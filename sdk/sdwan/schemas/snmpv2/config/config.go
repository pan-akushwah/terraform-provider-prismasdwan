package config

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/SNMPV2Config

/*
Config object.

ShortName: nusywCy
Parent chains:
*

Args:

Param Community (string, required): Community: NotNull(SNMPTRAP_CONFIG_COMMUNITY_IS_NULL) Pattern(error = SNMPCONFIG_UNSUPPORTED_COMMUNITY_NAME: White spaces not allowed in community name, regexp = ^\\S+$) Size(max = 32, error = SNMPCONFIG_COMMUNITY_LEN_EXCEEDS_LIMIT: Community length exceeds maximum limit, min = 0)
*/
type Config struct {
	Community string `json:"community"`
}
