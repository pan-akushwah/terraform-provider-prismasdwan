package n5

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/WANInterfaceLabelScreenV2N5

import (
	rIUJWmK "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/vpnlink/configuration"
	qRlmEFd "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/wanl3/reachability"
)

/*
Config object.

ShortName: rrePbcM
Parent chains:
*

Args:

Param BwcEnabled (bool): Bwc Enabled

Param Description (string): Description: Size(max = 256, message = PATHGROUP_INVALID_DESCRIPTION, min = 0)

Param Etag (int64): Entity tag for the resource

Param Id (string, read-only): Id

Param L3Reachability (qRlmEFd.Config): the L3Reachability param.

Param Label (string): Label: Pattern(message = INVALID_INTERFACE_LABEL, regexp = (public|private)-(([1-9])|([1-2][0-9])|(3[0-2])|(100[0-9])))

Param LqmEnabled (bool): Lqm Enabled

Param Name (string): Name: Size(max = 128, message = PATHGROUP_INVALID_NAME, min = 0)

Param ProbeProfileId (string): Probe Profile Id

Param Tags ([]string): Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 128, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\s]+, required = false)

Param UseForApplicationReachabilityProbes (bool): Use For Application Reachability Probes: Valid

Param UseForControllerConnections (bool): Use For Controller Connections: Valid

Param UseLqmForNonHubPaths (bool): Use Lqm For Non Hub Paths

Param VpnlinkConfiguration (rIUJWmK.Config): the VpnlinkConfiguration param.
*/
type Config struct {
	BwcEnabled                          *bool           `json:"bwc_enabled"`
	Description                         *string         `json:"description"`
	Etag                                *int64          `json:"_etag"`
	Id                                  *string         `json:"id"`
	L3Reachability                      *qRlmEFd.Config `json:"l3_reachability"`
	Label                               *string         `json:"label"`
	LqmEnabled                          *bool           `json:"lqm_enabled"`
	Name                                *string         `json:"name"`
	ProbeProfileId                      *string         `json:"probe_profile_id"`
	Tags                                []string        `json:"tags"`
	UseForApplicationReachabilityProbes *bool           `json:"use_for_application_reachability_probes"`
	UseForControllerConnections         *bool           `json:"use_for_controller_connections"`
	UseLqmForNonHubPaths                *bool           `json:"use_lqm_for_non_hub_paths"`
	VpnlinkConfiguration                *rIUJWmK.Config `json:"vpnlink_configuration"`
}
