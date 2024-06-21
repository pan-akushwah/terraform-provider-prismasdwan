package provider

// Note:  This file is automatically generated.  Manually made changes
// will be overwritten when the provider is generated.

import (
	"context"
	"strings"

	"github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk"
	eItpily "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/security/zone/network/association"
	aVdThpZ "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/site/context"
	xCzsxgj "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/services/sdwan/v20/api/sites/siteid/sitesecurityzones"

	"github.com/hashicorp/terraform-plugin-framework-validators/stringvalidator"
	"github.com/hashicorp/terraform-plugin-framework/datasource"
	dsschema "github.com/hashicorp/terraform-plugin-framework/datasource/schema"
	"github.com/hashicorp/terraform-plugin-framework/path"
	"github.com/hashicorp/terraform-plugin-framework/resource"
	rsschema "github.com/hashicorp/terraform-plugin-framework/resource/schema"
	"github.com/hashicorp/terraform-plugin-framework/resource/schema/planmodifier"
	"github.com/hashicorp/terraform-plugin-framework/resource/schema/stringplanmodifier"
	"github.com/hashicorp/terraform-plugin-framework/schema/validator"
	"github.com/hashicorp/terraform-plugin-framework/types"
	"github.com/hashicorp/terraform-plugin-log/tflog"
)

// Data source (listing).
var (
	_ datasource.DataSource              = &siteSecurityZonesListDataSource{}
	_ datasource.DataSourceWithConfigure = &siteSecurityZonesListDataSource{}
)

func NewSiteSecurityZonesListDataSource() datasource.DataSource {
	return &siteSecurityZonesListDataSource{}
}

type siteSecurityZonesListDataSource struct {
	client *sdwan.Client
}

// siteSecurityZonesListDsModel is the model.
type siteSecurityZonesListDsModel struct {
	Tfid types.String `tfsdk:"tfid"`

	// Input.
	SiteId types.String `tfsdk:"site_id"`

	// Output.
	Items      []siteSecurityZonesListDsModel_eItpily_Config `tfsdk:"items"`
	TotalItems types.Int64                                   `tfsdk:"total_items"`
}

type siteSecurityZonesListDsModel_eItpily_Config struct {
	Etag     types.Int64                                   `tfsdk:"etag"`
	Id       types.String                                  `tfsdk:"id"`
	Networks []siteSecurityZonesListDsModel_aVdThpZ_Config `tfsdk:"networks"`
	ZoneId   types.String                                  `tfsdk:"zone_id"`
}

type siteSecurityZonesListDsModel_aVdThpZ_Config struct {
	NetworkId   types.String `tfsdk:"network_id"`
	NetworkType types.String `tfsdk:"network_type"`
}

// Metadata returns the data source type name.
func (d *siteSecurityZonesListDataSource) Metadata(_ context.Context, req datasource.MetadataRequest, resp *datasource.MetadataResponse) {
	resp.TypeName = req.ProviderTypeName + "_site_security_zones_list"
}

