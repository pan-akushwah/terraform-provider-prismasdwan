package config

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/AuthenticationInterfaceConfig

/*
Config object.

ShortName: mIAatvm
Parent chains:
*

Args:

Param FallbackRetryCount (int64): Fallback Retry Count

Param Mode (string): Mode String must be one of these: `"none"`, `"dot1x"`, `"macauth"`, `"dot1x-to-macauth-fallback"`.

Param ReauthenticationTimeout (int64): Reauthentication Timeout
*/
type Config struct {
	FallbackRetryCount      *int64  `json:"fallback_retry_count"`
	Mode                    *string `json:"mode"`
	ReauthenticationTimeout *int64  `json:"reauthentication_timeout"`
}
