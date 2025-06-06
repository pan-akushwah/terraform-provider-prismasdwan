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
// | Schema Map Summary (size=goLangStructMap=7)
// | Computed Resource Name=sites_prismasase_connections
// +-----------------------------------------------------------------
// | RoutingConfigs HasID=false
// | Routing HasID=false
// | IPSecTunnelAuthentication HasID=false
// | IPSecTunnel HasID=false
// | RemoteNetworkGroup HasID=false
// | IPSecTunnelConfigs HasID=false
// | SaseConnectionScreenV2N1 HasID=true
// +-----------------------------------------------------------------

// Data source.
var (
	_ datasource.DataSource              = &sitePrismaSaseConnectionDataSource{}
	_ datasource.DataSourceWithConfigure = &sitePrismaSaseConnectionDataSource{}
)

// To enable this data source for TF Provider, go to `provider.go` and inject this into the function
// as below:
//
//	func (p *SdwanProvider) DataSources(_ context.Context) []func() datasource.DataSource {
//	  	return []func() datasource.DataSource{
//	     ... <other existing data sources>
//	     NewSitePrismaSaseConnectionDataSource,
//	     // -- append next datasource above -- //
//	     }
//	  }
func NewSitePrismaSaseConnectionDataSource() datasource.DataSource {
	return &sitePrismaSaseConnectionDataSource{}
}

type sitePrismaSaseConnectionDataSource struct {
	client *sdwan.Client
}

// Metadata returns the data source type name.
func (d *sitePrismaSaseConnectionDataSource) Metadata(_ context.Context, req datasource.MetadataRequest, resp *datasource.MetadataResponse) {
	resp.TypeName = "prismasdwan_site_prisma_sase_connection"
}

