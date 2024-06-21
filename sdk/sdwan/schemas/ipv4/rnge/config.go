package rnge

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/IPv4Range

/*
Config object.

ShortName: xYviIkG
Parent chains:
*

Args:

Param End (string, required): End: NotNull(error = END_IP_MISSING: End ip is not specified in range.) IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = END_IP_INVALID_IN_RANGE: Invalid end ip specified in range., type = IP)

Param Start (string, required): Start: NotNull(error = START_IP_MISSING: Start ip is not specified in range.) IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = START_IP_INVALID_IN_RANGE: Invalid start ip specified in range., type = IP)
*/
type Config struct {
	End   string `json:"end"`
	Start string `json:"start"`
}
