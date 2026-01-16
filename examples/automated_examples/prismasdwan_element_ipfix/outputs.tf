# Element IPFIX Details
output "element_ipfix_details" {
  description = "Details of the created element IPFIX configuration"
  value = {
    id                   = prismasdwan_element_ipfix.element_ipfix_full.id
    site_id              = prismasdwan_element_ipfix.element_ipfix_full.site_id
    element_id           = prismasdwan_element_ipfix.element_ipfix_full.element_id
    name                 = prismasdwan_element_ipfix.element_ipfix_full.name
    description          = prismasdwan_element_ipfix.element_ipfix_full.description
    tags                 = prismasdwan_element_ipfix.element_ipfix_full.tags
    ipfixprofile_id      = prismasdwan_element_ipfix.element_ipfix_full.ipfixprofile_id
    ipfixtemplate_id     = prismasdwan_element_ipfix.element_ipfix_full.ipfixtemplate_id
    export_cache_timeout = prismasdwan_element_ipfix.element_ipfix_full.export_cache_timeout
    sampler              = prismasdwan_element_ipfix.element_ipfix_full.sampler
    x_etag               = prismasdwan_element_ipfix.element_ipfix_full.x_etag
    x_schema             = prismasdwan_element_ipfix.element_ipfix_full.x_schema
    
    # Collector configurations
    collectors = {
      collector_1 = {
        host                     = prismasdwan_element_ipfix.element_ipfix_full.collector_1_host
        host_port               = prismasdwan_element_ipfix.element_ipfix_full.collector_1_host_port
        protocol                = prismasdwan_element_ipfix.element_ipfix_full.collector_1_protocol
        max_message_size        = prismasdwan_element_ipfix.element_ipfix_full.collector_1_max_message_size
        ipfixcollectorcontext_id = prismasdwan_element_ipfix.element_ipfix_full.collector_1_ipfixcollectorcontext_id
      }
      collector_2 = {
        host                     = prismasdwan_element_ipfix.element_ipfix_full.collector_2_host
        host_port               = prismasdwan_element_ipfix.element_ipfix_full.collector_2_host_port
        protocol                = prismasdwan_element_ipfix.element_ipfix_full.collector_2_protocol
        max_message_size        = prismasdwan_element_ipfix.element_ipfix_full.collector_2_max_message_size
        ipfixcollectorcontext_id = prismasdwan_element_ipfix.element_ipfix_full.collector_2_ipfixcollectorcontext_id
      }
      collector_3 = {
        host                     = prismasdwan_element_ipfix.element_ipfix_full.collector_3_host
        host_port               = prismasdwan_element_ipfix.element_ipfix_full.collector_3_host_port
        protocol                = prismasdwan_element_ipfix.element_ipfix_full.collector_3_protocol
        max_message_size        = prismasdwan_element_ipfix.element_ipfix_full.collector_3_max_message_size
        ipfixcollectorcontext_id = prismasdwan_element_ipfix.element_ipfix_full.collector_3_ipfixcollectorcontext_id
      }
      collector_4 = {
        host                     = prismasdwan_element_ipfix.element_ipfix_full.collector_4_host
        host_port               = prismasdwan_element_ipfix.element_ipfix_full.collector_4_host_port
        protocol                = prismasdwan_element_ipfix.element_ipfix_full.collector_4_protocol
        max_message_size        = prismasdwan_element_ipfix.element_ipfix_full.collector_4_max_message_size
        ipfixcollectorcontext_id = prismasdwan_element_ipfix.element_ipfix_full.collector_4_ipfixcollectorcontext_id
      }
    }
    
    # Filter configurations
    filters = {
      filter_1 = {
        wan_path_direction     = prismasdwan_element_ipfix.element_ipfix_full.filter_1_wan_path_direction
        rtp_transport_type     = prismasdwan_element_ipfix.element_ipfix_full.filter_1_rtp_transport_type
        app_def_ids           = prismasdwan_element_ipfix.element_ipfix_full.filter_1_app_def_ids
        priority_traffic_types = prismasdwan_element_ipfix.element_ipfix_full.filter_1_priority_traffic_types
        protocols             = prismasdwan_element_ipfix.element_ipfix_full.filter_1_protocols
        src_prefixes_id       = prismasdwan_element_ipfix.element_ipfix_full.filter_1_src_prefixes_id
        dst_prefixes_id       = prismasdwan_element_ipfix.element_ipfix_full.filter_1_dst_prefixes_id
        ipfixfiltercontext_ids = prismasdwan_element_ipfix.element_ipfix_full.filter_1_ipfixfiltercontext_ids
        src_port_start        = prismasdwan_element_ipfix.element_ipfix_full.filter_1_src_port_start
        src_port_end          = prismasdwan_element_ipfix.element_ipfix_full.filter_1_src_port_end
        dst_port_start        = prismasdwan_element_ipfix.element_ipfix_full.filter_1_dst_port_start
        dst_port_end          = prismasdwan_element_ipfix.element_ipfix_full.filter_1_dst_port_end
      }
    }
  }
}

