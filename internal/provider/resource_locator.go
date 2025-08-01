package provider

// Note:  This file is automatically generated.  Manually made changes
// will be overwritten when the provider is generated.

import (
	"context"
	"encoding/json"
	"strings"
	"sync"

	sdwan "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk"
	sdwan_client "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/services"
	"github.com/tidwall/gjson"

	"github.com/hashicorp/terraform-plugin-framework/diag"
	"github.com/hashicorp/terraform-plugin-framework/path"
	"github.com/hashicorp/terraform-plugin-framework/resource"
	rsschema "github.com/hashicorp/terraform-plugin-framework/resource/schema"
	"github.com/hashicorp/terraform-plugin-framework/tfsdk"
	"github.com/hashicorp/terraform-plugin-framework/types"
	"github.com/hashicorp/terraform-plugin-log/tflog"
)

// Resource.
var (
	_ resource.Resource                = &newResourceLocatorResource{}
	_ resource.ResourceWithConfigure   = &newResourceLocatorResource{}
	_ resource.ResourceWithImportState = &newResourceLocatorResource{}
)

// map to contain url and path
var resourceTypeToUrlMap map[string]string
var mtx = sync.RWMutex{}

// To enable this data source for TF Provider, go to `provider.go` and inject this into the function
// as below:
//
//	func (p *SdwanProvider) Resources(_ context.Context) []func() resource.Resource {
//	  	return []func() resource.Resource{
//	     ... <other existing resources>
//	     NewResourceLocatorResource,
//	     // -- append next resource above -- //
//	     }
//	  }
func NewResourceLocatorResource() resource.Resource {
	return &newResourceLocatorResource{}
}

type newResourceLocatorResource struct {
	client *sdwan.Client
}

// Metadata returns the data source type name.
func (r *newResourceLocatorResource) Metadata(_ context.Context, req resource.MetadataRequest, resp *resource.MetadataResponse) {
	resp.TypeName = "prismasdwan_resource_locator"
}

type rsModelResourceLocator struct {
	TfParameters          types.Map    `tfsdk:"x_parameters"`
	ResourceType          types.String `tfsdk:"resource_type"`
	ResourceProperty      types.String `tfsdk:"resource_property"`
	ResourcePropertyValue types.String `tfsdk:"resource_property_value"`
	Result                types.String `tfsdk:"result"`
}

type listResponse struct {
	Etag   *int64                   `json:"_etag"`   // propertyName=_etag type=INTEGER
	Schema *int64                   `json:"_schema"` // propertyName=_schema type=INTEGER
	Count  *int64                   `json:"count"`   // propertyName=count type=INTEGER
	Items  []map[string]interface{} `json:"items"`   // propertyName=items type=ARRAY_REFERENCE
}

// Schema defines the schema for this data source.
func (r *newResourceLocatorResource) Schema(_ context.Context, _ resource.SchemaRequest, resp *resource.SchemaResponse) {
	resp.Schema = rsschema.Schema{
		Description: "Retrieves a config item.",
		Attributes: map[string]rsschema.Attribute{
			"resource_type": rsschema.StringAttribute{
				Computed: false,
				Required: true,
			},
			"resource_property": rsschema.StringAttribute{
				Computed: false,
				Required: false,
				Optional: true,
			},
			"resource_property_value": rsschema.StringAttribute{
				Computed: false,
				Required: false,
				Optional: true,
			},
			"result": rsschema.StringAttribute{
				Computed: true,
				Required: false,
			},
			"x_parameters": rsschema.MapAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				ElementType: types.StringType,
			},
		},
	}
}

