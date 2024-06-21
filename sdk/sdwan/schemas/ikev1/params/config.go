package params

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/IKEV1Params

/*
Config object.

ShortName: mKyPIKy
Parent chains:
*

Args:

Param XauthId (string): Xauth Id

Param XauthSecret (string): Xauth Secret: Length(max = 128, error = IPSECCONFIG_INVALID_XAUTH_SECRET_LEN: Invalid extended authentication secret length.Should be between 4-128., min = 4)

Param XauthSecretEncrypted (string): Xauth Secret Encrypted: JsonIgnore(value = true)

Param XauthSecretHash (string): Xauth Secret Hash: JsonIgnore(value = true)

Param XauthType (string, required): Xauth Type: ValidateEnum(enumClass = classOf[IKEXAuthType], error = IPSECCONFIG_INVALID_XAUTH_TYPE: Invalid extended authentication type specified.Valid type are secret or none., nullAllowed = false)  String must be one of these: `"NONE"`, `"SECRET"`.
*/
type Config struct {
	XauthId              *string `json:"xauth_id"`
	XauthSecret          *string `json:"xauth_secret"`
	XauthSecretEncrypted *string `json:"xauth_secret_encrypted"`
	XauthSecretHash      *string `json:"xauth_secret_hash"`
	XauthType            string  `json:"xauth_type"`
}
