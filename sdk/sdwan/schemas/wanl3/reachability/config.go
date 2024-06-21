package reachability

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/WANL3Reachability

/*
Config object.

ShortName: qRlmEFd
Parent chains:
*

Args:

Param ProbeConfigIds ([]string): Probe Config Ids

Param UseElementDefault (bool): Use Element Default
*/
type Config struct {
	ProbeConfigIds    []string `json:"probe_config_ids"`
	UseElementDefault *bool    `json:"use_element_default"`
}