// Configure prepares the struct.
func (r *newResourceLocatorResource) Configure(_ context.Context, req resource.ConfigureRequest, resp *resource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}
	r.client = req.ProviderData.(*sdwan.Client)
	mtx.Lock()
	if resourceTypeToUrlMap != nil {
		mtx.Unlock()
		return
	}
	// inject into map
	resourceTypeToUrlMap = make(map[string]string)
	resourceTypeToUrlMap["TEST"] = "SOME"
	resourceTypeToUrlMap["prismasdwan_ipfix_template"] = "/sdwan/v2.0/api/ipfixtemplates/{template_id}"
	resourceTypeToUrlMap["prismasdwan_app_def_override"] = "/sdwan/v2.3/api/appdefs/{appdef_id}/overrides/{override_id}"
	resourceTypeToUrlMap["prismasdwan_qos_policy_local_prefix"] = "/sdwan/v2.0/api/prioritypolicylocalprefixes/{priority_policy_id}"
	resourceTypeToUrlMap["prismasdwan_element_radius"] = "/sdwan/v2.0/api/elements/{element_id}/radii/{radius_id}"
	resourceTypeToUrlMap["prismasdwan_element_ipfix"] = "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/ipfix/{ipfix_id}"
	resourceTypeToUrlMap["prismasdwan_site_prisma_sase_connection"] = "/sdwan/v2.1/api/sites/{site_id}/prismasase_connections/{prismasase_connection_id}"
	resourceTypeToUrlMap["prismasdwan_sdwanapps_config"] = "/sdwan/v2.0/api/sdwanapps/{app_id}/configs/{cid}"
	resourceTypeToUrlMap["prismasdwan_security_policy_local_prefix"] = "/sdwan/v2.0/api/ngfwsecuritypolicylocalprefixes/{prefix_id}"
	resourceTypeToUrlMap["prismasdwan_site_hub_cluster"] = "/sdwan/v4.0/api/sites/{site_id}/hubclusters/{hub_cluster_id}"
	resourceTypeToUrlMap["prismasdwan_site_prisma_access_config"] = "/sdwan/v2.0/api/sites/{site_id}/prismaaccess_configs/{config_id}"
	resourceTypeToUrlMap["prismasdwan_anynet_link"] = "/sdwan/v4.0/api/anynetlinks/{anynet_id}"
	resourceTypeToUrlMap["prismasdwan_dns_service_profile"] = "/sdwan/v2.1/api/dnsserviceprofiles/{dnsservice_role_id}"
	resourceTypeToUrlMap["prismasdwan_wan_overlay"] = "/sdwan/v2.0/api/wanoverlays/{wan_overlay_id}"
	resourceTypeToUrlMap["prismasdwan_app_def"] = "/sdwan/v2.6/api/appdefs/{appdef_id}"
	resourceTypeToUrlMap["prismasdwan_nat_zone"] = "/sdwan/v2.0/api/natzones/{nat_policy_zone_id}"
	resourceTypeToUrlMap["prismasdwan_multicast_peer_group_profile"] = "/sdwan/v2.1/api/multicastpeergroups/{peer_group_id}"
	resourceTypeToUrlMap["prismasdwan_nat_policy_set"] = "/sdwan/v2.0/api/natpolicysets/{nat_policy_set_id}"
	resourceTypeToUrlMap["prismasdwan_element_bgp_config"] = "/sdwan/v2.4/api/sites/{site_id}/elements/{element_id}/bgpconfigs/{bgp_config_id}"
	resourceTypeToUrlMap["prismasdwan_site_security_zone"] = "/sdwan/v2.0/api/sites/{site_id}/sitesecurityzones/{zone_id}"
	resourceTypeToUrlMap["prismasdwan_element_security_zone"] = "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/securityzones/{security_zone_id}"
	resourceTypeToUrlMap["prismasdwan_site_path_policy_local_prefix"] = "/sdwan/v2.1/api/sites/{site_id}/networkpolicylocalprefixes/{prefix_id}"
	resourceTypeToUrlMap["prismasdwan_site_wan_multicast_configuration"] = "/sdwan/v2.0/api/sites/{site_id}/multicastsourcesiteconfigs/{config_id}"
	resourceTypeToUrlMap["prismasdwan_ntp_template"] = "/sdwan/v2.0/api/templates/ntp/{ntp_id}"
	resourceTypeToUrlMap["prismasdwan_site_lan_network"] = "/sdwan/v3.3/api/sites/{site_id}/lannetworks/{lannetwork_id}"
	resourceTypeToUrlMap["prismasdwan_element_interface"] = "/sdwan/v4.20/api/sites/{site_id}/elements/{element_id}/interfaces/{interface_id}"
	resourceTypeToUrlMap["prismasdwan_qos_policy_global_prefix"] = "/sdwan/v2.1/api/prioritypolicyglobalprefixes/{priority_policy_id}"
	resourceTypeToUrlMap["prismasdwan_qos_policy_rule"] = "/sdwan/v2.2/api/prioritypolicysets/{policy_set_id}/prioritypolicyrules/{policy_rule_id}"
	resourceTypeToUrlMap["prismasdwan_wan_network"] = "/sdwan/v2.1/api/wannetworks/{wan_network_id}"
	resourceTypeToUrlMap["prismasdwan_security_policy_stack"] = "/sdwan/v2.0/api/ngfwsecuritypolicysetstacks/{policyset_stack_id}"
	resourceTypeToUrlMap["prismasdwan_element_static_route"] = "/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/staticroutes/{static_route_id}"
	resourceTypeToUrlMap["prismasdwan_event_correlation_policy_rule"] = "/sdwan/v2.1/api/eventcorrelationpolicysets/{policy_set_id}/eventcorrelationpolicyrules/{policy_rule_id}"
	resourceTypeToUrlMap["prismasdwan_site_hub_prefix_filter_association"] = "/sdwan/v2.0/api/sites/{site_id}/pathprefixdistributionfilterassociation/{id}"
	resourceTypeToUrlMap["prismasdwan_qos_policy_stack"] = "/sdwan/v2.0/api/prioritypolicysetstacks/{policy_set_id}"
	resourceTypeToUrlMap["prismasdwan_ipfix_filter_context"] = "/sdwan/v2.0/api/ipfixfiltercontexts/{context_id}"
	resourceTypeToUrlMap["prismasdwan_wan_interface_label"] = "/sdwan/v2.5/api/waninterfacelabels/{wantinterface_label_id}"
	resourceTypeToUrlMap["prismasdwan_ipsec_profile"] = "/sdwan/v2.2/api/ipsecprofiles/{profile_id}"
	resourceTypeToUrlMap["prismasdwan_iot_profile"] = "/sdwan/v2.0/api/deviceidprofiles/{profile_id}"
	resourceTypeToUrlMap["prismasdwan_nat_policy_pool"] = "/sdwan/v2.0/api/natpolicypools/{natpolicy_pool_id}"
	resourceTypeToUrlMap["prismasdwan_nat_local_prefix"] = "/sdwan/v2.0/api/natlocalprefixes/{prefix_id}"
	resourceTypeToUrlMap["prismasdwan_vrf_context"] = "/sdwan/v2.0/api/vrfcontexts/{vrf_context_id}"
	resourceTypeToUrlMap["prismasdwan_site_hub_cluster_member"] = "/sdwan/v3.0/api/sites/{site_id}/hubclusters/{hub_cluster_id}/hubclustermembers/{hub_cluster_member_id}"
	resourceTypeToUrlMap["prismasdwan_site_hub_prefix_filter"] = "/sdwan/v2.0/api/sites/{site_id}/prefixfilters/{filter_id}"
	resourceTypeToUrlMap["prismasdwan_path_global_prefix"] = "/sdwan/v2.1/api/networkpolicyglobalprefixes/{prefix_id}"
	resourceTypeToUrlMap["prismasdwan_element_shell"] = "/sdwan/v2.1/api/sites/{site_id}/elementshells/{element_shell_id}"
	resourceTypeToUrlMap["prismasdwan_nat_global_prefix"] = "/sdwan/v2.0/api/natglobalprefixes/{prefix_id}"
	resourceTypeToUrlMap["prismasdwan_probe_profile"] = "/sdwan/v2.0/api/probeprofiles/{profile_id}"
	resourceTypeToUrlMap["prismasdwan_ipfix_profile"] = "/sdwan/v2.0/api/ipfixprofiles/{profile_id}"
	resourceTypeToUrlMap["prismasdwan_local_prefix_filter"] = "/sdwan/v2.0/api/localprefixfilters/{id}"
	resourceTypeToUrlMap["prismasdwan_element"] = "/sdwan/v3.2/api/elements/{element_id}"
	resourceTypeToUrlMap["prismasdwan_apn_profile"] = "/sdwan/v2.0/api/apnprofiles/{apnprofile_id}"
	resourceTypeToUrlMap["prismasdwan_site_security_policy_local_prefix"] = "/sdwan/v2.1/api/sites/{site_id}/ngfwsecuritypolicylocalprefixes/{prefix_id}"
	resourceTypeToUrlMap["prismasdwan_site_iot_snmp_start_node"] = "/sdwan/v2.0/api/sites/{site_id}/deviceidconfigs/{deviceid_config_id}/snmpdiscoverystartnodes/{deviceid_start_node_id}"
	resourceTypeToUrlMap["prismasdwan_ipfix_global_prefix"] = "/sdwan/v2.0/api/ipfixglobalprefixes/{prefix_id}"
	resourceTypeToUrlMap["prismasdwan_ipfix_collector_context"] = "/sdwan/v2.0/api/ipfixcollectorcontexts/{context_id}"
	resourceTypeToUrlMap["prismasdwan_performance_policy_set"] = "/sdwan/v2.0/api/perfmgmtpolicysets/{perfmgmtpolicyset_id}"
	resourceTypeToUrlMap["prismasdwan_global_prefix_filter"] = "/sdwan/v2.0/api/globalprefixfilters/{filter_id}"
	resourceTypeToUrlMap["prismasdwan_security_policy_set"] = "/sdwan/v2.0/api/ngfwsecuritypolicysets/{policy_set_id}"
	resourceTypeToUrlMap["prismasdwan_ipfix_local_prefix"] = "/sdwan/v2.0/api/ipfixlocalprefixes/{prefix_id}"
	resourceTypeToUrlMap["prismasdwan_security_zone"] = "/sdwan/v2.1/api/securityzones/{zone_id}"
	resourceTypeToUrlMap["prismasdwan_tacacs_plus_profile"] = "/sdwan/v2.0/api/tacacs_plus_profiles/{profile_id}"
	resourceTypeToUrlMap["prismasdwan_element_dns_service"] = "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/dnsservices/{dnsservice_role_id}"
	resourceTypeToUrlMap["prismasdwan_site"] = "/sdwan/v4.12/api/sites/{site_id}"
	resourceTypeToUrlMap["prismasdwan_dns_service_role"] = "/sdwan/v2.0/api/dnsserviceroles/{dnsservice_role_id}"
	resourceTypeToUrlMap["prismasdwan_site_dhcp_server"] = "/sdwan/v2.3/api/sites/{site_id}/dhcpservers/{dhcp_server_id}"
	resourceTypeToUrlMap["prismasdwan_path_policy_rule"] = "/sdwan/v2.4/api/networkpolicysets/{policy_set_id}/networkpolicyrules/{policy_rule_id}"
	resourceTypeToUrlMap["prismasdwan_performance_policy_stack"] = "/sdwan/v2.0/api/perfmgmtpolicysetstacks/{id}"
	resourceTypeToUrlMap["prismasdwan_vrf_context_profile"] = "/sdwan/v2.0/api/vrfcontextprofiles/{vrf_context_profile_id}"
	resourceTypeToUrlMap["prismasdwan_element_snmp_trap"] = "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/snmptraps/{snmptrap_id}"
	resourceTypeToUrlMap["prismasdwan_service_group"] = "/sdwan/v2.1/api/servicelabels/{service_label_id}"
	resourceTypeToUrlMap["prismasdwan_site_nat_local_prefix"] = "/sdwan/v2.0/api/sites/{site_id}/natlocalprefixes/{prefix_id}"
	resourceTypeToUrlMap["prismasdwan_element_cellular_module"] = "/sdwan/v2.0/api/elements/{element_id}/cellular_modules/{cellular_module_id}"
	resourceTypeToUrlMap["prismasdwan_element_multicast_global_config"] = "/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/multicastglobalconfigs/{config_id}"
	resourceTypeToUrlMap["prismasdwan_element_ospf_config"] = "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/ospfconfigs/{ospf_config_id}"
	resourceTypeToUrlMap["prismasdwan_element_shell_interface"] = "/sdwan/v2.3/api/sites/{site_id}/elementshells/{element_shell_id}/interfaces/{interface_id}"
	resourceTypeToUrlMap["prismasdwan_element_syslog_server"] = "/sdwan/v2.2/api/sites/{site_id}/elements/{element_id}/syslogservers/{syslogserver_id}"
	resourceTypeToUrlMap["prismasdwan_path_policy_set"] = "/sdwan/v2.0/api/networkpolicysets/{policy_set_id}"
	resourceTypeToUrlMap["prismasdwan_element_tacacs_plus_server"] = "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/tacacs_plus_servers/{id}"
	resourceTypeToUrlMap["prismasdwan_nat_policy_rule"] = "/sdwan/v2.0/api/natpolicysets/{nat_policy_set_id}/natpolicyrules/{nat_policy_rule_id}"
	resourceTypeToUrlMap["prismasdwan_domain"] = "/sdwan/v2.1/api/servicebindingmaps/{map_id}"
	resourceTypeToUrlMap["prismasdwan_network_context"] = "/sdwan/v2.0/api/networkcontexts/{network_context_id}"
	resourceTypeToUrlMap["prismasdwan_site_wan_interface"] = "/sdwan/v2.9/api/sites/{site_id}/waninterfaces/{wan_interface_id}"
	resourceTypeToUrlMap["prismasdwan_path_policy_stack"] = "/sdwan/v2.0/api/networkpolicysetstacks/{policy_set_id}"
	resourceTypeToUrlMap["prismasdwan_element_multicast_rp"] = "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/multicastrps/{config_id}"
	resourceTypeToUrlMap["prismasdwan_element_application_probe"] = "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/application_probe"
	resourceTypeToUrlMap["prismasdwan_site_qos_policy_local_prefix"] = "/sdwan/v2.1/api/sites/{site_id}/prioritypolicylocalprefixes/{prefix_id}"
	resourceTypeToUrlMap["prismasdwan_qos_policy_set"] = "/sdwan/v2.0/api/prioritypolicysets/{policy_set_id}"
	resourceTypeToUrlMap["prismasdwan_site_ipfix_local_prefix"] = "/sdwan/v2.0/api/sites/{site_id}/ipfixlocalprefixes/{prefix_id}"
	resourceTypeToUrlMap["prismasdwan_element_routing_routemap"] = "/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/routing_routemaps/{config_id}"
	resourceTypeToUrlMap["prismasdwan_element_cellular_module_sim_security"] = "/sdwan/v2.0/api/elements/{element_id}/cellular_modules/{cellular_module_id}/sim_security/{sim_security_id}"
	resourceTypeToUrlMap["prismasdwan_element_ntp"] = "/sdwan/v2.1/api/elements/{element_id}/ntp/{ntp_id}"
	resourceTypeToUrlMap["prismasdwan_element_routing_aspathaccesslist"] = "/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/routing_aspathaccesslists/{config_id}"
	resourceTypeToUrlMap["prismasdwan_path_local_prefix"] = "/sdwan/v2.0/api/networkpolicylocalprefixes/{prefix_id}"
	resourceTypeToUrlMap["prismasdwan_syslog_profile"] = "/sdwan/v2.0/api/syslogserverprofiles/{profile_id}"
	resourceTypeToUrlMap["prismasdwan_site_spoke_cluster"] = "/sdwan/v2.0/api/sites/{site_id}/spokeclusters/{spoke_cluster_id}"
	resourceTypeToUrlMap["prismasdwan_site_iot_device_id_config"] = "/sdwan/v2.1/api/sites/{site_id}/deviceidconfigs/{config_id}"
	resourceTypeToUrlMap["prismasdwan_element_ospf_global_config"] = "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/ospfglobalconfigs/{ospf_config_id}"
	resourceTypeToUrlMap["prismasdwan_performance_policy_rule"] = "/sdwan/v2.2/api/perfmgmtpolicysets/{perfmgmtpolicyset_id}/perfmgmtpolicyrules/{perfmgmtpolicyrule_id}"
	resourceTypeToUrlMap["prismasdwan_service_endpoint"] = "/sdwan/v3.0/api/serviceendpoints/{service_endpoint_id}"
	resourceTypeToUrlMap["prismasdwan_element_toolkit"] = "/sdwan/v2.2/api/elements/{element_id}/elementaccessconfigs"
	resourceTypeToUrlMap["prismasdwan_nat_policy_set_stack"] = "/sdwan/v2.0/api/natpolicysetstacks/{natpolicy_set_stack_id}"
	resourceTypeToUrlMap["prismasdwan_event_correlation_policy_set"] = "/sdwan/v2.0/api/eventcorrelationpolicysets/{policy_set_id}"
	resourceTypeToUrlMap["prismasdwan_element_routing_prefixlist"] = "/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/routing_prefixlists/{routing_prefixlist_id}"
	resourceTypeToUrlMap["prismasdwan_element_iot_device_id_config"] = "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/deviceidconfigs/{config_id}"
	resourceTypeToUrlMap["prismasdwan_security_policy_global_prefix"] = "/sdwan/v2.1/api/ngfwsecuritypolicyglobalprefixes/{prefix_id}"
	resourceTypeToUrlMap["prismasdwan_element_snmp_agent"] = "/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/snmpagents/{snmpagent_id}"
	resourceTypeToUrlMap["prismasdwan_probe_config"] = "/sdwan/v2.0/api/probeconfigs/{config_id}"
	resourceTypeToUrlMap["prismasdwan_path_group"] = "/sdwan/v2.1/api/pathgroups/{path_group_id}"
	resourceTypeToUrlMap["prismasdwan_element_bgp_peer"] = "/sdwan/v2.6/api/sites/{site_id}/elements/{element_id}/bgppeers/{bgp_peer_id}"
	resourceTypeToUrlMap["prismasdwan_security_policy_rule"] = "/sdwan/v2.2/api/ngfwsecuritypolicysets/{policy_set_id}/ngfwsecuritypolicyrules/{policy_rule_id}"
	resourceTypeToUrlMap["prismasdwan_element_routing_ipcommunitylist"] = "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/routing_ipcommunitylists/{config_id}"
	resourceTypeToUrlMap["prismasdwan_site_ciphers"] = "/sdwan/v2.0/api/sites/{site_id}/siteciphers"
	resourceTypeToUrlMap["prismasdwan_external_ca_config"] = "/sdwan/v2.0/api/externalcaconfigs/{id}"
	resourceTypeToUrlMap["prismasdwan_site_hub_prefix_filter_profile"] = "/sdwan/v2.0/api/sites/{site_id}/pathprefixdistributionfilters/{id}"
	resourceTypeToUrlMap["prismasdwan_performance_profile"] = "/sdwan/v2.1/api/perfmgmtthresholdprofiles/{profile_id}"
	resourceTypeToUrlMap["prismasdwan_site_hub_distribution_fabric"] = "/sdwan/v2.0/api/sites/{site_id}/prefixdistributionspokelists/{id}"
	mtx.Unlock()
}

