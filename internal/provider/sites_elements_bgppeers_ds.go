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
// | Computed Resource Name=sites_elements_bgppeers
// +-----------------------------------------------------------------
// | AggregatePrefixes HasID=false
// | RouteAggregation HasID=false
// | BGPConfig HasID=false
// | BGPPeerConfigScreenV2N6 HasID=true
// +-----------------------------------------------------------------

// Data source.
var (
	_ datasource.DataSource              = &sitesElementsBgppeersDataSource{}
	_ datasource.DataSourceWithConfigure = &sitesElementsBgppeersDataSource{}
)

// To enable this data source for TF Provider, go to `provider.go` and inject this into the function
// as below:
//
//	func (p *SdwanProvider) DataSources(_ context.Context) []func() datasource.DataSource {
//	  	return []func() datasource.DataSource{
//	     ... <other existing data sources>
//	     NewSitesElementsBgppeersDataSource,
//	     // -- append next datasource above -- //
//	     }
//	  }
func NewSitesElementsBgppeersDataSource() datasource.DataSource {
	return &sitesElementsBgppeersDataSource{}
}

type sitesElementsBgppeersDataSource struct {
	client *sdwan.Client
}

// Metadata returns the data source type name.
func (d *sitesElementsBgppeersDataSource) Metadata(_ context.Context, req datasource.MetadataRequest, resp *datasource.MetadataResponse) {
	resp.TypeName = "prismasdwan_sites_elements_bgppeers"
}

