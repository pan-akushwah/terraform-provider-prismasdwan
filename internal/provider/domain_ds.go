package provider

// Note:  This file is automatically generated.  Manually made changes
// will be overwritten when the provider is generated.

import (
	"context"
	"encoding/json"
	"strings"

	sdwan "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk"
	sdwan_schema "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas"
	sdwan_client "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/services"

	"github.com/hashicorp/terraform-plugin-framework/datasource"
	dsschema "github.com/hashicorp/terraform-plugin-framework/datasource/schema"
	"github.com/hashicorp/terraform-plugin-framework/types"
	"github.com/hashicorp/terraform-plugin-log/tflog"
)

// +-----------------------------------------------------------------
// | Schema Map Summary (size=goLangStructMap=2)
// | Computed Resource Name=servicebindingmaps
// +-----------------------------------------------------------------
// | ServiceBinding HasID=false
// | ServiceBindingMapScreenV2N1 HasID=true
// +-----------------------------------------------------------------

// Data source.
var (
	_ datasource.DataSource              = &domainDataSource{}
	_ datasource.DataSourceWithConfigure = &domainDataSource{}
)

// To enable this data source for TF Provider, go to `provider.go` and inject this into the function
// as below:
//
//	func (p *SdwanProvider) DataSources(_ context.Context) []func() datasource.DataSource {
//	  	return []func() datasource.DataSource{
//	     ... <other existing data sources>
//	     NewDomainDataSource,
//	     // -- append next datasource above -- //
//	     }
//	  }
func NewDomainDataSource() datasource.DataSource {
	return &domainDataSource{}
}

type domainDataSource struct {
	client *sdwan.Client
}

// Metadata returns the data source type name.
func (d *domainDataSource) Metadata(_ context.Context, req datasource.MetadataRequest, resp *datasource.MetadataResponse) {
	resp.TypeName = "prismasdwan_domain"
}

// Schema defines the schema for this data source.
func (d *domainDataSource) Schema(_ context.Context, _ datasource.SchemaRequest, resp *datasource.SchemaResponse) {
	resp.Schema = dsschema.Schema{
		Description: "Retrieves a config item.",

		Attributes: map[string]dsschema.Attribute{
			"tfid": dsschema.StringAttribute{
				Computed: true,
			},
			// rest all properties to be read from GET API Schema schema=ServiceBindingMapScreenV2N1
			// generic x_parameters is added to accomodate path parameters
			"x_parameters": dsschema.MapAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				ElementType: types.StringType,
			},
			// property: name=_etag, type=INTEGER macro=rss_schema
			"x_etag": dsschema.Int64Attribute{
				Required:  false,
				Computed:  true,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=_etag, type=INTEGER macro=rss_schema
			// property: name=_schema, type=INTEGER macro=rss_schema
			"x_schema": dsschema.Int64Attribute{
				Required:  false,
				Computed:  true,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=_schema, type=INTEGER macro=rss_schema
			// property: name=description, type=STRING macro=rss_schema
			"description": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=description, type=STRING macro=rss_schema
			// property: name=id, type=STRING macro=rss_schema
			"id": dsschema.StringAttribute{
				Required:  false,
				Computed:  true,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=id, type=STRING macro=rss_schema
			// property: name=is_default, type=BOOLEAN macro=rss_schema
			"is_default": dsschema.BoolAttribute{
				Required:  true,
				Computed:  false,
				Optional:  false,
				Sensitive: false,
			},
			// key name holder for attribute: name=is_default, type=BOOLEAN macro=rss_schema
			// property: name=name, type=STRING macro=rss_schema
			"name": dsschema.StringAttribute{
				Required:  true,
				Computed:  false,
				Optional:  false,
				Sensitive: false,
			},
			// key name holder for attribute: name=name, type=STRING macro=rss_schema
			// property: name=service_bindings, type=ARRAY_REFERENCE macro=rss_schema
			"service_bindings": dsschema.ListNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				NestedObject: dsschema.NestedAttributeObject{
					Attributes: map[string]dsschema.Attribute{
						// property: name=service_endpoint_ids, type=ARRAY_PRIMITIVE macro=rss_schema
						"service_endpoint_ids": dsschema.ListAttribute{
							Required:    false,
							Computed:    false,
							Optional:    true,
							Sensitive:   false,
							ElementType: types.StringType,
						},
						// key name holder for attribute: name=service_endpoint_ids, type=ARRAY_PRIMITIVE macro=rss_schema
						// property: name=service_label_id, type=STRING macro=rss_schema
						"service_label_id": dsschema.StringAttribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=service_label_id, type=STRING macro=rss_schema
					},
				},
			},
			// key name holder for attribute: name=service_label_id, type=STRING macro=rss_schema
			// property: name=tags, type=SET_PRIMITIVE macro=rss_schema
			"tags": dsschema.SetAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				Sensitive:   false,
				ElementType: types.StringType,
			},
			// key name holder for attribute: name=tags, type=SET_PRIMITIVE macro=rss_schema
		},
	}
}