# Individual outputs for easy access
output "element_ipfix_id" {
  description = "ID of the created element IPFIX configuration"
  value       = prismasdwan_element_ipfix.element_ipfix_full.id
}

output "element_ipfix_name" {
  description = "Name of the created element IPFIX configuration"
  value       = prismasdwan_element_ipfix.element_ipfix_full.name
}

output "element_ipfix_tfid" {
  description = "Terraform ID of the element IPFIX configuration"
  value       = prismasdwan_element_ipfix.element_ipfix_full.id
}

# Resource Resolution Status
output "resource_resolution_status" {
  description = "Status of resource name to ID resolution"
  value = {
    site_resolution = {
      site_name     = var.site_name
      resolved_id   = prismasdwan_resource_locator.site.result
      resolution_ok = prismasdwan_resource_locator.site.result != null
    }
    
    element_resolution = {
      element_name  = var.element_name
      resolved_id   = prismasdwan_resource_locator.element.result
      resolution_ok = prismasdwan_resource_locator.element.result != null
    }
    
    ipfix_profile_resolution = {
      profile_name  = var.ipfixprofile_name
      resolved_id   = prismasdwan_resource_locator.ipfix_profile.result
      resolution_ok = prismasdwan_resource_locator.ipfix_profile.result != null
    }
    
    ipfix_template_resolution = {
      template_name = var.ipfixtemplate_name
      resolved_id   = length(prismasdwan_resource_locator.ipfix_template) > 0 ? prismasdwan_resource_locator.ipfix_template[0].result : null
      resolution_ok = var.ipfixtemplate_name == "" || (length(prismasdwan_resource_locator.ipfix_template) > 0 && prismasdwan_resource_locator.ipfix_template[0].result != null)
    }
    
    overall_resolution_status = (
      prismasdwan_resource_locator.site.result != null &&
      prismasdwan_resource_locator.element.result != null &&
      prismasdwan_resource_locator.ipfix_profile.result != null &&
      (var.ipfixtemplate_name == "" || (length(prismasdwan_resource_locator.ipfix_template) > 0 && prismasdwan_resource_locator.ipfix_template[0].result != null))
    ) ? "success" : "partial_or_failed"
  }
}

