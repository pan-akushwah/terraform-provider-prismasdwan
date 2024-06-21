package n8

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/WANInterfaceScreenV2N8

import (
	nSFnnqb "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/lqmconfig"
	rIUJWmK "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/vpnlink/configuration"
	qRlmEFd "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/wanl3/reachability"
)

/*
Config object.

ShortName: uAgupQd
Parent chains:
*

Args:

Param BfdMode (string, required): Bfd Mode: ValidateEnum(enumClass = classOf[BfdMode], WAN_CONFIG_INVALID_BFD_MODE, nullAllowed = false)  String must be one of these: `"aggressive"`, `"non_aggressive"`.

Param BwConfigMode (string, required): Bw Config Mode: ValidateEnum(enumClass = classOf[BWConfigMode], message = INVALID_BANDWIDTH_CONFIG_MODE, nullAllowed = false)  String must be one of these: `"auto"`, `"manual"`, `"manual_bwm_disabled"`.

Param BwcEnabled (bool): Bwc Enabled

Param Cost (int64): Cost: Range(max = 1024L, error = WANINTERFACE_INVALID_COST_VALUE: Cost value for site WAN interface should be within range 0-1024, min = 0L)

Param Description (string): Description: Size(max = 256, WANINTERFACE_CONFIG_DESCRIPTION_EXCEEDS_LIMIT, min = 0)

Param Etag (int64): Entity tag for the resource

Param Id (string, read-only): Id

Param L3Reachability (qRlmEFd.Config): the L3Reachability param.

Param LabelId (string, required): Label Id: NotEmpty(message = WAN_INTERFACE_INVALID_LABEL)

Param LinkBwDown (float64): Link Bw Down: JsonIgnore(value = true)

Param LinkBwUp (float64): Link Bw Up: JsonIgnore(value = true)

Param LqmConfig (nSFnnqb.Config): the LqmConfig param.

Param LqmEnabled (bool): Lqm Enabled

Param Name (string): Name: Size(max = 128, WANINTERFACE_CONFIG_NAME_EXCEEDS_LIMIT, min = 0)

Param NetworkId (string, required): Network Id: NotEmpty(message = NETWORK_ID_REQD)

Param ProbeProfileId (string): Probe Profile Id

Param Tags ([]string): Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 128, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\s]+, required = false)

Param Type (string): Type String must be one of these: `"PUBLIC_WAN"`, `"PRIVATE_WAN"`.

Param UseForApplicationReachabilityProbes (bool): Use For Application Reachability Probes: Valid

Param UseForControllerConnections (bool): Use For Controller Connections: Valid

Param UseLqmForNonHubPaths (bool): Use Lqm For Non Hub Paths

Param VpnlinkConfiguration (rIUJWmK.Config): the VpnlinkConfiguration param.
*/
type Config struct {
	BfdMode                             string          `json:"bfd_mode"`
	BwConfigMode                        string          `json:"bw_config_mode"`
	BwcEnabled                          *bool           `json:"bwc_enabled"`
	Cost                                *int64          `json:"cost"`
	Description                         *string         `json:"description"`
	Etag                                *int64          `json:"_etag"`
	Id                                  *string         `json:"id"`
	L3Reachability                      *qRlmEFd.Config `json:"l3_reachability"`
	LabelId                             string          `json:"label_id"`
	LinkBwDown                          *float64        `json:"link_bw_down"`
	LinkBwUp                            *float64        `json:"link_bw_up"`
	LqmConfig                           *nSFnnqb.Config `json:"lqm_config"`
	LqmEnabled                          *bool           `json:"lqm_enabled"`
	Name                                *string         `json:"name"`
	NetworkId                           string          `json:"network_id"`
	ProbeProfileId                      *string         `json:"probe_profile_id"`
	Tags                                []string        `json:"tags"`
	Type                                *string         `json:"type"`
	UseForApplicationReachabilityProbes *bool           `json:"use_for_application_reachability_probes"`
	UseForControllerConnections         *bool           `json:"use_for_controller_connections"`
	UseLqmForNonHubPaths                *bool           `json:"use_lqm_for_non_hub_paths"`
	VpnlinkConfiguration                *rIUJWmK.Config `json:"vpnlink_configuration"`
}
