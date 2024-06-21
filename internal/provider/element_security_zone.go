package provider

// Note:  This file is automatically generated.  Manually made changes
// will be overwritten when the provider is generated.

import (
	"context"
	"strings"

	"github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk"
	sPPuDTU "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/element/security/zone/screen"
	utDbvHr "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/services/sdwan/v20/api/sites/siteid/elements/elementid/securityzones"

	"github.com/hashicorp/terraform-plugin-framework/datasource"
	dsschema "github.com/hashicorp/terraform-plugin-framework/datasource/schema"
	"github.com/hashicorp/terraform-plugin-framework/path"
	"github.com/hashicorp/terraform-plugin-framework/resource"
	rsschema "github.com/hashicorp/terraform-plugin-framework/resource/schema"
	"github.com/hashicorp/terraform-plugin-framework/resource/schema/planmodifier"
	"github.com/hashicorp/terraform-plugin-framework/resource/schema/stringplanmodifier"
	"github.com/hashicorp/terraform-plugin-framework/types"
	"github.com/hashicorp/terraform-plugin-log/tflog"
)

// Data source (listing).
var (
	_ datasource.DataSource              = &elementSecurityZoneListDataSource{}
	_ datasource.DataSourceWithConfigure = &elementSecurityZoneListDataSource{}
)

func NewElementSecurityZoneListDataSource() datasource.DataSource {
	return &elementSecurityZoneListDataSource{}
}

type elementSecurityZoneListDataSource struct {
	client *sdwan.Client
}

// elementSecurityZoneListDsModel is the model.
type elementSecurityZoneListDsModel struct {
	Tfid types.String `tfsdk:"tfid"`

	// Input.
	ElementId types.String `tfsdk:"element_id"`
	SiteId    types.String `tfsdk:"site_id"`

	// Output.
	Items      []elementSecurityZoneListDsModel_sPPuDTU_Config `tfsdk:"items"`
	TotalItems types.Int64                                     `tfsdk:"total_items"`
}

type elementSecurityZoneListDsModel_sPPuDTU_Config struct {
	Etag            types.Int64  `tfsdk:"etag"`
	Id              types.String `tfsdk:"id"`
	InterfaceIds    types.List   `tfsdk:"interface_ids"`
	LannetworkIds   types.List   `tfsdk:"lannetwork_ids"`
	WaninterfaceIds types.List   `tfsdk:"waninterface_ids"`
	WanoverlayIds   types.List   `tfsdk:"wanoverlay_ids"`
	ZoneId          types.String `tfsdk:"zone_id"`
}

// Metadata returns the data source type name.
func (d *elementSecurityZoneListDataSource) Metadata(_ context.Context, req datasource.MetadataRequest, resp *datasource.MetadataResponse) {
	resp.TypeName = req.ProviderTypeName + "_element_security_zone_list"
}

