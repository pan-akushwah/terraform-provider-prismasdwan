package mapping

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/LanNetworkVlanMapping

/*
Config object.

ShortName: irQawLY
Parent chains:
*

Args:

Param LanNetworkId (string): Lan Network Id

Param VlanId (int64): Vlan Id: Range(max = 4095L, error = INVALID_VLANID: VLAN ID should be between 0 and 4095., min = 0L)
*/
type Config struct {
	LanNetworkId *string `json:"lan_network_id"`
	VlanId       *int64  `json:"vlan_id"`
}