// Configure prepares the struct.
func (d *domainDataSource) Configure(_ context.Context, req datasource.ConfigureRequest, resp *datasource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}
	d.client = req.ProviderData.(*sdwan.Client)
}

// Read performs Read for the struct.
func (d *domainDataSource) Read(ctx context.Context, req datasource.ReadRequest, resp *datasource.ReadResponse) {
	var state dsModelServiceBindingMapScreenV2N1
	resp.Diagnostics.Append(req.Config.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}
	// pointers
	diagnostics := &resp.Diagnostics

	// Basic logging.
	tflog.Info(ctx, "performing datasource read", map[string]any{
		"terraform_provider_function": "Read",
		"resource_name":               "prismasdwan_domain",
	})

	tfid := state.Tfid.ValueString()
	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 1 {
		resp.Diagnostics.AddError("error in prismasdwan_domain ID format", "Expected 1 tokens")
		return
	}

	// Prepare to read the config.
	svc := sdwan_client.NewClient(d.client)

	// Prepare input for the API endpoint.
	read_request := &sdwan_client.SdwanClientRequestResponse{}
	read_request.Method = "GET"
	read_request.Path = "/sdwan/v2.1/api/servicebindingmaps/{map_id}"

	// handle parameters
	params := make(map[string]*string)
	read_request.PathParameters = &params
	params["map_id"] = &tokens[0]

	// Perform the operation.
	svc.ExecuteSdwanRequest(ctx, read_request)
	if read_request.ResponseErr != nil {
		if IsObjectNotFound(*read_request.ResponseErr) {
			resp.State.RemoveResource(ctx)
		} else {
			resp.Diagnostics.AddError("error reading prismasdwan_domain", (*read_request.ResponseErr).Error())
		}
		return
	}

	// Create the Terraform ID.
	var idBuilder strings.Builder
	idBuilder.WriteString("x")

	// Store the answer to state.
	state.Tfid = types.StringValue(idBuilder.String())
	// start copying attributes
	var ans sdwan_schema.ServiceBindingMapScreenV2N1
	// copy from json response
	json_err := json.Unmarshal(*read_request.ResponseBytes, &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to ServiceBindingMapScreenV2N1", json_err.Error())
		return
	}

	// lets copy all items into state schema=ServiceBindingMapScreenV2N1
	// copy_to_state: state=state prefix=dsModel ans=ans properties=8
	// property: name=_etag, type=INTEGER macro=copy_to_state
	state.Etag = types.Int64PointerValue(ans.Etag)
	// property: name=_schema, type=INTEGER macro=copy_to_state
	state.Schema = types.Int64PointerValue(ans.Schema)
	// property: name=description, type=STRING macro=copy_to_state
	state.Description = types.StringPointerValue(ans.Description)
	// property: name=id, type=STRING macro=copy_to_state
	state.Id = types.StringPointerValue(ans.Id)
	// property: name=is_default, type=BOOLEAN macro=copy_to_state
	state.IsDefault = types.BoolPointerValue(ans.IsDefault)
	// property: name=name, type=STRING macro=copy_to_state
	state.Name = types.StringPointerValue(ans.Name)
	// property: name=service_bindings, type=ARRAY_REFERENCE macro=copy_to_state
	if ans.ServiceBindings == nil {
		state.ServiceBindings = nil
	} else if len(ans.ServiceBindings) == 0 {
		state.ServiceBindings = []dsModelServiceBinding{}
	} else {
		state.ServiceBindings = make([]dsModelServiceBinding, 0, len(ans.ServiceBindings))
		for varLoopServiceBindingsIndex, varLoopServiceBindings := range ans.ServiceBindings {
			// add a new item
			state.ServiceBindings = append(state.ServiceBindings, dsModelServiceBinding{})
			// copy_to_state: state=state.ServiceBindings[varLoopServiceBindingsIndex] prefix=dsModel ans=varLoopServiceBindings properties=2
			// property: name=service_endpoint_ids, type=ARRAY_PRIMITIVE macro=copy_to_state
			varServiceEndpointIds, errServiceEndpointIds := types.ListValueFrom(ctx, types.StringType, varLoopServiceBindings.ServiceEndpointIds)
			state.ServiceBindings[varLoopServiceBindingsIndex].ServiceEndpointIds = varServiceEndpointIds
			resp.Diagnostics.Append(errServiceEndpointIds.Errors()...)
			// property: name=service_label_id, type=STRING macro=copy_to_state
			state.ServiceBindings[varLoopServiceBindingsIndex].ServiceLabelId = types.StringPointerValue(varLoopServiceBindings.ServiceLabelId)
		}
	}
	// property: name=tags, type=SET_PRIMITIVE macro=copy_to_state
	varTags, errTags := types.SetValueFrom(ctx, types.StringType, ans.Tags)
	state.Tags = varTags
	resp.Diagnostics.Append(errTags.Errors()...)

	// Done.
	diagnostics.Append(resp.State.Set(ctx, &state)...)
}
