package location

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/Location

/*
Config object.

ShortName: hUAfQlh
Parent chains:
*

Args:

Param Description (string): Description

Param Latitude (float64): Latitude: Range(max = 90L, INVALID_LATITUDE_VALUE, min = -90L)

Param Longitude (float64): Longitude: Range(max = 180L, INVALID_LONGITUDE_VALUE, min = -180L)
*/
type Config struct {
	Description *string  `json:"description"`
	Latitude    *float64 `json:"latitude"`
	Longitude   *float64 `json:"longitude"`
}
