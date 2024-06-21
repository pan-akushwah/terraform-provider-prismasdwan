package config

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/PppoEInterfaceConfig

/*
Config object.

ShortName: yxxGXUe
Parent chains:
*

Args:

Param HostUniq (string): Host Uniq

Param IpAddressType (string): Ip Address Type

Param Password (string): Password

Param ReconnectionDelay (int64): Reconnection Delay

Param ServiceName (string): Service Name

Param Username (string): Username
*/
type Config struct {
	HostUniq          *string `json:"host_uniq"`
	IpAddressType     *string `json:"ip_address_type"`
	Password          *string `json:"password"`
	ReconnectionDelay *int64  `json:"reconnection_delay"`
	ServiceName       *string `json:"service_name"`
	Username          *string `json:"username"`
}
