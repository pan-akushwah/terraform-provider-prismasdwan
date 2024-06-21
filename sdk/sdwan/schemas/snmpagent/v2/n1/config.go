package n1

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/SNMPAgentV2N1

import (
	nusywCy "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/snmpv2/config"
	eTfarzd "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/snmpv3/config"
)

/*
Config object.

ShortName: leGYxeK
Parent chains:
*

Args:

Param Description (string): Description: Size(max = 256, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0)

Param Etag (int64): Entity tag for the resource

Param Id (string, read-only): Id

Param SystemContact (string): System Contact

Param SystemLocation (string): System Location

Param Tags ([]string): Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 128, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\s]+, required = false)

Param V2Config (nusywCy.Config): the V2Config param.

Param V3Config (eTfarzd.Config): the V3Config param.
*/
type Config struct {
	Description    *string         `json:"description"`
	Etag           *int64          `json:"_etag"`
	Id             *string         `json:"id"`
	SystemContact  *string         `json:"system_contact"`
	SystemLocation *string         `json:"system_location"`
	Tags           []string        `json:"tags"`
	V2Config       *nusywCy.Config `json:"v2_config"`
	V3Config       *eTfarzd.Config `json:"v3_config"`
}