// in some apis the status code is not consistent and hence we may have to act upon
// specific error codes instead
func (r *newResourceLocatorResource) GetHttpStatusCode(request *sdwan_client.SdwanClientRequestResponse) int {
	if request.ResponseErrorCode == nil {
		return request.ResponseStatusCode
	}
	if strings.Index(*request.ResponseErrorCode, "_NOT_FOUND") != -1 {
		return 404
	}
	return request.ResponseStatusCode
}

func (r *newResourceLocatorResource) Create(ctx context.Context, req resource.CreateRequest, resp *resource.CreateResponse) {
	tflog.Info(ctx, "executing resource lookup for prismasdwan_resource_locator}")
	var plan rsModelResourceLocator
	resp.Diagnostics.Append(req.Plan.Get(ctx, &plan)...)
	if resp.Diagnostics.HasError() {
		return
	}
	r.makeHttpGetLookUp(ctx, &plan, &resp.State, &resp.Diagnostics)
	if !resp.Diagnostics.HasError() {
		resp.Diagnostics.Append(resp.State.Set(ctx, &plan)...)
	}
}

func (r *newResourceLocatorResource) Read(ctx context.Context, req resource.ReadRequest, resp *resource.ReadResponse) {
	var state rsModelResourceLocator
	resp.Diagnostics.Append(req.State.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}
	// get copy of result
	existing_result := state.Result.ValueString()
	r.makeHttpGetLookUp(ctx, &state, &resp.State, &resp.Diagnostics)
	// verify
	if existing_result != state.Result.ValueString() || resp.Diagnostics.HasError() {
		resp.State.RemoveResource(ctx)
	}
}