# IPFIX Configuration Analysis
output "ipfix_configuration_analysis" {
  description = "Analysis of the IPFIX configuration"
  value = {
    sampling_configuration = {
      algorithm               = var.sampler_algorithm
      time_interval_seconds   = var.sampler_time_interval
      time_spacing_seconds    = var.sampler_time_spacing
      sampling_enabled        = var.sampler_algorithm != "none"
      sampling_rate_per_hour  = var.sampler_algorithm == "time_based" ? 3600 / var.sampler_time_interval : 0
    }
    
    export_configuration = {
      cache_timeout_seconds   = var.export_cache_timeout
      fast_export            = var.export_cache_timeout <= 30
      standard_export        = var.export_cache_timeout >= 30 && var.export_cache_timeout <= 120
      slow_export            = var.export_cache_timeout > 120
    }
    
    collector_configuration = {
      total_collectors       = length(var.collector_configs)
      udp_collectors        = length([for c in var.collector_configs : c if c.protocol == "udp"])
      tcp_collectors        = length([for c in var.collector_configs : c if c.protocol == "tcp"])
      high_availability     = length(var.collector_configs) > 1
      uses_contexts         = length([for c in var.collector_configs : c if c.ipfixcollectorcontext_name != ""]) > 0
    }
    
    filtering_configuration = {
      total_filters         = var.enable_filter_1 ? 1 : 0
      filters_enabled       = var.enable_filter_1
      app_based_filtering   = var.enable_filter_1 && (var.app_def_name_1 != "" || var.app_def_name_2 != "" || var.app_def_name_3 != "")
      prefix_based_filtering = var.enable_filter_1 && (var.src_prefix_filter_name != "" || var.dst_prefix_filter_name != "")
      port_based_filtering  = var.enable_filter_1 && (var.filter_1_enable_src_ports || var.filter_1_enable_dst_ports)
      direction_filtering   = var.enable_filter_1 && var.filter_1_wan_path_direction != null
    }
  }
}

# Deployment Status
output "deployment_status" {
  description = "Element IPFIX deployment status and metadata"
  value = {
    status         = "success"
    deployed_at    = timestamp()
    resource_type  = "element_ipfix"
    resource_count = 1
    
    configuration_summary = {
      element_name         = var.element_name
      site_name           = var.site_name
      ipfix_config_name   = var.ipfix_config_name
      collectors_count    = length(var.collector_configs)
      filters_count       = var.enable_filter_1 ? 1 : 0
      sampling_enabled    = var.sampler_algorithm != "none"
      template_used       = var.ipfixtemplate_name != ""
    }
  }
}

# Performance Analysis
output "performance_analysis" {
  description = "Performance impact analysis of the IPFIX configuration"
  value = {
    export_performance = {
      cache_timeout       = var.export_cache_timeout
      export_frequency    = "every_${var.export_cache_timeout}_seconds"
      performance_impact  = var.export_cache_timeout <= 30 ? "high" : (var.export_cache_timeout <= 120 ? "medium" : "low")
    }
    
    sampling_performance = {
      algorithm          = var.sampler_algorithm
      samples_per_hour   = var.sampler_algorithm == "time_based" ? 3600 / var.sampler_time_interval : 0
      cpu_impact         = var.sampler_algorithm == "none" ? "minimal" : "moderate"
    }
    
    filtering_performance = {
      filter_complexity   = var.enable_filter_1 ? 1 : 0
      processing_overhead = var.enable_filter_1 ? "moderate" : "minimal"
      optimization_level  = var.enable_filter_1 ? "filtered" : "unfiltered"
    }
    
    recommendations = {
      cache_optimization   = var.export_cache_timeout < 60 ? "Consider increasing cache timeout to reduce export frequency" : "Cache timeout is optimal"
      sampling_optimization = var.sampler_algorithm == "none" ? "Consider enabling sampling to reduce data volume" : "Sampling configuration is appropriate"
      filter_optimization = !var.enable_filter_1 ? "Consider adding filters to focus on relevant traffic" : "Filter configuration applied"
    }
  }
}

