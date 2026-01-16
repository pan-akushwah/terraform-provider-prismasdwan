# Resource locator for hub site
resource "prismasdwan_resource_locator" "hub_site" {
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.hub_site_name
}

# Local validation for duplicate orders within VRF contexts
locals {
  # Flatten all filters with their VRF context for validation
  all_filters_with_vrf = flatten([
    for filter_list in var.path_prefix_filter_list : [
      for filter in filter_list.path_prefix_filters : {
        vrf_context_id = filter_list.vrf_context_id
        order          = filter.order
        ipv4_prefix    = filter.ipv4_prefix
        ipv6_prefix    = filter.ipv6_prefix
        permit         = filter.permit
      }
    ]
  ])
  
  # Group filters by VRF context
  filters_by_vrf = {
    for vrf_id in distinct([for f in local.all_filters_with_vrf : f.vrf_context_id]) : vrf_id => [
      for f in local.all_filters_with_vrf : f if f.vrf_context_id == vrf_id
    ]
  }
  
  # Check for duplicate orders within each VRF
  duplicate_orders_validation = alltrue([
    for vrf_id, filters in local.filters_by_vrf : 
    length(filters) == length(distinct([for f in filters : f.order]))
  ])
  
  # Check filter count per VRF
  vrf_filter_count_validation = alltrue([
    for vrf_id, filters in local.filters_by_vrf : 
    length(filters) <= var.max_filters_per_vrf
  ])
}

# Validation checks
resource "null_resource" "order_validation" {
  count = var.enable_duplicate_order_validation ? 1 : 0
  
  lifecycle {
    precondition {
      condition     = local.duplicate_orders_validation
      error_message = "Duplicate order values found within the same VRF context. Each filter must have a unique order value within its VRF."
    }
  }
}

resource "null_resource" "filter_count_validation" {
  lifecycle {
    precondition {
      condition     = local.vrf_filter_count_validation
      error_message = "One or more VRF contexts exceed the maximum filter count of ${var.max_filters_per_vrf}."
    }
  }
}

# IPv4 prefix validation (basic CIDR format check)
resource "null_resource" "ipv4_prefix_validation" {
  count = var.enable_prefix_validation ? 1 : 0
  
  lifecycle {
    precondition {
      condition = alltrue([
        for filter_list in var.path_prefix_filter_list : alltrue([
          for filter in filter_list.path_prefix_filters : (
            filter.ipv4_prefix == null || can(regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", filter.ipv4_prefix))
          )
        ])
      ])
      error_message = "Invalid IPv4 prefix format detected. Must be in CIDR notation (e.g., 192.168.1.0/24)."
    }
  }
}

# IPv6 prefix validation (basic format check)
resource "null_resource" "ipv6_prefix_validation" {
  count = var.enable_prefix_validation ? 1 : 0
  
  lifecycle {
    precondition {
      condition = alltrue([
        for filter_list in var.path_prefix_filter_list : alltrue([
          for filter in filter_list.path_prefix_filters : (
            filter.ipv6_prefix == null || can(regex("^([0-9a-fA-F]{0,4}:){1,7}[0-9a-fA-F]{0,4}/[0-9]{1,3}$", filter.ipv6_prefix))
          )
        ])
      ])
      error_message = "Invalid IPv6 prefix format detected. Must be in CIDR notation (e.g., 2001:db8::/32)."
    }
  }
}

resource "prismasdwan_site_hub_prefix_filter_profile" "hub_prefix_filter_profile_full" {
  # X_parameters with site ID
  x_parameters = {
    site_id = prismasdwan_resource_locator.hub_site.result
  }
  
  # Required fields
  name = var.prefix_filter_profile_name
  
  # Optional fields
  description = var.description
  tags        = var.tags
  
  # Path prefix filter list configuration
  path_prefix_filter_list = [
    for filter_list in var.path_prefix_filter_list : {
      vrf_context_id = filter_list.vrf_context_id
      path_prefix_filters = [
        for filter in filter_list.path_prefix_filters : {
          ipv4_prefix = filter.ipv4_prefix
          ipv6_prefix = filter.ipv6_prefix
          permit      = filter.permit
          order       = filter.order
        }
      ]
    }
  ]
  
  # Ensure validations pass before creating
  depends_on = [
    null_resource.order_validation,
    null_resource.filter_count_validation,
    null_resource.ipv4_prefix_validation,
    null_resource.ipv6_prefix_validation
  ]
}