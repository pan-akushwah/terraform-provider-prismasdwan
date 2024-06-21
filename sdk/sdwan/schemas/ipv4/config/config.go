package config

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/Ipv4Config

import (
	mTuoPRe "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/dns"
	rKcwmLF "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/ipv4/dhcp"
	cvAyZuw "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/ipv4/pppoe"
	nfiOrAO "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/ipv4/static"
	bBEnHsN "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/route"
)

/*
Config object.

ShortName: wsoFfyL
Parent chains:
*

Args:

Param DhcpConfig (rKcwmLF.Config): the DhcpConfig param.

Param DnsV4Config (mTuoPRe.Config): the DnsV4Config param.

Param PppoeConfig (cvAyZuw.Config): the PppoeConfig param.

Param Routes ([]bBEnHsN.Config): Routes: Valid

Param StaticConfig (nfiOrAO.Config): the StaticConfig param.

Param Type (string): Type: Size(max = 12, error = INTERFACE_CONFIG_INVALID_IP_TYPE: IP Type is not valid., min = 0)
*/
type Config struct {
	DhcpConfig   *rKcwmLF.Config  `json:"dhcp_config"`
	DnsV4Config  *mTuoPRe.Config  `json:"dns_v4_config"`
	PppoeConfig  *cvAyZuw.Config  `json:"pppoe_config"`
	Routes       []bBEnHsN.Config `json:"routes"`
	StaticConfig *nfiOrAO.Config  `json:"static_config"`
	Type         *string          `json:"type"`
}
