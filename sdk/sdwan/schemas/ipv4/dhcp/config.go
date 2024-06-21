package dhcp

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/Ipv4Dhcp

/*
Config object.

ShortName: rKcwmLF
Parent chains:
*

Args:

Param ClientId (string): Client Id

Param Hostname (string): Hostname
*/
type Config struct {
	ClientId *string `json:"client_id"`
	Hostname *string `json:"hostname"`
}
