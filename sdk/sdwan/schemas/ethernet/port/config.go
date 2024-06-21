package port

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/EthernetPort

import (
	ujXZojh "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/ethernet"
)

/*
Config object.

ShortName: ehJLagQ
Parent chains:
*

Args:

Param FullDuplex (bool): Full Duplex

Param PortId (ujXZojh.Config): the PortId param.

Param PortName (string): Port Name

Param Speed (int64): Speed
*/
type Config struct {
	FullDuplex *bool           `json:"full_duplex"`
	PortId     *ujXZojh.Config `json:"port_id"`
	PortName   *string         `json:"port_name"`
	Speed      *int64          `json:"speed"`
}
