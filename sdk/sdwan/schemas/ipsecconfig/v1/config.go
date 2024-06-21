package v1

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/IPSECConfigV1

import (
	xdEvbZX "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/ipsecauthentication/v1"
)

/*
Config object.

ShortName: nnsRzDg
Parent chains:
*

Args:

Param Authentication (xdEvbZX.Config): the Authentication param.

Param IpsecProfileId (string, required): Ipsec Profile Id: Required(IPSEC_PROFILE_ID_MISSING)
*/
type Config struct {
	Authentication *xdEvbZX.Config `json:"authentication"`
	IpsecProfileId string          `json:"ipsec_profile_id"`
}
