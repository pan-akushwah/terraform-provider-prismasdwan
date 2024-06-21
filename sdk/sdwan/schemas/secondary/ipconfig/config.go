package ipconfig

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/SecondaryIPConfig

/*
Config object.

ShortName: jmyEuEW
Parent chains:
*

Args:

Param Ipv4Address (string): Ipv4 Address

Param Scope (string): Scope
*/
type Config struct {
	Ipv4Address *string `json:"ipv4_address"`
	Scope       *string `json:"scope"`
}
