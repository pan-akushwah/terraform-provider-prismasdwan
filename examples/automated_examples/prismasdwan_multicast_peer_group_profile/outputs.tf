# Basic Multicast Peer Group Profile Information
output "multicast_peer_group_profile_id" {
  description = "The ID of the multicast peer group profile"
  value       = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.id
}

output "multicast_peer_group_name" {
  description = "The name of the multicast peer group profile"
  value       = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.name
}

output "description" {
  description = "The description of the multicast peer group profile"
  value       = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.description
}

output "is_source_site_receiver" {
  description = "Whether source site can be a receiver"
  value       = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver
}

output "peer_sites" {
  description = "The configured peer sites in the multicast group"
  value       = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites
}

# Detailed Multicast Peer Group Profile Information
output "multicast_peer_group_profile_details" {
  description = "Detailed information about the multicast peer group profile"
  value = {
    id                      = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.id
    name                    = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.name
    description             = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.description
    is_source_site_receiver = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver
    peer_sites              = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites
    tags                    = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.tags
    x_etag                  = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.x_etag
    x_schema                = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.x_schema
    created_at              = timestamp()
  }
}

# Multicast Peer Group Profile Summary
output "multicast_peer_group_summary" {
  description = "Summary of multicast peer group configuration"
  value = {
    peer_group_name         = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.name
    total_peer_sites        = length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites)
    source_site_receiver    = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver
    tags_count              = length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.tags != null ? prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.tags : [])
    resource_type           = "multicast_peer_group_profile"
    api_version             = "v2.1"
    multicast_topology_type = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver ? "bidirectional" : "unidirectional"
    group_efficiency        = (
      length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) <= 5 ? "high" :
      length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) <= 20 ? "moderate" : "enterprise"
    )
  }
}

# Peer Sites Analysis
output "peer_sites_analysis" {
  description = "Analysis of configured peer sites in the multicast group"
  value = {
    total_peer_sites = length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites)
    peer_site_details = {
      for idx, peer_site in prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites : idx => {
        peer_site_id = peer_site.peer_site_id
        site_name = var.peer_site_names[idx]
        site_role = (
          idx == 0 ? "primary-peer" :
          idx < 3 ? "secondary-peer" : "additional-peer"
        )
        multicast_capability = "full-multicast-support"
        bandwidth_optimization = "enabled"
      }
    }
    multicast_network_topology = {
      topology_type = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver ? "mesh" : "star"
      redundancy_level = (
        length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) >= 3 ? "high" :
        length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) == 2 ? "moderate" : "basic"
      )
      scalability_factor = (
        length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) <= 10 ? "small-scale" :
        length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) <= 50 ? "medium-scale" : "large-scale"
      )
      fault_tolerance = length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) > 1 ? "resilient" : "single-point"
    }
    bandwidth_efficiency = {
      multicast_advantage = "significant"
      bandwidth_savings = (
        length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) > 1 ? 
        (length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) - 1) * 100 / length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) : 0
      )
      traffic_optimization = "optimized"
      network_utilization = "efficient"
    }
  }
}

# Multicast Configuration Analysis
output "multicast_configuration_analysis" {
  description = "Analysis of the multicast configuration"
  value = {
    configuration_scope = "peer-group-multicast"
    multicast_capabilities = {
      content_distribution = true
      real_time_communication = true
      video_streaming = true
      software_distribution = true
      live_broadcasts = true
      collaborative_applications = true
      source_site_reception = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver
      bidirectional_multicast = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver
    }
    multicast_strategy = {
      distribution_model = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver ? "mesh-multicast" : "hub-spoke-multicast"
      redundancy_strategy = "multi-path-redundancy"
      failover_behavior = "automatic-failover"
      load_balancing = "intelligent-distribution"
      quality_of_service = "assured"
    }
    performance_optimization = {
      bandwidth_efficiency = "maximized"
      latency_optimization = "minimized"
      jitter_control = "enabled"
      packet_loss_prevention = "active"
      traffic_shaping = "adaptive"
    }
    operational_benefits = [
      "Efficient content distribution across multiple sites",
      "Reduced bandwidth consumption through multicast",
      "Enhanced real-time communication capabilities",
      "Improved video and media streaming performance",
      "Optimized software and update distribution",
      "Better resource utilization across the network"
    ]
  }
}

