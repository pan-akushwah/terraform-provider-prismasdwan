package provider

import (
	"context"
	"testing"

	"github.com/hashicorp/terraform-plugin-framework/datasource"
)

// prismasdwan_sdwanapp is hand-written and registered in provider.go: its schema must be valid and the provider must
// still list it after a regeneration.
func TestSdwanappDataSourceRegisteredWithValidSchema(t *testing.T) {
	ctx := context.Background()
	var found bool
	for _, newDataSource := range New("test")().DataSources(ctx) {
		ds := newDataSource()
		var meta datasource.MetadataResponse
		ds.Metadata(ctx, datasource.MetadataRequest{ProviderTypeName: "prismasdwan"}, &meta)
		if meta.TypeName != "prismasdwan_sdwanapp" {
			continue
		}
		found = true
		var schema datasource.SchemaResponse
		ds.Schema(ctx, datasource.SchemaRequest{}, &schema)
		if diags := schema.Schema.ValidateImplementation(ctx); diags.HasError() {
			t.Fatalf("invalid schema: %v", diags)
		}
		if name, ok := schema.Schema.Attributes["name"]; !ok || !name.IsRequired() {
			t.Fatalf("name must be a required attribute")
		}
	}
	if !found {
		t.Fatal("prismasdwan_sdwanapp is not registered in provider.go")
	}
}
