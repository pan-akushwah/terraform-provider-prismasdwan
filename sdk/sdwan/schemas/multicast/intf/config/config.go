package config

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/MulticastInterfaceConfig

/*
Config object.

ShortName: zLXjrfn
Parent chains:
*

Args:

Param IgmpVersion (string): Igmp Version String must be one of these: `"IGMPV2"`, `"IGMPV3"`.

Param MulticastEnabled (bool): Multicast Enabled
*/
type Config struct {
	IgmpVersion      *string `json:"igmp_version"`
	MulticastEnabled *bool   `json:"multicast_enabled"`
}