// Schema defines the schema for this listing data source.
func (d *siteSecurityZonesListDataSource) Schema(_ context.Context, _ datasource.SchemaRequest, resp *datasource.SchemaResponse) {
	resp.Schema = dsschema.Schema{
		Description: "Retrieves a listing of config items.",

		Attributes: map[string]dsschema.Attribute{
			// inputs:map[string]bool{"site_id":true} outputs:map[string]bool{"items":true, "tfid":true, "total_items":true} forceNew:map[string]bool{"site_id":true}
			"items": dsschema.ListNestedAttribute{
				Description: "The Items param.",
				Computed:    true,
				NestedObject: dsschema.NestedAttributeObject{
					Attributes: map[string]dsschema.Attribute{
						// inputs:map[string]bool{} outputs:map[string]bool{"etag":true, "id":true, "networks":true, "zone_id":true} forceNew:map[string]bool(nil)
						"etag": dsschema.Int64Attribute{
							Description: "Entity tag for the resource.",
							Computed:    true,
						},
						"id": dsschema.StringAttribute{
							Description: "Id.",
							Computed:    true,
						},
						"networks": dsschema.ListNestedAttribute{
							Description: "Networks: Required(error = SECURITYZONE_INVALID_CONTEXT: Context id or site id not found.) Valid .",
							Computed:    true,
							NestedObject: dsschema.NestedAttributeObject{
								Attributes: map[string]dsschema.Attribute{
									// inputs:map[string]bool{} outputs:map[string]bool{"network_id":true, "network_type":true} forceNew:map[string]bool(nil)
									"network_id": dsschema.StringAttribute{
										Description: "Network Id.",
										Computed:    true,
									},
									"network_type": dsschema.StringAttribute{
										Description: "Network Type: ValidateEnum(enumClass = classOf[ContextType], error = SECURITYZONE_INVALID_CONTEXTTYPE: Context type not supported., nullAllowed = false) . String must be one of these: `\"wan_network\"`, `\"lan_network\"`, `\"wan_overlay\"`.",
										Computed:    true,
									},
								},
							},
						},
						"zone_id": dsschema.StringAttribute{
							Description: "Zone Id: Required(error = SECURITYZONE_INVALID_ZONE: Zone cannot be changed in the PUT.) .",
							Computed:    true,
						},
					},
				},
			},
			"site_id": dsschema.StringAttribute{
				Description: "Site Id.",
				Required:    true,
			},
			"tfid": dsschema.StringAttribute{
				Description: "The Terraform ID.",
				Computed:    true,
			},
			"total_items": dsschema.Int64Attribute{
				Description: "The TotalItems param.",
				Computed:    true,
			},
		},
	}
}

// Configure prepares the struct.
func (d *siteSecurityZonesListDataSource) Configure(_ context.Context, req datasource.ConfigureRequest, resp *datasource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}

	d.client = req.ProviderData.(*sdwan.Client)
}

// Read performs Read for the struct.
func (d *siteSecurityZonesListDataSource) Read(ctx context.Context, req datasource.ReadRequest, resp *datasource.ReadResponse) {
	var state siteSecurityZonesListDsModel
	resp.Diagnostics.Append(req.Config.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}

	// Basic logging.
	tflog.Info(ctx, "performing data source listing", map[string]any{
		"data_source_name":            "prismasdwan_site_security_zones_list",
		"terraform_provider_function": "Read",
		"site_id":                     state.SiteId.ValueString(),
	})

	// Prepare to run the command.
	svc := xCzsxgj.NewClient(d.client)

	// Prepare input for the API endpoint.
	input := xCzsxgj.ListInput{}

	input.SiteId = StringValue(state.SiteId)

	// Perform the operation.
	ans, err := svc.List(ctx, input)
	if err != nil {
		resp.Diagnostics.AddError("Error getting listing", err.Error())
		return
	}

	// Create the Terraform ID.
	var idBuilder strings.Builder
	idBuilder.WriteString(input.SiteId)

	// Store the answer to state.

	state.Tfid = types.StringValue(idBuilder.String())

	if len(ans.Items) == 0 {
		state.Items = nil
	} else {
		state.Items = make([]siteSecurityZonesListDsModel_eItpily_Config, 0, len(ans.Items))
		for _, var0 := range ans.Items {
			var1 := siteSecurityZonesListDsModel_eItpily_Config{}

			var1.Etag = types.Int64PointerValue(var0.Etag)

			var1.Id = types.StringPointerValue(var0.Id)

			if len(var0.Networks) == 0 {
				var1.Networks = nil
			} else {
				var1.Networks = make([]siteSecurityZonesListDsModel_aVdThpZ_Config, 0, len(var0.Networks))
				for _, var2 := range var0.Networks {
					var3 := siteSecurityZonesListDsModel_aVdThpZ_Config{}

					var3.NetworkId = types.StringPointerValue(var2.NetworkId)

					var3.NetworkType = types.StringValue(var2.NetworkType)
					var1.Networks = append(var1.Networks, var3)
				}
			}

			var1.ZoneId = types.StringValue(var0.ZoneId)
			state.Items = append(state.Items, var1)
		}
	}

	state.TotalItems = types.Int64PointerValue(ans.TotalItems)

	// Done.
	resp.Diagnostics.Append(resp.State.Set(ctx, &state)...)
}

