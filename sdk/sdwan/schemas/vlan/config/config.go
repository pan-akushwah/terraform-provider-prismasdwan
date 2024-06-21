package config

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/VlanConfig

/*
Config object.

ShortName: aCdiNxV
Parent chains:
*

Args:

Param MstpInstance (int64): Mstp Instance

Param VlanId (int64): Vlan Id

Param VoiceEnabled (bool): Voice Enabled
*/
type Config struct {
	MstpInstance *int64 `json:"mstp_instance"`
	VlanId       *int64 `json:"vlan_id"`
	VoiceEnabled *bool  `json:"voice_enabled"`
}
