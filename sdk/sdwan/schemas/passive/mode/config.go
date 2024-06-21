package mode

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/PassiveMode

/*
Config object.

ShortName: wiUYuNU
Parent chains:
*

Args:

Param Enable (bool): Enable

Param PeerIpDynamic (bool): Peer Ip Dynamic
*/
type Config struct {
	Enable        *bool `json:"enable"`
	PeerIpDynamic *bool `json:"peer_ip_dynamic"`
}
