package n3

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/DHCPServerScreenV2N3

import (
	mqfebzt "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/custom/dhcpoptions"
	xygFTDt "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/iprange"
	xqHSEzl "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/static/mapping/v2"
)

/*
Config object.

ShortName: dEowMJz
Parent chains:
*

Args:

Param AddressFamily (string, required): Address Family: ValidateEnum(enumClass = classOf[IPAddressFamily], DHCP_CONFIG_ADDRESS_FAMILY_INVALID, nullAllowed = false)

Param BroadcastAddress (string): Broadcast Address

Param CustomOptions ([]mqfebzt.Config): Custom Options: Valid

Param DefaultLeaseTime (int64): Default Lease Time: Min(error = DHCPSERVER_CONFIG_UNSUPPORTED_DEFAULT_LEASE_TIME: Default lease time should be between 300 and 2^32-1 seconds respectively., value = 300L) Max(error = DHCPSERVER_CONFIG_UNSUPPORTED_DEFAULT_LEASE_TIME: Default lease time should be between 300 and 2^32-1 seconds respectively., value = 4294967295L)

Param Description (string): Description: Size(max = 256, error = DHCPSERVER_CONFIG_DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds the maximum limit., min = 0)

Param Disabled (bool): Disabled

Param DnsServers ([]string): Dns Servers: Size(max = 3, error = DHCPSERVER_CONFIG_DNS_ENTRIES_EXCEEDS_LIMIT: Name servers count exceeds the maximum limit, min = 0)

Param DomainName (string): Domain Name: Size(max = 256, error = DHCPSERVER_CONFIG_INVALID_DOMAIN_NAME: Domain name exceeds the maximum limit., min = 0)

Param Etag (int64): Entity tag for the resource

Param Gateway (string): Gateway

Param Id (string, read-only): Id

Param IpRanges ([]xygFTDt.Config, required): Ip Ranges: NotNull(error = DHCPSERVER_CONFIG_IP_RANGE_MISSING: Provide valid IPv4/IPv6 address range for defined subnet.) Size(max = 2147483647, error = DHCPSERVER_CONFIG_IP_RANGE_MISSING: Provide valid IPv4/IPv6 address range for defined subnet., min = 1) Valid

Param MaxLeaseTime (int64): Max Lease Time: Min(error = DHCPSERVER_CONFIG_UNSUPPORTED_MAX_LEASE_TIME: Max lease time should be between 300 and 2^32-1 seconds respectively., value = 300L) Max(error = DHCPSERVER_CONFIG_UNSUPPORTED_MAX_LEASE_TIME: Max lease time should be between 300 and 2^32-1 seconds respectively., value = 4294967295L)

Param NetworkContextId (string): Network Context Id: Digits(fraction = 0, integer = 50, error = INVALID_NETWORK_CTX_ID: Invalid network ctrx id.)

Param StaticMappings ([]xqHSEzl.Config): Static Mappings: Valid

Param Subnet (string, required): Subnet: NotNull(error = DHCPSERVER_CONFIG_INVALID_SUBNET_ADDR: Invalid IPv4 subnet address.)

Param Tags ([]string): Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 128, listMaxSize = 10, error = DHCPSERVER_CONFIG_INVALID_TAGS: Tags config is invalid- maximum 10 tags are supported, tag should not exceed maximum limit of 128 characters, it should not have duplicates., noTrim = false, regex = [^,\\s]+, required = false)

Param VrfContextId (string): Vrf Context Id
*/
type Config struct {
	AddressFamily    string           `json:"address_family"`
	BroadcastAddress *string          `json:"broadcast_address"`
	CustomOptions    []mqfebzt.Config `json:"custom_options"`
	DefaultLeaseTime *int64           `json:"default_lease_time"`
	Description      *string          `json:"description"`
	Disabled         *bool            `json:"disabled"`
	DnsServers       []string         `json:"dns_servers"`
	DomainName       *string          `json:"domain_name"`
	Etag             *int64           `json:"_etag"`
	Gateway          *string          `json:"gateway"`
	Id               *string          `json:"id"`
	IpRanges         []xygFTDt.Config `json:"ip_ranges"`
	MaxLeaseTime     *int64           `json:"max_lease_time"`
	NetworkContextId *string          `json:"network_context_id"`
	StaticMappings   []xqHSEzl.Config `json:"static_mappings"`
	Subnet           string           `json:"subnet"`
	Tags             []string         `json:"tags"`
	VrfContextId     *string          `json:"vrf_context_id"`
}
