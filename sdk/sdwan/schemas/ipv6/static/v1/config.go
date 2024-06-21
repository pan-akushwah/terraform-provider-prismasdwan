package v1

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/Ipv6StaticV1

/*
Config object.

ShortName: lIDFRUy
Parent chains:
*

Args:

Param Address (string): Address

Param EnablePrefixDistribution (bool): Enable Prefix Distribution
*/
type Config struct {
	Address                  *string `json:"address"`
	EnablePrefixDistribution *bool   `json:"enable_prefix_distribution"`
}
