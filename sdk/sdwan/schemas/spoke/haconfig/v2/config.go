package v2

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/SpokeHAConfigV2

import (
	gvOEngs "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/track/v2"
)

/*
Config object.

ShortName: urOXkAM
Parent chains:
*

Args:

Param ClusterId (string, required): Cluster Id: Required(SPOKEHA_CONFIG_CLUSTER_ID_REQD)

Param Enable (bool, required): Enable: Required(SPOKEHA_CONFIG_ENABLE_REQD)

Param Priority (int64, required): Priority: Required(SPOKEHA_CONFIG_PRIORITY_REQD) Range(max = 254L, SPOKEHA_CONFIG_INVALID_PRIORITY, min = 1L)

Param SourceInterface (string, required): Source Interface: Required(SPOKEHA_CONFIG_SOURCE_INTERFACE_ID_REQD)

Param Track (gvOEngs.Config): the Track param.
*/
type Config struct {
	ClusterId       string          `json:"cluster_id"`
	Enable          bool            `json:"enable"`
	Priority        int64           `json:"priority"`
	SourceInterface string          `json:"source_interface"`
	Track           *gvOEngs.Config `json:"track"`
}
