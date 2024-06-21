package greconfig

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/GREConfig

/*
Config object.

ShortName: suSmnCD
Parent chains:
*

Args:

Param Csum (bool): Csum

Param KeepaliveEnable (bool): Keepalive Enable

Param KeepaliveFailCount (int64): Keepalive Fail Count: Range(max = 10L, error = INTERFACE_CONFIG_SERVICE_LINK_INVALID_GRE_KEEPALIVE_FAIL_COUNT: Keep alive fail count should be in range 1 to 10, min = 1L)

Param KeepaliveInterval (int64): Keepalive Interval: Range(max = 30L, error = INTERFACE_CONFIG_SERVICE_LINK_INVALID_GRE_KEEPALIVE_INTERVAL: Keep alive interval should be in range 3 to 30, min = 3L)
*/
type Config struct {
	Csum               *bool  `json:"csum"`
	KeepaliveEnable    *bool  `json:"keepalive_enable"`
	KeepaliveFailCount *int64 `json:"keepalive_fail_count"`
	KeepaliveInterval  *int64 `json:"keepalive_interval"`
}
