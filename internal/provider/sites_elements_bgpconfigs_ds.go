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
// | Computed Resource Name=sites_elements_bgpconfigs
// +-----------------------------------------------------------------
// | OspfRedistribution HasID=false
// | BGPGlobalConfigScreenV2N4 HasID=true
// +-----------------------------------------------------------------

// Data source.
var (
	_ datasource.DataSource              = &sitesElementsBgpconfigsDataSource{}
	_ datasource.DataSourceWithConfigure = &sitesElementsBgpconfigsDataSource{}
)

// To enable this data source for TF Provider, go to `provider.go` and inject this into the function
// as below:
//
//	func (p *SdwanProvider) DataSources(_ context.Context) []func() datasource.DataSource {
//	  	return []func() datasource.DataSource{
//	     ... <other existing data sources>
//	     NewSitesElementsBgpconfigsDataSource,
//	     // -- append next datasource above -- //
//	     }
//	  }
func NewSitesElementsBgpconfigsDataSource() datasource.DataSource {
	return &sitesElementsBgpconfigsDataSource{}
}

type sitesElementsBgpconfigsDataSource struct {
	client *sdwan.Client
}

// Metadata returns the data source type name.
func (d *sitesElementsBgpconfigsDataSource) Metadata(_ context.Context, req datasource.MetadataRequest, resp *datasource.MetadataResponse) {
	resp.TypeName = "prismasdwan_sites_elements_bgpconfigs"
}

// Schema defines the schema for this data source.
func (d *sitesElementsBgpconfigsDataSource) Schema(_ context.Context, _ datasource.SchemaRequest, resp *datasource.SchemaResponse) {
	resp.Schema = dsschema.Schema{
		Description: "Retrieves a config item.",

		Attributes: map[string]dsschema.Attribute{
			"tfid": dsschema.StringAttribute{
				Computed: true,
			},
			// rest all properties to be read from GET API Schema schema=BGPGlobalConfigScreenV2N4
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
			// property: name=admin_distance, type=INTEGER macro=rss_schema
			"admin_distance": dsschema.Int64Attribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=admin_distance, type=INTEGER macro=rss_schema
			// property: name=adv_interval, type=INTEGER macro=rss_schema
			"adv_interval": dsschema.Int64Attribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=adv_interval, type=INTEGER macro=rss_schema
			// property: name=graceful_restart, type=BOOLEAN macro=rss_schema
			"graceful_restart": dsschema.BoolAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=graceful_restart, type=BOOLEAN macro=rss_schema
			// property: name=hold_time, type=INTEGER macro=rss_schema
			"hold_time": dsschema.Int64Attribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=hold_time, type=INTEGER macro=rss_schema
			// property: name=id, type=STRING macro=rss_schema
			"id": dsschema.StringAttribute{
				Required:  false,
				Computed:  true,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=id, type=STRING macro=rss_schema
			// property: name=ipv6_prefixes_to_adv_to_wan, type=ARRAY_PRIMITIVE macro=rss_schema
			"ipv6_prefixes_to_adv_to_wan": dsschema.ListAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				Sensitive:   false,
				ElementType: types.StringType,
			},
			// key name holder for attribute: name=ipv6_prefixes_to_adv_to_wan, type=ARRAY_PRIMITIVE macro=rss_schema
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
			// property: name=maximum_paths, type=INTEGER macro=rss_schema
			"maximum_paths": dsschema.Int64Attribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=maximum_paths, type=INTEGER macro=rss_schema
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
			// property: name=ospf_redistribution, type=ARRAY_REFERENCE macro=rss_schema
			"ospf_redistribution": dsschema.ListNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				NestedObject: dsschema.NestedAttributeObject{
					Attributes: map[string]dsschema.Attribute{
						// property: name=route_map_id, type=STRING macro=rss_schema
						"route_map_id": dsschema.StringAttribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=route_map_id, type=STRING macro=rss_schema
						// property: name=vrf_context_id, type=STRING macro=rss_schema
						"vrf_context_id": dsschema.StringAttribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=vrf_context_id, type=STRING macro=rss_schema
					},
				},
			},
			// key name holder for attribute: name=vrf_context_id, type=STRING macro=rss_schema
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
			// property: name=prefix_adv_type, type=STRING macro=rss_schema
			"prefix_adv_type": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=prefix_adv_type, type=STRING macro=rss_schema
			// property: name=prefix_adv_type_to_lan, type=STRING macro=rss_schema
			"prefix_adv_type_to_lan": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=prefix_adv_type_to_lan, type=STRING macro=rss_schema
			// property: name=prefixes_to_adv_to_wan, type=ARRAY_PRIMITIVE macro=rss_schema
			"prefixes_to_adv_to_wan": dsschema.ListAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				Sensitive:   false,
				ElementType: types.StringType,
			},
			// key name holder for attribute: name=prefixes_to_adv_to_wan, type=ARRAY_PRIMITIVE macro=rss_schema
			// property: name=router_id, type=STRING macro=rss_schema
			"router_id": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=router_id, type=STRING macro=rss_schema
			// property: name=stalepath_time, type=INTEGER macro=rss_schema
			"stalepath_time": dsschema.Int64Attribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=stalepath_time, type=INTEGER macro=rss_schema
		},
	}
}

