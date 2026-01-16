# Resource locator for site (required)
resource "prismasdwan_resource_locator" "site" {
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.site_name
}

resource "prismasdwan_resource_locator" "globalmcast" {
    x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
    element_id = prismasdwan_resource_locator.element.result
    }
  resource_type = "prismasdwan_element_multicast_global_config"
}

# Resource locator for element (required)
resource "prismasdwan_resource_locator" "element" {
  resource_type = "prismasdwan_element"
  resource_property = "name"
  resource_property_value = var.element_name
  
  # Set x_parameters for site-specific element lookup
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
  }
}

resource "prismasdwan_element_multicast_global_config" "element_multicast_global_config_full" {
  # IGMP Protocol Parameters
  igmp_protocol_parameters = var.enable_igmp ? {
    query_max_response_time    = var.igmp_query_max_response_time
    last_member_query_interval = var.igmp_last_member_query_interval
    last_member_query_count    = var.igmp_last_member_query_count
    query_interval             = var.igmp_query_interval
  } : null
  
  # PIM Protocol Parameters
  pim_protocol_parameters = var.enable_pim ? {
    join_prune_interval = var.pim_join_prune_interval
    hello_hold_time     = var.pim_hello_hold_time
    hello_interval      = var.pim_hello_interval
  } : null
  
  # Optional multicast parameters
  dr_priority             = var.dr_priority
  bsm_enabled            = var.bsm_enabled
  spt_switchover_enabled = var.spt_switchover_enabled
  
  # Set x_parameters for site and element-specific multicast global config
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
    element_id = prismasdwan_resource_locator.element.result
    config_id = prismasdwan_resource_locator.globalmcast.result
  }
}