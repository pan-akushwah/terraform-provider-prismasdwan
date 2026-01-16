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

# Resource locator for IPFIX profile
resource "prismasdwan_resource_locator" "ipfix_profile" {
  resource_type = "prismasdwan_ipfix_profile"
  resource_property = "name"
  resource_property_value = var.ipfixprofile_name
}

# Resource locator for IPFIX template (if provided)
resource "prismasdwan_resource_locator" "ipfix_template" {
  count = var.ipfixtemplate_name != "" ? 1 : 0
  
  resource_type = "prismasdwan_ipfix_template"
  resource_property = "name"
  resource_property_value = var.ipfixtemplate_name
}

# Resource locators for IPFIX collector contexts
resource "prismasdwan_resource_locator" "ipfix_collector_context_1" {
  count = length(var.collector_configs) >= 1 && var.collector_configs[0].ipfixcollectorcontext_name != "" ? 1 : 0
  
  resource_type = "prismasdwan_ipfix_collector_context"
  resource_property = "name"
  resource_property_value = var.collector_configs[0].ipfixcollectorcontext_name
}

resource "prismasdwan_resource_locator" "ipfix_collector_context_2" {
  count = length(var.collector_configs) >= 2 && var.collector_configs[1].ipfixcollectorcontext_name != "" ? 1 : 0
  
  resource_type = "prismasdwan_ipfix_collector_context"
  resource_property = "name"
  resource_property_value = var.collector_configs[1].ipfixcollectorcontext_name
}

resource "prismasdwan_resource_locator" "ipfix_collector_context_3" {
  count = length(var.collector_configs) >= 3 && var.collector_configs[2].ipfixcollectorcontext_name != "" ? 1 : 0
  
  resource_type = "prismasdwan_ipfix_collector_context"
  resource_property = "name"
  resource_property_value = var.collector_configs[2].ipfixcollectorcontext_name
}

resource "prismasdwan_resource_locator" "ipfix_collector_context_4" {
  count = length(var.collector_configs) >= 4 && var.collector_configs[3].ipfixcollectorcontext_name != "" ? 1 : 0
  
  resource_type = "prismasdwan_ipfix_collector_context"
  resource_property = "name"
  resource_property_value = var.collector_configs[3].ipfixcollectorcontext_name
}

# Resource locators for app definitions
resource "prismasdwan_resource_locator" "app_def_1" {
  count = var.app_def_name_1 != "" ? 1 : 0
  
  resource_type = "prismasdwan_app_def"
  resource_property = "name"
  resource_property_value = var.app_def_name_1
}

resource "prismasdwan_resource_locator" "app_def_2" {
  count = var.app_def_name_2 != "" ? 1 : 0
  
  resource_type = "prismasdwan_app_def"
  resource_property = "name"
  resource_property_value = var.app_def_name_2
}

resource "prismasdwan_resource_locator" "app_def_3" {
  count = var.app_def_name_3 != "" ? 1 : 0
  
  resource_type = "prismasdwan_app_def"
  resource_property = "name"
  resource_property_value = var.app_def_name_3
}

# Resource locators for prefix filter lists
resource "prismasdwan_resource_locator" "src_prefix_filter" {
  count = var.src_prefix_filter_name != "" ? 1 : 0
  
  resource_type = "prismasdwan_prefix_filter_list"
  resource_property = "name"
  resource_property_value = var.src_prefix_filter_name
}

resource "prismasdwan_resource_locator" "dst_prefix_filter" {
  count = var.dst_prefix_filter_name != "" ? 1 : 0
  
  resource_type = "prismasdwan_prefix_filter_list"
  resource_property = "name"
  resource_property_value = var.dst_prefix_filter_name
}

# Resource locators for IPFIX filter contexts
resource "prismasdwan_resource_locator" "ipfix_filter_context_1" {
  count = var.ipfix_filter_context_name_1 != "" ? 1 : 0
  
  resource_type = "prismasdwan_ipfix_filter_context"
  resource_property = "name"
  resource_property_value = var.ipfix_filter_context_name_1
}

resource "prismasdwan_resource_locator" "ipfix_filter_context_2" {
  count = var.ipfix_filter_context_name_2 != "" ? 1 : 0
  
  resource_type = "prismasdwan_ipfix_filter_context"
  resource_property = "name"
  resource_property_value = var.ipfix_filter_context_name_2
}

