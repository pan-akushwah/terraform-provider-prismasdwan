package arpconfig

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/StaticARPConfig

/*
Config object.

ShortName: pWDbfYi
Parent chains:
*

Args:

Param Ipv4Address (string): Ipv4 Address: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, INVALID_IP, type = IP)

Param MacAddress (string): Mac Address: MACAddress(error = INTERFACE_CONFIG_INVALID_MAC: Invalid mac address syntax.)
*/
type Config struct {
	Ipv4Address *string `json:"ipv4_address"`
	MacAddress  *string `json:"mac_address"`
}