// Schema defines the schema for this data source.
func (d *sitesElementsBgppeersDataSource) Schema(_ context.Context, _ datasource.SchemaRequest, resp *datasource.SchemaResponse) {
	resp.Schema = dsschema.Schema{
		Description: "Retrieves a config item.",

		Attributes: map[string]dsschema.Attribute{
			"tfid": dsschema.StringAttribute{
				Computed: true,
			},
			// rest all properties to be read from GET API Schema schema=BGPPeerConfigScreenV2N6
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
			// property: name=advertise_default_route, type=BOOLEAN macro=rss_schema
			"advertise_default_route": dsschema.BoolAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=advertise_default_route, type=BOOLEAN macro=rss_schema
			// property: name=allow_v4_prefixes, type=BOOLEAN macro=rss_schema
			"allow_v4_prefixes": dsschema.BoolAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=allow_v4_prefixes, type=BOOLEAN macro=rss_schema
			// property: name=allow_v6_prefixes, type=BOOLEAN macro=rss_schema
			"allow_v6_prefixes": dsschema.BoolAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=allow_v6_prefixes, type=BOOLEAN macro=rss_schema
			// property: name=bgp_config, type=REFERENCE macro=rss_schema
			"bgp_config": dsschema.SingleNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				Attributes: map[string]dsschema.Attribute{
					// property: name=adv_interval, type=INTEGER macro=rss_schema
					"adv_interval": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=adv_interval, type=INTEGER macro=rss_schema
					// property: name=hold_time, type=INTEGER macro=rss_schema
					"hold_time": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=hold_time, type=INTEGER macro=rss_schema
					// property: name=keepalive_time, type=INTEGER macro=rss_schema
					"keepalive_time": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=keepalive_time, type=INTEGER macro=rss_schema
					// property: name=local_as_num, type=STRING macro=rss_schema
					"local_as_num": dsschema.StringAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=local_as_num, type=STRING macro=rss_schema
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
					// property: name=multi_hop_limit, type=INTEGER macro=rss_schema
					"multi_hop_limit": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=multi_hop_limit, type=INTEGER macro=rss_schema
					// property: name=peer_auth_type, type=STRING macro=rss_schema
					"peer_auth_type": dsschema.StringAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=peer_auth_type, type=STRING macro=rss_schema
					// property: name=peer_retry_time, type=INTEGER macro=rss_schema
					"peer_retry_time": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=peer_retry_time, type=INTEGER macro=rss_schema
				},
			},
			// key name holder for attribute: name=peer_retry_time, type=INTEGER macro=rss_schema
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
			// property: name=peer_ip, type=STRING macro=rss_schema
			"peer_ip": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=peer_ip, type=STRING macro=rss_schema
			// property: name=peer_ip_v6, type=STRING macro=rss_schema
			"peer_ip_v6": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=peer_ip_v6, type=STRING macro=rss_schema
			// property: name=peer_type, type=STRING macro=rss_schema
			"peer_type": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=peer_type, type=STRING macro=rss_schema
			// property: name=remote_as_num, type=STRING macro=rss_schema
			"remote_as_num": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=remote_as_num, type=STRING macro=rss_schema
			// property: name=route_aggregation, type=REFERENCE macro=rss_schema
			"route_aggregation": dsschema.SingleNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				Attributes: map[string]dsschema.Attribute{
					// property: name=aggregate_prefixes, type=ARRAY_REFERENCE macro=rss_schema
					"aggregate_prefixes": dsschema.ListNestedAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
						NestedObject: dsschema.NestedAttributeObject{
							Attributes: map[string]dsschema.Attribute{
								// property: name=ip_prefixes, type=ARRAY_PRIMITIVE macro=rss_schema
								"ip_prefixes": dsschema.ListAttribute{
									Required:    false,
									Computed:    false,
									Optional:    true,
									Sensitive:   false,
									ElementType: types.StringType,
								},
								// key name holder for attribute: name=ip_prefixes, type=ARRAY_PRIMITIVE macro=rss_schema
								// property: name=type, type=STRING macro=rss_schema
								"type": dsschema.StringAttribute{
									Required:  false,
									Computed:  false,
									Optional:  true,
									Sensitive: false,
								},
								// key name holder for attribute: name=type, type=STRING macro=rss_schema
							},
						},
					},
					// key name holder for attribute: name=type, type=STRING macro=rss_schema
					// property: name=aggregate_type, type=STRING macro=rss_schema
					"aggregate_type": dsschema.StringAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=aggregate_type, type=STRING macro=rss_schema
					// property: name=ipv4_prefix_list_id, type=STRING macro=rss_schema
					"ipv4_prefix_list_id": dsschema.StringAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=ipv4_prefix_list_id, type=STRING macro=rss_schema
					// property: name=ipv6_prefix_list_id, type=STRING macro=rss_schema
					"ipv6_prefix_list_id": dsschema.StringAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=ipv6_prefix_list_id, type=STRING macro=rss_schema
				},
			},
			// key name holder for attribute: name=ipv6_prefix_list_id, type=STRING macro=rss_schema
			// property: name=route_map_in_id, type=STRING macro=rss_schema
			"route_map_in_id": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=route_map_in_id, type=STRING macro=rss_schema
			// property: name=route_map_out_id, type=STRING macro=rss_schema
			"route_map_out_id": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=route_map_out_id, type=STRING macro=rss_schema
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
			// property: name=update_source, type=STRING macro=rss_schema
			"update_source": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=update_source, type=STRING macro=rss_schema
			// property: name=update_source_v6, type=STRING macro=rss_schema
			"update_source_v6": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=update_source_v6, type=STRING macro=rss_schema
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
func (d *sitesElementsBgppeersDataSource) Configure(_ context.Context, req datasource.ConfigureRequest, resp *datasource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}
	d.client = req.ProviderData.(*sdwan.Client)
}

