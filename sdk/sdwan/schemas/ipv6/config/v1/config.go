package v1

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/Ipv6ConfigV1

import (
	mTuoPRe "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/dns"
	juuQHdk "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/ipv6/dhcp"
	lIDFRUy "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/ipv6/static/v1"
	bBEnHsN "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/route"
)

/*
Config object.

ShortName: bMGDwkY
Parent chains:
*

Args:

Param DhcpConfig (juuQHdk.Config): the DhcpConfig param.

Param DnsV6Config (mTuoPRe.Config): the DnsV6Config param.

Param Routes ([]bBEnHsN.Config): Routes

Param StaticConfig (lIDFRUy.Config): the StaticConfig param.

Param Type (string): Type
*/
type Config struct {
	DhcpConfig   *juuQHdk.Config  `json:"dhcp_config"`
	DnsV6Config  *mTuoPRe.Config  `json:"dns_v6_config"`
	Routes       []bBEnHsN.Config `json:"routes"`
	StaticConfig *lIDFRUy.Config  `json:"static_config"`
	Type         *string          `json:"type"`
}