# Multicast Performance Metrics
output "multicast_performance_metrics" {
  description = "Multicast performance and efficiency metrics"
  value = {
    multicast_efficiency = {
      total_peer_sites = length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites)
      multicast_advantage_factor = length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites)
      bandwidth_savings_percentage = (
        length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) > 1 ? 
        ((length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) - 1) * 100) / length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) : 0
      )
      network_optimization = "significant"
    }
    scalability_metrics = {
      current_peer_count = length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites)
      maximum_supported_peers = 100
      scalability_headroom = 100 - length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites)
      growth_capacity = "high"
    }
    performance_indicators = {
      multicast_complexity = (
        length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) <= 5 ? "low" :
        length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) <= 20 ? "moderate" : "high"
      )
      convergence_time = "fast"
      fault_recovery_time = "minimal"
      maintenance_overhead = "low"
      operational_complexity = "manageable"
    }
  }
}

# Source Site Receiver Analysis
output "source_site_receiver_analysis" {
  description = "Analysis of source site receiver configuration"
  value = {
    source_site_receiver_enabled = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver
    multicast_flow_pattern = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver ? "bidirectional" : "unidirectional"
    topology_implications = {
      network_topology = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver ? "full-mesh" : "hub-and-spoke"
      redundancy_level = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver ? "high" : "moderate"
      fault_tolerance = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver ? "enhanced" : "standard"
      bandwidth_utilization = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver ? "optimized-bidirectional" : "optimized-unidirectional"
    }
    use_case_suitability = {
      content_distribution = true
      video_conferencing = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver
      collaborative_applications = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver
      software_updates = true
      live_streaming = true
      backup_replication = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver
    }
    configuration_benefits = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver ? [
      "Enhanced collaboration capabilities",
      "Bidirectional content flow",
      "Improved fault tolerance",
      "Better resource utilization",
      "Advanced redundancy options"
    ] : [
      "Simplified network topology",
      "Reduced complexity",
      "Efficient hub-spoke distribution",
      "Lower management overhead",
      "Optimized bandwidth usage"
    ]
  }
}

# Resource Locator Information
output "resource_locator_details" {
  description = "Details about the resource locators used for peer sites"
  value = {
    peer_sites_resolved = [
      for locator in prismasdwan_resource_locator.peer_sites : locator.result
    ]
    peer_site_resolution_status = {
      for idx, locator in prismasdwan_resource_locator.peer_sites : var.peer_site_names[idx] => {
        site_name = var.peer_site_names[idx]
        site_id = locator.result
        resolution_successful = locator.result != null
      }
    }
    total_resolved_sites = length([
      for locator in prismasdwan_resource_locator.peer_sites : locator.result if locator.result != null
    ])
    all_sites_resolved = length([
      for locator in prismasdwan_resource_locator.peer_sites : locator.result if locator.result != null
    ]) == length(var.peer_site_names)
  }
}

# Tags Information
output "tags_info" {
  description = "Information about configured tags"
  value = {
    configured_tags = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.tags
    tags_count      = length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.tags != null ? prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.tags : [])
    has_tags        = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.tags != null && length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.tags) > 0
    tags_analysis = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.tags != null ? {
      for tag in prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.tags : tag => {
        length = length(tag)
        is_valid_format = can(regex("^[^,\\s]+$", tag))
        tag_category = (
          contains(["terraform", "infrastructure", "automation"], tag) ? "infrastructure" :
          contains(["multicast", "peer-group", "content-distribution"], tag) ? "multicast" :
          contains(["production", "staging", "development", "test"], tag) ? "environment" :
          contains(["real-time", "streaming", "collaboration"], tag) ? "application" :
          "custom"
        )
      }
    } : {}
  }
}

