package context

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/SiteContext

/*
Config object.

ShortName: aVdThpZ
Parent chains:
*

Args:

Param NetworkId (string): Network Id

Param NetworkType (string, required): Network Type: ValidateEnum(enumClass = classOf[ContextType], error = SECURITYZONE_INVALID_CONTEXTTYPE: Context type not supported., nullAllowed = false)  String must be one of these: `"wan_network"`, `"lan_network"`, `"wan_overlay"`.
*/
type Config struct {
	NetworkId   *string `json:"network_id"`
	NetworkType string  `json:"network_type"`
}
