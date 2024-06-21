package ntpserver

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/NTPServer

/*
Config object.

ShortName: wwbhsxr
Parent chains:
*

Args:

Param Host (string, required): Host: ValidateHostName(allowNull = false, error = NTP_CONFIG_INVALID_HOST: Host can be only domain name or IP address.)

Param MaxPoll (int64, required): Max Poll: Required(message = required) ValidateDecimal(allowZero = false, increment = 0, max = 0, error = NTP_CONFIG_INVALID_MAXPOLL_VALUE: The range for maximum poll values is between 4-17., min = 0)

Param MinPoll (int64, required): Min Poll: Required(message = required) ValidateDecimal(allowZero = false, increment = 0, max = 0, error = NTP_CONFIG_INVALID_MINPOLL_VALUE: The range for minimum poll values is between 4-17., min = 0)

Param Version (int64, required): Version: Required(message = required) ValidateDecimal(allowZero = false, increment = 0, max = 0, error = NTP_CONFIG_INVALID_VERSION: Allowed versions are 2,3 & 4., min = 0)
*/
type Config struct {
	Host    string `json:"host"`
	MaxPoll int64  `json:"max_poll"`
	MinPoll int64  `json:"min_poll"`
	Version int64  `json:"version"`
}
