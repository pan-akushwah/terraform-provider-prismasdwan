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
// | Schema Map Summary (size=goLangStructMap=1)
// | Computed Resource Name=ipfixtemplates
// +-----------------------------------------------------------------
// | IPFixTemplateScreen HasID=true
// +-----------------------------------------------------------------

// Data source.
var (
	_ datasource.DataSource              = &ipfixTemplateDataSource{}
	_ datasource.DataSourceWithConfigure = &ipfixTemplateDataSource{}
)

// To enable this data source for TF Provider, go to `provider.go` and inject this into the function
// as below:
//
//	func (p *SdwanProvider) DataSources(_ context.Context) []func() datasource.DataSource {
//	  	return []func() datasource.DataSource{
//	     ... <other existing data sources>
//	     NewIpfixTemplateDataSource,
//	     // -- append next datasource above -- //
//	     }
//	  }
func NewIpfixTemplateDataSource() datasource.DataSource {
	return &ipfixTemplateDataSource{}
}

type ipfixTemplateDataSource struct {
	client *sdwan.Client
}

// Metadata returns the data source type name.
func (d *ipfixTemplateDataSource) Metadata(_ context.Context, req datasource.MetadataRequest, resp *datasource.MetadataResponse) {
	resp.TypeName = "prismasdwan_ipfix_template"
}

// Schema defines the schema for this data source.
func (d *ipfixTemplateDataSource) Schema(_ context.Context, _ datasource.SchemaRequest, resp *datasource.SchemaResponse) {
	resp.Schema = dsschema.Schema{
		Description: "Retrieves a config item.",

		Attributes: map[string]dsschema.Attribute{
			"tfid": dsschema.StringAttribute{
				Computed: true,
			},
			// rest all properties to be read from GET API Schema schema=IPFixTemplateScreen
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
			// property: name=flow_fields, type=ARRAY_PRIMITIVE macro=rss_schema
			"flow_fields": dsschema.ListAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				Sensitive:   false,
				ElementType: types.StringType,
			},
			// key name holder for attribute: name=flow_fields, type=ARRAY_PRIMITIVE macro=rss_schema
			// property: name=generate_biflow, type=BOOLEAN macro=rss_schema
			"generate_biflow": dsschema.BoolAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=generate_biflow, type=BOOLEAN macro=rss_schema
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
			// property: name=option_export_timeout, type=INTEGER macro=rss_schema
			"option_export_timeout": dsschema.Int64Attribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=option_export_timeout, type=INTEGER macro=rss_schema
			// property: name=options, type=ARRAY_PRIMITIVE macro=rss_schema
			"options": dsschema.ListAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				Sensitive:   false,
				ElementType: types.StringType,
			},
			// key name holder for attribute: name=options, type=ARRAY_PRIMITIVE macro=rss_schema
			// property: name=tags, type=SET_PRIMITIVE macro=rss_schema
			"tags": dsschema.SetAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				Sensitive:   false,
				ElementType: types.StringType,
			},
			// key name holder for attribute: name=tags, type=SET_PRIMITIVE macro=rss_schema
			// property: name=template_export_timeout, type=INTEGER macro=rss_schema
			"template_export_timeout": dsschema.Int64Attribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=template_export_timeout, type=INTEGER macro=rss_schema
		},
	}
}

// Configure prepares the struct.
func (d *ipfixTemplateDataSource) Configure(_ context.Context, req datasource.ConfigureRequest, resp *datasource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}
	d.client = req.ProviderData.(*sdwan.Client)
}