// Data source.
var (
	_ datasource.DataSource              = &siteSecurityZonesDataSource{}
	_ datasource.DataSourceWithConfigure = &siteSecurityZonesDataSource{}
)

func NewSiteSecurityZonesDataSource() datasource.DataSource {
	return &siteSecurityZonesDataSource{}
}

type siteSecurityZonesDataSource struct {
	client *sdwan.Client
}

// siteSecurityZonesDsModel is the model.
type siteSecurityZonesDsModel struct {
	Tfid types.String `tfsdk:"tfid"`

	// Input.
	SiteId types.String `tfsdk:"site_id"`
	ZoneId types.String `tfsdk:"zone_id"`

	// Output.
	Etag     types.Int64                               `tfsdk:"etag"`
	Id       types.String                              `tfsdk:"id"`
	Networks []siteSecurityZonesDsModel_aVdThpZ_Config `tfsdk:"networks"`
	// omit input: zone_id
}

type siteSecurityZonesDsModel_aVdThpZ_Config struct {
	NetworkId   types.String `tfsdk:"network_id"`
	NetworkType types.String `tfsdk:"network_type"`
}

// Metadata returns the data source type name.
func (d *siteSecurityZonesDataSource) Metadata(_ context.Context, req datasource.MetadataRequest, resp *datasource.MetadataResponse) {
	resp.TypeName = req.ProviderTypeName + "_site_security_zones"
}

// Schema defines the schema for this data source.
func (d *siteSecurityZonesDataSource) Schema(_ context.Context, _ datasource.SchemaRequest, resp *datasource.SchemaResponse) {
	resp.Schema = dsschema.Schema{
		Description: "Retrieves a config item.",

		Attributes: map[string]dsschema.Attribute{
			// inputs:map[string]bool{"site_id":true, "zone_id":true} outputs:map[string]bool{"etag":true, "id":true, "networks":true, "tfid":true, "zone_id":true} forceNew:map[string]bool{"site_id":true, "zone_id":true}
			"etag": dsschema.Int64Attribute{
				Description: "Entity tag for the resource.",
				Computed:    true,
			},
			"id": dsschema.StringAttribute{
				Description: "Id.",
				Computed:    true,
			},
			"networks": dsschema.ListNestedAttribute{
				Description: "Networks: Required(error = SECURITYZONE_INVALID_CONTEXT: Context id or site id not found.) Valid .",
				Computed:    true,
				NestedObject: dsschema.NestedAttributeObject{
					Attributes: map[string]dsschema.Attribute{
						// inputs:map[string]bool{} outputs:map[string]bool{"network_id":true, "network_type":true} forceNew:map[string]bool(nil)
						"network_id": dsschema.StringAttribute{
							Description: "Network Id.",
							Computed:    true,
						},
						"network_type": dsschema.StringAttribute{
							Description: "Network Type: ValidateEnum(enumClass = classOf[ContextType], error = SECURITYZONE_INVALID_CONTEXTTYPE: Context type not supported., nullAllowed = false) . String must be one of these: `\"wan_network\"`, `\"lan_network\"`, `\"wan_overlay\"`.",
							Computed:    true,
						},
					},
				},
			},
			"site_id": dsschema.StringAttribute{
				Description: "Site Id.",
				Required:    true,
			},
			"tfid": dsschema.StringAttribute{
				Description: "The Terraform ID.",
				Computed:    true,
			},
			"zone_id": dsschema.StringAttribute{
				Description: "Zone Id.",
				Required:    true,
			},
		},
	}
}

// Configure prepares the struct.
func (d *siteSecurityZonesDataSource) Configure(_ context.Context, req datasource.ConfigureRequest, resp *datasource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}

	d.client = req.ProviderData.(*sdwan.Client)
}

