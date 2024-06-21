package configuration

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/VPNLinkConfiguration

/*
Config object.

ShortName: rIUJWmK
Parent chains:
*

Args:

Param KeepAliveFailureCount (int64, required): Keep Alive Failure Count: NotNull(error = VPNLINK_CONFIG_INVALID_KEEP_ALIVE_FAILURE_COUNT: VPN Link keep alive failure count must be between 3 and 30.) Range(max = 30L, error = VPNLINK_CONFIG_INVALID_KEEP_ALIVE_FAILURE_COUNT: VPN Link keep alive failure count must be between 3 and 30., min = 3L)

Param KeepAliveInterval (int64, required): Keep Alive Interval: NotNull(error = VPNLINK_CONFIG_INVALID_KEEP_ALIVE_INTERVAL: VPN Link keep alive interval must be between 100ms-1740,000ms.) Range(max = 1740000L, error = VPNLINK_CONFIG_INVALID_KEEP_ALIVE_INTERVAL: VPN Link keep alive interval must be between 100ms-1740,000ms., min = 100L)
*/
type Config struct {
	KeepAliveFailureCount int64 `json:"keep_alive_failure_count"`
	KeepAliveInterval     int64 `json:"keep_alive_interval"`
}
