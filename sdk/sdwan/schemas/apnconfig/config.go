package apnconfig

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/APNConfig

/*
Config object.

ShortName: aeWshcf
Parent chains:
*

Args:

Param Apn (string): Apn: Size(max = 100, error = CELLULAR_INTERFACE_CONFIG_APN_CONFIG_PROFILE_NAME_INVALID: Invalid cellular interface config. APN name is invalid. APN name allowed max length is 100. Valid characters are alphanumeric, hyphen (-), and period (.). Must begin and end with an alphanumeric character., min = 0)

Param Authentication (string, required): Authentication: ValidateEnum(enumClass = classOf[APNAuthentication], message = INVALID_APN_AUTHENTICATION, nullAllowed = false)  String must be one of these: `"none"`, `"pap"`, `"chap"`, `"pap_or_chap"`.

Param ClearPassword (bool): Clear Password

Param Password (string): Password

Param PasswordEncrypted (string): Password Encrypted: JsonIgnore(value = true)

Param UserName (string): User Name: Size(max = 100, error = CELLULAR_INTERFACE_CONFIG_APN_CONFIG_USERNAME_INVALID: Invalid cellular interface config. APN username is invalid. APN username allowed max length is 100., min = 0)
*/
type Config struct {
	Apn               *string `json:"apn"`
	Authentication    string  `json:"authentication"`
	ClearPassword     *bool   `json:"clear_password"`
	Password          *string `json:"password"`
	PasswordEncrypted *string `json:"password_encrypted"`
	UserName          *string `json:"user_name"`
}
