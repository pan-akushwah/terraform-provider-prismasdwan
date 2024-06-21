package iprange

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/IPRange

/*
Config object.

ShortName: xygFTDt
Parent chains:
*

Args:

Param EndIp (string, required): End Ip: NotNull(error = DHCPSERVER_CONFIG_IP_RANGE_MISSING: Provide valid IPv4/IPv6 address range for defined subnet.)

Param StartIp (string, required): Start Ip: NotNull(error = DHCPSERVER_CONFIG_IP_RANGE_MISSING: Provide valid IPv4/IPv6 address range for defined subnet.)
*/
type Config struct {
	EndIp   string `json:"end_ip"`
	StartIp string `json:"start_ip"`
}
