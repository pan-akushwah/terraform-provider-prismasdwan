package n3

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/StaticRouteV2N3

import (
	tyOPiTo "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/next/hop"
)

/*
Config object.

ShortName: efuRypb
Parent chains:
*

Args:

Param AddressFamily (string, required): Address Family: ValidateEnum(enumClass = classOf[IPAddressFamily], error = STATICROUTE_CONFIG_ADDRESS_FAMILY_INVALID: Static Route address family is invalid., nullAllowed = false)

Param Description (string): Description: Size(max = 256, error = DESCRIPTION_SIZE_EXCEEDED: Description size exceeded., min = 0) Valid

Param DestinationPrefix (string, required): Destination Prefix: Required(DESTINATION_PREFIX_REQD)

Param Etag (int64): Entity tag for the resource

Param Id (string, read-only): Id

Param Name (string): Name: Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0)

Param NetworkContextId (string): Network Context Id

Param NexthopReachabilityProbe (bool): Nexthop Reachability Probe

Param Nexthops ([]tyOPiTo.Config, required): Nexthops: Required(message = required) Size(max = 8, NEXTHOPLIST_SIZE_EXCEEDED, min = 0) Valid

Param Scope (string, required): Scope: ValidateEnum(enumClass = classOf[NetworkScope], message = Invalid enum string., nullAllowed = false)

Param Tags ([]string): Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 128, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\s]+, required = false)

Param VrfContextId (string): Vrf Context Id
*/
type Config struct {
	AddressFamily            string           `json:"address_family"`
	Description              *string          `json:"description"`
	DestinationPrefix        string           `json:"destination_prefix"`
	Etag                     *int64           `json:"_etag"`
	Id                       *string          `json:"id"`
	Name                     *string          `json:"name"`
	NetworkContextId         *string          `json:"network_context_id"`
	NexthopReachabilityProbe *bool            `json:"nexthop_reachability_probe"`
	Nexthops                 []tyOPiTo.Config `json:"nexthops"`
	Scope                    string           `json:"scope"`
	Tags                     []string         `json:"tags"`
	VrfContextId             *string          `json:"vrf_context_id"`
}