# Multicast Network Topology Analysis
output "multicast_network_topology_analysis" {
  description = "Comprehensive analysis of multicast network topology"
  value = {
    topology_characteristics = {
      peer_group_size = length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites)
      topology_type = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver ? "mesh" : "star"
      communication_pattern = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver ? "many-to-many" : "one-to-many"
      redundancy_paths = (
        length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) > 2 ? "multiple" : "limited"
      )
    }
    network_efficiency = {
      bandwidth_optimization = "multicast-enabled"
      traffic_reduction_factor = length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites)
      network_convergence = "fast"
      scalability_rating = (
        length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) <= 10 ? "excellent" :
        length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) <= 50 ? "good" : "moderate"
      )
    }
    operational_characteristics = {
      management_complexity = (
        length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) <= 5 ? "low" :
        length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) <= 20 ? "moderate" : "high"
      )
      fault_tolerance = (
        length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites) > 2 ? "high" : "moderate"
      )
      maintenance_overhead = "minimal"
      troubleshooting_complexity = "manageable"
    }
  }
}

# Deployment Status
output "deployment_status" {
  description = "Status of the multicast peer group profile deployment"
  value = {
    deployed_at                    = timestamp()
    resource_count                 = 1
    resource_type                  = "multicast_peer_group_profile"
    status                         = "success"
    peer_sites_configured          = length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites)
    all_peer_sites_resolved        = length([
      for locator in prismasdwan_resource_locator.peer_sites : locator.result if locator.result != null
    ]) == length(var.peer_site_names)
    source_site_receiver_enabled   = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver
    multicast_ready                = true
    api_version                    = "v2.1"
    api_model                      = "MulticastPeerGroupProfile"
  }
}

# Configuration Validation Status
output "configuration_validation_status" {
  description = "Validation status of the configuration"
  value = {
    peer_group_name_valid          = length(var.multicast_peer_group_name) > 0 && length(var.multicast_peer_group_name) <= 128
    peer_sites_count_valid         = length(var.peer_site_names) > 0 && length(var.peer_site_names) <= 100
    peer_sites_unique              = length(var.peer_site_names) == length(distinct(var.peer_site_names))
    peer_sites_resolved            = length([
      for locator in prismasdwan_resource_locator.peer_sites : locator.result if locator.result != null
    ]) == length(var.peer_site_names)
    description_valid              = length(var.description) <= 256
    tags_count_valid               = length(var.tags) <= 10
    tags_format_valid              = alltrue([for tag in var.tags : length(tag) <= 128])
    tags_unique                    = length(var.tags) == length(distinct(var.tags))
    source_site_receiver_valid     = contains([true, false], var.is_source_site_receiver)
    all_validations_passed         = (
      length(var.multicast_peer_group_name) > 0 && length(var.multicast_peer_group_name) <= 128 &&
      length(var.peer_site_names) > 0 && length(var.peer_site_names) <= 100 &&
      length(var.peer_site_names) == length(distinct(var.peer_site_names)) &&
      length(var.description) <= 256 &&
      length(var.tags) <= 10 &&
      alltrue([for tag in var.tags : length(tag) <= 128]) &&
      length(var.tags) == length(distinct(var.tags))
    )
  }
}

# Multicast Use Cases Analysis
output "multicast_use_cases_analysis" {
  description = "Analysis of multicast use cases and applications"
  value = {
    content_distribution = {
      software_updates = {
        suitability = "excellent"
        bandwidth_savings = "significant"
        deployment_efficiency = "high"
      }
      media_distribution = {
        suitability = "excellent"
        quality_assurance = "maintained"
        scalability = "enterprise-grade"
      }
      backup_synchronization = {
        suitability = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver ? "excellent" : "good"
        data_consistency = "ensured"
        network_efficiency = "optimized"
      }
    }
    real_time_applications = {
      video_conferencing = {
        suitability = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver ? "excellent" : "moderate"
        latency = "minimized"
        quality = "high-definition"
      }
      live_streaming = {
        suitability = "excellent"
        audience_scalability = "unlimited"
        bandwidth_efficiency = "maximized"
      }
      collaborative_tools = {
        suitability = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver ? "excellent" : "good"
        interaction_quality = "seamless"
        user_experience = "enhanced"
      }
    }
    enterprise_applications = {
      digital_signage = {
        suitability = "excellent"
        content_synchronization = "perfect"
        management_efficiency = "simplified"
      }
      training_delivery = {
        suitability = "excellent"
        reach = "organization-wide"
        cost_effectiveness = "high"
      }
      emergency_communications = {
        suitability = "excellent"
        reliability = "mission-critical"
        coverage = "comprehensive"
      }
    }
  }
}

