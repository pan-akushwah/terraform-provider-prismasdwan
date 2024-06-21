package v2

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/TrackV2

import (
	uvXdTvM "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/track/intf"
	kBpyQPJ "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/track/waninterface"
)

/*
Config object.

ShortName: gvOEngs
Parent chains:
*

Args:

Param Interfaces ([]uvXdTvM.Config): Interfaces: Valid

Param Waninterfaces ([]kBpyQPJ.Config): Waninterfaces: Valid
*/
type Config struct {
	Interfaces    []uvXdTvM.Config `json:"interfaces"`
	Waninterfaces []kBpyQPJ.Config `json:"waninterfaces"`
}
