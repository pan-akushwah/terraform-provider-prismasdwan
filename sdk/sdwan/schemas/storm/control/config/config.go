package config

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/StormControlConfig

/*
Config object.

ShortName: qhDZEMT
Parent chains:
*

Args:

Param BroadcastThreshold (int64): Broadcast Threshold: ValidateDecimal(allowZero = true, increment = 0, max = 0, error = INTERFACE_CONFIG_INVALID_STORM_CONTROL_BROADCAST_THRESHOLD: Invalid interface configuration. Switch port interface storm control broadcast threshold value is invalid. Valid value is 0, or range must be [64-1000000] kbps, [64kbps to < 1Mbps in increments of 64kbps], [1Mbps to 100Mbps in increments of 1Mbps], [100Mbps to 1000Mbps in increments of 10Mbps], min = 0)

Param MulticastThreshold (int64): Multicast Threshold: ValidateDecimal(allowZero = true, increment = 0, max = 0, error = INTERFACE_CONFIG_INVALID_STORM_CONTROL_MULTICAST_THRESHOLD: Invalid interface configuration. Switch port interface storm control multicast threshold value is invalid. Valid value is 0, or range must be [64-1000000] kbps, [64kbps to < 1Mbps in increments of 64kbps], [1Mbps to 100Mbps in increments of 1Mbps], [100Mbps to 1000Mbps in increments of 10Mbps], min = 0)

Param UnicastThreshold (int64): Unicast Threshold: ValidateDecimal(allowZero = true, increment = 0, max = 0, error = INTERFACE_CONFIG_INVALID_STORM_CONTROL_UNICAST_THRESHOLD: Invalid interface configuration. Switch port interface storm control unicast threshold value is invalid. Valid value is 0, or range must be [64-1000000] kbps, [64kbps to < 1Mbps in increments of 64kbps], [1Mbps to 100Mbps in increments of 1Mbps], [100Mbps to 1000Mbps in increments of 10Mbps], min = 0)
*/
type Config struct {
	BroadcastThreshold *int64 `json:"broadcast_threshold"`
	MulticastThreshold *int64 `json:"multicast_threshold"`
	UnicastThreshold   *int64 `json:"unicast_threshold"`
}
