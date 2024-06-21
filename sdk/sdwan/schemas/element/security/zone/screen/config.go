package screen

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/ElementSecurityZoneScreen

/*
Config object.

ShortName: sPPuDTU
Parent chains:
*

Args:

Param Etag (int64): Entity tag for the resource

Param Id (string, read-only): Id

Param InterfaceIds ([]string): Interface Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_INTERFACE_IDS: Specified interface ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false)

Param LannetworkIds ([]string): Lannetwork Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_LANNETWORK_IDS: Specified lan network ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false)

Param WaninterfaceIds ([]string): Waninterface Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_WANINTERFACE_IDS: Specified site wan interface ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false)

Param WanoverlayIds ([]string): Wanoverlay Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_WANOVERLAY_IDS: Specified wanoverlay ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false)

Param ZoneId (string, required): Zone Id: Required(error = ELEMENT_SECURITYZONE_ZONEID_REQUIRED: Security zone id is required for element level association.) Digits(fraction = 0, integer = 30, ELEMENT_SECURITYZONE_INVALID_ZONEID)
*/
type Config struct {
	Etag            *int64   `json:"_etag"`
	Id              *string  `json:"id"`
	InterfaceIds    []string `json:"interface_ids"`
	LannetworkIds   []string `json:"lannetwork_ids"`
	WaninterfaceIds []string `json:"waninterface_ids"`
	WanoverlayIds   []string `json:"wanoverlay_ids"`
	ZoneId          string   `json:"zone_id"`
}
