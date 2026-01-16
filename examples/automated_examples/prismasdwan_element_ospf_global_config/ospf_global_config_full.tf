# Resource locator for site
resource "prismasdwan_resource_locator" "site" {
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.site_name
}

# Resource locator for element
resource "prismasdwan_resource_locator" "element" {
  resource_type = "prismasdwan_element"
  resource_property = "name"
  resource_property_value = var.element_name
}

resource "prismasdwan_resource_locator" "ospfid" {
  resource_type = "prismasdwan_element_ospf_global_config"
  x_parameters = {
    site_id    = prismasdwan_resource_locator.site.result
    element_id = prismasdwan_resource_locator.element.result
  }

}

# Local validation for interval relationships
locals {
  interval_validation_passed = !var.enable_interval_validation || var.dead_interval >= (var.hello_interval * 4)
}

# Validation check
resource "null_resource" "interval_validation" {
  count = var.enable_interval_validation ? 1 : 0
  
  lifecycle {
    precondition {
      condition     = local.interval_validation_passed
      error_message = "Dead interval (${var.dead_interval}) should be at least 4 times the hello interval (${var.hello_interval}) for optimal OSPF operation."
    }
  }
}

resource "prismasdwan_element_ospf_global_config" "ospf_global_config_full" {
  # X_parameters with site and element IDs
  x_parameters = {
    site_id    = prismasdwan_resource_locator.site.result
    element_id = prismasdwan_resource_locator.element.result
    ospf_config_id = prismasdwan_resource_locator.ospfid.result
  }
  
  # OSPF Configuration Properties
  prefix_adv_type_to_lan = var.prefix_adv_type_to_lan
  retransmit_interval    = var.retransmit_interval
  cost                   = var.cost
  dead_interval          = var.dead_interval
  hello_interval         = var.hello_interval
  transmit_delay         = var.transmit_delay
  
  # Optional Router ID
  router_id = var.router_id
  
  # MD5 Authentication (if configured)
  md5_key_id = var.md5_key_id
  md5_secret = var.md5_secret
  
  # Ensure interval validation passes before creating
  depends_on = [null_resource.interval_validation]
}