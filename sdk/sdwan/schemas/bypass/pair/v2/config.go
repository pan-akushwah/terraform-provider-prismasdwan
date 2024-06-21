package v2

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/BypassPairV2

/*
Config object.

ShortName: zGfKFAQ
Parent chains:
*

Args:

Param Lan (string): Lan

Param LanStatePropagation (bool): Lan State Propagation

Param UseRelay (bool): Use Relay

Param Wan (string): Wan
*/
type Config struct {
	Lan                 *string `json:"lan"`
	LanStatePropagation *bool   `json:"lan_state_propagation"`
	UseRelay            *bool   `json:"use_relay"`
	Wan                 *string `json:"wan"`
}
