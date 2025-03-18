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
// | Schema Map Summary (size=goLangStructMap=4)
// | Computed Resource Name=sites_elements_ospfconfigs
// +-----------------------------------------------------------------
// | OspfGlobalConfig HasID=false
// | InterfaceOspfConfig HasID=false
// | Area HasID=false
// | OspfConfigScreen HasID=true
// +-----------------------------------------------------------------

// Data source.
var (
	_ datasource.DataSource              = &elementOspfConfigDataSource{}
	_ datasource.DataSourceWithConfigure = &elementOspfConfigDataSource{}
)

// To enable this data source for TF Provider, go to `provider.go` and inject this into the function
// as below:
//
//	func (p *SdwanProvider) DataSources(_ context.Context) []func() datasource.DataSource {
//	  	return []func() datasource.DataSource{
//	     ... <other existing data sources>
//	     NewElementOspfConfigDataSource,
//	     // -- append next datasource above -- //
//	     }
//	  }
func NewElementOspfConfigDataSource() datasource.DataSource {
	return &elementOspfConfigDataSource{}
}

type elementOspfConfigDataSource struct {
	client *sdwan.Client
}

// Metadata returns the data source type name.
func (d *elementOspfConfigDataSource) Metadata(_ context.Context, req datasource.MetadataRequest, resp *datasource.MetadataResponse) {
	resp.TypeName = "prismasdwan_element_ospf_config"
}

