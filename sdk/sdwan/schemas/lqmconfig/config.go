package lqmconfig

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/LQMConfig

/*
Config object.

ShortName: nSFnnqb
Parent chains:
*

Args:

Param HubSiteIds ([]string): Hub Site Ids: Size(max = 16, error = WANINTERFACE_LQM_CONFIG_INVALID_HUB_SITE_IDS_SIZE: Maximum 16 hub sites can be configured, min = 0) ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = WANINTERFACE_LQM_CONFIG_DUPLICATE_HUB_SITE_IDS: Duplicate hub site ids are not allowed., noTrim = false, regex = , required = false)

Param InterPacketGap (int64): Inter Packet Gap: Range(max = 300L, error = WANINTERFACE_LQM_CONFIG_INVALID_INTER_PACKET_GAP: inter packet gap should be in the range of 50-300 milliseconds., min = 50L)

Param Statistic (string): Statistic: ValidateEnum(enumClass = classOf[LQMStatistic], error = WANINTERFACE_LQM_CONFIG_INVALID_STATISTIC: Invalid statistic value. Valid values are min, max and avg., nullAllowed = true)  String must be one of these: `"min"`, `"max"`, `"avg"`.
*/
type Config struct {
	HubSiteIds     []string `json:"hub_site_ids"`
	InterPacketGap *int64   `json:"inter_packet_gap"`
	Statistic      *string  `json:"statistic"`
}