// Read performs Read for the struct.
func (d *sitesElementsBgppeersDataSource) Read(ctx context.Context, req datasource.ReadRequest, resp *datasource.ReadResponse) {
	var state dsModelBGPPeerConfigScreenV2N6
	resp.Diagnostics.Append(req.Config.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}
	// pointers
	diagnostics := &resp.Diagnostics

	// Basic logging.
	tflog.Info(ctx, "performing datasource read", map[string]any{
		"terraform_provider_function": "Read",
		"resource_name":               "prismasdwan_sites_elements_bgppeers",
	})

	tfid := state.Tfid.ValueString()
	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 3 {
		resp.Diagnostics.AddError("error in prismasdwan_sites_elements_bgppeers ID format", "Expected 3 tokens")
		return
	}

	// Prepare to read the config.
	svc := sdwan_client.NewClient(d.client)

	// Prepare input for the API endpoint.
	read_request := &sdwan_client.SdwanClientRequestResponse{}
	read_request.Method = "GET"
	read_request.Path = "/sdwan/v2.6/api/sites/{site_id}/elements/{element_id}/bgppeers/{bgp_peer_id}"

	// handle parameters
	params := make(map[string]*string)
	read_request.PathParameters = &params
	params["site_id"] = &tokens[0]
	params["element_id"] = &tokens[1]
	params["bgp_peer_id"] = &tokens[2]

	// Perform the operation.
	svc.ExecuteSdwanRequest(ctx, read_request)
	if read_request.ResponseErr != nil {
		if IsObjectNotFound(*read_request.ResponseErr) {
			resp.State.RemoveResource(ctx)
		} else {
			resp.Diagnostics.AddError("error reading prismasdwan_sites_elements_bgppeers", (*read_request.ResponseErr).Error())
		}
		return
	}

	// Create the Terraform ID.
	var idBuilder strings.Builder
	idBuilder.WriteString("x")

	// Store the answer to state.
	state.Tfid = types.StringValue(idBuilder.String())
	// start copying attributes
	var ans sdwan_schema.BGPPeerConfigScreenV2N6
	// copy from json response
	json_err := json.Unmarshal(*read_request.ResponseBytes, &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to BGPPeerConfigScreenV2N6", json_err.Error())
		return
	}

	// lets copy all items into state schema=BGPPeerConfigScreenV2N6
	// copy_to_state: state=state prefix=dsModel ans=ans properties=23
	// property: name=_etag, type=INTEGER macro=copy_to_state
	state.Etag = types.Int64PointerValue(ans.Etag)
	// property: name=_schema, type=INTEGER macro=copy_to_state
	state.Schema = types.Int64PointerValue(ans.Schema)
	// property: name=advertise_default_route, type=BOOLEAN macro=copy_to_state
	state.AdvertiseDefaultRoute = types.BoolPointerValue(ans.AdvertiseDefaultRoute)
	// property: name=allow_v4_prefixes, type=BOOLEAN macro=copy_to_state
	state.AllowV4Prefixes = types.BoolPointerValue(ans.AllowV4Prefixes)
	// property: name=allow_v6_prefixes, type=BOOLEAN macro=copy_to_state
	state.AllowV6Prefixes = types.BoolPointerValue(ans.AllowV6Prefixes)
	// property: name=bgp_config, type=REFERENCE macro=copy_to_state
	if ans.BgpConfig == nil {
		state.BgpConfig = nil
	} else {
		state.BgpConfig = &dsModelBGPConfig{}
		// copy_to_state: state=state.BgpConfig prefix=dsModel ans=ans.BgpConfig properties=8
		// property: name=adv_interval, type=INTEGER macro=copy_to_state
		state.BgpConfig.AdvInterval = types.Int64PointerValue(ans.BgpConfig.AdvInterval)
		// property: name=hold_time, type=INTEGER macro=copy_to_state
		state.BgpConfig.HoldTime = types.Int64PointerValue(ans.BgpConfig.HoldTime)
		// property: name=keepalive_time, type=INTEGER macro=copy_to_state
		state.BgpConfig.KeepaliveTime = types.Int64PointerValue(ans.BgpConfig.KeepaliveTime)
		// property: name=local_as_num, type=STRING macro=copy_to_state
		state.BgpConfig.LocalAsNum = types.StringPointerValue(ans.BgpConfig.LocalAsNum)
		// property: name=md5_secret, type=STRING macro=copy_to_state
		state.BgpConfig.Md5Secret = types.StringPointerValue(ans.BgpConfig.Md5Secret)
		// property: name=multi_hop_limit, type=INTEGER macro=copy_to_state
		state.BgpConfig.MultiHopLimit = types.Int64PointerValue(ans.BgpConfig.MultiHopLimit)
		// property: name=peer_auth_type, type=STRING macro=copy_to_state
		state.BgpConfig.PeerAuthType = types.StringPointerValue(ans.BgpConfig.PeerAuthType)
		// property: name=peer_retry_time, type=INTEGER macro=copy_to_state
		state.BgpConfig.PeerRetryTime = types.Int64PointerValue(ans.BgpConfig.PeerRetryTime)
	}
	// property: name=description, type=STRING macro=copy_to_state
	state.Description = types.StringPointerValue(ans.Description)
	// property: name=id, type=STRING macro=copy_to_state
	state.Id = types.StringPointerValue(ans.Id)
	// property: name=name, type=STRING macro=copy_to_state
	state.Name = types.StringPointerValue(ans.Name)
	// property: name=peer_ip, type=STRING macro=copy_to_state
	state.PeerIp = types.StringPointerValue(ans.PeerIp)
	// property: name=peer_ip_v6, type=STRING macro=copy_to_state
	state.PeerIpV6 = types.StringPointerValue(ans.PeerIpV6)
	// property: name=peer_type, type=STRING macro=copy_to_state
	state.PeerType = types.StringPointerValue(ans.PeerType)
	// property: name=remote_as_num, type=STRING macro=copy_to_state
	state.RemoteAsNum = types.StringPointerValue(ans.RemoteAsNum)
	// property: name=route_aggregation, type=REFERENCE macro=copy_to_state
	if ans.RouteAggregation == nil {
		state.RouteAggregation = nil
	} else {
		state.RouteAggregation = &dsModelRouteAggregation{}
		// copy_to_state: state=state.RouteAggregation prefix=dsModel ans=ans.RouteAggregation properties=4
		// property: name=aggregate_prefixes, type=ARRAY_REFERENCE macro=copy_to_state
		if ans.RouteAggregation.AggregatePrefixes == nil {
			state.RouteAggregation.AggregatePrefixes = nil
		} else if len(ans.RouteAggregation.AggregatePrefixes) == 0 {
			state.RouteAggregation.AggregatePrefixes = []dsModelAggregatePrefixes{}
		} else {
			state.RouteAggregation.AggregatePrefixes = make([]dsModelAggregatePrefixes, 0, len(ans.RouteAggregation.AggregatePrefixes))
			for varLoopAggregatePrefixesIndex, varLoopAggregatePrefixes := range ans.RouteAggregation.AggregatePrefixes {
				// add a new item
				state.RouteAggregation.AggregatePrefixes = append(state.RouteAggregation.AggregatePrefixes, dsModelAggregatePrefixes{})
				// copy_to_state: state=state.RouteAggregation.AggregatePrefixes[varLoopAggregatePrefixesIndex] prefix=dsModel ans=varLoopAggregatePrefixes properties=2
				// property: name=ip_prefixes, type=ARRAY_PRIMITIVE macro=copy_to_state
				varIpPrefixes, errIpPrefixes := types.ListValueFrom(ctx, types.StringType, varLoopAggregatePrefixes.IpPrefixes)
				state.RouteAggregation.AggregatePrefixes[varLoopAggregatePrefixesIndex].IpPrefixes = varIpPrefixes
				resp.Diagnostics.Append(errIpPrefixes.Errors()...)
				// property: name=type, type=STRING macro=copy_to_state
				state.RouteAggregation.AggregatePrefixes[varLoopAggregatePrefixesIndex].Type = types.StringPointerValue(varLoopAggregatePrefixes.Type)
			}
		}
		// property: name=aggregate_type, type=STRING macro=copy_to_state
		state.RouteAggregation.AggregateType = types.StringPointerValue(ans.RouteAggregation.AggregateType)
		// property: name=ipv4_prefix_list_id, type=STRING macro=copy_to_state
		state.RouteAggregation.Ipv4PrefixListId = types.StringPointerValue(ans.RouteAggregation.Ipv4PrefixListId)
		// property: name=ipv6_prefix_list_id, type=STRING macro=copy_to_state
		state.RouteAggregation.Ipv6PrefixListId = types.StringPointerValue(ans.RouteAggregation.Ipv6PrefixListId)
	}
	// property: name=route_map_in_id, type=STRING macro=copy_to_state
	state.RouteMapInId = types.StringPointerValue(ans.RouteMapInId)
	// property: name=route_map_out_id, type=STRING macro=copy_to_state
	state.RouteMapOutId = types.StringPointerValue(ans.RouteMapOutId)
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
	// property: name=update_source, type=STRING macro=copy_to_state
	state.UpdateSource = types.StringPointerValue(ans.UpdateSource)
	// property: name=update_source_v6, type=STRING macro=copy_to_state
	state.UpdateSourceV6 = types.StringPointerValue(ans.UpdateSourceV6)
	// property: name=vrf_context_id, type=STRING macro=copy_to_state
	state.VrfContextId = types.StringPointerValue(ans.VrfContextId)

	// Done.
	diagnostics.Append(resp.State.Set(ctx, &state)...)
}
