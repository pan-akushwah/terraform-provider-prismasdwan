package error

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/Error

import (
	vnMMXJg "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/error/response"
)

/*
Config object.

ShortName: impVGiJ
Parent chains:
*

Args:

Param Error ([]vnMMXJg.Config): the Error param.

Param Etag (int64): Entity tag for the resource
*/
type Config struct {
	Error []vnMMXJg.Config `json:"_error"`
	Etag  *int64           `json:"_etag"`
}
