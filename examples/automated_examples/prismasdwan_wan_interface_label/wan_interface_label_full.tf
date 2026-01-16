# Resource locator for probe profile
resource "prismasdwan_resource_locator" "probe_profile" {
  resource_type = "prismasdwan_probe_profile"
  resource_property = "name"
  resource_property_value = var.probe_profile_name
}

# Resource locators for L3 reachability probe configs
resource "prismasdwan_resource_locator" "probe_configs" {
  count = length(var.l3_reachability_probe_config_names)
  
  resource_type = "prismasdwan_probe_config"
  resource_property = "name"
  resource_property_value = var.l3_reachability_probe_config_names[count.index]
}

resource "prismasdwan_resource_locator" "wanintflabelid" {
  resource_type = "prismasdwan_wan_interface_label"
  resource_property = "name"
  resource_property_value = var.label
}

resource "prismasdwan_wan_interface_label" "wan_interface_label_full" {
  
  x_parameters = {
    wantinterface_label_id = prismasdwan_resource_locator.wanintflabelid.result
  }
  
  name                                     = var.wan_interface_label_name
  description                              = var.description
  label                                    = var.label
  tags                                     = var.tags
  probe_profile_id                         = prismasdwan_resource_locator.probe_profile.result
  bwc_enabled                              = var.bwc_enabled
  lqm_enabled                              = var.lqm_enabled
  use_lqm_for_non_hub_paths               = var.use_lqm_for_non_hub_paths
  use_for_application_reachability_probes = var.use_for_application_reachability_probes
  use_for_controller_connections          = var.use_for_controller_connections
  
  l3_reachability = {
    use_element_default = var.l3_reachability_use_element_default
    probe_config_ids    = [for locator in prismasdwan_resource_locator.probe_configs : locator.result]
  }
  
  vpnlink_configuration = {
    keep_alive_interval      = var.vpnlink_keep_alive_interval
    keep_alive_failure_count = var.vpnlink_keep_alive_failure_count
  }
  
}