// Read performs Read for the struct.
func (d *ipfixTemplateDataSource) Read(ctx context.Context, req datasource.ReadRequest, resp *datasource.ReadResponse) {
	var state dsModelIPFixTemplateScreen
	resp.Diagnostics.Append(req.Config.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}
	// pointers
	diagnostics := &resp.Diagnostics

	// Basic logging.
	tflog.Info(ctx, "performing datasource read", map[string]any{
		"terraform_provider_function": "Read",
		"resource_name":               "prismasdwan_ipfix_template",
	})

	tfid := state.Tfid.ValueString()
	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 1 {
		resp.Diagnostics.AddError("error in prismasdwan_ipfix_template ID format", "Expected 1 tokens")
		return
	}

	// Prepare to read the config.
	svc := sdwan_client.NewClient(d.client)

	// Prepare input for the API endpoint.
	read_request := &sdwan_client.SdwanClientRequestResponse{}
	read_request.Method = "GET"
	read_request.Path = "/sdwan/v2.0/api/ipfixtemplates/{template_id}"

	// handle parameters
	params := make(map[string]*string)
	read_request.PathParameters = &params
	params["template_id"] = &tokens[0]

	// Perform the operation.
	svc.ExecuteSdwanRequest(ctx, read_request)
	if read_request.ResponseErr != nil {
		if IsObjectNotFound(*read_request.ResponseErr) {
			resp.State.RemoveResource(ctx)
		} else {
			resp.Diagnostics.AddError("error reading prismasdwan_ipfix_template", (*read_request.ResponseErr).Error())
		}
		return
	}

	// Create the Terraform ID.
	var idBuilder strings.Builder
	idBuilder.WriteString("x")

	// Store the answer to state.
	state.Tfid = types.StringValue(idBuilder.String())
	// start copying attributes
	var ans sdwan_schema.IPFixTemplateScreen
	// copy from json response
	json_err := json.Unmarshal(*read_request.ResponseBytes, &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to IPFixTemplateScreen", json_err.Error())
		return
	}

	// lets copy all items into state schema=IPFixTemplateScreen
	// copy_to_state: state=state prefix=dsModel ans=ans properties=11
	// property: name=_etag, type=INTEGER macro=copy_to_state
	state.Etag = types.Int64PointerValue(ans.Etag)
	// property: name=_schema, type=INTEGER macro=copy_to_state
	state.Schema = types.Int64PointerValue(ans.Schema)
	// property: name=description, type=STRING macro=copy_to_state
	state.Description = types.StringPointerValue(ans.Description)
	// property: name=flow_fields, type=ARRAY_PRIMITIVE macro=copy_to_state
	varFlowFields, errFlowFields := types.ListValueFrom(ctx, types.StringType, ans.FlowFields)
	state.FlowFields = varFlowFields
	resp.Diagnostics.Append(errFlowFields.Errors()...)
	// property: name=generate_biflow, type=BOOLEAN macro=copy_to_state
	state.GenerateBiflow = types.BoolPointerValue(ans.GenerateBiflow)
	// property: name=id, type=STRING macro=copy_to_state
	state.Id = types.StringPointerValue(ans.Id)
	// property: name=name, type=STRING macro=copy_to_state
	state.Name = types.StringPointerValue(ans.Name)
	// property: name=option_export_timeout, type=INTEGER macro=copy_to_state
	state.OptionExportTimeout = types.Int64PointerValue(ans.OptionExportTimeout)
	// property: name=options, type=ARRAY_PRIMITIVE macro=copy_to_state
	varOptions, errOptions := types.ListValueFrom(ctx, types.StringType, ans.Options)
	state.Options = varOptions
	resp.Diagnostics.Append(errOptions.Errors()...)
	// property: name=tags, type=SET_PRIMITIVE macro=copy_to_state
	varTags, errTags := types.SetValueFrom(ctx, types.StringType, ans.Tags)
	state.Tags = varTags
	resp.Diagnostics.Append(errTags.Errors()...)
	// property: name=template_export_timeout, type=INTEGER macro=copy_to_state
	state.TemplateExportTimeout = types.Int64PointerValue(ans.TemplateExportTimeout)

	// Done.
	diagnostics.Append(resp.State.Set(ctx, &state)...)
}
