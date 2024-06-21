package config

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/LanNetworkIPv4Config

import (
	mCcgFKg "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/dhcprelay"
	jGvcCTz "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/dhcpserver"
)

/*
Config object.

ShortName: eXzfzFj
Parent chains:
*

Args:

Param DefaultRouters ([]string): Default Routers: ListIPAddress(bcast = DENY, listMaxSize = 0, error = LAN_CONFIG_INVALID_DEFAULT_ROUTERS: Invalid ip for default routers., required = false, type = IPCIDR_32)

Param DhcpRelay (mCcgFKg.Config): the DhcpRelay param.

Param DhcpServer (jGvcCTz.Config): the DhcpServer param.

Param Prefixes ([]string): Prefixes: ListIPAddress(bcast = DENY, listMaxSize = 0, error = LAN_CONFIG_INVALID_PREFIX: Invalid prefix ip., required = false, type = PREFIXCIDR_32)
*/
type Config struct {
	DefaultRouters []string        `json:"default_routers"`
	DhcpRelay      *mCcgFKg.Config `json:"dhcp_relay"`
	DhcpServer     *jGvcCTz.Config `json:"dhcp_server"`
	Prefixes       []string        `json:"prefixes"`
}
