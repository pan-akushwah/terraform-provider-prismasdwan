package config

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/LanNetworkIPv6Config

/*
Config object.

ShortName: xXKbjbR
Parent chains:
*

Args:

Param DefaultRouters ([]string): Default Routers: ListIPv6Address(bcast = DENY, listMaxSize = 0, message = LAN_CONFIG_V6_INVALID_DEFAULT_ROUTERS, required = false, type = IPCIDR_128)

Param Prefixes ([]string): Prefixes: ListIPv6Address(bcast = DENY, listMaxSize = 0, message = LAN_CONFIG_INVALID_PREFIX_V6, required = false, type = GATEWAYCIDRV6)
*/
type Config struct {
	DefaultRouters []string `json:"default_routers"`
	Prefixes       []string `json:"prefixes"`
}
