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
// | Computed Resource Name=pathgroups
// +-----------------------------------------------------------------
// | WANPath HasID=false
// | PathGroupScreen HasID=true
// +-----------------------------------------------------------------

// Data source.
var (
	_ datasource.DataSource              = &pathgroupsDataSource{}
	_ datasource.DataSourceWithConfigure = &pathgroupsDataSource{}
)

// To enable this data source for TF Provider, go to `provider.go` and inject this into the function
// as below:
//
//	func (p *SdwanProvider) DataSources(_ context.Context) []func() datasource.DataSource {
//	  	return []func() datasource.DataSource{
//	     ... <other existing data sources>
//	     NewPathgroupsDataSource,
//	     // -- append next datasource above -- //
//	     }
//	  }
func NewPathgroupsDataSource() datasource.DataSource {
	return &pathgroupsDataSource{}
}

type pathgroupsDataSource struct {
	client *sdwan.Client
}

// Metadata returns the data source type name.
func (d *pathgroupsDataSource) Metadata(_ context.Context, req datasource.MetadataRequest, resp *datasource.MetadataResponse) {
	resp.TypeName = "prismasdwan_pathgroups"
}

// Schema defines the schema for this data source.
func (d *pathgroupsDataSource) Schema(_ context.Context, _ datasource.SchemaRequest, resp *datasource.SchemaResponse) {
	resp.Schema = dsschema.Schema{
		Description: "Retrieves a config item.",

		Attributes: map[string]dsschema.Attribute{
			"tfid": dsschema.StringAttribute{
				Computed: true,
			},
			// rest all properties to be read from GET API Schema schema=PathGroupScreen
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
			// property: name=name, type=STRING macro=rss_schema
			"name": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=name, type=STRING macro=rss_schema
			// property: name=paths, type=ARRAY_REFERENCE macro=rss_schema
			"paths": dsschema.ListNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				NestedObject: dsschema.NestedAttributeObject{
					Attributes: map[string]dsschema.Attribute{
						// property: name=label, type=STRING macro=rss_schema
						"label": dsschema.StringAttribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=label, type=STRING macro=rss_schema
						// property: name=path_type, type=STRING macro=rss_schema
						"path_type": dsschema.StringAttribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=path_type, type=STRING macro=rss_schema
					},
				},
			},
			// key name holder for attribute: name=path_type, type=STRING macro=rss_schema
		},
	}
}

// Configure prepares the struct.
func (d *pathgroupsDataSource) Configure(_ context.Context, req datasource.ConfigureRequest, resp *datasource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}
	d.client = req.ProviderData.(*sdwan.Client)
}

// Read performs Read for the struct.
func (d *pathgroupsDataSource) Read(ctx context.Context, req datasource.ReadRequest, resp *datasource.ReadResponse) {
	var state dsModelPathGroupScreen
	resp.Diagnostics.Append(req.Config.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}
	// pointers
	diagnostics := &resp.Diagnostics

	// Basic logging.
	tflog.Info(ctx, "performing datasource read", map[string]any{
		"terraform_provider_function": "Read",
		"resource_name":               "prismasdwan_pathgroups",
	})

	tfid := state.Tfid.ValueString()
	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 1 {
		resp.Diagnostics.AddError("error in prismasdwan_pathgroups ID format", "Expected 1 tokens")
		return
	}

	// Prepare to read the config.
	svc := sdwan_client.NewClient(d.client)

	// Prepare input for the API endpoint.
	read_request := &sdwan_client.SdwanClientRequestResponse{}
	read_request.Method = "GET"
	read_request.Path = "/sdwan/v2.1/api/pathgroups/{path_group_id}"

	// handle parameters
	params := make(map[string]*string)
	read_request.PathParameters = &params
	params["path_group_id"] = &tokens[0]

	// Perform the operation.
	svc.ExecuteSdwanRequest(ctx, read_request)
	if read_request.ResponseErr != nil {
		if IsObjectNotFound(*read_request.ResponseErr) {
			resp.State.RemoveResource(ctx)
		} else {
			resp.Diagnostics.AddError("error reading prismasdwan_pathgroups", (*read_request.ResponseErr).Error())
		}
		return
	}

	// Create the Terraform ID.
	var idBuilder strings.Builder
	idBuilder.WriteString("x")

	// Store the answer to state.
	state.Tfid = types.StringValue(idBuilder.String())
	// start copying attributes
	var ans sdwan_schema.PathGroupScreen
	// copy from json response
	json_err := json.Unmarshal(*read_request.ResponseBytes, &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to PathGroupScreen", json_err.Error())
		return
	}

	// lets copy all items into state schema=PathGroupScreen
	// copy_to_state: state=state prefix=dsModel ans=ans properties=6
	// property: name=_etag, type=INTEGER macro=copy_to_state
	state.Etag = types.Int64PointerValue(ans.Etag)
	// property: name=_schema, type=INTEGER macro=copy_to_state
	state.Schema = types.Int64PointerValue(ans.Schema)
	// property: name=description, type=STRING macro=copy_to_state
	state.Description = types.StringPointerValue(ans.Description)
	// property: name=id, type=STRING macro=copy_to_state
	state.Id = types.StringPointerValue(ans.Id)
	// property: name=name, type=STRING macro=copy_to_state
	state.Name = types.StringPointerValue(ans.Name)
	// property: name=paths, type=ARRAY_REFERENCE macro=copy_to_state
	if ans.Paths == nil {
		state.Paths = nil
	} else if len(ans.Paths) == 0 {
		state.Paths = []dsModelWANPath{}
	} else {
		state.Paths = make([]dsModelWANPath, 0, len(ans.Paths))
		for varLoopPathsIndex, varLoopPaths := range ans.Paths {
			// add a new item
			state.Paths = append(state.Paths, dsModelWANPath{})
			// copy_to_state: state=state.Paths[varLoopPathsIndex] prefix=dsModel ans=varLoopPaths properties=2
			// property: name=label, type=STRING macro=copy_to_state
			state.Paths[varLoopPathsIndex].Label = types.StringPointerValue(varLoopPaths.Label)
			// property: name=path_type, type=STRING macro=copy_to_state
			state.Paths[varLoopPathsIndex].PathType = types.StringPointerValue(varLoopPaths.PathType)
		}
	}

	// Done.
	diagnostics.Append(resp.State.Set(ctx, &state)...)
}