// Schema defines the schema for this data source.
func (d *elementOspfConfigDataSource) Schema(_ context.Context, _ datasource.SchemaRequest, resp *datasource.SchemaResponse) {
	resp.Schema = dsschema.Schema{
		Description: "Retrieves a config item.",

		Attributes: map[string]dsschema.Attribute{
			"tfid": dsschema.StringAttribute{
				Computed: true,
			},
			// rest all properties to be read from GET API Schema schema=OspfConfigScreen
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
			// property: name=areas, type=ARRAY_REFERENCE macro=rss_schema
			"areas": dsschema.ListNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				NestedObject: dsschema.NestedAttributeObject{
					Attributes: map[string]dsschema.Attribute{
						// property: name=area_id, type=INTEGER macro=rss_schema
						"area_id": dsschema.Int64Attribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=area_id, type=INTEGER macro=rss_schema
						// property: name=area_type, type=STRING macro=rss_schema
						"area_type": dsschema.StringAttribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=area_type, type=STRING macro=rss_schema
					},
				},
			},
			// key name holder for attribute: name=area_type, type=STRING macro=rss_schema
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
			// property: name=interfaces, type=ARRAY_REFERENCE macro=rss_schema
			"interfaces": dsschema.ListNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				NestedObject: dsschema.NestedAttributeObject{
					Attributes: map[string]dsschema.Attribute{
						// property: name=area_id, type=INTEGER macro=rss_schema
						"area_id": dsschema.Int64Attribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=area_id, type=INTEGER macro=rss_schema
						// property: name=interface_id, type=STRING macro=rss_schema
						"interface_id": dsschema.StringAttribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=interface_id, type=STRING macro=rss_schema
						// property: name=ospf_config_override, type=REFERENCE macro=rss_schema
						"ospf_config_override": dsschema.SingleNestedAttribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
							Attributes: map[string]dsschema.Attribute{
								// property: name=cost, type=INTEGER macro=rss_schema
								"cost": dsschema.Int64Attribute{
									Required:  false,
									Computed:  false,
									Optional:  true,
									Sensitive: false,
								},
								// key name holder for attribute: name=cost, type=INTEGER macro=rss_schema
								// property: name=dead_interval, type=INTEGER macro=rss_schema
								"dead_interval": dsschema.Int64Attribute{
									Required:  false,
									Computed:  false,
									Optional:  true,
									Sensitive: false,
								},
								// key name holder for attribute: name=dead_interval, type=INTEGER macro=rss_schema
								// property: name=hello_interval, type=INTEGER macro=rss_schema
								"hello_interval": dsschema.Int64Attribute{
									Required:  false,
									Computed:  false,
									Optional:  true,
									Sensitive: false,
								},
								// key name holder for attribute: name=hello_interval, type=INTEGER macro=rss_schema
								// property: name=md5_key_id, type=INTEGER macro=rss_schema
								"md5_key_id": dsschema.Int64Attribute{
									Required:  false,
									Computed:  false,
									Optional:  true,
									Sensitive: false,
								},
								// key name holder for attribute: name=md5_key_id, type=INTEGER macro=rss_schema
								// property: name=md5_secret, type=STRING macro=rss_schema
								"md5_secret": dsschema.StringAttribute{
									Required:  false,
									Computed:  false,
									Optional:  true,
									Sensitive: true,
								},
								// key name holder for attribute: name=md5_secret, type=STRING macro=rss_schema
								"md5_secret_internal_key_name": dsschema.StringAttribute{
									Required:  false,
									Computed:  true,
									Optional:  true,
									Sensitive: false,
								},
								// property: name=retransmit_interval, type=INTEGER macro=rss_schema
								"retransmit_interval": dsschema.Int64Attribute{
									Required:  false,
									Computed:  false,
									Optional:  true,
									Sensitive: false,
								},
								// key name holder for attribute: name=retransmit_interval, type=INTEGER macro=rss_schema
								// property: name=transmit_delay, type=INTEGER macro=rss_schema
								"transmit_delay": dsschema.Int64Attribute{
									Required:  false,
									Computed:  false,
									Optional:  true,
									Sensitive: false,
								},
								// key name holder for attribute: name=transmit_delay, type=INTEGER macro=rss_schema
							},
						},
						// key name holder for attribute: name=transmit_delay, type=INTEGER macro=rss_schema
					},
				},
			},
			// key name holder for attribute: name=transmit_delay, type=INTEGER macro=rss_schema
			// property: name=name, type=STRING macro=rss_schema
			"name": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=name, type=STRING macro=rss_schema
			// property: name=prefix_adv_route_map_id, type=STRING macro=rss_schema
			"prefix_adv_route_map_id": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=prefix_adv_route_map_id, type=STRING macro=rss_schema
			// property: name=prefix_adv_type_to_lan, type=STRING macro=rss_schema
			"prefix_adv_type_to_lan": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=prefix_adv_type_to_lan, type=STRING macro=rss_schema
			// property: name=redistribute_bgp, type=BOOLEAN macro=rss_schema
			"redistribute_bgp": dsschema.BoolAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=redistribute_bgp, type=BOOLEAN macro=rss_schema
			// property: name=redistribute_route_map_id, type=STRING macro=rss_schema
			"redistribute_route_map_id": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=redistribute_route_map_id, type=STRING macro=rss_schema
			// property: name=router_id, type=STRING macro=rss_schema
			"router_id": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=router_id, type=STRING macro=rss_schema
			// property: name=scope, type=STRING macro=rss_schema
			"scope": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=scope, type=STRING macro=rss_schema
			// property: name=shutdown, type=BOOLEAN macro=rss_schema
			"shutdown": dsschema.BoolAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=shutdown, type=BOOLEAN macro=rss_schema
			// property: name=tags, type=SET_PRIMITIVE macro=rss_schema
			"tags": dsschema.SetAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				Sensitive:   false,
				ElementType: types.StringType,
			},
			// key name holder for attribute: name=tags, type=SET_PRIMITIVE macro=rss_schema
			// property: name=vrf_context_id, type=STRING macro=rss_schema
			"vrf_context_id": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=vrf_context_id, type=STRING macro=rss_schema
		},
	}
}

// Configure prepares the struct.
func (d *elementOspfConfigDataSource) Configure(_ context.Context, req datasource.ConfigureRequest, resp *datasource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}
	d.client = req.ProviderData.(*sdwan.Client)
}

