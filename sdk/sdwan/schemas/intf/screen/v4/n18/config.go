package n18

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/InterfaceScreenV4N18

import (
	mIAatvm "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/authentication/intf/config"
	zGfKFAQ "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/bypass/pair/v2"
	eumQbRC "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/cellular/intf/config"
	mCcgFKg "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/dhcprelay"
	ehJLagQ "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/ethernet/port"
	wsoFfyL "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/ipv4/config"
	bMGDwkY "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/ipv6/config/v1"
	irQawLY "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/lan/network/vlan/mapping"
	zLXjrfn "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/multicast/intf/config"
	alJfwdK "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/nat/pool"
	yxxGXUe "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/pppo/einterface/config"
	jmyEuEW "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/secondary/ipconfig"
	obJkRYB "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/service/link/v4"
	pWDbfYi "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/static/arpconfig"
	jEYlBbY "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/sub/intf"
	kslrKbF "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/switch/port/config"
	aCdiNxV "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/vlan/config"
)

/*
Config object.

ShortName: quvWIWu
Parent chains:
*

Args:

Param AdminUp (bool): Admin Up

Param AttachedLanNetworks ([]irQawLY.Config): Attached Lan Networks: Valid

Param AuthenticationConfig (mIAatvm.Config): the AuthenticationConfig param.

Param BoundInterfaces ([]string): Bound Interfaces

Param BypassPair (zGfKFAQ.Config): the BypassPair param.

Param CellularConfig (eumQbRC.Config): the CellularConfig param.

Param Description (string): Description: Size(max = 256, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0)

Param DevicemgmtPolicysetstackId (string): Devicemgmt Policysetstack Id: Digits(fraction = 0, integer = 30, INVALID_DEVICEMGMT_POLICYSETSTACK_ID)

Param DhcpRelay (mCcgFKg.Config): the DhcpRelay param.

Param DirectedBroadcast (bool): Directed Broadcast

Param Etag (int64): Entity tag for the resource

Param EthernetPort (ehJLagQ.Config): the EthernetPort param.

Param Id (string, read-only): Id

Param InterfaceProfileId (string): Interface Profile Id

Param IpfixcollectorcontextId (string): Ipfixcollectorcontext Id

Param IpfixfiltercontextId (string): Ipfixfiltercontext Id

Param Ipv4Config (wsoFfyL.Config): the Ipv4Config param.

Param Ipv6Config (bMGDwkY.Config): the Ipv6Config param.

Param LldpEnabled (bool): Lldp Enabled

Param MacAddress (string): Mac Address: Pattern(error = INTERFACE_CONFIG_INVALID_MAC: Invalid mac address syntax., regexp = ([0-9a-f]{2}[:]){5}([0-9a-f]{2}))

Param Mtu (int64): Mtu: Range(max = 9216L, error = INTERFACE_CONFIG_INVALID_MTU: MTU is not in the valid range., min = 0L)

Param MulticastConfig (zLXjrfn.Config): the MulticastConfig param.

Param Name (string): Name: Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0)

Param NatAddress (string): Nat Address: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = INVALID_NAT_IP: NAT IP address is invalid., type = IP)

Param NatAddressV6 (string): Nat Address V6: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = INVALID_IPV6_NAT: IPv6 NAT address is invalid., type = IPV6)

Param NatPools ([]alJfwdK.Config): Nat Pools: Valid

Param NatPort (int64): Nat Port: Range(max = 65535L, error = INTERFACE_CONFIG_INVALID_PORT: LAN,WAN,Internet bypass ports cannot be part of logical interface groups., min = 0L)

Param NatPortV6 (int64): Nat Port V6: Range(max = 65535L, error = INTERFACE_CONFIG_INVALID_PORT: LAN,WAN,Internet bypass ports cannot be part of logical interface groups., min = 0L)

Param NatZoneId (string): Nat Zone Id: Digits(fraction = 0, integer = 30, INVALID_NAT_POLICY_ZONE)

Param NetworkContextId (string): Network Context Id

Param Parent (string): Parent

Param PeerBypasspairWanPortType (string, required): Peer Bypasspair Wan Port Type: ValidateEnum(enumClass = classOf[PortExtensionType], message = Invalid enum string., nullAllowed = false)  String must be one of these: `"none"`, `"cellular"`.

Param PoeEnabled (bool): Poe Enabled

Param PowerUsageThreshold (int64): Power Usage Threshold: ValidateDecimal(allowZero = true, increment = 0, max = 0, error = INTERFACE_CONFIG_INVALID_POE_POWER_USAGE_THRESHOLD: Invalid Interface configuration. Invalid PoE alarm threshold value {}. Valid values are in the range 50-100., min = 0)

Param PppoeConfig (yxxGXUe.Config): the PppoeConfig param.

Param Scope (string, required): Scope: ValidateEnum(enumClass = classOf[NetworkScope], message = Invalid enum string., nullAllowed = false)  String must be one of these: `"GLOBAL"`, `"LOCAL"`.

Param SecondaryIpConfigs ([]jmyEuEW.Config): Secondary Ip Configs

Param ServiceLinkConfig (obJkRYB.Config): the ServiceLinkConfig param.

Param SiteWanInterfaceIds ([]string): Site Wan Interface Ids

Param StaticArpConfigs ([]pWDbfYi.Config): Static Arp Configs: Size(max = 32, error = INTERFACE_CONFIG_STATIC_ARP_EXCEEDS_LIMIT: Invalid interface configuration. Static ARP entries exceed the supported limit of 16, min = 0)

Param SubInterface (jEYlBbY.Config): the SubInterface param.

Param SwitchPortConfig (kslrKbF.Config): the SwitchPortConfig param.

Param Tags ([]string): Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 128, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\s]+, required = false)

Param Type (string, required): Type: ValidateEnum(enumClass = classOf[InterfaceType], error = INVALID_PORT_TYPE: Port type is not valid., nullAllowed = false)

Param UsedFor (string, required): Used For: ValidateEnum(enumClass = classOf[UsedFor], error = INTERFACE_CONFIG_INVALID_USEDFOR_VALUE: Invalid used for value specified.The allowed values are public,private_wan,lan,none, nullAllowed = false)

Param VlanConfig (aCdiNxV.Config): the VlanConfig param.

Param VrfContextId (string): Vrf Context Id
*/
type Config struct {
	AdminUp                    *bool            `json:"admin_up"`
	AttachedLanNetworks        []irQawLY.Config `json:"attached_lan_networks"`
	AuthenticationConfig       *mIAatvm.Config  `json:"authentication_config"`
	BoundInterfaces            []string         `json:"bound_interfaces"`
	BypassPair                 *zGfKFAQ.Config  `json:"bypass_pair"`
	CellularConfig             *eumQbRC.Config  `json:"cellular_config"`
	Description                *string          `json:"description"`
	DevicemgmtPolicysetstackId *string          `json:"devicemgmt_policysetstack_id"`
	DhcpRelay                  *mCcgFKg.Config  `json:"dhcp_relay"`
	DirectedBroadcast          *bool            `json:"directed_broadcast"`
	Etag                       *int64           `json:"_etag"`
	EthernetPort               *ehJLagQ.Config  `json:"ethernet_port"`
	Id                         *string          `json:"id"`
	InterfaceProfileId         *string          `json:"interface_profile_id"`
	IpfixcollectorcontextId    *string          `json:"ipfixcollectorcontext_id"`
	IpfixfiltercontextId       *string          `json:"ipfixfiltercontext_id"`
	Ipv4Config                 *wsoFfyL.Config  `json:"ipv4_config"`
	Ipv6Config                 *bMGDwkY.Config  `json:"ipv6_config"`
	LldpEnabled                *bool            `json:"lldp_enabled"`
	MacAddress                 *string          `json:"mac_address"`
	Mtu                        *int64           `json:"mtu"`
	MulticastConfig            *zLXjrfn.Config  `json:"multicast_config"`
	Name                       *string          `json:"name"`
	NatAddress                 *string          `json:"nat_address"`
	NatAddressV6               *string          `json:"nat_address_v6"`
	NatPools                   []alJfwdK.Config `json:"nat_pools"`
	NatPort                    *int64           `json:"nat_port"`
	NatPortV6                  *int64           `json:"nat_port_v6"`
	NatZoneId                  *string          `json:"nat_zone_id"`
	NetworkContextId           *string          `json:"network_context_id"`
	Parent                     *string          `json:"parent"`
	PeerBypasspairWanPortType  string           `json:"peer_bypasspair_wan_port_type"`
	PoeEnabled                 *bool            `json:"poe_enabled"`
	PowerUsageThreshold        *int64           `json:"power_usage_threshold"`
	PppoeConfig                *yxxGXUe.Config  `json:"pppoe_config"`
	Scope                      string           `json:"scope"`
	SecondaryIpConfigs         []jmyEuEW.Config `json:"secondary_ip_configs"`
	ServiceLinkConfig          *obJkRYB.Config  `json:"service_link_config"`
	SiteWanInterfaceIds        []string         `json:"site_wan_interface_ids"`
	StaticArpConfigs           []pWDbfYi.Config `json:"static_arp_configs"`
	SubInterface               *jEYlBbY.Config  `json:"sub_interface"`
	SwitchPortConfig           *kslrKbF.Config  `json:"switch_port_config"`
	Tags                       []string         `json:"tags"`
	Type                       string           `json:"type"`
	UsedFor                    string           `json:"used_for"`
	VlanConfig                 *aCdiNxV.Config  `json:"vlan_config"`
	VrfContextId               *string          `json:"vrf_context_id"`
}
