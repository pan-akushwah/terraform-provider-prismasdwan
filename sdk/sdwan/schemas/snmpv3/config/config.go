package config

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/SNMPV3Config

import (
	qhaCvMo "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/snmpuser/access"
)

/*
Config object.

ShortName: eTfarzd
Parent chains:
*

Args:

Param UserAccess (qhaCvMo.Config): the UserAccess param.
*/
type Config struct {
	UserAccess *qhaCvMo.Config `json:"user_access"`
}
