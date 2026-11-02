package provider

import (
	"context"
	"fmt"
	"sort"
	"strings"
	"testing"

	"github.com/hashicorp/terraform-plugin-framework/resource"
	"github.com/hashicorp/terraform-plugin-framework/tfsdk"
	"github.com/hashicorp/terraform-plugin-go/tftypes"
)

// knownSchemaModelMismatches lists resources whose generated schema cannot be converted into their Go model, with
// the reason. TestSchemaMatchesModel fails when an entry starts to work, so it is removed as soon as it is fixed.
var knownSchemaModelMismatches = map[string]string{
	"sdwanapps_config":       "empty-object property (user_config) is generated as an attribute without fields: Draft 2",
	"site_hub_prefix_filter": "empty-object property (site) is generated as an attribute without fields: Draft 2",
}

// skeleton builds a value of the given type in which every nested object, list, set and map is present (a single
// element each) and every primitive is null. Converting it into the Go model exercises every nested struct, which an
// all-null plan does not: a nested object that is null is never converted, so a schema attribute missing from the
// model would go unnoticed.
func skeleton(t tftypes.Type) tftypes.Value {
	switch typ := t.(type) {
	case tftypes.Object:
		attrs := make(map[string]tftypes.Value, len(typ.AttributeTypes))
		for name, attrType := range typ.AttributeTypes {
			attrs[name] = skeleton(attrType)
		}
		return tftypes.NewValue(typ, attrs)
	case tftypes.List:
		return tftypes.NewValue(typ, []tftypes.Value{skeleton(typ.ElementType)})
	case tftypes.Set:
		return tftypes.NewValue(typ, []tftypes.Value{skeleton(typ.ElementType)})
	case tftypes.Map:
		return tftypes.NewValue(typ, map[string]tftypes.Value{"key": skeleton(typ.ElementType)})
	default:
		return tftypes.NewValue(t, nil)
	}
}

// createConversionErrors runs the first step of Create, converting the plan into the resource's Go model, and
// returns the conversion errors. Create goes on to call the API with a nil client, which panics: that only means the
// conversion succeeded, so the panic is recovered.
func createConversionErrors(r resource.Resource, only string) (errs []string) {
	ctx := context.Background()
	var schemaResp resource.SchemaResponse
	r.Schema(ctx, resource.SchemaRequest{}, &schemaResp)
	objType := schemaResp.Schema.Type().TerraformType(ctx)
	raw := skeleton(objType)
	if only != "" {
		// only this attribute is populated, every other one is null
		attrs := map[string]tftypes.Value{}
		for name, attrType := range objType.(tftypes.Object).AttributeTypes {
			if name == only {
				attrs[name] = skeleton(attrType)
			} else {
				attrs[name] = tftypes.NewValue(attrType, nil)
			}
		}
		raw = tftypes.NewValue(objType, attrs)
	}
	plan := tfsdk.Plan{Schema: schemaResp.Schema, Raw: raw}
	resp := resource.CreateResponse{State: tfsdk.State{Schema: schemaResp.Schema, Raw: tftypes.NewValue(objType, nil)}}

	defer func() {
		_ = recover()
		for _, d := range resp.Diagnostics.Errors() {
			if strings.Contains(d.Summary(), "Conversion") || strings.Contains(d.Detail(), "mismatch between struct and object") {
				errs = append(errs, d.Summary()+": "+firstLine(d.Detail()))
			}
		}
	}()
	r.Create(ctx, resource.CreateRequest{Plan: plan}, &resp)
	return nil
}

func firstLine(s string) string {
	s = strings.TrimSpace(s)
	if i := strings.Index(s, "\n\n"); i > 0 && strings.Contains(s[i:], "mismatch") {
		return strings.TrimSpace(s[i:])
	}
	if i := strings.Index(s, "\n"); i > 0 {
		return s[:i]
	}
	return s
}

// T1 of the QA findings: every generated resource schema must convert into its Go model. Catches a schema attribute
// that is missing from the model (and the reverse), at any nesting level, without a tenant.
func TestSchemaMatchesModel(t *testing.T) {
	p := New("test")()
	var failures []string
	checked := 0
	for _, newResource := range p.Resources(context.Background()) {
		r := newResource()
		var meta resource.MetadataResponse
		r.Metadata(context.Background(), resource.MetadataRequest{ProviderTypeName: "prismasdwan"}, &meta)
		name := strings.TrimPrefix(meta.TypeName, "prismasdwan_")
		checked++

		errs := createConversionErrors(r, "")
		if len(errs) > 0 {
			// say which top-level attributes cause it
			var schemaResp resource.SchemaResponse
			r.Schema(context.Background(), resource.SchemaRequest{}, &schemaResp)
			var culprits []string
			for attr := range schemaResp.Schema.Type().TerraformType(context.Background()).(tftypes.Object).AttributeTypes {
				if len(createConversionErrors(r, attr)) > 0 {
					culprits = append(culprits, attr)
				}
			}
			sort.Strings(culprits)
			errs = append(errs, "attributes: "+strings.Join(culprits, ", "))
		}
		reason, known := knownSchemaModelMismatches[name]
		switch {
		case len(errs) > 0 && !known:
			failures = append(failures, fmt.Sprintf("%s: %s", name, strings.Join(errs, "; ")))
		case len(errs) == 0 && known:
			failures = append(failures, fmt.Sprintf("%s: converts now, remove it from knownSchemaModelMismatches (%s)", name, reason))
		}
	}
	if checked < 100 {
		t.Fatalf("only %d resources checked; the provider registers more", checked)
	}
	sort.Strings(failures)
	for _, f := range failures {
		t.Error(f)
	}
}
