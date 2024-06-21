package ntp

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/ElementNTP

import (
	wwbhsxr "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/ntpserver"
)

/*
Config object.

ShortName: mSjVWwC
Parent chains:
*

Args:

Param Description (string): Description: Size(max = 256, error = NTP_CONFIG_DESCRIPTION_INVALID: NTP description is invalid. The maximum length is 256., min = 0)

Param Etag (int64): Entity tag for the resource

Param Id (string, read-only): Id

Param Name (string, required): Name: NotEmpty(error = NTP_CONFIG_NAME_REQD: Name is mandatory for NTP configuration.) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0)

Param NtpServers ([]wwbhsxr.Config, required): Ntp Servers: NotEmpty(error = NTP_CONFIG_INVALID_SERVER_SIZE: A minimum of 1 and a maximum of 10 NTP servers can be configured.) Size(max = 10, error = NTP_CONFIG_INVALID_SERVER_SIZE: A minimum of 1 and a maximum of 10 NTP servers can be configured., min = 1) Valid

Param SourceInterfaceIds ([]string): Source Interface Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 10, error = NTP_CONFIG_INVALID_INTERFACE_IDS: Source interface ids cannot be empty and should be valid.Interface ids should not be port that is part of logical interface group like bypass pair., noTrim = false, regex = , required = false)

Param Tags ([]string): Tags
*/
type Config struct {
	Description        *string          `json:"description"`
	Etag               *int64           `json:"_etag"`
	Id                 *string          `json:"id"`
	Name               string           `json:"name"`
	NtpServers         []wwbhsxr.Config `json:"ntp_servers"`
	SourceInterfaceIds []string         `json:"source_interface_ids"`
	Tags               []string         `json:"tags"`
}