# Security and Compliance Analysis
output "security_compliance_analysis" {
  description = "Security and compliance analysis of the IPFIX configuration"
  value = {
    data_collection = {
      comprehensive_monitoring = length(var.collector_configs) > 0
      redundant_collection    = length(var.collector_configs) > 1
      secure_transport        = length([for c in var.collector_configs : c if c.protocol == "tcp"]) > 0
    }
    
    traffic_visibility = {
      comprehensive_filtering = var.enable_filter_1
      application_visibility = var.enable_filter_1 && (var.app_def_name_1 != "" || var.app_def_name_2 != "" || var.app_def_name_3 != "")
      network_segmentation   = var.enable_filter_1 && (var.src_prefix_filter_name != "" || var.dst_prefix_filter_name != "")
      traffic_classification = var.enable_filter_1 && length(var.filter_1_priority_traffic_types) > 0
    }
    
    compliance_readiness = {
      audit_trail_available = true
      data_retention_control = true
      selective_monitoring  = var.enable_filter_1
      protocol_coverage     = var.enable_filter_1 && length(var.filter_1_protocols) > 0
    }
    
    security_recommendations = [
      for rec in [
        length(var.collector_configs) == 1 ? "Consider adding redundant collectors for high availability" : null,
        length([for c in var.collector_configs : c if c.protocol == "udp"]) == length(var.collector_configs) ? "Consider using TCP for more reliable transport" : null,
        !var.enable_filter_1 ? "Consider adding filters to focus monitoring on security-relevant traffic" : null
      ] : rec if rec != null
    ]
  }
}

# Validation Status
output "validation_status" {
  description = "Configuration validation results"
  value = {
    collectors_valid         = length(var.collector_configs) >= 1 && length(var.collector_configs) <= 4
    sampling_valid          = contains(["time_based", "none"], var.sampler_algorithm)
    cache_timeout_valid     = var.export_cache_timeout >= 10 && var.export_cache_timeout <= 600
    tags_valid              = length(var.tags) <= 10
    filters_valid            = (var.enable_filter_1 ? 1 : 0) <= 8
    
    overall_validation = (
      length(var.collector_configs) >= 1 && length(var.collector_configs) <= 4 &&
      contains(["time_based", "none"], var.sampler_algorithm) &&
      var.export_cache_timeout >= 10 && var.export_cache_timeout <= 600 &&
      length(var.tags) <= 10 &&
      (var.enable_filter_1 ? 1 : 0) <= 8
    ) ? "valid" : "invalid"
    
    validation_errors = [
      for error in [
        length(var.collector_configs) < 1 || length(var.collector_configs) > 4 ? "Collector count must be between 1 and 4" : null,
        !contains(["time_based", "none"], var.sampler_algorithm) ? "Invalid sampler algorithm" : null,
        var.export_cache_timeout < 10 || var.export_cache_timeout > 600 ? "Cache timeout must be between 10 and 600 seconds" : null,
        length(var.tags) > 10 ? "Too many tags (max 10)" : null
      ] : error if error != null
    ]
  }
}

# Operational Insights
output "operational_insights" {
  description = "Operational insights and recommendations"
  value = {
    monitoring_coverage = {
      element_covered     = var.element_name
      site_covered        = var.site_name
      profile_applied     = var.ipfixprofile_name
      template_applied    = var.ipfixtemplate_name != ""
    }
    
    data_flow_analysis = {
      collection_points   = length(var.collector_configs)
      sampling_ratio      = var.sampler_algorithm == "time_based" ? var.sampler_time_interval : 0
      export_frequency    = var.export_cache_timeout
      estimated_data_rate = var.sampler_algorithm == "time_based" ? "moderate" : "high"
    }
    
    filtering_insights = {
      application_aware = var.enable_filter_1 && (var.app_def_name_1 != "" || var.app_def_name_2 != "" || var.app_def_name_3 != "")
      network_aware = var.enable_filter_1 && (var.src_prefix_filter_name != "" || var.dst_prefix_filter_name != "")
      protocol_aware = var.enable_filter_1 && length(var.filter_1_protocols) > 0
      port_aware = var.enable_filter_1 && (var.filter_1_enable_src_ports || var.filter_1_enable_dst_ports)
    }
    
    traffic_analysis = {
      bidirectional_monitoring = var.enable_filter_1 && var.filter_1_wan_path_direction != null
      priority_traffic_covered = var.enable_filter_1 && length(var.filter_1_priority_traffic_types) > 0
      comprehensive_coverage   = var.enable_filter_1
    }
    
    operational_recommendations = [
      for rec in [
        var.export_cache_timeout > 300 ? "Consider reducing cache timeout for near real-time monitoring" : null,
        !var.enable_filter_1 ? "Enable filtering to reduce data volume and focus on relevant traffic" : null,
        length(var.collector_configs) == 1 ? "Add redundant collectors for high availability" : null,
        var.sampler_algorithm == "none" ? "Consider enabling sampling to reduce resource usage" : null
      ] : rec if rec != null
    ]
  }
}