// Read performs Read for the struct.
func (d *elementOspfConfigDataSource) Read(ctx context.Context, req datasource.ReadRequest, resp *datasource.ReadResponse) {
	var state dsModelOspfConfigScreen
	resp.Diagnostics.Append(req.Config.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}
	// pointers
	diagnostics := &resp.Diagnostics

	// Basic logging.
	tflog.Info(ctx, "performing datasource read", map[string]any{
		"terraform_provider_function": "Read",
		"resource_name":               "prismasdwan_element_ospf_config",
	})

	tfid := state.Tfid.ValueString()
	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 3 {
		resp.Diagnostics.AddError("error in prismasdwan_element_ospf_config ID format", "Expected 3 tokens")
		return
	}

	// Prepare to read the config.
	svc := sdwan_client.NewClient(d.client)

	// Prepare input for the API endpoint.
	read_request := &sdwan_client.SdwanClientRequestResponse{}
	read_request.Method = "GET"
	read_request.Path = "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/ospfconfigs/{ospf_config_id}"

	// handle parameters
	params := make(map[string]*string)
	read_request.PathParameters = &params
	params["site_id"] = &tokens[0]
	params["element_id"] = &tokens[1]
	params["ospf_config_id"] = &tokens[2]

	// Perform the operation.
	svc.ExecuteSdwanRequest(ctx, read_request)
	if read_request.ResponseErr != nil {
		if IsObjectNotFound(*read_request.ResponseErr) {
			resp.State.RemoveResource(ctx)
		} else {
			resp.Diagnostics.AddError("error reading prismasdwan_element_ospf_config", (*read_request.ResponseErr).Error())
		}
		return
	}

	// Create the Terraform ID.
	var idBuilder strings.Builder
	idBuilder.WriteString("x")

	// Store the answer to state.
	state.Tfid = types.StringValue(idBuilder.String())
	// start copying attributes
	var ans sdwan_schema.OspfConfigScreen
	// copy from json response
	json_err := json.Unmarshal(*read_request.ResponseBytes, &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to OspfConfigScreen", json_err.Error())
		return
	}

	// lets copy all items into state schema=OspfConfigScreen
	// copy_to_state: state=state prefix=dsModel ans=ans properties=16
	// property: name=_etag, type=INTEGER macro=copy_to_state
	state.Etag = types.Int64PointerValue(ans.Etag)
	// property: name=_schema, type=INTEGER macro=copy_to_state
	state.Schema = types.Int64PointerValue(ans.Schema)
	// property: name=areas, type=ARRAY_REFERENCE macro=copy_to_state
	if ans.Areas == nil {
		state.Areas = nil
	} else if len(ans.Areas) == 0 {
		state.Areas = []dsModelArea{}
	} else {
		state.Areas = make([]dsModelArea, 0, len(ans.Areas))
		for varLoopAreasIndex, varLoopAreas := range ans.Areas {
			// add a new item
			state.Areas = append(state.Areas, dsModelArea{})
			// copy_to_state: state=state.Areas[varLoopAreasIndex] prefix=dsModel ans=varLoopAreas properties=2
			// property: name=area_id, type=INTEGER macro=copy_to_state
			state.Areas[varLoopAreasIndex].AreaId = types.Int64PointerValue(varLoopAreas.AreaId)
			// property: name=area_type, type=STRING macro=copy_to_state
			state.Areas[varLoopAreasIndex].AreaType = types.StringPointerValue(varLoopAreas.AreaType)
		}
	}
	// property: name=description, type=STRING macro=copy_to_state
	state.Description = types.StringPointerValue(ans.Description)
	// property: name=id, type=STRING macro=copy_to_state
	state.Id = types.StringPointerValue(ans.Id)
	// property: name=interfaces, type=ARRAY_REFERENCE macro=copy_to_state
	if ans.Interfaces == nil {
		state.Interfaces = nil
	} else if len(ans.Interfaces) == 0 {
		state.Interfaces = []dsModelInterfaceOspfConfig{}
	} else {
		state.Interfaces = make([]dsModelInterfaceOspfConfig, 0, len(ans.Interfaces))
		for varLoopInterfacesIndex, varLoopInterfaces := range ans.Interfaces {
			// add a new item
			state.Interfaces = append(state.Interfaces, dsModelInterfaceOspfConfig{})
			// copy_to_state: state=state.Interfaces[varLoopInterfacesIndex] prefix=dsModel ans=varLoopInterfaces properties=3
			// property: name=area_id, type=INTEGER macro=copy_to_state
			state.Interfaces[varLoopInterfacesIndex].AreaId = types.Int64PointerValue(varLoopInterfaces.AreaId)
			// property: name=interface_id, type=STRING macro=copy_to_state
			state.Interfaces[varLoopInterfacesIndex].InterfaceId = types.StringPointerValue(varLoopInterfaces.InterfaceId)
			// property: name=ospf_config_override, type=REFERENCE macro=copy_to_state
			if varLoopInterfaces.OspfConfigOverride == nil {
				state.Interfaces[varLoopInterfacesIndex].OspfConfigOverride = nil
			} else {
				state.Interfaces[varLoopInterfacesIndex].OspfConfigOverride = &dsModelOspfGlobalConfig{}
				// copy_to_state: state=state.Interfaces[varLoopInterfacesIndex].OspfConfigOverride prefix=dsModel ans=varLoopInterfaces.OspfConfigOverride properties=7
				// property: name=cost, type=INTEGER macro=copy_to_state
				state.Interfaces[varLoopInterfacesIndex].OspfConfigOverride.Cost = types.Int64PointerValue(varLoopInterfaces.OspfConfigOverride.Cost)
				// property: name=dead_interval, type=INTEGER macro=copy_to_state
				state.Interfaces[varLoopInterfacesIndex].OspfConfigOverride.DeadInterval = types.Int64PointerValue(varLoopInterfaces.OspfConfigOverride.DeadInterval)
				// property: name=hello_interval, type=INTEGER macro=copy_to_state
				state.Interfaces[varLoopInterfacesIndex].OspfConfigOverride.HelloInterval = types.Int64PointerValue(varLoopInterfaces.OspfConfigOverride.HelloInterval)
				// property: name=md5_key_id, type=INTEGER macro=copy_to_state
				state.Interfaces[varLoopInterfacesIndex].OspfConfigOverride.Md5KeyId = types.Int64PointerValue(varLoopInterfaces.OspfConfigOverride.Md5KeyId)
				// property: name=md5_secret, type=STRING macro=copy_to_state
				state.Interfaces[varLoopInterfacesIndex].OspfConfigOverride.Md5Secret = types.StringPointerValue(varLoopInterfaces.OspfConfigOverride.Md5Secret)
				// property: name=retransmit_interval, type=INTEGER macro=copy_to_state
				state.Interfaces[varLoopInterfacesIndex].OspfConfigOverride.RetransmitInterval = types.Int64PointerValue(varLoopInterfaces.OspfConfigOverride.RetransmitInterval)
				// property: name=transmit_delay, type=INTEGER macro=copy_to_state
				state.Interfaces[varLoopInterfacesIndex].OspfConfigOverride.TransmitDelay = types.Int64PointerValue(varLoopInterfaces.OspfConfigOverride.TransmitDelay)
			}
		}
	}
	// property: name=name, type=STRING macro=copy_to_state
	state.Name = types.StringPointerValue(ans.Name)
	// property: name=prefix_adv_route_map_id, type=STRING macro=copy_to_state
	state.PrefixAdvRouteMapId = types.StringPointerValue(ans.PrefixAdvRouteMapId)
	// property: name=prefix_adv_type_to_lan, type=STRING macro=copy_to_state
	state.PrefixAdvTypeToLan = types.StringPointerValue(ans.PrefixAdvTypeToLan)
	// property: name=redistribute_bgp, type=BOOLEAN macro=copy_to_state
	state.RedistributeBgp = types.BoolPointerValue(ans.RedistributeBgp)
	// property: name=redistribute_route_map_id, type=STRING macro=copy_to_state
	state.RedistributeRouteMapId = types.StringPointerValue(ans.RedistributeRouteMapId)
	// property: name=router_id, type=STRING macro=copy_to_state
	state.RouterId = types.StringPointerValue(ans.RouterId)
	// property: name=scope, type=STRING macro=copy_to_state
	state.Scope = types.StringPointerValue(ans.Scope)
	// property: name=shutdown, type=BOOLEAN macro=copy_to_state
	state.Shutdown = types.BoolPointerValue(ans.Shutdown)
	// property: name=tags, type=SET_PRIMITIVE macro=copy_to_state
	varTags, errTags := types.SetValueFrom(ctx, types.StringType, ans.Tags)
	state.Tags = varTags
	resp.Diagnostics.Append(errTags.Errors()...)
	// property: name=vrf_context_id, type=STRING macro=copy_to_state
	state.VrfContextId = types.StringPointerValue(ans.VrfContextId)

	// Done.
	diagnostics.Append(resp.State.Set(ctx, &state)...)
}
