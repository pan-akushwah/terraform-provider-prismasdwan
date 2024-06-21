package software

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/Software

/*
Config object.

ShortName: ndabCzl
Parent chains:
*

Args:

Param Location (string): Location

Param Version (string): Version
*/
type Config struct {
	Location *string `json:"location"`
	Version  *string `json:"version"`
}
