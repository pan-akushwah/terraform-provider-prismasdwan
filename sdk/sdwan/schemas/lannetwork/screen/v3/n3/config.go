package n3

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/LANNetworkScreenV3N3

import (
	eXzfzFj "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/lan/network/ipv4/config"
	xXKbjbR "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/lan/network/ipv6/config"
)

/*
Config object.

ShortName: yjUyRcw
Parent chains:
*

Args:

Param Description (string): Description: Size(max = 1024, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0)

Param Etag (int64): Entity tag for the resource

Param Id (string, read-only): Id

Param Ipv4Config (eXzfzFj.Config): the Ipv4Config param.

Param Ipv6Config (xXKbjbR.Config): the Ipv6Config param.

Param Name (string, required): Name: Required(error = NAME_REQD: Please provide resource name.) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0)

Param NetworkContextId (string): Network Context Id: Digits(fraction = 0, integer = 30, error = INVALID_NETWORK_CONTEXT_ID: Specified network context is invalid.)

Param Scope (string, required): Scope: ValidateEnum(enumClass = classOf[NetworkScope], message = Invalid enum string., nullAllowed = false)  String must be one of these: `"GLOBAL"`, `"LOCAL"`.

Param Tags ([]string): Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 1024, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\s]+, required = false)

Param VrfContextId (string): Vrf Context Id
*/
type Config struct {
	Description      *string         `json:"description"`
	Etag             *int64          `json:"_etag"`
	Id               *string         `json:"id"`
	Ipv4Config       *eXzfzFj.Config `json:"ipv4_config"`
	Ipv6Config       *xXKbjbR.Config `json:"ipv6_config"`
	Name             string          `json:"name"`
	NetworkContextId *string         `json:"network_context_id"`
	Scope            string          `json:"scope"`
	Tags             []string        `json:"tags"`
	VrfContextId     *string         `json:"vrf_context_id"`
}