// Read performs Read for the struct.
func (d *siteSecurityZonesDataSource) Read(ctx context.Context, req datasource.ReadRequest, resp *datasource.ReadResponse) {
	var state siteSecurityZonesDsModel
	resp.Diagnostics.Append(req.Config.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}

	// Basic logging.
	tflog.Info(ctx, "performing data source read", map[string]any{
		"data_source_name":            "prismasdwan_site_security_zones",
		"terraform_provider_function": "Read",
		"site_id":                     state.SiteId.ValueString(),
		"zone_id":                     state.ZoneId.ValueString(),
	})

	// Prepare to run the command.
	svc := xCzsxgj.NewClient(d.client)

	// Prepare input for the API endpoint.
	input := xCzsxgj.ReadInput{}

	input.SiteId = StringValue(state.SiteId)

	input.ZoneId = StringValue(state.ZoneId)

	// Perform the operation.
	ans, err := svc.Read(ctx, input)
	if err != nil {
		resp.Diagnostics.AddError("Error reading config", err.Error())
		return
	}

	// Create the Terraform ID.
	var idBuilder strings.Builder
	idBuilder.WriteString(input.SiteId)

	idBuilder.WriteString(IdSeparator)
	idBuilder.WriteString(input.ZoneId)

	idBuilder.WriteString(IdSeparator)
	if ans.Id == nil {
		resp.Diagnostics.AddError("Undefined param required for ID", "Id")
		return
	}
	if ans.Id != nil {
		idBuilder.WriteString(*ans.Id)
	}

	// Store the answer to state.

	state.Tfid = types.StringValue(idBuilder.String())

	state.Etag = types.Int64PointerValue(ans.Etag)

	state.Id = types.StringPointerValue(ans.Id)

	if len(ans.Networks) == 0 {
		state.Networks = nil
	} else {
		state.Networks = make([]siteSecurityZonesDsModel_aVdThpZ_Config, 0, len(ans.Networks))
		for _, var0 := range ans.Networks {
			var1 := siteSecurityZonesDsModel_aVdThpZ_Config{}

			var1.NetworkId = types.StringPointerValue(var0.NetworkId)

			var1.NetworkType = types.StringValue(var0.NetworkType)
			state.Networks = append(state.Networks, var1)
		}
	}

	state.ZoneId = types.StringValue(ans.ZoneId)

	// Done.
	resp.Diagnostics.Append(resp.State.Set(ctx, &state)...)
}

// Resource.
var (
	_ resource.Resource                = &siteSecurityZonesResource{}
	_ resource.ResourceWithConfigure   = &siteSecurityZonesResource{}
	_ resource.ResourceWithImportState = &siteSecurityZonesResource{}
)

func NewSiteSecurityZonesResource() resource.Resource {
	return &siteSecurityZonesResource{}
}

type siteSecurityZonesResource struct {
	client *sdwan.Client
}

// siteSecurityZonesRsModel is the model.
type siteSecurityZonesRsModel struct {
	Tfid types.String `tfsdk:"tfid"`

	// Input.
	Etag     types.Int64                               `tfsdk:"etag"`
	Id       types.String                              `tfsdk:"id"`
	Networks []siteSecurityZonesRsModel_aVdThpZ_Config `tfsdk:"networks"`
	SiteId   types.String                              `tfsdk:"site_id"`
	ZoneId   types.String                              `tfsdk:"zone_id"`

	// Output.
	// omit input: etag
	// omit input: id
	// omit input: networks
	// omit input: zone_id
}

type siteSecurityZonesRsModel_aVdThpZ_Config struct {
	NetworkId   types.String `tfsdk:"network_id"`
	NetworkType types.String `tfsdk:"network_type"`
}

// Metadata returns the data source type name.
func (r *siteSecurityZonesResource) Metadata(_ context.Context, req resource.MetadataRequest, resp *resource.MetadataResponse) {
	resp.TypeName = req.ProviderTypeName + "_site_security_zones"
}

