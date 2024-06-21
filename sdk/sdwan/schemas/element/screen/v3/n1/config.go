package n1

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/ElementScreenV3N1

import (
	xtSEgxw "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/led/config"
	ndabCzl "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/software"
	urOXkAM "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/spoke/haconfig/v2"
	abEEBQk "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/switch/config"
)

/*
Config object.

ShortName: nNBVXzb
Parent chains:
*

Args:

Param ClusterId (string): Cluster Id

Param Description (string): Description: Size(max = 256, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0)

Param DeviceProfileId (string): Device Profile Id

Param Etag (int64): Entity tag for the resource

Param Id (string, read-only): Id

Param L3DirectPrivateWanForwarding (bool): L3 Direct Private Wan Forwarding

Param L3LanForwarding (bool): L3 Lan Forwarding

Param LedConfig (xtSEgxw.Config): the LedConfig param.

Param MainPowerUsageThreshold (int64): Main Power Usage Threshold: ValidateDecimal(allowZero = true, increment = 0, max = 0, error = INVALID_MAIN_POWER_USAGE_THRESHOLD: Invalid main power usage threshold. Allowed range is 50-100., min = 0)

Param Name (string): Name: Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0)

Param NatPolicysetstackId (string): Nat Policysetstack Id: Digits(fraction = 0, integer = 20, error = INVALID_NAT_POLICYSETSTACK_ID: Invalid nat policy set stack id.)

Param NetworkPolicysetstackId (string): Network Policysetstack Id: Digits(fraction = 0, integer = 20, error = INVALID_NETWORK_POLICYSETSTACK_ID: Invalid network policy set stack id)

Param PriorityPolicysetstackId (string): Priority Policysetstack Id: Digits(fraction = 0, integer = 20, error = INVALID_PRIORITY_POLICYSETSTACK_ID: Invalid priority policy set stack id)

Param SiteId (string, required): Site Id: Digits(fraction = 0, integer = 50, SITEID_INVALID) NotNull

Param SpokeHaConfig (urOXkAM.Config): the SpokeHaConfig param.

Param SwObj (ndabCzl.Config): the SwObj param.

Param SwitchConfig (abEEBQk.Config): the SwitchConfig param.

Param Tags ([]string): Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 128, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\s]+, required = false)

Param VpnToVpnForwarding (bool): Vpn To Vpn Forwarding
*/
type Config struct {
	ClusterId                    *string         `json:"cluster_id"`
	Description                  *string         `json:"description"`
	DeviceProfileId              *string         `json:"device_profile_id"`
	Etag                         *int64          `json:"_etag"`
	Id                           *string         `json:"id"`
	L3DirectPrivateWanForwarding *bool           `json:"l3_direct_private_wan_forwarding"`
	L3LanForwarding              *bool           `json:"l3_lan_forwarding"`
	LedConfig                    *xtSEgxw.Config `json:"led_config"`
	MainPowerUsageThreshold      *int64          `json:"main_power_usage_threshold"`
	Name                         *string         `json:"name"`
	NatPolicysetstackId          *string         `json:"nat_policysetstack_id"`
	NetworkPolicysetstackId      *string         `json:"network_policysetstack_id"`
	PriorityPolicysetstackId     *string         `json:"priority_policysetstack_id"`
	SiteId                       string          `json:"site_id"`
	SpokeHaConfig                *urOXkAM.Config `json:"spoke_ha_config"`
	SwObj                        *ndabCzl.Config `json:"sw_obj"`
	SwitchConfig                 *abEEBQk.Config `json:"switch_config"`
	Tags                         []string        `json:"tags"`
	VpnToVpnForwarding           *bool           `json:"vpn_to_vpn_forwarding"`
}
