package option82

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/DHCPRelayOption82

/*
Config object.

ShortName: tOChZgD
Parent chains:
*

Args:

Param CircuitId (string): Circuit Id: Size(max = 255, error = DHCPRELAY_CIRCUIT_ID_EXCEEDS_LIMIT: Option 82 Circuid ID exceeds maximum length, min = 0)

Param Enabled (bool): Enabled

Param ReforwardingPolicy (string, required): Reforwarding Policy: ValidateEnum(enumClass = classOf[DHCPRelayReforwardingPolicy], error = INVALID_DHCP_RELAY_REFWDING_POLICY: Option 82 invalid reforwarding policy, nullAllowed = false)  String must be one of these: `"REPLACE"`, `"KEEP"`, `"APPEND"`, `"DROP"`.

Param RemoteId (string): Remote Id: Size(max = 255, error = DHCPRELAY_REMOTE_ID_EXCEEDS_LIMIT: Option 82 Remote ID exceeds maximum length, min = 0)
*/
type Config struct {
	CircuitId          *string `json:"circuit_id"`
	Enabled            *bool   `json:"enabled"`
	ReforwardingPolicy string  `json:"reforwarding_policy"`
	RemoteId           *string `json:"remote_id"`
}
