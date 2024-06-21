package ethernet

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/Ethernet

/*
Config object.

ShortName: ujXZojh
Parent chains:
*

Args:

Param Connector (string): Connector Type

Param Device (string): Device Name

Param Disabled (bool): Disabled

Param DisabledReason (string): Disabled Reason: Size(max = 5000, DISABLED_REASON_INVALID_0001, min = 0)

Param ElementId (string): Element Id

Param Id (string): the Id param.

Param Inactive (bool): Inactive

Param InactiveReason (string): Inactive Reason: Size(max = 5000, INACTIVE_REASON_INVALID_0001, min = 0)

Param MaxMtu (int64): Max Mtu

Param MaxSpeed (int64): Max Speed

Param Name (string): Name

Param OriginalMacAddress (string): Orig Mac Addr

Param Region (string): Region

Param SiteId (string, required): Site Id: Digits(fraction = 0, integer = 50, SITEID_INVALID) NotNull
*/
type Config struct {
	Connector          *string `json:"connector"`
	Device             *string `json:"device"`
	Disabled           *bool   `json:"disabled"`
	DisabledReason     *string `json:"disabled_reason"`
	ElementId          *string `json:"element_id"`
	Id                 *string `json:"id"`
	Inactive           *bool   `json:"inactive"`
	InactiveReason     *string `json:"inactive_reason"`
	MaxMtu             *int64  `json:"max_mtu"`
	MaxSpeed           *int64  `json:"max_speed"`
	Name               *string `json:"name"`
	OriginalMacAddress *string `json:"original_mac_address"`
	Region             *string `json:"region"`
	SiteId             string  `json:"site_id"`
}
