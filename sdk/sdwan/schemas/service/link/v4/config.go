package v4

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/ServiceLinkV4

import (
	suSmnCD "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/greconfig"
	nnsRzDg "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/ipsecconfig/v1"
	wiUYuNU "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/passive/mode"
	pjMVEcr "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/peer/info"
)

/*
Config object.

ShortName: obJkRYB
Parent chains:
*

Args:

Param GreConfig (suSmnCD.Config): the GreConfig param.

Param IpsecConfig (nnsRzDg.Config): the IpsecConfig param.

Param LastParent (string): Last Parent: JsonIgnore(value = true)

Param Parent (string): Parent: JsonIgnore(value = true)

Param PassiveMode (wiUYuNU.Config): the PassiveMode param.

Param Peer (pjMVEcr.Config): the Peer param.

Param ServiceEndpointId (string): Service Endpoint Id

Param Type (string, required): Type: ValidateEnum(enumClass = classOf[ServiceLinkType], INVALID_SERVICE_LINK_TYPE, nullAllowed = false)  String must be one of these: `"IPSEC"`, `"GRE"`, `"GENEVE"`.
*/
type Config struct {
	GreConfig         *suSmnCD.Config `json:"gre_config"`
	IpsecConfig       *nnsRzDg.Config `json:"ipsec_config"`
	LastParent        *string         `json:"last_parent"`
	Parent            *string         `json:"parent"`
	PassiveMode       *wiUYuNU.Config `json:"passive_mode"`
	Peer              *pjMVEcr.Config `json:"peer"`
	ServiceEndpointId *string         `json:"service_endpoint_id"`
	Type              string          `json:"type"`
}
