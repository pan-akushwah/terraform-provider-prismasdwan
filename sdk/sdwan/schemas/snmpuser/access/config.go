package access

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/SNMPUserAccess

/*
Config object.

ShortName: qhaCvMo
Parent chains:
*

Args:

Param AuthPhrase (string): Auth Phrase: Pattern(error = SNMPCONFIG_UNSUPPORTED_AUTH_PHRASE: White spaces not allowed in auth phrase, regexp = ^\\S+$) Size(max = 256, error = SNMPCONFIG_INVALID_AUTH_PHRASE_LEN: Auth phrase length should be between 8 and 256, min = 8)

Param AuthType (string, required): Auth Type: ValidateEnum(enumClass = classOf[SNMPAuthType], error = SNMPCONFIG_INVALID_AUTH_TYPE: Unsupported snmp auth type specified, nullAllowed = false)  String must be one of these: `"NONE"`, `"MD5"`, `"SHA"`.

Param EncPhrase (string): Enc Phrase: Pattern(error = SNMPCONFIG_UNSUPPORTED_ENC_PHRASE: White spaces not allowed in enc phrase, regexp = ^\\S+$) Size(max = 256, error = SNMPCONFIG_INVALID_ENC_PHRASE_LEN: Enc phrase length should be between 8 and 256, min = 8)

Param EncType (string, required): Enc Type: ValidateEnum(enumClass = classOf[SNMPEncType], error = SNMPCONFIG_INVALID_ENC_TYPE: Unsupported snmp enc type specified, nullAllowed = false)  String must be one of these: `"NONE"`, `"AES"`, `"DES"`.

Param EngineId (string): Engine Id: Pattern(error = SNMPCONFIG_UNSUPPORTED_ENGINE_ID: hexadecimal value should be in pairs (multiple of two) with minimum length 10 and maximum length 256 for engine id., regexp = ^((?:0[xX])?(?=.{10,256}$)[0-9a-fA-F]{2}(?:[0-9a-fA-F]{2})*)$)

Param SecurityLevel (string, required): Security Level: ValidateEnum(enumClass = classOf[SNMPSecurityLevel], error = SNMPCONFIG_INVALID_SECURITY_LEVEL: Unsupported snmp security level specified, nullAllowed = false)  String must be one of these: `"NOAUTH"`, `"AUTH"`, `"PRIVATE"`.

Param UserName (string, required): User Name: NotNull(error = SNMPCONFIG_USER_NAME_MISSING: User name cannot be null) Pattern(error = SNMPCONFIG_UNSUPPORTED_USER_NAME: White spaces not allowed in user name, regexp = ^\\S+$) Size(max = 256, error = SNMPCONFIG_INVALID_USER_NAME_LEN: User name length should be between 4 and 256, min = 4)
*/
type Config struct {
	AuthPhrase    *string `json:"auth_phrase"`
	AuthType      string  `json:"auth_type"`
	EncPhrase     *string `json:"enc_phrase"`
	EncType       string  `json:"enc_type"`
	EngineId      *string `json:"engine_id"`
	SecurityLevel string  `json:"security_level"`
	UserName      string  `json:"user_name"`
}
