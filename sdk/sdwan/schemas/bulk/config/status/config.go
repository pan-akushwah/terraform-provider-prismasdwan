package status

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/BulkConfigStatus

/*
Config object.

ShortName: tephihM
Parent chains:
*

Args:

Param Etag (int64): Entity tag for the resource

Param Id (string): Id

Param Status (string): Status

Param StatusDescription (string): Status Description
*/
type Config struct {
	Etag              *int64  `json:"_etag"`
	Id                *string `json:"id"`
	Status            *string `json:"status"`
	StatusDescription *string `json:"status_description"`
}
