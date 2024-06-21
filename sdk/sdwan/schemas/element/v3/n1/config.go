package n1

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/ElementV3N1

import (
	xtSEgxw "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/led/config"
	urOXkAM "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/spoke/haconfig/v2"
	abEEBQk "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/switch/config"
)

/*
Config object.

ShortName: suxdMuj
Parent chains:
*

Args:

Param AdminAction (string): Admin Action String must be one of these: `"ALLOCATE"`, `"CLAIM"`, `"BOUND"`, `"UNBOUND"`, `"DECLAIM"`, `"RETURN"`, `"REVOKE"`, `"RETIRE"`, `"STOCK"`, `"UPGRADE"`, `"REMANUFACTURE"`, `"DEFAULT"`, `"INVALID"`.

Param AdminRenewState (string): Admin Renew State String must be one of these: `"SLEEP"`, `"INIT"`, `"ACTIVE"`, `"ACTIVE_ASSIGNED_DEFAULT"`, `"ACTIVE_ASSIGNED_TENANT"`, `"ACTIVE_TRUSTED"`, `"ACTIVE_NOCERT"`, `"ACTIVE_CLAIMED"`, `"ACTIVE_MIC"`, `"ACTIVE_MIC_PENDING"`, `"ACTIVE_MIC_ISSUED"`, `"ACTIVE_MIC_FAILED"`, `"ACTIVE_CIC"`, `"ACTIVE_CIC_SITE"`, `"ACTIVE_CIC_PENDING"`, `"ACTIVE_CIC_ISSUED"`, `"ACTIVE_CIC_FAILED"`, `"ACTIVE_INVENTORY_IN_PROGRESS"`, `"ACTIVE_INVENTORY_GET_PENDING"`, `"ACTIVE_INVENTORY_POST_PENDING"`, `"ACTIVE_INVENTORY_GET_COMPLETE"`, `"ACTIVE_INVENTORY_GET_FAILED"`, `"ACTIVE_INVENTORY_OPERATION_FAILED"`, `"ACTIVE_INTF_CONFIG_GET_PENDING"`, `"ACTIVE_INTF_CONFIG_GET_COMPLETE"`, `"ACTIVE_INTF_CONFIG_GET_FAILED"`, `"ACTIVE_INTF_STATE_GET_PENDING"`, `"ACTIVE_INTF_STATE_GET_COMPLETE"`, `"ACTIVE_INTF_STATE_GET_FAILED"`, `"ACTIVE_BOUND_TO_SITE_PENDING"`, `"ACTIVE_BOUND_TO_SITE"`, `"ACTIVE_BOUND_TO_SITE_FAILED"`, `"ACTIVE_READY"`, `"ACTIVE_RENEW_PENDING"`, `"ACTIVE_RENEWED"`, `"ACTIVE_DECLAIM_IN_PROGRESS"`, `"ACTIVE_DECLAIMED"`, `"ACTIVE_UNBOUND_FROM_SITE"`, `"ACTIVE_UNBOUND_IN_PROGRESS"`, `"ACTIVE_UNBOUND_FROM_SITE_FAILED"`, `"ACTIVE_CIC_CERTIFICATE_CHECK"`, `"ACTIVE_MONITORING"`, `"ACTIVE_CONNECTED"`, `"ACTIVE_24_HOURS_LESS"`, `"ACTIVE_24_HOURS_MORE"`, `"ACTIVE_TROUBLESHOOT"`, `"ACTIVE_SUSPEND_INIT"`, `"ACTIVE_SUSPEND_IN_PROGRESS"`, `"ACTIVE_SUSPENDED"`, `"ACTIVE_SUSPEND_FAILED"`, `"ACTIVE_SUSPEND_FAILED_TIMEOUT"`, `"ACTIVE_SUSPENDED_MIC_OPERATIONAL"`, `"ACTIVE_SUSPENDED_CIC_OPERATIONAL"`, `"ACTIVE_SUSPENDED_EMPTY_TOKEN"`, `"ACTIVE_SUSPENDED_TOKEN_EXPIRED"`, `"INACTIVE_NOCERT"`, `"INACTIVE_MIC"`, `"INACTIVE_CIC"`, `"INACTIVE_CIC_SITE"`, `"RETURNED"`, `"STANDBY"`, `"OOS_AT_READY"`, `"OOS_AT_INIT"`, `"OOS_AT_BIND_PENDING"`, `"OOS_AT_BIND"`, `"OOS_AT_BIND_FAILED"`, `"OOS_AT_UNBIND_FAILED"`, `"OOS_AT_UNBIND_PROGRESS"`, `"DECOMMISSION"`.

Param AdminSuspendState (string): Admin Suspend State String must be one of these: `"SLEEP"`, `"INIT"`, `"ACTIVE"`, `"ACTIVE_ASSIGNED_DEFAULT"`, `"ACTIVE_ASSIGNED_TENANT"`, `"ACTIVE_TRUSTED"`, `"ACTIVE_NOCERT"`, `"ACTIVE_CLAIMED"`, `"ACTIVE_MIC"`, `"ACTIVE_MIC_PENDING"`, `"ACTIVE_MIC_ISSUED"`, `"ACTIVE_MIC_FAILED"`, `"ACTIVE_CIC"`, `"ACTIVE_CIC_SITE"`, `"ACTIVE_CIC_PENDING"`, `"ACTIVE_CIC_ISSUED"`, `"ACTIVE_CIC_FAILED"`, `"ACTIVE_INVENTORY_IN_PROGRESS"`, `"ACTIVE_INVENTORY_GET_PENDING"`, `"ACTIVE_INVENTORY_POST_PENDING"`, `"ACTIVE_INVENTORY_GET_COMPLETE"`, `"ACTIVE_INVENTORY_GET_FAILED"`, `"ACTIVE_INVENTORY_OPERATION_FAILED"`, `"ACTIVE_INTF_CONFIG_GET_PENDING"`, `"ACTIVE_INTF_CONFIG_GET_COMPLETE"`, `"ACTIVE_INTF_CONFIG_GET_FAILED"`, `"ACTIVE_INTF_STATE_GET_PENDING"`, `"ACTIVE_INTF_STATE_GET_COMPLETE"`, `"ACTIVE_INTF_STATE_GET_FAILED"`, `"ACTIVE_BOUND_TO_SITE_PENDING"`, `"ACTIVE_BOUND_TO_SITE"`, `"ACTIVE_BOUND_TO_SITE_FAILED"`, `"ACTIVE_READY"`, `"ACTIVE_RENEW_PENDING"`, `"ACTIVE_RENEWED"`, `"ACTIVE_DECLAIM_IN_PROGRESS"`, `"ACTIVE_DECLAIMED"`, `"ACTIVE_UNBOUND_FROM_SITE"`, `"ACTIVE_UNBOUND_IN_PROGRESS"`, `"ACTIVE_UNBOUND_FROM_SITE_FAILED"`, `"ACTIVE_CIC_CERTIFICATE_CHECK"`, `"ACTIVE_MONITORING"`, `"ACTIVE_CONNECTED"`, `"ACTIVE_24_HOURS_LESS"`, `"ACTIVE_24_HOURS_MORE"`, `"ACTIVE_TROUBLESHOOT"`, `"ACTIVE_SUSPEND_INIT"`, `"ACTIVE_SUSPEND_IN_PROGRESS"`, `"ACTIVE_SUSPENDED"`, `"ACTIVE_SUSPEND_FAILED"`, `"ACTIVE_SUSPEND_FAILED_TIMEOUT"`, `"ACTIVE_SUSPENDED_MIC_OPERATIONAL"`, `"ACTIVE_SUSPENDED_CIC_OPERATIONAL"`, `"ACTIVE_SUSPENDED_EMPTY_TOKEN"`, `"ACTIVE_SUSPENDED_TOKEN_EXPIRED"`, `"INACTIVE_NOCERT"`, `"INACTIVE_MIC"`, `"INACTIVE_CIC"`, `"INACTIVE_CIC_SITE"`, `"RETURNED"`, `"STANDBY"`, `"OOS_AT_READY"`, `"OOS_AT_INIT"`, `"OOS_AT_BIND_PENDING"`, `"OOS_AT_BIND"`, `"OOS_AT_BIND_FAILED"`, `"OOS_AT_UNBIND_FAILED"`, `"OOS_AT_UNBIND_PROGRESS"`, `"DECOMMISSION"`.

Param AllowedRoles ([]string): Allowed Roles Individual elements in this list are subject to additional validation. String must be one of these: `"NONE"`, `"HUB"`, `"SPOKE"`, `"PA_WE_BR"`, `"PA_WE_DC"`, `"PA_CONN"`.

Param ClusterId (string): Cluster Id

Param Connected (bool): Connected

Param DeploymentOp (string): Deployment Op String must be one of these: `"DECLAIM"`, `"UPGRADE"`, `"ABORT_UPGRADE"`, `"DEFAULT"`, `"INVALID"`, `"REBIND"`, `"READY"`, `"IN_SERVICE"`, `"REUNBIND"`, `"RENEW_CIC"`, `"ABORT_CELLULARMODULE_FIRMWARE_UPGRADE"`, `"FIPS_AUTO"`, `"NON_FIPS_AUTO"`, `"FIPS_MANUAL"`, `"NON_FIPS_MANUAL"`, `"GET_MAC_ADDRESS_TABLE"`.

Param Description (string): Description: Size(max = 256, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0)

Param DeviceChangeModeStartTime (int64): Device Change Mode Start Time

Param DeviceChangeModeState (string): Device Change Mode State String must be one of these: `"ELEMENT_CHANGE_MODE_INIT"`, `"ELEMENT_CHANGE_MODE_IN_PROGRESS"`, `"ELEMENT_CHANGE_MODE_FAILED"`, `"ELEMENT_CHANGE_MODE_TIMEOUT"`, `"ELEMENT_CHANGE_MODE"`.

Param DeviceMode (string): Device Mode String must be one of these: `"none"`, `"l3-mode"`, `"l2-mode"`.

Param DeviceProfileId (string): Device Profile Id

Param FipsMode (string): Fips Mode String must be one of these: `"none"`, `"fips"`, `"non_fips"`.

Param FipsModeChangeStartTime (int64): Fips Mode Change Start Time

Param HwId (string): Hw Id

Param Id (string): Id

Param L3DirectPrivateWanForwarding (bool): L3 Direct Private Wan Forwarding

Param L3LanForwarding (bool): L3 Lan Forwarding

Param LedConfig (xtSEgxw.Config): the LedConfig param.

Param MainPowerUsageThreshold (int64): Main Power Usage Threshold: ValidateDecimal(allowZero = true, increment = 0, max = 0, error = INVALID_MAIN_POWER_USAGE_THRESHOLD: Invalid main power usage threshold. Allowed range is 50-100., min = 0)

Param ModelName (string): Model Name

Param Name (string): Name: Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0)

Param NatPolicysetstackId (string): Nat Policysetstack Id: Digits(fraction = 0, integer = 20, error = INVALID_NAT_POLICYSETSTACK_ID: Invalid nat policy set stack id.)

Param NetworkPolicysetstackId (string): Network Policysetstack Id: Digits(fraction = 0, integer = 20, error = INVALID_NETWORK_POLICYSETSTACK_ID: Invalid network policy set stack id)

Param OverrideIndicator ([]string): Override Indicator

Param PriorityPolicysetstackId (string): Priority Policysetstack Id: Digits(fraction = 0, integer = 20, error = INVALID_PRIORITY_POLICYSETSTACK_ID: Invalid priority policy set stack id)

Param Role (string): Role String must be one of these: `"NONE"`, `"HUB"`, `"SPOKE"`, `"PA_WE_BR"`, `"PA_WE_DC"`, `"PA_CONN"`.

Param SerialNumber (string): Serial Number

Param SiteId (string, required): Site Id: Digits(fraction = 0, integer = 50, SITEID_INVALID) NotNull

Param SoftwareVersion (string): Software Version

Param SpokeHaConfig (urOXkAM.Config): the SpokeHaConfig param.

Param State (string): State String must be one of these: `"ACTIVE_INIT"`, `"ACTIVE_INVENTORY_IN_PROGRESS"`, `"ACTIVE_INVENTORY_OPERATION_FAILED"`, `"ACTIVE_INVENTORY_GET_PENDING"`, `"ACTIVE_INVENTORY_GET_COMPLETE"`, `"ACTIVE_INVENTORY_POST_PENDING"`, `"ACTIVE_INTF_CONFIG_GET_FAILED"`, `"ACTIVE_INTF_STATE_GET_FAILED"`, `"ACTIVE_READY"`, `"ACTIVE_BOUND_IN_PROGRESS"`, `"ACTIVE_UNBOUND_IN_PROGRESS"`, `"ACTIVE_UNBOUND_FROM_SITE_FAILED"`, `"ACTIVE_BOUND_TO_SITE"`, `"ACTIVE_BOUND_TO_SITE_FAILED"`, `"OOS"`, `"ACTIVE_DECLAIM_IN_PROGRESS"`, `"ACTIVE_DECLAIMED"`.

Param SwitchConfig (abEEBQk.Config): the SwitchConfig param.

Param Tags ([]string): Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 128, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\s]+, required = false)

Param VpnToVpnForwarding (bool): Vpn To Vpn Forwarding
*/
type Config struct {
	AdminAction                  *string         `json:"admin_action"`
	AdminRenewState              *string         `json:"admin_renew_state"`
	AdminSuspendState            *string         `json:"admin_suspend_state"`
	AllowedRoles                 []string        `json:"allowed_roles"`
	ClusterId                    *string         `json:"cluster_id"`
	Connected                    *bool           `json:"connected"`
	DeploymentOp                 *string         `json:"deployment_op"`
	Description                  *string         `json:"description"`
	DeviceChangeModeStartTime    *int64          `json:"device_change_mode_start_time"`
	DeviceChangeModeState        *string         `json:"device_change_mode_state"`
	DeviceMode                   *string         `json:"device_mode"`
	DeviceProfileId              *string         `json:"device_profile_id"`
	FipsMode                     *string         `json:"fips_mode"`
	FipsModeChangeStartTime      *int64          `json:"fips_mode_change_start_time"`
	HwId                         *string         `json:"hw_id"`
	Id                           *string         `json:"id"`
	L3DirectPrivateWanForwarding *bool           `json:"l3_direct_private_wan_forwarding"`
	L3LanForwarding              *bool           `json:"l3_lan_forwarding"`
	LedConfig                    *xtSEgxw.Config `json:"led_config"`
	MainPowerUsageThreshold      *int64          `json:"main_power_usage_threshold"`
	ModelName                    *string         `json:"model_name"`
	Name                         *string         `json:"name"`
	NatPolicysetstackId          *string         `json:"nat_policysetstack_id"`
	NetworkPolicysetstackId      *string         `json:"network_policysetstack_id"`
	OverrideIndicator            []string        `json:"override_indicator"`
	PriorityPolicysetstackId     *string         `json:"priority_policysetstack_id"`
	Role                         *string         `json:"role"`
	SerialNumber                 *string         `json:"serial_number"`
	SiteId                       string          `json:"site_id"`
	SoftwareVersion              *string         `json:"software_version"`
	SpokeHaConfig                *urOXkAM.Config `json:"spoke_ha_config"`
	State                        *string         `json:"state"`
	SwitchConfig                 *abEEBQk.Config `json:"switch_config"`
	Tags                         []string        `json:"tags"`
	VpnToVpnForwarding           *bool           `json:"vpn_to_vpn_forwarding"`
}
