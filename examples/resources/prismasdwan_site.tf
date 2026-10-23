# Copyright Palo Alto Networks Inc. 2025
#
# prismasdwan_site: Manages a Prisma SD-WAN Site.
#
# This example creates the resource with the objects it depends on, then reads it back through the data source with
# several filters.
#
# Notes:
#   - element_cluster_role is required: SPOKE for branch sites, HUB for data-center sites.
#   - Policy stacks, the VRF profile and the service binding are optional: omitted, the site gets the tenant
#     defaults, which the provider reads back.
#   - Several sites can be created in one apply: the provider creates them one at a time, because parallel creates
#     fail with "Resource already exists" and can still leave the site behind.
#   - A site with a multicast peer group attached can't be deleted; remove multicast_peer_group_id first.
#   - Hub prefix filter associations need a HUB site or one with branch_gateway = true.
#   - The data source section shows lookups by name, id, role, a nested attribute (address.city), a tag (gjson
#     query) and a reference id.
#
# Tested end to end by the provider suite: resources/site/example, data_sources/site/filters.
#
# Provider configuration (see the provider documentation):
#
#   provider "prismasdwan" {
#     host          = "api.sase.paloaltonetworks.com"
#     client_id     = "acmeuser@12345.iam.panserviceaccount.com"
#     client_secret = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
#     scope         = "tsg_id:12345"
#     auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#   }

#
# 1. A branch site with only what a site needs. Policy stacks, the VRF profile and the service binding are left
#    out, so the tenant's defaults apply (the provider reads them back as computed values).
#
resource "prismasdwan_site" "branch" {
  name                 = "san_jose_branch"
  description          = "Branch office, San Jose"
  tags                 = ["branch", "west"]
  admin_state          = "disabled" # active once elements are assigned
  element_cluster_role = "SPOKE"    # SPOKE: branch site; HUB: data-center site
  address = {
    street    = "3000 Tannery Way"
    city      = "Santa Clara"
    state     = "California"
    post_code = "95054"
    country   = "United States"
  }
  location = {
    longitude   = -121.9552
    latitude    = 37.3541
    description = "Building A"
  }
  branch_gateway                            = false
  prefer_lan_default_over_wan_default_route = false
  app_acceleration_enabled                  = false
}

#
# 2. A data-center (hub) site.
#
resource "prismasdwan_site" "datacenter" {
  name                 = "dallas_datacenter"
  description          = "Primary data center"
  tags                 = ["datacenter"]
  admin_state          = "disabled" # one of: monitor, active, disabled
  element_cluster_role = "HUB"      # one of: NONE, HUB, SPOKE, PA_WE_BR, PA_WE_DC, PA_CONN
  address = {
    city    = "Dallas"
    state   = "Texas"
    country = "United States"
  }
  location = {
    longitude = -96.7970
    latitude  = 32.7767
  }
  branch_gateway                            = false
  prefer_lan_default_over_wan_default_route = false
  app_acceleration_enabled                  = false
}

#
# 3. A branch site with every policy binding set explicitly.
#
# Built-in objects are looked up rather than hardcoded: ids differ between tenants. Default stacks are found by
# their default flag, which works whatever they are named in your tenant.
#
resource "prismasdwan_resource_locator" "default_path_stack" {
  resource_type           = "prismasdwan_path_policy_stack"
  resource_property       = "default_policysetstack"
  resource_property_value = "true"
}

resource "prismasdwan_resource_locator" "default_qos_stack" {
  resource_type           = "prismasdwan_qos_policy_stack"
  resource_property       = "default_policysetstack"
  resource_property_value = "true"
}

resource "prismasdwan_resource_locator" "default_nat_stack" {
  resource_type           = "prismasdwan_nat_policy_set_stack"
  resource_property       = "default_policysetstack"
  resource_property_value = "true"
}

resource "prismasdwan_resource_locator" "default_performance_stack" {
  resource_type           = "prismasdwan_performance_policy_stack"
  resource_property       = "default_policysetstack"
  resource_property_value = "true"
}

resource "prismasdwan_resource_locator" "global_vrf_profile" {
  resource_type           = "prismasdwan_vrf_context_profile"
  resource_property       = "name"
  resource_property_value = "Global Profile"
}