// Schema defines the schema for this listing data source.
func (d *elementSecurityZoneListDataSource) Schema(_ context.Context, _ datasource.SchemaRequest, resp *datasource.SchemaResponse) {
	resp.Schema = dsschema.Schema{
		Description: "Retrieves a listing of config items.",

		Attributes: map[string]dsschema.Attribute{
			// inputs:map[string]bool{"element_id":true, "site_id":true} outputs:map[string]bool{"items":true, "tfid":true, "total_items":true} forceNew:map[string]bool{"element_id":true, "site_id":true}
			"element_id": dsschema.StringAttribute{
				Description: "Element Id.",
				Required:    true,
			},
			"items": dsschema.ListNestedAttribute{
				Description: "The Items param.",
				Computed:    true,
				NestedObject: dsschema.NestedAttributeObject{
					Attributes: map[string]dsschema.Attribute{
						// inputs:map[string]bool{} outputs:map[string]bool{"etag":true, "id":true, "interface_ids":true, "lannetwork_ids":true, "waninterface_ids":true, "wanoverlay_ids":true, "zone_id":true} forceNew:map[string]bool(nil)
						"etag": dsschema.Int64Attribute{
							Description: "Entity tag for the resource.",
							Computed:    true,
						},
						"id": dsschema.StringAttribute{
							Description: "Id.",
							Computed:    true,
						},
						"interface_ids": dsschema.ListAttribute{
							Description: "Interface Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_INTERFACE_IDS: Specified interface ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false) .",
							Computed:    true,
							ElementType: types.StringType,
						},
						"lannetwork_ids": dsschema.ListAttribute{
							Description: "Lannetwork Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_LANNETWORK_IDS: Specified lan network ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false) .",
							Computed:    true,
							ElementType: types.StringType,
						},
						"waninterface_ids": dsschema.ListAttribute{
							Description: "Waninterface Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_WANINTERFACE_IDS: Specified site wan interface ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false) .",
							Computed:    true,
							ElementType: types.StringType,
						},
						"wanoverlay_ids": dsschema.ListAttribute{
							Description: "Wanoverlay Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_WANOVERLAY_IDS: Specified wanoverlay ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false) .",
							Computed:    true,
							ElementType: types.StringType,
						},
						"zone_id": dsschema.StringAttribute{
							Description: "Zone Id: Required(error = ELEMENT_SECURITYZONE_ZONEID_REQUIRED: Security zone id is required for element level association.) Digits(fraction = 0, integer = 30, ELEMENT_SECURITYZONE_INVALID_ZONEID) .",
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
func (d *elementSecurityZoneListDataSource) Configure(_ context.Context, req datasource.ConfigureRequest, resp *datasource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}

	d.client = req.ProviderData.(*sdwan.Client)
}

// Read performs Read for the struct.
func (d *elementSecurityZoneListDataSource) Read(ctx context.Context, req datasource.ReadRequest, resp *datasource.ReadResponse) {
	var state elementSecurityZoneListDsModel
	resp.Diagnostics.Append(req.Config.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}

	// Basic logging.
	tflog.Info(ctx, "performing data source listing", map[string]any{
		"data_source_name":            "prismasdwan_element_security_zone_list",
		"terraform_provider_function": "Read",
		"site_id":                     state.SiteId.ValueString(),
		"element_id":                  state.ElementId.ValueString(),
	})

	// Prepare to run the command.
	svc := utDbvHr.NewClient(d.client)

	// Prepare input for the API endpoint.
	input := utDbvHr.ListInput{}

	input.SiteId = StringValue(state.SiteId)

	input.ElementId = StringValue(state.ElementId)

	// Perform the operation.
	ans, err := svc.List(ctx, input)
	if err != nil {
		resp.Diagnostics.AddError("Error getting listing", err.Error())
		return
	}

	// Create the Terraform ID.
	var idBuilder strings.Builder
	idBuilder.WriteString(input.SiteId)

	idBuilder.WriteString(IdSeparator)
	idBuilder.WriteString(input.ElementId)

	// Store the answer to state.

	state.Tfid = types.StringValue(idBuilder.String())

	if len(ans.Items) == 0 {
		state.Items = nil
	} else {
		state.Items = make([]elementSecurityZoneListDsModel_sPPuDTU_Config, 0, len(ans.Items))
		for _, var0 := range ans.Items {
			var1 := elementSecurityZoneListDsModel_sPPuDTU_Config{}

			var1.Etag = types.Int64PointerValue(var0.Etag)

			var1.Id = types.StringPointerValue(var0.Id)

			var2, var3 := types.ListValueFrom(ctx, types.StringType, var0.InterfaceIds)
			var1.InterfaceIds = var2
			resp.Diagnostics.Append(var3.Errors()...)

			var4, var5 := types.ListValueFrom(ctx, types.StringType, var0.LannetworkIds)
			var1.LannetworkIds = var4
			resp.Diagnostics.Append(var5.Errors()...)

			var6, var7 := types.ListValueFrom(ctx, types.StringType, var0.WaninterfaceIds)
			var1.WaninterfaceIds = var6
			resp.Diagnostics.Append(var7.Errors()...)

			var8, var9 := types.ListValueFrom(ctx, types.StringType, var0.WanoverlayIds)
			var1.WanoverlayIds = var8
			resp.Diagnostics.Append(var9.Errors()...)

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
	_ datasource.DataSource              = &elementSecurityZoneDataSource{}
	_ datasource.DataSourceWithConfigure = &elementSecurityZoneDataSource{}
)

func NewElementSecurityZoneDataSource() datasource.DataSource {
	return &elementSecurityZoneDataSource{}
}

type elementSecurityZoneDataSource struct {
	client *sdwan.Client
}

// elementSecurityZoneDsModel is the model.
type elementSecurityZoneDsModel struct {
	Tfid types.String `tfsdk:"tfid"`

	// Input.
	ElementId      types.String `tfsdk:"element_id"`
	SecurityZoneId types.String `tfsdk:"security_zone_id"`
	SiteId         types.String `tfsdk:"site_id"`

	// Output.
	Etag            types.Int64  `tfsdk:"etag"`
	Id              types.String `tfsdk:"id"`
	InterfaceIds    types.List   `tfsdk:"interface_ids"`
	LannetworkIds   types.List   `tfsdk:"lannetwork_ids"`
	WaninterfaceIds types.List   `tfsdk:"waninterface_ids"`
	WanoverlayIds   types.List   `tfsdk:"wanoverlay_ids"`
	ZoneId          types.String `tfsdk:"zone_id"`
}

// Metadata returns the data source type name.
func (d *elementSecurityZoneDataSource) Metadata(_ context.Context, req datasource.MetadataRequest, resp *datasource.MetadataResponse) {
	resp.TypeName = req.ProviderTypeName + "_element_security_zone"
}

// Schema defines the schema for this data source.
func (d *elementSecurityZoneDataSource) Schema(_ context.Context, _ datasource.SchemaRequest, resp *datasource.SchemaResponse) {
	resp.Schema = dsschema.Schema{
		Description: "Retrieves a config item.",

		Attributes: map[string]dsschema.Attribute{
			// inputs:map[string]bool{"element_id":true, "security_zone_id":true, "site_id":true} outputs:map[string]bool{"etag":true, "id":true, "interface_ids":true, "lannetwork_ids":true, "tfid":true, "waninterface_ids":true, "wanoverlay_ids":true, "zone_id":true} forceNew:map[string]bool{"element_id":true, "security_zone_id":true, "site_id":true}
			"element_id": dsschema.StringAttribute{
				Description: "Element Id.",
				Required:    true,
			},
			"etag": dsschema.Int64Attribute{
				Description: "Entity tag for the resource.",
				Computed:    true,
			},
			"id": dsschema.StringAttribute{
				Description: "Id.",
				Computed:    true,
			},
			"interface_ids": dsschema.ListAttribute{
				Description: "Interface Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_INTERFACE_IDS: Specified interface ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false) .",
				Computed:    true,
				ElementType: types.StringType,
			},
			"lannetwork_ids": dsschema.ListAttribute{
				Description: "Lannetwork Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_LANNETWORK_IDS: Specified lan network ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false) .",
				Computed:    true,
				ElementType: types.StringType,
			},
			"security_zone_id": dsschema.StringAttribute{
				Description: "Security Zone Id.",
				Required:    true,
			},
			"site_id": dsschema.StringAttribute{
				Description: "Site Id.",
				Required:    true,
			},
			"tfid": dsschema.StringAttribute{
				Description: "The Terraform ID.",
				Computed:    true,
			},
			"waninterface_ids": dsschema.ListAttribute{
				Description: "Waninterface Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_WANINTERFACE_IDS: Specified site wan interface ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false) .",
				Computed:    true,
				ElementType: types.StringType,
			},
			"wanoverlay_ids": dsschema.ListAttribute{
				Description: "Wanoverlay Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_WANOVERLAY_IDS: Specified wanoverlay ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false) .",
				Computed:    true,
				ElementType: types.StringType,
			},
			"zone_id": dsschema.StringAttribute{
				Description: "Zone Id: Required(error = ELEMENT_SECURITYZONE_ZONEID_REQUIRED: Security zone id is required for element level association.) Digits(fraction = 0, integer = 30, ELEMENT_SECURITYZONE_INVALID_ZONEID) .",
				Computed:    true,
			},
		},
	}
}

// Configure prepares the struct.
func (d *elementSecurityZoneDataSource) Configure(_ context.Context, req datasource.ConfigureRequest, resp *datasource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}

	d.client = req.ProviderData.(*sdwan.Client)
}

// Read performs Read for the struct.
func (d *elementSecurityZoneDataSource) Read(ctx context.Context, req datasource.ReadRequest, resp *datasource.ReadResponse) {
	var state elementSecurityZoneDsModel
	resp.Diagnostics.Append(req.Config.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}

	// Basic logging.
	tflog.Info(ctx, "performing data source read", map[string]any{
		"data_source_name":            "prismasdwan_element_security_zone",
		"terraform_provider_function": "Read",
		"site_id":                     state.SiteId.ValueString(),
		"element_id":                  state.ElementId.ValueString(),
		"security_zone_id":            state.SecurityZoneId.ValueString(),
	})

	// Prepare to run the command.
	svc := utDbvHr.NewClient(d.client)

	// Prepare input for the API endpoint.
	input := utDbvHr.ReadInput{}

	input.SiteId = StringValue(state.SiteId)

	input.ElementId = StringValue(state.ElementId)

	input.SecurityZoneId = StringValue(state.SecurityZoneId)

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
	idBuilder.WriteString(input.ElementId)

	idBuilder.WriteString(IdSeparator)
	idBuilder.WriteString(input.SecurityZoneId)

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

	var0, var1 := types.ListValueFrom(ctx, types.StringType, ans.InterfaceIds)
	state.InterfaceIds = var0
	resp.Diagnostics.Append(var1.Errors()...)

	var2, var3 := types.ListValueFrom(ctx, types.StringType, ans.LannetworkIds)
	state.LannetworkIds = var2
	resp.Diagnostics.Append(var3.Errors()...)

	var4, var5 := types.ListValueFrom(ctx, types.StringType, ans.WaninterfaceIds)
	state.WaninterfaceIds = var4
	resp.Diagnostics.Append(var5.Errors()...)

	var6, var7 := types.ListValueFrom(ctx, types.StringType, ans.WanoverlayIds)
	state.WanoverlayIds = var6
	resp.Diagnostics.Append(var7.Errors()...)

	state.ZoneId = types.StringValue(ans.ZoneId)

	// Done.
	resp.Diagnostics.Append(resp.State.Set(ctx, &state)...)
}

// Resource.
var (
	_ resource.Resource                = &elementSecurityZoneResource{}
	_ resource.ResourceWithConfigure   = &elementSecurityZoneResource{}
	_ resource.ResourceWithImportState = &elementSecurityZoneResource{}
)

func NewElementSecurityZoneResource() resource.Resource {
	return &elementSecurityZoneResource{}
}

type elementSecurityZoneResource struct {
	client *sdwan.Client
}

// elementSecurityZoneRsModel is the model.
type elementSecurityZoneRsModel struct {
	Tfid types.String `tfsdk:"tfid"`

	// Input.
	ElementId       types.String `tfsdk:"element_id"`
	Etag            types.Int64  `tfsdk:"etag"`
	Id              types.String `tfsdk:"id"`
	InterfaceIds    types.List   `tfsdk:"interface_ids"`
	LannetworkIds   types.List   `tfsdk:"lannetwork_ids"`
	SiteId          types.String `tfsdk:"site_id"`
	WaninterfaceIds types.List   `tfsdk:"waninterface_ids"`
	WanoverlayIds   types.List   `tfsdk:"wanoverlay_ids"`
	ZoneId          types.String `tfsdk:"zone_id"`

	// Output.
	// omit input: etag
	// omit input: id
	// omit input: interface_ids
	// omit input: lannetwork_ids
	// omit input: waninterface_ids
	// omit input: wanoverlay_ids
	// omit input: zone_id
}

// Metadata returns the data source type name.
func (r *elementSecurityZoneResource) Metadata(_ context.Context, req resource.MetadataRequest, resp *resource.MetadataResponse) {
	resp.TypeName = req.ProviderTypeName + "_element_security_zone"
}

// Schema defines the schema for this data source.
func (r *elementSecurityZoneResource) Schema(_ context.Context, _ resource.SchemaRequest, resp *resource.SchemaResponse) {
	resp.Schema = rsschema.Schema{
		Description: "Retrieves a config item.",

		Attributes: map[string]rsschema.Attribute{
			// inputs:map[string]bool{"element_id":true, "etag":true, "id":true, "interface_ids":true, "lannetwork_ids":true, "site_id":true, "waninterface_ids":true, "wanoverlay_ids":true, "zone_id":true} outputs:map[string]bool{"etag":true, "id":true, "interface_ids":true, "lannetwork_ids":true, "tfid":true, "waninterface_ids":true, "wanoverlay_ids":true, "zone_id":true} forceNew:map[string]bool{"element_id":true, "site_id":true}
			"element_id": rsschema.StringAttribute{
				Description: "Element Id.",
				Required:    true,
				PlanModifiers: []planmodifier.String{
					stringplanmodifier.RequiresReplace(),
				},
			},
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
			"interface_ids": rsschema.ListAttribute{
				Description: "Interface Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_INTERFACE_IDS: Specified interface ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false) .",
				Optional:    true,
				ElementType: types.StringType,
			},
			"lannetwork_ids": rsschema.ListAttribute{
				Description: "Lannetwork Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_LANNETWORK_IDS: Specified lan network ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false) .",
				Optional:    true,
				ElementType: types.StringType,
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
			"waninterface_ids": rsschema.ListAttribute{
				Description: "Waninterface Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_WANINTERFACE_IDS: Specified site wan interface ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false) .",
				Optional:    true,
				ElementType: types.StringType,
			},
			"wanoverlay_ids": rsschema.ListAttribute{
				Description: "Wanoverlay Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_WANOVERLAY_IDS: Specified wanoverlay ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false) .",
				Optional:    true,
				ElementType: types.StringType,
			},
			"zone_id": rsschema.StringAttribute{
				Description: "Zone Id: Required(error = ELEMENT_SECURITYZONE_ZONEID_REQUIRED: Security zone id is required for element level association.) Digits(fraction = 0, integer = 30, ELEMENT_SECURITYZONE_INVALID_ZONEID) .",
				Required:    true,
			},
		},
	}
}

// Configure prepares the struct.
func (r *elementSecurityZoneResource) Configure(_ context.Context, req resource.ConfigureRequest, resp *resource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}

	r.client = req.ProviderData.(*sdwan.Client)
}

// Create resource.
func (r *elementSecurityZoneResource) Create(ctx context.Context, req resource.CreateRequest, resp *resource.CreateResponse) {
	var state elementSecurityZoneRsModel
	resp.Diagnostics.Append(req.Plan.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}

	// Basic logging.
	tflog.Info(ctx, "performing resource create", map[string]any{
		"resource_name":               "prismasdwan_element_security_zone",
		"terraform_provider_function": "Create",
		"site_id":                     state.SiteId.ValueString(),
		"element_id":                  state.ElementId.ValueString(),
	})

	// Prepare to create the config.
	svc := utDbvHr.NewClient(r.client)

	// Prepare input for the API endpoint.
	input := utDbvHr.CreateInput{}

	input.SiteId = StringValue(state.SiteId)

	input.ElementId = StringValue(state.ElementId)
	input.Request = &sPPuDTU.Config{}

	input.Request.Etag = Int64ValueOrNil(state.Etag)

	input.Request.InterfaceIds = ListStringValueOrNil(ctx, state.InterfaceIds)

	input.Request.LannetworkIds = ListStringValueOrNil(ctx, state.LannetworkIds)

	input.Request.WaninterfaceIds = ListStringValueOrNil(ctx, state.WaninterfaceIds)

	input.Request.WanoverlayIds = ListStringValueOrNil(ctx, state.WanoverlayIds)

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
	idBuilder.WriteString(input.ElementId)

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

	var4, var5 := types.ListValueFrom(ctx, types.StringType, ans.InterfaceIds)
	state.InterfaceIds = var4
	resp.Diagnostics.Append(var5.Errors()...)

	var6, var7 := types.ListValueFrom(ctx, types.StringType, ans.LannetworkIds)
	state.LannetworkIds = var6
	resp.Diagnostics.Append(var7.Errors()...)

	var8, var9 := types.ListValueFrom(ctx, types.StringType, ans.WaninterfaceIds)
	state.WaninterfaceIds = var8
	resp.Diagnostics.Append(var9.Errors()...)

	var10, var11 := types.ListValueFrom(ctx, types.StringType, ans.WanoverlayIds)
	state.WanoverlayIds = var10
	resp.Diagnostics.Append(var11.Errors()...)

	state.ZoneId = types.StringValue(ans.ZoneId)

	// Done.
	resp.Diagnostics.Append(resp.State.Set(ctx, &state)...)
}

// Read performs Read for the struct.
func (r *elementSecurityZoneResource) Read(ctx context.Context, req resource.ReadRequest, resp *resource.ReadResponse) {
	var savestate, state elementSecurityZoneRsModel
	resp.Diagnostics.Append(req.State.Get(ctx, &savestate)...)
	if resp.Diagnostics.HasError() {
		return
	}

	tfid := savestate.Tfid.ValueString()
	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 3 {
		resp.Diagnostics.AddError("Error in resource ID format", "Expected 3 tokens")
		return
	}

	// Basic logging.
	tflog.Info(ctx, "performing resource read", map[string]any{
		"terraform_provider_function": "Read",
		"resource_name":               "prismasdwan_element_security_zone",
		"locMap":                      map[string]int{"element_id": 1, "security_zone_id": 2, "site_id": 0},
		"tokens":                      tokens,
	})

	// Prepare to read the config.
	svc := utDbvHr.NewClient(r.client)

	// Prepare input for the API endpoint.
	input := utDbvHr.ReadInput{}

	input.SiteId = tokens[0]

	input.ElementId = tokens[1]

	input.SecurityZoneId = tokens[2]

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

	if tokens[1] == "" {
		state.ElementId = types.StringNull()
	} else {
		state.ElementId = types.StringValue(tokens[1])
	}
	state.Tfid = savestate.Tfid

	state.Etag = types.Int64PointerValue(ans.Etag)

	state.Id = types.StringPointerValue(ans.Id)

	var0, var1 := types.ListValueFrom(ctx, types.StringType, ans.InterfaceIds)
	state.InterfaceIds = var0
	resp.Diagnostics.Append(var1.Errors()...)

	var2, var3 := types.ListValueFrom(ctx, types.StringType, ans.LannetworkIds)
	state.LannetworkIds = var2
	resp.Diagnostics.Append(var3.Errors()...)

	var4, var5 := types.ListValueFrom(ctx, types.StringType, ans.WaninterfaceIds)
	state.WaninterfaceIds = var4
	resp.Diagnostics.Append(var5.Errors()...)

	var6, var7 := types.ListValueFrom(ctx, types.StringType, ans.WanoverlayIds)
	state.WanoverlayIds = var6
	resp.Diagnostics.Append(var7.Errors()...)

	state.ZoneId = types.StringValue(ans.ZoneId)

	// Done.
	resp.Diagnostics.Append(resp.State.Set(ctx, &state)...)
}

// Update performs the Update for the struct.
func (r *elementSecurityZoneResource) Update(ctx context.Context, req resource.UpdateRequest, resp *resource.UpdateResponse) {
	var plan, state elementSecurityZoneRsModel
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
	if len(tokens) != 3 {
		resp.Diagnostics.AddError("Error in resource ID format", "Expected 3 tokens")
		return
	}

	// Basic logging.
	tflog.Info(ctx, "performing resource update", map[string]any{
		"terraform_provider_function": "Update",
		"resource_name":               "prismasdwan_element_security_zone",
		"tfid":                        state.Tfid.ValueString(),
	})

	// Prepare to update the config.
	svc := utDbvHr.NewClient(r.client)

	// Prepare input for the API endpoint.
	input := utDbvHr.UpdateInput{}

	if tokens[0] != "" {
		input.SiteId = tokens[0]
	}

	if tokens[1] != "" {
		input.ElementId = tokens[1]
	}

	if tokens[2] != "" {
		input.SecurityZoneId = tokens[2]
	}
	input.Request = &sPPuDTU.Config{}

	input.Request.Etag = ValueInt64PointerFromPlanOrState(plan.Etag, state.Etag)

	input.Request.InterfaceIds = ListStringValueOrNil(ctx, plan.InterfaceIds)

	input.Request.LannetworkIds = ListStringValueOrNil(ctx, plan.LannetworkIds)

	input.Request.WaninterfaceIds = ListStringValueOrNil(ctx, plan.WaninterfaceIds)

	input.Request.WanoverlayIds = ListStringValueOrNil(ctx, plan.WanoverlayIds)

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

	var4, var5 := types.ListValueFrom(ctx, types.StringType, ans.InterfaceIds)
	state.InterfaceIds = var4
	resp.Diagnostics.Append(var5.Errors()...)

	var6, var7 := types.ListValueFrom(ctx, types.StringType, ans.LannetworkIds)
	state.LannetworkIds = var6
	resp.Diagnostics.Append(var7.Errors()...)

	var8, var9 := types.ListValueFrom(ctx, types.StringType, ans.WaninterfaceIds)
	state.WaninterfaceIds = var8
	resp.Diagnostics.Append(var9.Errors()...)

	var10, var11 := types.ListValueFrom(ctx, types.StringType, ans.WanoverlayIds)
	state.WanoverlayIds = var10
	resp.Diagnostics.Append(var11.Errors()...)

	state.ZoneId = types.StringValue(ans.ZoneId)

	// Done.
	resp.Diagnostics.Append(resp.State.Set(ctx, &state)...)
}

// Delete performs delete for the struct.
func (r *elementSecurityZoneResource) Delete(ctx context.Context, req resource.DeleteRequest, resp *resource.DeleteResponse) {
	var idType types.String
	resp.Diagnostics.Append(req.State.GetAttribute(ctx, path.Root("tfid"), &idType)...)
	if resp.Diagnostics.HasError() {
		return
	}
	tfid := idType.ValueString()
	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 3 {
		resp.Diagnostics.AddError("Error in resource ID format", "Expected 3 tokens")
		return
	}

	// Basic logging.
	tflog.Info(ctx, "performing resource delete", map[string]any{
		"terraform_provider_function": "Delete",
		"resource_name":               "prismasdwan_element_security_zone",
		"locMap":                      map[string]int{"element_id": 1, "security_zone_id": 2, "site_id": 0},
		"tokens":                      tokens,
	})

	svc := utDbvHr.NewClient(r.client)

	// Prepare input for the API endpoint.
	input := utDbvHr.DeleteInput{}

	input.SiteId = tokens[0]

	input.ElementId = tokens[1]

	input.SecurityZoneId = tokens[2]

	// Perform the operation.
	if _, err := svc.Delete(ctx, input); err != nil && !IsObjectNotFound(err) {
		resp.Diagnostics.AddError("Error in delete", err.Error())
	}
}

func (r *elementSecurityZoneResource) ImportState(ctx context.Context, req resource.ImportStateRequest, resp *resource.ImportStateResponse) {
	resource.ImportStatePassthroughID(ctx, path.Root("tfid"), req, resp)
}