# Collector Details
output "collector_details" {
  description = "Detailed information about configured collectors"
  value = {
    collector_1 = length(var.collector_configs) >= 1 ? {
      host                     = var.collector_configs[0].host
      host_port               = var.collector_configs[0].host_port
      protocol                = var.collector_configs[0].protocol
      max_message_size        = var.collector_configs[0].max_message_size
      ipfixcollectorcontext_name = var.collector_configs[0].ipfixcollectorcontext_name
      active                  = true
    } : null
    
    collector_2 = length(var.collector_configs) >= 2 ? {
      host                     = var.collector_configs[1].host
      host_port               = var.collector_configs[1].host_port
      protocol                = var.collector_configs[1].protocol
      max_message_size        = var.collector_configs[1].max_message_size
      ipfixcollectorcontext_name = var.collector_configs[1].ipfixcollectorcontext_name
      active                  = true
    } : null
    
    collector_3 = length(var.collector_configs) >= 3 ? {
      host                     = var.collector_configs[2].host
      host_port               = var.collector_configs[2].host_port
      protocol                = var.collector_configs[2].protocol
      max_message_size        = var.collector_configs[2].max_message_size
      ipfixcollectorcontext_name = var.collector_configs[2].ipfixcollectorcontext_name
      active                  = true
    } : null
    
    collector_4 = length(var.collector_configs) >= 4 ? {
      host                     = var.collector_configs[3].host
      host_port               = var.collector_configs[3].host_port
      protocol                = var.collector_configs[3].protocol
      max_message_size        = var.collector_configs[3].max_message_size
      ipfixcollectorcontext_name = var.collector_configs[3].ipfixcollectorcontext_name
      active                  = true
    } : null
    
    summary = {
      total_active_collectors = length(var.collector_configs)
      udp_collectors         = length([for c in var.collector_configs : c if c.protocol == "udp"])
      tcp_collectors         = length([for c in var.collector_configs : c if c.protocol == "tcp"])
      high_availability      = length(var.collector_configs) > 1
    }
  }
}

# Filter Details
output "filter_details" {
  description = "Detailed information about configured filters"
  value = var.enable_filter_1 ? {
    filter_1 = {
      wan_path_direction     = var.filter_1_wan_path_direction
      rtp_transport_type     = var.filter_1_rtp_transport_type
      app_def_names         = [var.app_def_name_1, var.app_def_name_2, var.app_def_name_3]
      priority_traffic_types = var.filter_1_priority_traffic_types
      protocols             = var.filter_1_protocols
      src_prefix_filter_name = var.src_prefix_filter_name
      dst_prefix_filter_name = var.dst_prefix_filter_name
      ipfix_filter_context_names = [var.ipfix_filter_context_name_1, var.ipfix_filter_context_name_2]
      src_port_range = var.filter_1_enable_src_ports ? {
        start = var.filter_1_src_port_start
        end   = var.filter_1_src_port_end
      } : null
      dst_port_range = var.filter_1_enable_dst_ports ? {
        start = var.filter_1_dst_port_start
        end   = var.filter_1_dst_port_end
      } : null
      active = true
    }
    
    summary = {
      total_active_filters    = 1
      application_filtering   = var.app_def_name_1 != "" || var.app_def_name_2 != "" || var.app_def_name_3 != ""
      network_filtering       = var.src_prefix_filter_name != "" || var.dst_prefix_filter_name != ""
      port_filtering         = var.filter_1_enable_src_ports || var.filter_1_enable_dst_ports
      protocol_filtering     = length(var.filter_1_protocols) > 0
      direction_filtering    = var.filter_1_wan_path_direction != null
    }
  } : {
    summary = {
      total_active_filters = 0
      filtering_disabled   = true
    }
  }
}