resource "prismasdwan_element_ipfix" "element_ipfix_full" {
    x_parameters = {
  site_id              = prismasdwan_resource_locator.site.result
  element_id           = prismasdwan_resource_locator.element.result
    }
  name                 = var.ipfix_config_name
  description          = var.description
  tags                 = var.tags
  ipfixprofile_id      = prismasdwan_resource_locator.ipfix_profile.result
  ipfixtemplate_id     = length(prismasdwan_resource_locator.ipfix_template) > 0 ? prismasdwan_resource_locator.ipfix_template[0].result : null
  export_cache_timeout = var.export_cache_timeout
  
  sampler = {
    algorithm     = var.sampler_algorithm
    time_interval = var.sampler_time_interval
    time_spacing  = var.sampler_time_spacing
  }
  
  # Collector 1 (required)
  collector_1_host                     = var.collector_configs[0].host
  collector_1_host_port               = var.collector_configs[0].host_port
  collector_1_protocol                = var.collector_configs[0].protocol
  collector_1_max_message_size        = var.collector_configs[0].max_message_size
  collector_1_ipfixcollectorcontext_id = length(prismasdwan_resource_locator.ipfix_collector_context_1) > 0 ? prismasdwan_resource_locator.ipfix_collector_context_1[0].result : null

  # Collector 2 (optional)
  collector_2_host                     = length(var.collector_configs) >= 2 ? var.collector_configs[1].host : null
  collector_2_host_port               = length(var.collector_configs) >= 2 ? var.collector_configs[1].host_port : null
  collector_2_protocol                = length(var.collector_configs) >= 2 ? var.collector_configs[1].protocol : null
  collector_2_max_message_size        = length(var.collector_configs) >= 2 ? var.collector_configs[1].max_message_size : null
  collector_2_ipfixcollectorcontext_id = length(var.collector_configs) >= 2 && length(prismasdwan_resource_locator.ipfix_collector_context_2) > 0 ? prismasdwan_resource_locator.ipfix_collector_context_2[0].result : null

  # Collector 3 (optional)
  collector_3_host                     = length(var.collector_configs) >= 3 ? var.collector_configs[2].host : null
  collector_3_host_port               = length(var.collector_configs) >= 3 ? var.collector_configs[2].host_port : null
  collector_3_protocol                = length(var.collector_configs) >= 3 ? var.collector_configs[2].protocol : null
  collector_3_max_message_size        = length(var.collector_configs) >= 3 ? var.collector_configs[2].max_message_size : null
  collector_3_ipfixcollectorcontext_id = length(var.collector_configs) >= 3 && length(prismasdwan_resource_locator.ipfix_collector_context_3) > 0 ? prismasdwan_resource_locator.ipfix_collector_context_3[0].result : null

  # Collector 4 (optional)
  collector_4_host                     = length(var.collector_configs) >= 4 ? var.collector_configs[3].host : null
  collector_4_host_port               = length(var.collector_configs) >= 4 ? var.collector_configs[3].host_port : null
  collector_4_protocol                = length(var.collector_configs) >= 4 ? var.collector_configs[3].protocol : null
  collector_4_max_message_size        = length(var.collector_configs) >= 4 ? var.collector_configs[3].max_message_size : null
  collector_4_ipfixcollectorcontext_id = length(var.collector_configs) >= 4 && length(prismasdwan_resource_locator.ipfix_collector_context_4) > 0 ? prismasdwan_resource_locator.ipfix_collector_context_4[0].result : null

  # Filter 1 (optional)
  filter_1_wan_path_direction = var.enable_filter_1 ? var.filter_1_wan_path_direction : null
  filter_1_rtp_transport_type = var.enable_filter_1 ? var.filter_1_rtp_transport_type : null
  filter_1_app_def_ids = var.enable_filter_1 ? [
    for id in [
      length(prismasdwan_resource_locator.app_def_1) > 0 ? prismasdwan_resource_locator.app_def_1[0].result : null,
      length(prismasdwan_resource_locator.app_def_2) > 0 ? prismasdwan_resource_locator.app_def_2[0].result : null,
      length(prismasdwan_resource_locator.app_def_3) > 0 ? prismasdwan_resource_locator.app_def_3[0].result : null
    ] : id if id != null
  ] : []
  filter_1_priority_traffic_types = var.enable_filter_1 ? var.filter_1_priority_traffic_types : []
  filter_1_protocols = var.enable_filter_1 ? var.filter_1_protocols : []
  filter_1_src_prefixes_id = var.enable_filter_1 && length(prismasdwan_resource_locator.src_prefix_filter) > 0 ? prismasdwan_resource_locator.src_prefix_filter[0].result : null
  filter_1_dst_prefixes_id = var.enable_filter_1 && length(prismasdwan_resource_locator.dst_prefix_filter) > 0 ? prismasdwan_resource_locator.dst_prefix_filter[0].result : null
  filter_1_ipfixfiltercontext_ids = var.enable_filter_1 ? [
    for id in [
      length(prismasdwan_resource_locator.ipfix_filter_context_1) > 0 ? prismasdwan_resource_locator.ipfix_filter_context_1[0].result : null,
      length(prismasdwan_resource_locator.ipfix_filter_context_2) > 0 ? prismasdwan_resource_locator.ipfix_filter_context_2[0].result : null
    ] : id if id != null
  ] : []
  filter_1_src_port_start = var.enable_filter_1 && var.filter_1_enable_src_ports ? var.filter_1_src_port_start : null
  filter_1_src_port_end = var.enable_filter_1 && var.filter_1_enable_src_ports ? var.filter_1_src_port_end : null
  filter_1_dst_port_start = var.enable_filter_1 && var.filter_1_enable_dst_ports ? var.filter_1_dst_port_start : null
  filter_1_dst_port_end = var.enable_filter_1 && var.filter_1_enable_dst_ports ? var.filter_1_dst_port_end : null
}
