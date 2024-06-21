package pool

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/NatPool

import (
	xYviIkG "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/ipv4/rnge"
)

/*
Config object.

ShortName: alJfwdK
Parent chains:
*

Args:

Param Ipv4Ranges ([]xYviIkG.Config): Ipv4 Ranges: Size(max = 4, error = INTERFACE_CONFIG_INVALID_NAT_POOL_IP_RANGE: Minimum 1 and maximum 4 nat pool IP ranges can be specified., min = 1) Valid

Param NatPoolId (string): Nat Pool Id: Digits(fraction = 0, integer = 30, INVALID_NAT_POLICYPOOL_ID)
*/
type Config struct {
	Ipv4Ranges []xYviIkG.Config `json:"ipv4_ranges"`
	NatPoolId  *string          `json:"nat_pool_id"`
}
