package config

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/SwitchConfig

/*
Config object.

ShortName: abEEBQk
Parent chains:
*

Args:

Param DefaultVlanId (int64): Default Vlan Id: Range(max = 4000L, error = INVALID_VLAN_ID: Invalid VLAN id. VLAN id must be between 1-4000., min = 1L)

Param MstpEnabled (bool): Mstp Enabled

Param StpAgingTimer (int64): Stp Aging Timer: Range(max = 1000000L, error = INVALID_STP_AGING_TIMER: Invalid STP aging timer. Allowed range is 10-1000000., min = 10L)

Param StpForwardDelay (int64): Stp Forward Delay: Range(max = 30L, error = INVALID_STP_FORWARD_DELAY: Invalid STP forward delay. Allowed range is 4-30 and given value should also meet the criteria: (2 * (stp_forward_delay - 1)) >= stp_max_age., min = 4L)

Param StpHelloTime (int64): Stp Hello Time: Range(max = 10L, error = INVALID_STP_HELLO_TIME: Invalid STP hello time. Allowed range is 1-10., min = 1L)

Param StpMaxAge (int64): Stp Max Age: Range(max = 40L, error = INVALID_STP_MAX_AGE: Invalid STP max age. Allowed range is 6-40., min = 6L)

Param StpMode (string, required): Stp Mode: ValidateEnum(enumClass = classOf[STPMode], error = INVALID_STP_MODE: Invalid STP mode. Allowed values are stp, rstp or mstp., nullAllowed = false)  String must be one of these: `"RSTP"`.

Param StpPriority (int64): Stp Priority: Range(max = 61440L, error = INVALID_STP_PRIORITY: Invalid STP priority. Value should be in the multiples of 4096., min = 0L)
*/
type Config struct {
	DefaultVlanId   *int64 `json:"default_vlan_id"`
	MstpEnabled     *bool  `json:"mstp_enabled"`
	StpAgingTimer   *int64 `json:"stp_aging_timer"`
	StpForwardDelay *int64 `json:"stp_forward_delay"`
	StpHelloTime    *int64 `json:"stp_hello_time"`
	StpMaxAge       *int64 `json:"stp_max_age"`
	StpMode         string `json:"stp_mode"`
	StpPriority     *int64 `json:"stp_priority"`
}
