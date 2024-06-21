package dhcprelay

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/DHCPRelay

import (
	tOChZgD "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/dhcprelay/option82"
)

/*
Config object.

ShortName: mCcgFKg
Parent chains:
*

Args:

Param Enabled (bool): Enabled

Param Option82 (tOChZgD.Config): the Option82 param.

Param ServerIps ([]string): Server Ips: ListIPAddress(bcast = DENY, listMaxSize = 0, error = INTERFACE_CONFIG_INVALID_DHCP_RELAY_LIST: DHCP Servers IP specified in the list are invalid, required = true, type = IP) Size(max = 16, error = INTERFACE_CONFIG_DHCP_RELAY_LIST_EXCEEDS_LIMIT: DHCP Servers specified in the list exceeds maximum limit, min = 0)

Param SourceInterface (string): Source Interface
*/
type Config struct {
	Enabled         *bool           `json:"enabled"`
	Option82        *tOChZgD.Config `json:"option_82"`
	ServerIps       []string        `json:"server_ips"`
	SourceInterface *string         `json:"source_interface"`
}