// Schema defines the schema for this data source.
func (d *sitePrismaSaseConnectionDataSource) Schema(_ context.Context, _ datasource.SchemaRequest, resp *datasource.SchemaResponse) {
	resp.Schema = dsschema.Schema{
		Description: "Retrieves a config item.",

		Attributes: map[string]dsschema.Attribute{
			"tfid": dsschema.StringAttribute{
				Computed: true,
			},
			// rest all properties to be read from GET API Schema schema=SaseConnectionScreenV2N1
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
			// property: name=enabled_wan_interface_ids, type=ARRAY_PRIMITIVE macro=rss_schema
			"enabled_wan_interface_ids": dsschema.ListAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				Sensitive:   false,
				ElementType: types.StringType,
			},
			// key name holder for attribute: name=enabled_wan_interface_ids, type=ARRAY_PRIMITIVE macro=rss_schema
			// property: name=id, type=STRING macro=rss_schema
			"id": dsschema.StringAttribute{
				Required:  false,
				Computed:  true,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=id, type=STRING macro=rss_schema
			// property: name=ipsec_tunnel_configs, type=REFERENCE macro=rss_schema
			"ipsec_tunnel_configs": dsschema.SingleNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				Attributes: map[string]dsschema.Attribute{
					// property: name=anti_replay, type=BOOLEAN macro=rss_schema
					"anti_replay": dsschema.BoolAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=anti_replay, type=BOOLEAN macro=rss_schema
					// property: name=copy_tos, type=BOOLEAN macro=rss_schema
					"copy_tos": dsschema.BoolAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=copy_tos, type=BOOLEAN macro=rss_schema
					// property: name=enable_gre_encapsulation, type=BOOLEAN macro=rss_schema
					"enable_gre_encapsulation": dsschema.BoolAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=enable_gre_encapsulation, type=BOOLEAN macro=rss_schema
					// property: name=ike_key_exchange, type=STRING macro=rss_schema
					"ike_key_exchange": dsschema.StringAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=ike_key_exchange, type=STRING macro=rss_schema
					// property: name=prismaaccess_ike_crypto_profile_id, type=STRING macro=rss_schema
					"prismaaccess_ike_crypto_profile_id": dsschema.StringAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=prismaaccess_ike_crypto_profile_id, type=STRING macro=rss_schema
					// property: name=prismaaccess_ipsec_profile_id, type=STRING macro=rss_schema
					"prismaaccess_ipsec_profile_id": dsschema.StringAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=prismaaccess_ipsec_profile_id, type=STRING macro=rss_schema
					// property: name=tunnel_monitoring, type=BOOLEAN macro=rss_schema
					"tunnel_monitoring": dsschema.BoolAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=tunnel_monitoring, type=BOOLEAN macro=rss_schema
				},
			},
			// key name holder for attribute: name=tunnel_monitoring, type=BOOLEAN macro=rss_schema
			// property: name=is_active, type=BOOLEAN macro=rss_schema
			"is_active": dsschema.BoolAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=is_active, type=BOOLEAN macro=rss_schema
			// property: name=is_enabled, type=BOOLEAN macro=rss_schema
			"is_enabled": dsschema.BoolAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=is_enabled, type=BOOLEAN macro=rss_schema
			// property: name=prismaaccess_edge_location, type=ARRAY_PRIMITIVE macro=rss_schema
			"prismaaccess_edge_location": dsschema.ListAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				Sensitive:   false,
				ElementType: types.StringType,
			},
			// key name holder for attribute: name=prismaaccess_edge_location, type=ARRAY_PRIMITIVE macro=rss_schema
			// property: name=prismaaccess_qos_cir_mbps, type=INTEGER macro=rss_schema
			"prismaaccess_qos_cir_mbps": dsschema.Int64Attribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=prismaaccess_qos_cir_mbps, type=INTEGER macro=rss_schema
			// property: name=prismaaccess_qos_profile_id, type=STRING macro=rss_schema
			"prismaaccess_qos_profile_id": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=prismaaccess_qos_profile_id, type=STRING macro=rss_schema
			// property: name=remote_network_groups, type=ARRAY_REFERENCE macro=rss_schema
			"remote_network_groups": dsschema.ListNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				NestedObject: dsschema.NestedAttributeObject{
					Attributes: map[string]dsschema.Attribute{
						// property: name=ipsec_tunnels, type=ARRAY_REFERENCE macro=rss_schema
						"ipsec_tunnels": dsschema.ListNestedAttribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
							NestedObject: dsschema.NestedAttributeObject{
								Attributes: map[string]dsschema.Attribute{
									// property: name=authentication, type=REFERENCE macro=rss_schema
									"authentication": dsschema.SingleNestedAttribute{
										Required:  false,
										Computed:  false,
										Optional:  true,
										Sensitive: false,
										Attributes: map[string]dsschema.Attribute{
											// property: name=branch_ike_identification, type=STRING macro=rss_schema
											"branch_ike_identification": dsschema.StringAttribute{
												Required:  false,
												Computed:  false,
												Optional:  true,
												Sensitive: false,
											},
											// key name holder for attribute: name=branch_ike_identification, type=STRING macro=rss_schema
											// property: name=prismaaccess_ike_identification, type=STRING macro=rss_schema
											"prismaaccess_ike_identification": dsschema.StringAttribute{
												Required:  false,
												Computed:  false,
												Optional:  true,
												Sensitive: false,
											},
											// key name holder for attribute: name=prismaaccess_ike_identification, type=STRING macro=rss_schema
											// property: name=psk, type=STRING macro=rss_schema
											"psk": dsschema.StringAttribute{
												Required:  false,
												Computed:  false,
												Optional:  true,
												Sensitive: false,
											},
											// key name holder for attribute: name=psk, type=STRING macro=rss_schema
										},
									},
									// key name holder for attribute: name=psk, type=STRING macro=rss_schema
									// property: name=name, type=STRING macro=rss_schema
									"name": dsschema.StringAttribute{
										Required:  false,
										Computed:  false,
										Optional:  true,
										Sensitive: false,
									},
									// key name holder for attribute: name=name, type=STRING macro=rss_schema
									// property: name=routing, type=REFERENCE macro=rss_schema
									"routing": dsschema.SingleNestedAttribute{
										Required:  false,
										Computed:  false,
										Optional:  true,
										Sensitive: false,
										Attributes: map[string]dsschema.Attribute{
											// property: name=branch_as_number, type=STRING macro=rss_schema
											"branch_as_number": dsschema.StringAttribute{
												Required:  false,
												Computed:  false,
												Optional:  true,
												Sensitive: false,
											},
											// key name holder for attribute: name=branch_as_number, type=STRING macro=rss_schema
											// property: name=branch_ip_address, type=STRING macro=rss_schema
											"branch_ip_address": dsschema.StringAttribute{
												Required:  false,
												Computed:  false,
												Optional:  true,
												Sensitive: false,
											},
											// key name holder for attribute: name=branch_ip_address, type=STRING macro=rss_schema
											// property: name=prismaaccess_ip_address, type=STRING macro=rss_schema
											"prismaaccess_ip_address": dsschema.StringAttribute{
												Required:  false,
												Computed:  false,
												Optional:  true,
												Sensitive: false,
											},
											// key name holder for attribute: name=prismaaccess_ip_address, type=STRING macro=rss_schema
										},
									},
									// key name holder for attribute: name=prismaaccess_ip_address, type=STRING macro=rss_schema
									// property: name=routing_configs, type=REFERENCE macro=rss_schema
									"routing_configs": dsschema.SingleNestedAttribute{
										Required:  false,
										Computed:  false,
										Optional:  true,
										Sensitive: false,
										Attributes: map[string]dsschema.Attribute{
											// property: name=advertise_default_route, type=BOOLEAN macro=rss_schema
											"advertise_default_route": dsschema.BoolAttribute{
												Required:  false,
												Computed:  false,
												Optional:  true,
												Sensitive: false,
											},
											// key name holder for attribute: name=advertise_default_route, type=BOOLEAN macro=rss_schema
											// property: name=bgp_secret, type=STRING macro=rss_schema
											"bgp_secret": dsschema.StringAttribute{
												Required:  false,
												Computed:  false,
												Optional:  true,
												Sensitive: true,
											},
											// key name holder for attribute: name=bgp_secret, type=STRING macro=rss_schema
											"bgp_secret_internal_key_name": dsschema.StringAttribute{
												Required:  false,
												Computed:  true,
												Optional:  true,
												Sensitive: false,
											},
											// property: name=export_routes, type=BOOLEAN macro=rss_schema
											"export_routes": dsschema.BoolAttribute{
												Required:  false,
												Computed:  false,
												Optional:  true,
												Sensitive: false,
											},
											// key name holder for attribute: name=export_routes, type=BOOLEAN macro=rss_schema
											// property: name=summarize_mobile_routes_before_advertise, type=BOOLEAN macro=rss_schema
											"summarize_mobile_routes_before_advertise": dsschema.BoolAttribute{
												Required:  false,
												Computed:  false,
												Optional:  true,
												Sensitive: false,
											},
											// key name holder for attribute: name=summarize_mobile_routes_before_advertise, type=BOOLEAN macro=rss_schema
										},
									},
									// key name holder for attribute: name=summarize_mobile_routes_before_advertise, type=BOOLEAN macro=rss_schema
									// property: name=wan_interface_id, type=STRING macro=rss_schema
									"wan_interface_id": dsschema.StringAttribute{
										Required:  false,
										Computed:  false,
										Optional:  true,
										Sensitive: false,
									},
									// key name holder for attribute: name=wan_interface_id, type=STRING macro=rss_schema
								},
							},
						},
						// key name holder for attribute: name=wan_interface_id, type=STRING macro=rss_schema
						// property: name=name, type=STRING macro=rss_schema
						"name": dsschema.StringAttribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=name, type=STRING macro=rss_schema
						// property: name=spn_name, type=ARRAY_PRIMITIVE macro=rss_schema
						"spn_name": dsschema.ListAttribute{
							Required:    false,
							Computed:    false,
							Optional:    true,
							Sensitive:   false,
							ElementType: types.StringType,
						},
						// key name holder for attribute: name=spn_name, type=ARRAY_PRIMITIVE macro=rss_schema
					},
				},
			},
			// key name holder for attribute: name=spn_name, type=ARRAY_PRIMITIVE macro=rss_schema
			// property: name=routing_configs, type=REFERENCE macro=rss_schema
			"routing_configs": dsschema.SingleNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				Attributes: map[string]dsschema.Attribute{
					// property: name=advertise_default_route, type=BOOLEAN macro=rss_schema
					"advertise_default_route": dsschema.BoolAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=advertise_default_route, type=BOOLEAN macro=rss_schema
					// property: name=bgp_secret, type=STRING macro=rss_schema
					"bgp_secret": dsschema.StringAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: true,
					},
					// key name holder for attribute: name=bgp_secret, type=STRING macro=rss_schema
					"bgp_secret_internal_key_name": dsschema.StringAttribute{
						Required:  false,
						Computed:  true,
						Optional:  true,
						Sensitive: false,
					},
					// property: name=export_routes, type=BOOLEAN macro=rss_schema
					"export_routes": dsschema.BoolAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=export_routes, type=BOOLEAN macro=rss_schema
					// property: name=summarize_mobile_routes_before_advertise, type=BOOLEAN macro=rss_schema
					"summarize_mobile_routes_before_advertise": dsschema.BoolAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=summarize_mobile_routes_before_advertise, type=BOOLEAN macro=rss_schema
				},
			},
			// key name holder for attribute: name=summarize_mobile_routes_before_advertise, type=BOOLEAN macro=rss_schema
			// property: name=site_id, type=STRING macro=rss_schema
			"site_id": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=site_id, type=STRING macro=rss_schema
		},
	}
}

