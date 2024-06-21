package n10

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/SiteScreenV4N10

import (
	mhJDwSQ "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/address"
	oPPPeKY "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/extended/tag"
	hUAfQlh "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/location"
)

/*
Config object.

ShortName: uewNibC
Parent chains:
*

Args:

Param Address (mhJDwSQ.Config): the Address param.

Param AdminState (string, required): Admin State: Required(error = SITE_ADMIN_STATE_MISSING: Site admin state missing.) ValidateEnum(enumClass = classOf[SiteState], message = Invalid enum string., nullAllowed = false)

Param BranchGateway (bool): Branch Gateway

Param Description (string): Description: Size(max = 1024, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0)

Param ElementClusterRole (string, required): Element Cluster Role: Required(error = SITE_ROLE_MISSING: Site role missing.) ValidateEnum(enumClass = classOf[ElementClusterRole], message = Invalid enum string., nullAllowed = false)

Param Etag (int64): Entity tag for the resource

Param ExtendedTags ([]oPPPeKY.Config): Extended Tags: Valid ListObject(allowDuplicate = false, allowEmpty = true, allowNull = true, listMaxSize = 10, message = INVALID_EXTENDED_TAG_SIZE_OR_DUPLICATE, required = false)

Param Id (string, read-only): Id

Param Location (hUAfQlh.Config): the Location param.

Param MulticastPeerGroupId (string): Multicast Peer Group Id

Param Name (string, required): Name: Required(error = NAME_REQD: Please provide resource name.) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0)

Param NatPolicysetstackId (string): Nat Policysetstack Id: Digits(fraction = 0, integer = 20, error = INVALID_NAT_POLICYSETSTACK_ID: Invalid nat policy set stack id.)

Param NetworkPolicysetstackId (string): Network Policysetstack Id: Digits(fraction = 0, integer = 20, error = INVALID_NETWORK_POLICYSETSTACK_ID: Invalid network policy set stack id)

Param PerfmgmtPolicysetstackId (string): Perfmgmt Policysetstack Id: Digits(fraction = 0, integer = 20, error = INVALID_PERFMGMT_POLICYSETSTACK_ID: Invalid performance management policy set stack id)

Param PolicySetId (string): Policy Set Id

Param PreferLanDefaultOverWanDefaultRoute (bool): Prefer Lan Default Over Wan Default Route Default: `false`.

Param PriorityPolicysetstackId (string): Priority Policysetstack Id: Digits(fraction = 0, integer = 20, error = INVALID_PRIORITY_POLICYSETSTACK_ID: Invalid priority policy set stack id)

Param SecurityPolicysetId (string): Security Policyset Id

Param SecurityPolicysetstackId (string): Security Policysetstack Id

Param ServiceBinding (string): Service Binding

Param Tags ([]string): Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 1024, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\s]+, required = false)

Param VrfContextProfileId (string): Vrf Context Profile Id
*/
type Config struct {
	Address                             *mhJDwSQ.Config  `json:"address"`
	AdminState                          string           `json:"admin_state"`
	BranchGateway                       *bool            `json:"branch_gateway"`
	Description                         *string          `json:"description"`
	ElementClusterRole                  string           `json:"element_cluster_role"`
	Etag                                *int64           `json:"_etag"`
	ExtendedTags                        []oPPPeKY.Config `json:"extended_tags"`
	Id                                  *string          `json:"id"`
	Location                            *hUAfQlh.Config  `json:"location"`
	MulticastPeerGroupId                *string          `json:"multicast_peer_group_id"`
	Name                                string           `json:"name"`
	NatPolicysetstackId                 *string          `json:"nat_policysetstack_id"`
	NetworkPolicysetstackId             *string          `json:"network_policysetstack_id"`
	PerfmgmtPolicysetstackId            *string          `json:"perfmgmt_policysetstack_id"`
	PolicySetId                         *string          `json:"policy_set_id"`
	PreferLanDefaultOverWanDefaultRoute *bool            `json:"prefer_lan_default_over_wan_default_route"`
	PriorityPolicysetstackId            *string          `json:"priority_policysetstack_id"`
	SecurityPolicysetId                 *string          `json:"security_policyset_id"`
	SecurityPolicysetstackId            *string          `json:"security_policysetstack_id"`
	ServiceBinding                      *string          `json:"service_binding"`
	Tags                                []string         `json:"tags"`
	VrfContextProfileId                 *string          `json:"vrf_context_profile_id"`
}
