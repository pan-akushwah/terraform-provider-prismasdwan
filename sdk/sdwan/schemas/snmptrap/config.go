package snmptrap

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/SNMPTrap

import (
	nusywCy "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/snmpv2/config"
	eTfarzd "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/snmpv3/config"
)

/*
Config object.

ShortName: uzXNpRw
Parent chains:
*

Args:

Param Description (string): Description: Size(max = 256, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0)

Param Enabled (bool): Enabled

Param Etag (int64): Entity tag for the resource

Param Id (string, read-only): Id

Param ServerIp (string, required): Server Ip: NotNull(error = SNMPTRAP_CONFIG_SERVER_IP_MISSING: SNMP Server ip cannot be null) IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, INVALID_IP_ADDRESS_001, type = IP)

Param SourceInterface (string): Source Interface

Param Tags ([]string): Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 128, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\s]+, required = false)

Param V2Config (nusywCy.Config): the V2Config param.

Param V3Config (eTfarzd.Config): the V3Config param.

Param Version (string, required): Version: ValidateEnum(enumClass = classOf[SNMPVersion], error = SNMPTRAP_CONFIG_INVALID_VERSION: Unsupported snmp version specified, nullAllowed = false)
*/
type Config struct {
	Description     *string         `json:"description"`
	Enabled         *bool           `json:"enabled"`
	Etag            *int64          `json:"_etag"`
	Id              *string         `json:"id"`
	ServerIp        string          `json:"server_ip"`
	SourceInterface *string         `json:"source_interface"`
	Tags            []string        `json:"tags"`
	V2Config        *nusywCy.Config `json:"v2_config"`
	V3Config        *eTfarzd.Config `json:"v3_config"`
	Version         string          `json:"version"`
}
