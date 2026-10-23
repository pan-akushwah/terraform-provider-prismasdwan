package provider

import (
	"context"
	"strings"
	"testing"

	"github.com/hashicorp/terraform-plugin-framework/resource"
	"github.com/hashicorp/terraform-plugin-framework/tfsdk"
	"github.com/hashicorp/terraform-plugin-go/tftypes"
)

// configFor builds a resource config from the resource's own schema, with the given attributes set and every
// other attribute null.
func configFor(t *testing.T, r resource.Resource, attrs map[string]tftypes.Value) tfsdk.Config {
	t.Helper()
	ctx := context.Background()
	var schemaResp resource.SchemaResponse
	r.Schema(ctx, resource.SchemaRequest{}, &schemaResp)
	objType, ok := schemaResp.Schema.Type().TerraformType(ctx).(tftypes.Object)
	if !ok {
		t.Fatal("resource schema is not an object")
	}
	values := make(map[string]tftypes.Value, len(objType.AttributeTypes))
	for name, typ := range objType.AttributeTypes {
		if v, ok := attrs[name]; ok {
			values[name] = v
		} else {
			values[name] = tftypes.NewValue(typ, nil)
		}
	}
	return tfsdk.Config{Schema: schemaResp.Schema, Raw: tftypes.NewValue(objType, values)}
}

func validate(r resource.Resource, config tfsdk.Config) []string {
	var resp resource.ValidateConfigResponse
	r.(resource.ResourceWithValidateConfig).ValidateConfig(context.Background(), resource.ValidateConfigRequest{Config: config}, &resp)
	var details []string
	for _, d := range resp.Diagnostics.Errors() {
		details = append(details, d.Detail())
	}
	return details
}

func str(v string) tftypes.Value { return tftypes.NewValue(tftypes.String, v) }

func xParameters(values map[string]tftypes.Value) tftypes.Value {
	return tftypes.NewValue(tftypes.Map{ElementType: tftypes.String}, values)
}

// CGSDW-41556: without x_parameters the request went out with a literal "{site_id}" and the API answered HTTP 502.
func TestValidateConfigMissingPathParameters(t *testing.T) {
	tests := []struct {
		name     string
		resource resource.Resource
		attrs    map[string]tftypes.Value
		want     []string
	}{
		{
			name:     "element_iot_device_id_config without x_parameters",
			resource: NewElementIotDeviceIdConfigResource(),
			attrs: map[string]tftypes.Value{
				"name":        str("TfNullPathTest"),
				"description": str("Test element iot device id config"),
			},
			want: []string{`path parameter "site_id" is required; set x_parameters.site_id`,
				`path parameter "element_id" is required; set x_parameters.element_id`},
		},
		{
			name:     "performance_policy_rule without x_parameters",
			resource: NewPerformancePolicyRuleResource(),
			attrs: map[string]tftypes.Value{
				"name":    str("TfNullPathRule"),
				"type":    str("app_circuit_health"),
				"enabled": tftypes.NewValue(tftypes.Bool, true),
			},
			want: []string{`path parameter "perfmgmtpolicyset_id" is required; set x_parameters.perfmgmtpolicyset_id`},
		},
		{
			name:     "element_iot_device_id_config with only site_id",
			resource: NewElementIotDeviceIdConfigResource(),
			attrs: map[string]tftypes.Value{
				"name":         str("TfNullPathTest"),
				"x_parameters": xParameters(map[string]tftypes.Value{"site_id": str("123")}),
			},
			want: []string{`path parameter "element_id" is required; set x_parameters.element_id`},
		},
		{
			name:     "element_iot_device_id_config with a null element_id",
			resource: NewElementIotDeviceIdConfigResource(),
			attrs: map[string]tftypes.Value{
				"name": str("TfNullPathTest"),
				"x_parameters": xParameters(map[string]tftypes.Value{
					"site_id": str("123"), "element_id": tftypes.NewValue(tftypes.String, nil)}),
			},
			want: []string{`path parameter "element_id" is required; set x_parameters.element_id`},
		},
		{
			name:     "all path parameters set",
			resource: NewElementIotDeviceIdConfigResource(),
			attrs: map[string]tftypes.Value{
				"name":         str("TfNullPathTest"),
				"x_parameters": xParameters(map[string]tftypes.Value{"site_id": str("123"), "element_id": str("456")}),
			},
		},
		{
			name:     "x_parameters known only after apply",
			resource: NewPerformancePolicyRuleResource(),
			attrs: map[string]tftypes.Value{
				"name":         str("TfNullPathRule"),
				"x_parameters": tftypes.NewValue(tftypes.Map{ElementType: tftypes.String}, tftypes.UnknownValue),
			},
		},
		{
			name:     "path parameter value known only after apply",
			resource: NewPerformancePolicyRuleResource(),
			attrs: map[string]tftypes.Value{
				"name": str("TfNullPathRule"),
				"x_parameters": xParameters(map[string]tftypes.Value{
					"perfmgmtpolicyset_id": tftypes.NewValue(tftypes.String, tftypes.UnknownValue)}),
			},
		},
		{
			name:     "resource without path parameters",
			resource: NewNatZoneResource(),
			attrs:    map[string]tftypes.Value{"name": str("zone")},
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := validate(tt.resource, configFor(t, tt.resource, tt.attrs))
			if strings.Join(got, "\n") != strings.Join(tt.want, "\n") {
				t.Errorf("errors:\n  got  %q\n  want %q", got, tt.want)
			}
		})
	}
}