// Schema defines the schema for this data source.
func (r *siteSecurityZonesResource) Schema(_ context.Context, _ resource.SchemaRequest, resp *resource.SchemaResponse) {
	resp.Schema = rsschema.Schema{
		Description: "Retrieves a config item.",

		Attributes: map[string]rsschema.Attribute{
			// inputs:map[string]bool{"etag":true, "id":true, "networks":true, "site_id":true, "zone_id":true} outputs:map[string]bool{"etag":true, "id":true, "networks":true, "tfid":true, "zone_id":true} forceNew:map[string]bool{"site_id":true}
			"etag": rsschema.Int64Attribute{
				Description: "Entity tag for the resource.",
				Optional:    true,
				Computed:    true,
			},
			"id": rsschema.StringAttribute{
				Description: "Id.",
				Computed:    true,
				PlanModifiers: []planmodifier.String{
					stringplanmodifier.UseStateForUnknown(),
				},
			},
			"networks": rsschema.ListNestedAttribute{
				Description: "Networks: Required(error = SECURITYZONE_INVALID_CONTEXT: Context id or site id not found.) Valid .",
				Required:    true,
				NestedObject: rsschema.NestedAttributeObject{
					Attributes: map[string]rsschema.Attribute{
						// inputs:map[string]bool{"network_id":true, "network_type":true} outputs:map[string]bool{"network_id":true, "network_type":true} forceNew:map[string]bool(nil)
						"network_id": rsschema.StringAttribute{
							Description: "Network Id.",
							Optional:    true,
						},
						"network_type": rsschema.StringAttribute{
							Description: "Network Type: ValidateEnum(enumClass = classOf[ContextType], error = SECURITYZONE_INVALID_CONTEXTTYPE: Context type not supported., nullAllowed = false) . String must be one of these: `\"wan_network\"`, `\"lan_network\"`, `\"wan_overlay\"`.",
							Required:    true,
							Validators: []validator.String{
								stringvalidator.OneOf("wan_network", "lan_network", "wan_overlay"),
							},
						},
					},
				},
			},
			"site_id": rsschema.StringAttribute{
				Description: "Site Id.",
				Required:    true,
				PlanModifiers: []planmodifier.String{
					stringplanmodifier.RequiresReplace(),
				},
			},
			"tfid": rsschema.StringAttribute{
				Description: "The Terraform ID.",
				Computed:    true,
				PlanModifiers: []planmodifier.String{
					stringplanmodifier.UseStateForUnknown(),
				},
			},
			"zone_id": rsschema.StringAttribute{
				Description: "Zone Id: Required(error = SECURITYZONE_INVALID_ZONE: Zone cannot be changed in the PUT.) .",
				Required:    true,
			},
		},
	}
}

// Configure prepares the struct.
func (r *siteSecurityZonesResource) Configure(_ context.Context, req resource.ConfigureRequest, resp *resource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}

	r.client = req.ProviderData.(*sdwan.Client)
}

// Create resource.
func (r *siteSecurityZonesResource) Create(ctx context.Context, req resource.CreateRequest, resp *resource.CreateResponse) {
	var state siteSecurityZonesRsModel
	resp.Diagnostics.Append(req.Plan.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}

	// Basic logging.
	tflog.Info(ctx, "performing resource create", map[string]any{
		"resource_name":               "prismasdwan_site_security_zones",
		"terraform_provider_function": "Create",
		"site_id":                     state.SiteId.ValueString(),
	})

	// Prepare to create the config.
	svc := xCzsxgj.NewClient(r.client)

	// Prepare input for the API endpoint.
	input := xCzsxgj.CreateInput{}

	input.SiteId = StringValue(state.SiteId)
	input.Request = &eItpily.Config{}

	input.Request.Etag = Int64ValueOrNil(state.Etag)

	if len(state.Networks) != 0 {
		input.Request.Networks = make([]aVdThpZ.Config, 0, len(state.Networks))
		for _, var0 := range state.Networks {
			var var1 aVdThpZ.Config

			var1.NetworkId = StringValueOrNil(var0.NetworkId)

			var1.NetworkType = StringValue(var0.NetworkType)
			input.Request.Networks = append(input.Request.Networks, var1)
		}
	}

	input.Request.ZoneId = StringValue(state.ZoneId)

	// Perform the operation.
	ans, err := svc.Create(ctx, input)
	if err != nil {
		resp.Diagnostics.AddError("Error creating config", err.Error())
		return
	}

	// Create the Terraform ID.
	var idBuilder strings.Builder
	idBuilder.WriteString(input.SiteId)

	idBuilder.WriteString(IdSeparator)
	if ans.Id == nil {
		resp.Diagnostics.AddError("Undefined param required for ID", "Id")
		return
	}
	if ans.Id != nil {
		idBuilder.WriteString(*ans.Id)
	}

	// Store the answer to state.

	state.Tfid = types.StringValue(idBuilder.String())

	state.Etag = types.Int64PointerValue(ans.Etag)

	state.Id = types.StringPointerValue(ans.Id)

	if len(ans.Networks) == 0 {
		state.Networks = nil
	} else {
		state.Networks = make([]siteSecurityZonesRsModel_aVdThpZ_Config, 0, len(ans.Networks))
		for _, var2 := range ans.Networks {
			var3 := siteSecurityZonesRsModel_aVdThpZ_Config{}

			var3.NetworkId = types.StringPointerValue(var2.NetworkId)

			var3.NetworkType = types.StringValue(var2.NetworkType)
			state.Networks = append(state.Networks, var3)
		}
	}

	state.ZoneId = types.StringValue(ans.ZoneId)

	// Done.
	resp.Diagnostics.Append(resp.State.Set(ctx, &state)...)
}