# Resource Locator Results
output "resource_locator_results" {
  description = "Results from all resource locators"
  value = {
    site = {
      name   = var.site_name
      id     = prismasdwan_resource_locator.site.result
      status = prismasdwan_resource_locator.site.result != null ? "resolved" : "failed"
    }
    
    element = {
      name   = var.element_name
      id     = prismasdwan_resource_locator.element.result
      status = prismasdwan_resource_locator.element.result != null ? "resolved" : "failed"
    }
    
    ipfix_profile = {
      name   = var.ipfixprofile_name
      id     = prismasdwan_resource_locator.ipfix_profile.result
      status = prismasdwan_resource_locator.ipfix_profile.result != null ? "resolved" : "failed"
    }
    
    ipfix_template = {
      name   = var.ipfixtemplate_name
      id     = length(prismasdwan_resource_locator.ipfix_template) > 0 ? prismasdwan_resource_locator.ipfix_template[0].result : null
      status = var.ipfixtemplate_name == "" ? "not_required" : (length(prismasdwan_resource_locator.ipfix_template) > 0 && prismasdwan_resource_locator.ipfix_template[0].result != null ? "resolved" : "failed")
    }
    
    app_definitions = {
      app_def_1 = {
        name   = var.app_def_name_1
        id     = length(prismasdwan_resource_locator.app_def_1) > 0 ? prismasdwan_resource_locator.app_def_1[0].result : null
        status = var.app_def_name_1 == "" ? "not_required" : (length(prismasdwan_resource_locator.app_def_1) > 0 && prismasdwan_resource_locator.app_def_1[0].result != null ? "resolved" : "failed")
      }
      app_def_2 = {
        name   = var.app_def_name_2
        id     = length(prismasdwan_resource_locator.app_def_2) > 0 ? prismasdwan_resource_locator.app_def_2[0].result : null
        status = var.app_def_name_2 == "" ? "not_required" : (length(prismasdwan_resource_locator.app_def_2) > 0 && prismasdwan_resource_locator.app_def_2[0].result != null ? "resolved" : "failed")
      }
      app_def_3 = {
        name   = var.app_def_name_3
        id     = length(prismasdwan_resource_locator.app_def_3) > 0 ? prismasdwan_resource_locator.app_def_3[0].result : null
        status = var.app_def_name_3 == "" ? "not_required" : (length(prismasdwan_resource_locator.app_def_3) > 0 && prismasdwan_resource_locator.app_def_3[0].result != null ? "resolved" : "failed")
      }
    }
    
    prefix_filters = {
      src_prefix_filter = {
        name   = var.src_prefix_filter_name
        id     = length(prismasdwan_resource_locator.src_prefix_filter) > 0 ? prismasdwan_resource_locator.src_prefix_filter[0].result : null
        status = var.src_prefix_filter_name == "" ? "not_required" : (length(prismasdwan_resource_locator.src_prefix_filter) > 0 && prismasdwan_resource_locator.src_prefix_filter[0].result != null ? "resolved" : "failed")
      }
      dst_prefix_filter = {
        name   = var.dst_prefix_filter_name
        id     = length(prismasdwan_resource_locator.dst_prefix_filter) > 0 ? prismasdwan_resource_locator.dst_prefix_filter[0].result : null
        status = var.dst_prefix_filter_name == "" ? "not_required" : (length(prismasdwan_resource_locator.dst_prefix_filter) > 0 && prismasdwan_resource_locator.dst_prefix_filter[0].result != null ? "resolved" : "failed")
      }
    }
  }
}
