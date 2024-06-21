package config

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/CellularInterfaceConfig

import (
	aeWshcf "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/apnconfig"
)

/*
Config object.

ShortName: eumQbRC
Parent chains:
*

Args:

Param ApnConfig (aeWshcf.Config): the ApnConfig param.

Param ApnprofileId (string): Apnprofile Id

Param AutoApn (bool): Auto Apn

Param ParentModuleId (string): Parent Module Id

Param ParentSimSlotNumber (int64): Parent Sim Slot Number
*/
type Config struct {
	ApnConfig           *aeWshcf.Config `json:"apn_config"`
	ApnprofileId        *string         `json:"apnprofile_id"`
	AutoApn             *bool           `json:"auto_apn"`
	ParentModuleId      *string         `json:"parent_module_id"`
	ParentSimSlotNumber *int64          `json:"parent_sim_slot_number"`
}
