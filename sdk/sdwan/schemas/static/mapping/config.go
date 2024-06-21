package mapping

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/StaticMapping

/*
Config object.

ShortName: yKYCDSK
Parent chains:
*

Args:

Param IpAddress (string, required): Ip Address: NotNull(error = DHCPSERVER_CONFIG_STATIC_MAPPING_MISSING: Provide all required attributes for static mappings.)

Param Mac (string): Mac: MACAddressFiveColons(error = DHCPSERVER_CONFIG_INVALID_STATIC_MAPPING_MAC_ADDR: Invalid mac address provided for static mapping)

Param Name (string, required): Name: NotNull(error = DHCPSERVER_CONFIG_STATIC_MAPPING_MISSING: Provide all required attributes for static mappings.) Size(max = 256, error = DHCPSERVER_CONFIG_STATIC_MAPPING_NAME_EXCEEDS_LIMIT: Static Mapping name execeeds the maximum limit, min = 0) Pattern(error = DHCPSERVER_CONFIG_STATIC_MAPPING_UNSUPPORTED_NAME: Provide valid static mapping name, regexp = ^[a-zA-Z0-9]+(([a-zA-Z0-9\\-_])|(\\.?[a-zA-Z0-9\\-]))*\\.?$)
*/
type Config struct {
	IpAddress string  `json:"ip_address"`
	Mac       *string `json:"mac"`
	Name      string  `json:"name"`
}
