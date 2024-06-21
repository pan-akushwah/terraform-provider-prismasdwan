package info

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/PeerInfo

/*
Config object.

ShortName: pjMVEcr
Parent chains:
*

Args:

Param Hostname (string): Hostname: Size(max = 256, INVALID_PEER_HOSTNAME, min = 0)

Param IpAddresses ([]string): Ip Addresses
*/
type Config struct {
	Hostname    *string  `json:"hostname"`
	IpAddresses []string `json:"ip_addresses"`
}