// Configure prepares the struct.
func (d *sitePrismaSaseConnectionDataSource) Configure(_ context.Context, req datasource.ConfigureRequest, resp *datasource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}
	d.client = req.ProviderData.(*sdwan.Client)
}

// Read performs Read for the struct.
func (d *sitePrismaSaseConnectionDataSource) Read(ctx context.Context, req datasource.ReadRequest, resp *datasource.ReadResponse) {
	var state dsModelSaseConnectionScreenV2N1
	resp.Diagnostics.Append(req.Config.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}
	// pointers
	diagnostics := &resp.Diagnostics

	// Basic logging.
	tflog.Info(ctx, "performing datasource read", map[string]any{
		"terraform_provider_function": "Read",
		"resource_name":               "prismasdwan_site_prisma_sase_connection",
	})

	tfid := state.Tfid.ValueString()
	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 2 {
		resp.Diagnostics.AddError("error in prismasdwan_site_prisma_sase_connection ID format", "Expected 2 tokens")
		return
	}

	// Prepare to read the config.
	svc := sdwan_client.NewClient(d.client)

	// Prepare input for the API endpoint.
	read_request := &sdwan_client.SdwanClientRequestResponse{}
	read_request.Method = "GET"
	read_request.Path = "/sdwan/v2.1/api/sites/{site_id}/prismasase_connections/{prismasase_connection_id}"

	// handle parameters
	params := make(map[string]*string)
	read_request.PathParameters = &params
	params["site_id"] = &tokens[0]
	params["prismasase_connection_id"] = &tokens[1]

	// Perform the operation.
	svc.ExecuteSdwanRequest(ctx, read_request)
	if read_request.ResponseErr != nil {
		if IsObjectNotFound(*read_request.ResponseErr) {
			resp.State.RemoveResource(ctx)
		} else {
			resp.Diagnostics.AddError("error reading prismasdwan_site_prisma_sase_connection", (*read_request.ResponseErr).Error())
		}
		return
	}

	// Create the Terraform ID.
	var idBuilder strings.Builder
	idBuilder.WriteString("x")

	// Store the answer to state.
	state.Tfid = types.StringValue(idBuilder.String())
	// start copying attributes
	var ans sdwan_schema.SaseConnectionScreenV2N1
	// copy from json response
	json_err := json.Unmarshal(*read_request.ResponseBytes, &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to SaseConnectionScreenV2N1", json_err.Error())
		return
	}

	// lets copy all items into state schema=SaseConnectionScreenV2N1
	// copy_to_state: state=state prefix=dsModel ans=ans properties=13
	// property: name=_etag, type=INTEGER macro=copy_to_state
	state.Etag = types.Int64PointerValue(ans.Etag)
	// property: name=_schema, type=INTEGER macro=copy_to_state
	state.Schema = types.Int64PointerValue(ans.Schema)
	// property: name=enabled_wan_interface_ids, type=ARRAY_PRIMITIVE macro=copy_to_state
	varEnabledWanInterfaceIds, errEnabledWanInterfaceIds := types.ListValueFrom(ctx, types.StringType, ans.EnabledWanInterfaceIds)
	state.EnabledWanInterfaceIds = varEnabledWanInterfaceIds
	resp.Diagnostics.Append(errEnabledWanInterfaceIds.Errors()...)
	// property: name=id, type=STRING macro=copy_to_state
	state.Id = types.StringPointerValue(ans.Id)
	// property: name=ipsec_tunnel_configs, type=REFERENCE macro=copy_to_state
	if ans.IpsecTunnelConfigs == nil {
		state.IpsecTunnelConfigs = nil
	} else {
		state.IpsecTunnelConfigs = &dsModelIPSecTunnelConfigs{}
		// copy_to_state: state=state.IpsecTunnelConfigs prefix=dsModel ans=ans.IpsecTunnelConfigs properties=7
		// property: name=anti_replay, type=BOOLEAN macro=copy_to_state
		state.IpsecTunnelConfigs.AntiReplay = types.BoolPointerValue(ans.IpsecTunnelConfigs.AntiReplay)
		// property: name=copy_tos, type=BOOLEAN macro=copy_to_state
		state.IpsecTunnelConfigs.CopyTos = types.BoolPointerValue(ans.IpsecTunnelConfigs.CopyTos)
		// property: name=enable_gre_encapsulation, type=BOOLEAN macro=copy_to_state
		state.IpsecTunnelConfigs.EnableGreEncapsulation = types.BoolPointerValue(ans.IpsecTunnelConfigs.EnableGreEncapsulation)
		// property: name=ike_key_exchange, type=STRING macro=copy_to_state
		state.IpsecTunnelConfigs.IkeKeyExchange = types.StringPointerValue(ans.IpsecTunnelConfigs.IkeKeyExchange)
		// property: name=prismaaccess_ike_crypto_profile_id, type=STRING macro=copy_to_state
		state.IpsecTunnelConfigs.PrismaaccessIkeCryptoProfileId = types.StringPointerValue(ans.IpsecTunnelConfigs.PrismaaccessIkeCryptoProfileId)
		// property: name=prismaaccess_ipsec_profile_id, type=STRING macro=copy_to_state
		state.IpsecTunnelConfigs.PrismaaccessIpsecProfileId = types.StringPointerValue(ans.IpsecTunnelConfigs.PrismaaccessIpsecProfileId)
		// property: name=tunnel_monitoring, type=BOOLEAN macro=copy_to_state
		state.IpsecTunnelConfigs.TunnelMonitoring = types.BoolPointerValue(ans.IpsecTunnelConfigs.TunnelMonitoring)
	}
	// property: name=is_active, type=BOOLEAN macro=copy_to_state
	state.IsActive = types.BoolPointerValue(ans.IsActive)
	// property: name=is_enabled, type=BOOLEAN macro=copy_to_state
	state.IsEnabled = types.BoolPointerValue(ans.IsEnabled)
	// property: name=prismaaccess_edge_location, type=ARRAY_PRIMITIVE macro=copy_to_state
	varPrismaaccessEdgeLocation, errPrismaaccessEdgeLocation := types.ListValueFrom(ctx, types.StringType, ans.PrismaaccessEdgeLocation)
	state.PrismaaccessEdgeLocation = varPrismaaccessEdgeLocation
	resp.Diagnostics.Append(errPrismaaccessEdgeLocation.Errors()...)
	// property: name=prismaaccess_qos_cir_mbps, type=INTEGER macro=copy_to_state
	state.PrismaaccessQosCirMbps = types.Int64PointerValue(ans.PrismaaccessQosCirMbps)
	// property: name=prismaaccess_qos_profile_id, type=STRING macro=copy_to_state
	state.PrismaaccessQosProfileId = types.StringPointerValue(ans.PrismaaccessQosProfileId)
	// property: name=remote_network_groups, type=ARRAY_REFERENCE macro=copy_to_state
	if ans.RemoteNetworkGroups == nil {
		state.RemoteNetworkGroups = nil
	} else if len(ans.RemoteNetworkGroups) == 0 {
		state.RemoteNetworkGroups = []dsModelRemoteNetworkGroup{}
	} else {
		state.RemoteNetworkGroups = make([]dsModelRemoteNetworkGroup, 0, len(ans.RemoteNetworkGroups))
		for varLoopRemoteNetworkGroupsIndex, varLoopRemoteNetworkGroups := range ans.RemoteNetworkGroups {
			// add a new item
			state.RemoteNetworkGroups = append(state.RemoteNetworkGroups, dsModelRemoteNetworkGroup{})
			// copy_to_state: state=state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex] prefix=dsModel ans=varLoopRemoteNetworkGroups properties=3
			// property: name=ipsec_tunnels, type=ARRAY_REFERENCE macro=copy_to_state
			if varLoopRemoteNetworkGroups.IpsecTunnels == nil {
				state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels = nil
			} else if len(varLoopRemoteNetworkGroups.IpsecTunnels) == 0 {
				state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels = []dsModelIPSecTunnel{}
			} else {
				state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels = make([]dsModelIPSecTunnel, 0, len(varLoopRemoteNetworkGroups.IpsecTunnels))
				for varLoopIpsecTunnelsIndex, varLoopIpsecTunnels := range varLoopRemoteNetworkGroups.IpsecTunnels {
					// add a new item
					state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels = append(state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels, dsModelIPSecTunnel{})
					// copy_to_state: state=state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex] prefix=dsModel ans=varLoopIpsecTunnels properties=5
					// property: name=authentication, type=REFERENCE macro=copy_to_state
					if varLoopIpsecTunnels.Authentication == nil {
						state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].Authentication = nil
					} else {
						state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].Authentication = &dsModelIPSecTunnelAuthentication{}
						// copy_to_state: state=state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].Authentication prefix=dsModel ans=varLoopIpsecTunnels.Authentication properties=3
						// property: name=branch_ike_identification, type=STRING macro=copy_to_state
						state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].Authentication.BranchIkeIdentification = types.StringPointerValue(varLoopIpsecTunnels.Authentication.BranchIkeIdentification)
						// property: name=prismaaccess_ike_identification, type=STRING macro=copy_to_state
						state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].Authentication.PrismaaccessIkeIdentification = types.StringPointerValue(varLoopIpsecTunnels.Authentication.PrismaaccessIkeIdentification)
						// property: name=psk, type=STRING macro=copy_to_state
						state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].Authentication.Psk = types.StringPointerValue(varLoopIpsecTunnels.Authentication.Psk)
					}
					// property: name=name, type=STRING macro=copy_to_state
					state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].Name = types.StringPointerValue(varLoopIpsecTunnels.Name)
					// property: name=routing, type=REFERENCE macro=copy_to_state
					if varLoopIpsecTunnels.Routing == nil {
						state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].Routing = nil
					} else {
						state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].Routing = &dsModelRouting{}
						// copy_to_state: state=state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].Routing prefix=dsModel ans=varLoopIpsecTunnels.Routing properties=3
						// property: name=branch_as_number, type=STRING macro=copy_to_state
						state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].Routing.BranchAsNumber = types.StringPointerValue(varLoopIpsecTunnels.Routing.BranchAsNumber)
						// property: name=branch_ip_address, type=STRING macro=copy_to_state
						state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].Routing.BranchIpAddress = types.StringPointerValue(varLoopIpsecTunnels.Routing.BranchIpAddress)
						// property: name=prismaaccess_ip_address, type=STRING macro=copy_to_state
						state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].Routing.PrismaaccessIpAddress = types.StringPointerValue(varLoopIpsecTunnels.Routing.PrismaaccessIpAddress)
					}
					// property: name=routing_configs, type=REFERENCE macro=copy_to_state
					if varLoopIpsecTunnels.RoutingConfigs == nil {
						state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].RoutingConfigs = nil
					} else {
						state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].RoutingConfigs = &dsModelRoutingConfigs{}
						// copy_to_state: state=state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].RoutingConfigs prefix=dsModel ans=varLoopIpsecTunnels.RoutingConfigs properties=4
						// property: name=advertise_default_route, type=BOOLEAN macro=copy_to_state
						state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].RoutingConfigs.AdvertiseDefaultRoute = types.BoolPointerValue(varLoopIpsecTunnels.RoutingConfigs.AdvertiseDefaultRoute)
						// property: name=bgp_secret, type=STRING macro=copy_to_state
						state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].RoutingConfigs.BgpSecret = types.StringPointerValue(varLoopIpsecTunnels.RoutingConfigs.BgpSecret)
						// property: name=export_routes, type=BOOLEAN macro=copy_to_state
						state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].RoutingConfigs.ExportRoutes = types.BoolPointerValue(varLoopIpsecTunnels.RoutingConfigs.ExportRoutes)
						// property: name=summarize_mobile_routes_before_advertise, type=BOOLEAN macro=copy_to_state
						state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].RoutingConfigs.SummarizeMobileRoutesBeforeAdvertise = types.BoolPointerValue(varLoopIpsecTunnels.RoutingConfigs.SummarizeMobileRoutesBeforeAdvertise)
					}
					// property: name=wan_interface_id, type=STRING macro=copy_to_state
					state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].IpsecTunnels[varLoopIpsecTunnelsIndex].WanInterfaceId = types.StringPointerValue(varLoopIpsecTunnels.WanInterfaceId)
				}
			}
			// property: name=name, type=STRING macro=copy_to_state
			state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].Name = types.StringPointerValue(varLoopRemoteNetworkGroups.Name)
			// property: name=spn_name, type=ARRAY_PRIMITIVE macro=copy_to_state
			varSpnName, errSpnName := types.ListValueFrom(ctx, types.StringType, varLoopRemoteNetworkGroups.SpnName)
			state.RemoteNetworkGroups[varLoopRemoteNetworkGroupsIndex].SpnName = varSpnName
			resp.Diagnostics.Append(errSpnName.Errors()...)
		}
	}
	// property: name=routing_configs, type=REFERENCE macro=copy_to_state
	if ans.RoutingConfigs == nil {
		state.RoutingConfigs = nil
	} else {
		state.RoutingConfigs = &dsModelRoutingConfigs{}
		// copy_to_state: state=state.RoutingConfigs prefix=dsModel ans=ans.RoutingConfigs properties=4
		// property: name=advertise_default_route, type=BOOLEAN macro=copy_to_state
		state.RoutingConfigs.AdvertiseDefaultRoute = types.BoolPointerValue(ans.RoutingConfigs.AdvertiseDefaultRoute)
		// property: name=bgp_secret, type=STRING macro=copy_to_state
		state.RoutingConfigs.BgpSecret = types.StringPointerValue(ans.RoutingConfigs.BgpSecret)
		// property: name=export_routes, type=BOOLEAN macro=copy_to_state
		state.RoutingConfigs.ExportRoutes = types.BoolPointerValue(ans.RoutingConfigs.ExportRoutes)
		// property: name=summarize_mobile_routes_before_advertise, type=BOOLEAN macro=copy_to_state
		state.RoutingConfigs.SummarizeMobileRoutesBeforeAdvertise = types.BoolPointerValue(ans.RoutingConfigs.SummarizeMobileRoutesBeforeAdvertise)
	}
	// property: name=site_id, type=STRING macro=copy_to_state
	state.SiteId = types.StringPointerValue(ans.SiteId)

	// Done.
	diagnostics.Append(resp.State.Set(ctx, &state)...)
}