func (r *newResourceLocatorResource) Update(ctx context.Context, req resource.UpdateRequest, resp *resource.UpdateResponse) {
	resp.State.RemoveResource(ctx)
	var plan rsModelResourceLocator
	resp.Diagnostics.Append(req.Plan.Get(ctx, &plan)...)
	if resp.Diagnostics.HasError() {
		return
	}
	r.makeHttpGetLookUp(ctx, &plan, &resp.State, &resp.Diagnostics)
	if !resp.Diagnostics.HasError() {
		resp.Diagnostics.Append(resp.State.Set(ctx, &plan)...)
	}
}

func (r *newResourceLocatorResource) Delete(ctx context.Context, req resource.DeleteRequest, resp *resource.DeleteResponse) {
	resp.State.RemoveResource(ctx)
}

func (r *newResourceLocatorResource) ImportState(ctx context.Context, req resource.ImportStateRequest, resp *resource.ImportStateResponse) {
	resource.ImportStatePassthroughID(ctx, path.Root("resultq"), req, resp)
}

func (r *newResourceLocatorResource) makeHttpGetLookUp(ctx context.Context, plan *rsModelResourceLocator, state *tfsdk.State, diagnostic *diag.Diagnostics) {
	tflog.Info(ctx, "executing resource lookup for prismasdwan_resource_locator}")
	// Basic logging.
	tflog.Info(ctx, "performing resource lookup", map[string]any{
		"resource_name":               "prismasdwan_resource_locator}",
		"terraform_provider_function": "Lookup",
	})
	// find the path
	get_path, ok := resourceTypeToUrlMap[plan.ResourceType.ValueString()]
	if !ok {
		diagnostic.AddError("could not find supported resource type", plan.ResourceType.ValueString())
		return
	}

	// Prepare input for the API endpoint.
	get_request := &sdwan_client.SdwanClientRequestResponse{}
	get_request.Method = "GET"
	get_request.Path = get_path[:strings.LastIndex(get_path, "/")]

	// copy parameters from plan always
	params := MapStringValueOrNil(ctx, plan.TfParameters)
	get_request.PathParameters = &params
	// split the path from last slash

	// Client that will perform the request.
	svc := sdwan_client.NewClient(r.client)

	// Perform the operation.
	svc.ExecuteSdwanRequest(ctx, get_request)
	if get_request.ResponseErr != nil {
		if IsObjectNotFound(*get_request.ResponseErr) {
			state.RemoveResource(ctx)
		} else if r.GetHttpStatusCode(get_request) == 404 {
			state.RemoveResource(ctx)
		} else {
			tflog.Info(ctx, "lookup request failed for prismasdwan_resource_locator", map[string]any{
				"terraform_provider_function": "LookUp",
				"resource_name":               "prismasdwan_resource_locator",
				"path":                        get_request.FinalPath,
			})
			diagnostic.AddError("error reading prismasdwan_resource_locator from sdwan servers", (*get_request.ResponseErr).Error())
		}
		return
	}

	// process http json path
	response_body_string := string(*get_request.ResponseBytes)
	tflog.Info(ctx, "lookup response from server", map[string]any{
		"path": response_body_string,
	})

	// iterate through items and find the first matching item
	var response listResponse
	json_err := json.Unmarshal([]byte(response_body_string), &response)
	// if found, exit
	if json_err != nil {
		diagnostic.AddError("error in json unmarshal to generic map in lookup", json_err.Error())
		return
	}
	// ensure its as array
	for _, item := range response.Items {
		// create json from item
		item_json, item_err := json.Marshal(item)
		if item_err != nil {
			diagnostic.AddError("error in json unmarshal to generic map in lookup", item_err.Error())
			return
		}
		// do a path look up
		path_value := gjson.Get(string(item_json), plan.ResourceProperty.ValueString()).String()
		id_value := gjson.Get(string(item_json), "id").String()
		id_value = strings.Replace(id_value, "\"", "", 2)
		path_value = strings.Replace(path_value, "\"", "", 2)
		tflog.Info(ctx, "scanned through an item and found a value", map[string]any{
			"req_path":   plan.ResourceProperty.ValueString(),
			"req_value":  plan.ResourcePropertyValue.ValueString(),
			"json_value": path_value,
			"id_value":   id_value,
		})
		// compare
		if plan.ResourcePropertyValue.ValueString() == path_value {
			plan.Result = types.StringValue(id_value)
			return
		}
	}
	// add error
	diagnostic.AddError("items not found in lookup", response_body_string)
}