resource "prismasdwan_resource_locator" "preset_domain" {
  resource_type           = "prismasdwan_domain"
  resource_property       = "name"
  resource_property_value = "Preset Domain"
}

# Tenants have no default security stack, so this example creates one: a stack needs a default-rule set.
resource "prismasdwan_security_policy_set" "branch_default_rules" {
  name                  = "branch_default_rules"
  description           = "Default rules for branch sites"
  defaultrule_policyset = true
}

resource "prismasdwan_security_policy_stack" "branch_security" {
  name                     = "branch_security"
  description              = "Security policy for branch sites"
  defaultrule_policyset_id = prismasdwan_security_policy_set.branch_default_rules.id
}

resource "prismasdwan_site" "bound_branch" {
  name                 = "austin_branch"
  description          = "Branch office with explicit policy bindings"
  tags                 = ["branch", "south"]
  admin_state          = "disabled" # one of: monitor, active, disabled
  element_cluster_role = "SPOKE"    # one of: NONE, HUB, SPOKE, PA_WE_BR, PA_WE_DC, PA_CONN
  address = {
    city    = "Austin"
    state   = "Texas"
    country = "United States"
  }
  location = {
    longitude = -97.7431
    latitude  = 30.2672
  }
  network_policysetstack_id  = prismasdwan_resource_locator.default_path_stack.result        # path policy
  priority_policysetstack_id = prismasdwan_resource_locator.default_qos_stack.result         # QoS policy
  nat_policysetstack_id      = prismasdwan_resource_locator.default_nat_stack.result         # NAT policy
  perfmgmt_policysetstack_id = prismasdwan_resource_locator.default_performance_stack.result # performance policy
  security_policysetstack_id = prismasdwan_security_policy_stack.branch_security.id          # security policy
  vrf_context_profile_id     = prismasdwan_resource_locator.global_vrf_profile.result
  service_binding            = prismasdwan_resource_locator.preset_domain.result # domain: which service endpoints the site uses

  branch_gateway                            = false
  prefer_lan_default_over_wan_default_route = false
  app_acceleration_enabled                  = false
}

#
# Reading sites with the data source
#
# filters keys are paths into each site's JSON (nested paths and gjson queries work) and values are compared as
# strings; a site is returned when every filter matches. items is null when nothing matches.
#

# one site by name
data "prismasdwan_site" "find_by_name" {
  filters = {
    name = prismasdwan_site.branch.name
  }
}

# one site by id
data "prismasdwan_site" "find_by_id" {
  filters = {
    id = prismasdwan_site.datacenter.id
  }
}

# every data-center site
data "prismasdwan_site" "find_hubs" {
  filters = {
    element_cluster_role = "HUB"
  }
  depends_on = [prismasdwan_site.datacenter]
}

# sites in a city: a nested attribute
data "prismasdwan_site" "find_in_santa_clara" {
  filters = {
    "address.city" = "Santa Clara"
  }
  depends_on = [prismasdwan_site.branch]
}

# disabled branch sites with the tag "branch": a list member (gjson query) combined with other filters
data "prismasdwan_site" "find_disabled_branches" {
  filters = {
    "tags.#(==\"branch\")" = "branch"
    element_cluster_role   = "SPOKE"
    admin_state            = "disabled"
  }
  depends_on = [prismasdwan_site.branch, prismasdwan_site.bound_branch]
}

# sites using a given security stack: a reference id
data "prismasdwan_site" "find_with_branch_security" {
  filters = {
    security_policysetstack_id = prismasdwan_security_policy_stack.branch_security.id
  }
  depends_on = [prismasdwan_site.bound_branch]
}

output "site_lookups" {
  value = {
    by_name              = [for s in coalesce(data.prismasdwan_site.find_by_name.items, []) : s.name]
    by_id                = [for s in coalesce(data.prismasdwan_site.find_by_id.items, []) : s.name]
    hubs                 = [for s in coalesce(data.prismasdwan_site.find_hubs.items, []) : s.name]
    in_santa_clara       = [for s in coalesce(data.prismasdwan_site.find_in_santa_clara.items, []) : s.name]
    disabled_branches    = [for s in coalesce(data.prismasdwan_site.find_disabled_branches.items, []) : s.name]
    with_branch_security = [for s in coalesce(data.prismasdwan_site.find_with_branch_security.items, []) : s.name]
  }
}