// Configure prepares the struct.
func (d *sitesElementsBgpconfigsDataSource) Configure(_ context.Context, req datasource.ConfigureRequest, resp *datasource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}
	d.client = req.ProviderData.(*sdwan.Client)
}

// Read performs Read for the struct.
func (d *sitesElementsBgpconfigsDataSource) Read(ctx context.Context, req datasource.ReadRequest, resp *datasource.ReadResponse) {
	var state dsModelBGPGlobalConfigScreenV2N4
	resp.Diagnostics.Append(req.Config.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}
	// pointers
	diagnostics := &resp.Diagnostics

	// Basic logging.
	tflog.Info(ctx, "performing datasource read", map[string]any{
		"terraform_provider_function": "Read",
		"resource_name":               "prismasdwan_sites_elements_bgpconfigs",
	})

	tfid := state.Tfid.ValueString()
	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 3 {
		resp.Diagnostics.AddError("error in prismasdwan_sites_elements_bgpconfigs ID format", "Expected 3 tokens")
		return
	}

	// Prepare to read the config.
	svc := sdwan_client.NewClient(d.client)

	// Prepare input for the API endpoint.
	read_request := &sdwan_client.SdwanClientRequestResponse{}
	read_request.Method = "GET"
	read_request.Path = "/sdwan/v2.4/api/sites/{site_id}/elements/{element_id}/bgpconfigs/{bgp_config_id}"

	// handle parameters
	params := make(map[string]*string)
	read_request.PathParameters = &params
	params["site_id"] = &tokens[0]
	params["element_id"] = &tokens[1]
	params["bgp_config_id"] = &tokens[2]

	// Perform the operation.
	svc.ExecuteSdwanRequest(ctx, read_request)
	if read_request.ResponseErr != nil {
		if IsObjectNotFound(*read_request.ResponseErr) {
			resp.State.RemoveResource(ctx)
		} else {
			resp.Diagnostics.AddError("error reading prismasdwan_sites_elements_bgpconfigs", (*read_request.ResponseErr).Error())
		}
		return
	}

	// Create the Terraform ID.
	var idBuilder strings.Builder
	idBuilder.WriteString("x")

	// Store the answer to state.
	state.Tfid = types.StringValue(idBuilder.String())
	// start copying attributes
	var ans sdwan_schema.BGPGlobalConfigScreenV2N4
	// copy from json response
	json_err := json.Unmarshal(*read_request.ResponseBytes, &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to BGPGlobalConfigScreenV2N4", json_err.Error())
		return
	}

	// lets copy all items into state schema=BGPGlobalConfigScreenV2N4
	// copy_to_state: state=state prefix=dsModel ans=ans properties=21
	// property: name=_etag, type=INTEGER macro=copy_to_state
	state.Etag = types.Int64PointerValue(ans.Etag)
	// property: name=_schema, type=INTEGER macro=copy_to_state
	state.Schema = types.Int64PointerValue(ans.Schema)
	// property: name=admin_distance, type=INTEGER macro=copy_to_state
	state.AdminDistance = types.Int64PointerValue(ans.AdminDistance)
	// property: name=adv_interval, type=INTEGER macro=copy_to_state
	state.AdvInterval = types.Int64PointerValue(ans.AdvInterval)
	// property: name=graceful_restart, type=BOOLEAN macro=copy_to_state
	state.GracefulRestart = types.BoolPointerValue(ans.GracefulRestart)
	// property: name=hold_time, type=INTEGER macro=copy_to_state
	state.HoldTime = types.Int64PointerValue(ans.HoldTime)
	// property: name=id, type=STRING macro=copy_to_state
	state.Id = types.StringPointerValue(ans.Id)
	// property: name=ipv6_prefixes_to_adv_to_wan, type=ARRAY_PRIMITIVE macro=copy_to_state
	varIpv6PrefixesToAdvToWan, errIpv6PrefixesToAdvToWan := types.ListValueFrom(ctx, types.StringType, ans.Ipv6PrefixesToAdvToWan)
	state.Ipv6PrefixesToAdvToWan = varIpv6PrefixesToAdvToWan
	resp.Diagnostics.Append(errIpv6PrefixesToAdvToWan.Errors()...)
	// property: name=keepalive_time, type=INTEGER macro=copy_to_state
	state.KeepaliveTime = types.Int64PointerValue(ans.KeepaliveTime)
	// property: name=local_as_num, type=STRING macro=copy_to_state
	state.LocalAsNum = types.StringPointerValue(ans.LocalAsNum)
	// property: name=maximum_paths, type=INTEGER macro=copy_to_state
	state.MaximumPaths = types.Int64PointerValue(ans.MaximumPaths)
	// property: name=md5_secret, type=STRING macro=copy_to_state
	state.Md5Secret = types.StringPointerValue(ans.Md5Secret)
	// property: name=multi_hop_limit, type=INTEGER macro=copy_to_state
	state.MultiHopLimit = types.Int64PointerValue(ans.MultiHopLimit)
	// property: name=ospf_redistribution, type=ARRAY_REFERENCE macro=copy_to_state
	if ans.OspfRedistribution == nil {
		state.OspfRedistribution = nil
	} else if len(ans.OspfRedistribution) == 0 {
		state.OspfRedistribution = []dsModelOspfRedistribution{}
	} else {
		state.OspfRedistribution = make([]dsModelOspfRedistribution, 0, len(ans.OspfRedistribution))
		for varLoopOspfRedistributionIndex, varLoopOspfRedistribution := range ans.OspfRedistribution {
			// add a new item
			state.OspfRedistribution = append(state.OspfRedistribution, dsModelOspfRedistribution{})
			// copy_to_state: state=state.OspfRedistribution[varLoopOspfRedistributionIndex] prefix=dsModel ans=varLoopOspfRedistribution properties=2
			// property: name=route_map_id, type=STRING macro=copy_to_state
			state.OspfRedistribution[varLoopOspfRedistributionIndex].RouteMapId = types.StringPointerValue(varLoopOspfRedistribution.RouteMapId)
			// property: name=vrf_context_id, type=STRING macro=copy_to_state
			state.OspfRedistribution[varLoopOspfRedistributionIndex].VrfContextId = types.StringPointerValue(varLoopOspfRedistribution.VrfContextId)
		}
	}
	// property: name=peer_auth_type, type=STRING macro=copy_to_state
	state.PeerAuthType = types.StringPointerValue(ans.PeerAuthType)
	// property: name=peer_retry_time, type=INTEGER macro=copy_to_state
	state.PeerRetryTime = types.Int64PointerValue(ans.PeerRetryTime)
	// property: name=prefix_adv_type, type=STRING macro=copy_to_state
	state.PrefixAdvType = types.StringPointerValue(ans.PrefixAdvType)
	// property: name=prefix_adv_type_to_lan, type=STRING macro=copy_to_state
	state.PrefixAdvTypeToLan = types.StringPointerValue(ans.PrefixAdvTypeToLan)
	// property: name=prefixes_to_adv_to_wan, type=ARRAY_PRIMITIVE macro=copy_to_state
	varPrefixesToAdvToWan, errPrefixesToAdvToWan := types.ListValueFrom(ctx, types.StringType, ans.PrefixesToAdvToWan)
	state.PrefixesToAdvToWan = varPrefixesToAdvToWan
	resp.Diagnostics.Append(errPrefixesToAdvToWan.Errors()...)
	// property: name=router_id, type=STRING macro=copy_to_state
	state.RouterId = types.StringPointerValue(ans.RouterId)
	// property: name=stalepath_time, type=INTEGER macro=copy_to_state
	state.StalepathTime = types.Int64PointerValue(ans.StalepathTime)

	// Done.
	diagnostics.Append(resp.State.Set(ctx, &state)...)
}