// Read performs Read for the struct.
func (r *siteSecurityZonesResource) Read(ctx context.Context, req resource.ReadRequest, resp *resource.ReadResponse) {
	var savestate, state siteSecurityZonesRsModel
	resp.Diagnostics.Append(req.State.Get(ctx, &savestate)...)
	if resp.Diagnostics.HasError() {
		return
	}

	tfid := savestate.Tfid.ValueString()
	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 2 {
		resp.Diagnostics.AddError("Error in resource ID format", "Expected 2 tokens")
		return
	}

	// Basic logging.
	tflog.Info(ctx, "performing resource read", map[string]any{
		"terraform_provider_function": "Read",
		"resource_name":               "prismasdwan_site_security_zones",
		"locMap":                      map[string]int{"site_id": 0, "zone_id": 1},
		"tokens":                      tokens,
	})

	// Prepare to read the config.
	svc := xCzsxgj.NewClient(r.client)

	// Prepare input for the API endpoint.
	input := xCzsxgj.ReadInput{}

	input.SiteId = tokens[0]

	input.ZoneId = tokens[1]

	// Perform the operation.
	ans, err := svc.Read(ctx, input)
	if err != nil {
		if IsObjectNotFound(err) {
			resp.State.RemoveResource(ctx)
		} else {
			resp.Diagnostics.AddError("Error reading config", err.Error())
		}
		return
	}

	// Store the answer to state.

	if tokens[0] == "" {
		state.SiteId = types.StringNull()
	} else {
		state.SiteId = types.StringValue(tokens[0])
	}
	state.Tfid = savestate.Tfid

	state.Etag = types.Int64PointerValue(ans.Etag)

	state.Id = types.StringPointerValue(ans.Id)

	if len(ans.Networks) == 0 {
		state.Networks = nil
	} else {
		state.Networks = make([]siteSecurityZonesRsModel_aVdThpZ_Config, 0, len(ans.Networks))
		for _, var0 := range ans.Networks {
			var1 := siteSecurityZonesRsModel_aVdThpZ_Config{}

			var1.NetworkId = types.StringPointerValue(var0.NetworkId)

			var1.NetworkType = types.StringValue(var0.NetworkType)
			state.Networks = append(state.Networks, var1)
		}
	}

	state.ZoneId = types.StringValue(ans.ZoneId)

	// Done.
	resp.Diagnostics.Append(resp.State.Set(ctx, &state)...)
}

