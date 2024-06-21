package config

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/SwitchPortConfig

import (
	qhDZEMT "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/storm/control/config"
)

/*
Config object.

ShortName: kslrKbF
Parent chains:
*

Args:

Param AccessVlanId (int64): Access Vlan Id

Param BpduGuardEnabled (bool): Bpdu Guard Enabled

Param ForwardFastEnabled (bool): Forward Fast Enabled

Param NativeVlanId (int64): Native Vlan Id

Param RootGuardEnabled (bool): Root Guard Enabled

Param StormControlConfig (qhDZEMT.Config): the StormControlConfig param.

Param StpPortCost (int64): Stp Port Cost: Range(max = 65535L, error = INTERFACE_CONFIG_SWITCH_PORT_INVALID_STP_COST: Invalid interface configuration. Switch port interface config is invalid. Invalid STP cost. Valid values are 1-65535., min = 1L)

Param StpPortEnabled (bool): Stp Port Enabled

Param StpPortPriority (int64): Stp Port Priority: ValidateDecimal(allowZero = true, increment = 0, max = 0, error = INTERFACE_CONFIG_SWITCH_PORT_INVALID_STP_PRIORITY: Invalid interface configuration. Switch port interface config is invalid. Invalid stp priority. Valid values are 0-240 and must be a multiple of 16., min = 0)

Param TrunkVlans ([]string): Trunk Vlans: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 32, error = INTERFACE_CONFIG_SWITCH_PORT_INVALID_TRUNK_VLANS: Invalid interface configuration. Switch port config is invalid.  VLAN mode is trunk. Max trunk VLANs allowed is 32 and no duplicates are allowed., noTrim = false, regex = , required = false)

Param VlanMode (string, required): Vlan Mode: ValidateEnum(enumClass = classOf[VlanMode], error = INTERFACE_CONFIG_SWITCH_PORT_INVALID_VLAN_MODE: Invalid interface configuration. Switch port interface config is invalid. Invalid vlan mode. Valid values are access and trunk., nullAllowed = false)  String must be one of these: `"access"`, `"trunk"`.

Param VoiceVlanId (int64): Voice Vlan Id
*/
type Config struct {
	AccessVlanId       *int64          `json:"access_vlan_id"`
	BpduGuardEnabled   *bool           `json:"bpdu_guard_enabled"`
	ForwardFastEnabled *bool           `json:"forward_fast_enabled"`
	NativeVlanId       *int64          `json:"native_vlan_id"`
	RootGuardEnabled   *bool           `json:"root_guard_enabled"`
	StormControlConfig *qhDZEMT.Config `json:"storm_control_config"`
	StpPortCost        *int64          `json:"stp_port_cost"`
	StpPortEnabled     *bool           `json:"stp_port_enabled"`
	StpPortPriority    *int64          `json:"stp_port_priority"`
	TrunkVlans         []string        `json:"trunk_vlans"`
	VlanMode           string          `json:"vlan_mode"`
	VoiceVlanId        *int64          `json:"voice_vlan_id"`
}