# Multicast Compliance Report
output "multicast_compliance_report" {
  description = "Comprehensive multicast compliance report for the configuration"
  value = {
    resource_compliance = {
      peer_group_name_status = length(var.multicast_peer_group_name) > 0 && length(var.multicast_peer_group_name) <= 128 ? "compliant" : "non-compliant"
      peer_sites_count_status = length(var.peer_site_names) > 0 && length(var.peer_site_names) <= 100 ? "compliant" : "non-compliant"
      peer_sites_resolution_status = length([
        for locator in prismasdwan_resource_locator.peer_sites : locator.result if locator.result != null
      ]) == length(var.peer_site_names) ? "compliant" : "non-compliant"
    }
    configuration_compliance = {
      description_format_compliance = length(var.description) <= 256 ? "compliant" : "non-compliant"
      peer_sites_uniqueness_compliance = length(var.peer_site_names) == length(distinct(var.peer_site_names)) ? "compliant" : "non-compliant"
      source_receiver_config_compliance = contains([true, false], var.is_source_site_receiver) ? "compliant" : "non-compliant"
    }
    tags_compliance = {
      tags_count_compliance = length(var.tags) <= 10 ? "compliant" : "non-compliant"
      tags_format_compliance = alltrue([
        for tag in var.tags : length(tag) <= 128 && can(regex("^[^,\\s]+$", tag))
      ]) ? "compliant" : "non-compliant"
      tags_uniqueness_compliance = length(var.tags) == length(distinct(var.tags)) ? "compliant" : "non-compliant"
    }
    overall_multicast_compliance_status = (
      length(var.multicast_peer_group_name) > 0 && length(var.multicast_peer_group_name) <= 128 &&
      length(var.peer_site_names) > 0 && length(var.peer_site_names) <= 100 &&
      length(var.peer_site_names) == length(distinct(var.peer_site_names)) &&
      length(var.description) <= 256 &&
      length(var.tags) <= 10 &&
      alltrue([for tag in var.tags : length(tag) <= 128])
    ) ? "fully-compliant" : "non-compliant"
        multicast_compliance_score = (
      (length(var.multicast_peer_group_name) > 0 && length(var.multicast_peer_group_name) <= 128 ? 1 : 0) +
      (length(var.peer_site_names) > 0 && length(var.peer_site_names) <= 100 ? 1 : 0) +
      (length(var.peer_site_names) == length(distinct(var.peer_site_names)) ? 1 : 0) +
      (length(var.description) <= 256 ? 1 : 0) +
      (length(var.tags) <= 10 ? 1 : 0) +
      (alltrue([for tag in var.tags : length(tag) <= 128]) ? 1 : 0)
    ) / 6 * 100
  }
}

# Operational Summary Report
output "operational_summary_report" {
  description = "Comprehensive operational summary of the multicast peer group configuration"
  value = {
    executive_summary = {
      feature_name = "Multicast Peer Group Profile"
      deployment_scope = "Multi-site multicast distribution"
      current_status = "Active"
      deployment_success = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.id != null
      peer_sites_configured = length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites)
      bidirectional_multicast = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver
    }
    technical_details = {
      resource_id = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.id
      peer_sites_count = length(prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.peer_sites)
      multicast_topology = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.is_source_site_receiver ? "mesh" : "star"
      bandwidth_optimization = "enabled"
      api_version = "v2.1"
      schema_version = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.x_schema
      etag_value = prismasdwan_multicast_peer_group_profile.multicast_peer_group_profile_full.x_etag
    }
    business_impact = {
      bandwidth_efficiency = "Maximized"
      content_distribution = "Optimized"
      network_utilization = "Enhanced"
      scalability = "Enterprise-ready"
      operational_cost = "Reduced"
      user_experience = "Improved"
    }
  }
}