// Update performs the Update for the struct.
func (r *siteSecurityZonesResource) Update(ctx context.Context, req resource.UpdateRequest, resp *resource.UpdateResponse) {
	var plan, state siteSecurityZonesRsModel
	resp.Diagnostics.Append(req.State.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}

	resp.Diagnostics.Append(req.Plan.Get(ctx, &plan)...)
	if resp.Diagnostics.HasError() {
		return
	}

	tfid := state.Tfid.ValueString()
	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 2 {
		resp.Diagnostics.AddError("Error in resource ID format", "Expected 2 tokens")
		return
	}

	// Basic logging.
	tflog.Info(ctx, "performing resource update", map[string]any{
		"terraform_provider_function": "Update",
		"resource_name":               "prismasdwan_site_security_zones",
		"tfid":                        state.Tfid.ValueString(),
	})

	// Prepare to update the config.
	svc := xCzsxgj.NewClient(r.client)

	// Prepare input for the API endpoint.
	input := xCzsxgj.UpdateInput{}

	if tokens[0] != "" {
		input.SiteId = tokens[0]
	}

	if tokens[1] != "" {
		input.ZoneId = tokens[1]
	}
	input.Request = &eItpily.Config{}

	input.Request.Etag = ValueInt64PointerFromPlanOrState(plan.Etag, state.Etag)

	if len(plan.Networks) != 0 || len(state.Networks) != 0 {
		NetworksToUse := plan.Networks
		if len(plan.Networks) == 0 {
			NetworksToUse = state.Networks
		}
		input.Request.Networks = make([]aVdThpZ.Config, 0, len(NetworksToUse))
		for _, var0 := range plan.Networks {
			var var1 aVdThpZ.Config

			var1.NetworkId = StringValueOrNil(var0.NetworkId)

			var1.NetworkType = StringValue(var0.NetworkType)
			input.Request.Networks = append(input.Request.Networks, var1)
		}
	}

	input.Request.ZoneId = ValueStringFromPlanOrState(plan.ZoneId, state.ZoneId)

	// Perform the operation.
	ans, err := svc.Update(ctx, input)
	if err != nil {
		if IsObjectNotFound(err) {
			resp.State.RemoveResource(ctx)
		} else {
			resp.Diagnostics.AddError("Error updating resource", err.Error())
		}
		return
	}

	// Store the answer to state.
	// Note: when supporting importing a resource, this will need to change to taking
	// values from the savestate.Tfid param and locMap.

	state.Etag = types.Int64PointerValue(ans.Etag)

	state.Id = types.StringPointerValue(ans.Id)

	if len(ans.Networks) == 0 {
		state.Networks = nil
	} else {
		state.Networks = make([]siteSecurityZonesRsModel_aVdThpZ_Config, 0, len(ans.Networks))
		for _, var2 := range ans.Networks {
			var3 := siteSecurityZonesRsModel_aVdThpZ_Config{}

			var3.NetworkId = types.StringPointerValue(var2.NetworkId)

			var3.NetworkType = types.StringValue(var2.NetworkType)
			state.Networks = append(state.Networks, var3)
		}
	}

	state.ZoneId = types.StringValue(ans.ZoneId)

	// Done.
	resp.Diagnostics.Append(resp.State.Set(ctx, &state)...)
}

// Delete performs delete for the struct.
func (r *siteSecurityZonesResource) Delete(ctx context.Context, req resource.DeleteRequest, resp *resource.DeleteResponse) {
	var idType types.String
	resp.Diagnostics.Append(req.State.GetAttribute(ctx, path.Root("tfid"), &idType)...)
	if resp.Diagnostics.HasError() {
		return
	}
	tfid := idType.ValueString()
	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 2 {
		resp.Diagnostics.AddError("Error in resource ID format", "Expected 2 tokens")
		return
	}

	// Basic logging.
	tflog.Info(ctx, "performing resource delete", map[string]any{
		"terraform_provider_function": "Delete",
		"resource_name":               "prismasdwan_site_security_zones",
		"locMap":                      map[string]int{"site_id": 0, "zone_id": 1},
		"tokens":                      tokens,
	})

	svc := xCzsxgj.NewClient(r.client)

	// Prepare input for the API endpoint.
	input := xCzsxgj.DeleteInput{}

	input.SiteId = tokens[0]

	input.ZoneId = tokens[1]

	// Perform the operation.
	if _, err := svc.Delete(ctx, input); err != nil && !IsObjectNotFound(err) {
		resp.Diagnostics.AddError("Error in delete", err.Error())
	}
}

func (r *siteSecurityZonesResource) ImportState(ctx context.Context, req resource.ImportStateRequest, resp *resource.ImportStateResponse) {
	resource.ImportStatePassthroughID(ctx, path.Root("tfid"), req, resp)
}
