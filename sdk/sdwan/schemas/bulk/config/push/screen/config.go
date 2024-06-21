package screen

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/BulkConfigPushScreen

/*
Config object.

ShortName: ljnPEAA
Parent chains:
*

Args:

Param Etag (int64): Entity tag for the resource

Param Id (string): Id

Param VariableMap ([]any): Variable Map
*/
type Config struct {
	Etag        *int64  `json:"_etag"`
	Id          *string `json:"id"`
	VariableMap []any   `json:"variable_map"`
}
