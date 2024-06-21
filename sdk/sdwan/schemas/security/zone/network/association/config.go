package association

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/SecurityZoneNetworkAssociation

import (
	aVdThpZ "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/site/context"
)

/*
Config object.

ShortName: eItpily
Parent chains:
*

Args:

Param Etag (int64): Entity tag for the resource

Param Id (string, read-only): Id

Param Networks ([]aVdThpZ.Config, required): Networks: Required(error = SECURITYZONE_INVALID_CONTEXT: Context id or site id not found.) Valid

Param ZoneId (string, required): Zone Id: Required(error = SECURITYZONE_INVALID_ZONE: Zone cannot be changed in the PUT.)
*/
type Config struct {
	Etag     *int64           `json:"_etag"`
	Id       *string          `json:"id"`
	Networks []aVdThpZ.Config `json:"networks"`
	ZoneId   string           `json:"zone_id"`
}
