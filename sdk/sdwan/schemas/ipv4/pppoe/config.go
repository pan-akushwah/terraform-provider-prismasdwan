package pppoe

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/Ipv4Pppoe

/*
Config object.

ShortName: cvAyZuw
Parent chains:
*

Args:

Param ChapPasswd (string): Chap Passwd

Param ChapUser (string): Chap User

Param SetRoute (bool): Set Route
*/
type Config struct {
	ChapPasswd *string `json:"chap_passwd"`
	ChapUser   *string `json:"chap_user"`
	SetRoute   *bool   `json:"set_route"`
}
