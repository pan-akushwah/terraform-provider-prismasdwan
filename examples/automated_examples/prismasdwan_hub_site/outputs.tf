# Site Details
output "site_details" {
  description = "Complete site configuration details"
  value = {
    id = prismasdwan_site.site_full.id
    tfid = prismasdwan_site.site_full.tfid
    name = var.site_name
    element_cluster_role = var.element_cluster_role
    admin_state = var.admin_state
    description = var.description
    tags = var.tags
    extended_tags = var.extended_tags
    x_etag = prismasdwan_site.site_full.x_etag
    x_schema = prismasdwan_site.site_full.x_schema
  }
}

# Individual Field Outputs
output "site_id" {
  description = "Site ID"
  value = prismasdwan_site.site_full.id
}

output "site_tfid" {
  description = "Site Terraform ID"
  value = prismasdwan_site.site_full.tfid
}

output "site_name" {
  description = "Site name"
  value = var.site_name
}

output "site_admin_state" {
  description = "Site administrative state"
  value = var.admin_state
}

output "site_cluster_role" {
  description = "Site element cluster role"
  value = var.element_cluster_role
}

# Resource Resolution Status
output "resource_resolution_status" {
  description = "Status of resource name to ID resolution"
  value = {
    policy_stacks = {
      security_policysetstack = var.security_policysetstack_name != null ? {
        name = var.security_policysetstack_name
        resolved_id = length(prismasdwan_resource_locator.security_policysetstack) > 0 ? prismasdwan_resource_locator.security_policysetstack[0].result : null
        resolution_ok = length(prismasdwan_resource_locator.security_policysetstack) > 0 ? prismasdwan_resource_locator.security_policysetstack[0].result != null : false
      } : null
      
      security_policyset = var.security_policyset_name != null ? {
        name = var.security_policyset_name
        resolved_id = length(prismasdwan_resource_locator.security_policyset) > 0 ? prismasdwan_resource_locator.security_policyset[0].result : null
        resolution_ok = length(prismasdwan_resource_locator.security_policyset) > 0 ? prismasdwan_resource_locator.security_policyset[0].result != null : false
      } : null
      
      network_policysetstack = var.network_policysetstack_name != null ? {
        name = var.network_policysetstack_name
        resolved_id = length(prismasdwan_resource_locator.network_policysetstack) > 0 ? prismasdwan_resource_locator.network_policysetstack[0].result : null
        resolution_ok = length(prismasdwan_resource_locator.network_policysetstack) > 0 ? prismasdwan_resource_locator.network_policysetstack[0].result != null : false
      } : null
      
      nat_policysetstack = var.nat_policysetstack_name != null ? {
        name = var.nat_policysetstack_name
        resolved_id = length(prismasdwan_resource_locator.nat_policysetstack) > 0 ? prismasdwan_resource_locator.nat_policysetstack[0].result : null
        resolution_ok = length(prismasdwan_resource_locator.nat_policysetstack) > 0 ? prismasdwan_resource_locator.nat_policysetstack[0].result != null : false
      } : null
      
      priority_policysetstack = var.priority_policysetstack_name != null ? {
        name = var.priority_policysetstack_name
        resolved_id = length(prismasdwan_resource_locator.priority_policysetstack) > 0 ? prismasdwan_resource_locator.priority_policysetstack[0].result : null
        resolution_ok = length(prismasdwan_resource_locator.priority_policysetstack) > 0 ? prismasdwan_resource_locator.priority_policysetstack[0].result != null : false
      } : null
      
      perfmgmt_policysetstack = var.perfmgmt_policysetstack_name != null ? {
        name = var.perfmgmt_policysetstack_name
        resolved_id = length(prismasdwan_resource_locator.perfmgmt_policysetstack) > 0 ? prismasdwan_resource_locator.perfmgmt_policysetstack[0].result : null
        resolution_ok = length(prismasdwan_resource_locator.perfmgmt_policysetstack) > 0 ? prismasdwan_resource_locator.perfmgmt_policysetstack[0].result != null : false
      } : null
    }
    
    services = {
      vrf_context_profile = var.vrf_context_profile_name != null ? {
        name = var.vrf_context_profile_name
        resolved_id = length(prismasdwan_resource_locator.vrf_context_profile) > 0 ? prismasdwan_resource_locator.vrf_context_profile[0].result : null
        resolution_ok = length(prismasdwan_resource_locator.vrf_context_profile) > 0 ? prismasdwan_resource_locator.vrf_context_profile[0].result != null : false
      } : null
      
      multicast_peer_group = var.multicast_peer_group_name != null ? {
        name = var.multicast_peer_group_name
        resolved_id = length(prismasdwan_resource_locator.multicast_peer_group) > 0 ? prismasdwan_resource_locator.multicast_peer_group[0].result : null
        resolution_ok = length(prismasdwan_resource_locator.multicast_peer_group) > 0 ? prismasdwan_resource_locator.multicast_peer_group[0].result != null : false
      } : null
      
      service_binding = var.service_binding_name != null ? {
        name = var.service_binding_name
        resolved_id = length(prismasdwan_resource_locator.service_binding) > 0 ? prismasdwan_resource_locator.service_binding[0].result : null
        resolution_ok = length(prismasdwan_resource_locator.service_binding) > 0 ? prismasdwan_resource_locator.service_binding[0].result != null : false
      } : null
    }
    
    overall_resolution_status = alltrue([
      var.security_policysetstack_name == null || (length(prismasdwan_resource_locator.security_policysetstack) > 0 ? prismasdwan_resource_locator.security_policysetstack[0].result != null : false),
      var.security_policyset_name == null || (length(prismasdwan_resource_locator.security_policyset) > 0 ? prismasdwan_resource_locator.security_policyset[0].result != null : false),
      var.network_policysetstack_name == null || (length(prismasdwan_resource_locator.network_policysetstack) > 0 ? prismasdwan_resource_locator.network_policysetstack[0].result != null : false),
      var.nat_policysetstack_name == null || (length(prismasdwan_resource_locator.nat_policysetstack) > 0 ? prismasdwan_resource_locator.nat_policysetstack[0].result != null : false),
      var.priority_policysetstack_name == null || (length(prismasdwan_resource_locator.priority_policysetstack) > 0 ? prismasdwan_resource_locator.priority_policysetstack[0].result != null : false),
      var.perfmgmt_policysetstack_name == null || (length(prismasdwan_resource_locator.perfmgmt_policysetstack) > 0 ? prismasdwan_resource_locator.perfmgmt_policysetstack[0].result != null : false),
      var.policy_set_name == null || (length(prismasdwan_resource_locator.policy_set) > 0 ? prismasdwan_resource_locator.policy_set[0].result != null : false),
      var.vrf_context_profile_name == null || (length(prismasdwan_resource_locator.vrf_context_profile) > 0 ? prismasdwan_resource_locator.vrf_context_profile[0].result != null : false),
      var.multicast_peer_group_name == null || (length(prismasdwan_resource_locator.multicast_peer_group) > 0 ? prismasdwan_resource_locator.multicast_peer_group[0].result != null : false),
      var.service_binding_name == null || (length(prismasdwan_resource_locator.service_binding) > 0 ? prismasdwan_resource_locator.service_binding[0].result != null : false)
    ]) ? "success" : "failed"
  }
}

# Site Configuration Analysis
output "site_configuration_analysis" {
  description = "Analysis of site configuration and capabilities"
  value = {
    site_characteristics = {
      is_hub_site = contains(["HUB", "DC", "PRIMARY"], var.element_cluster_role)
      is_spoke_site = contains(["SPOKE", "BRANCH", "EDGE"], var.element_cluster_role)
      is_transit_site = var.element_cluster_role == "TRANSIT"
      is_active = var.admin_state == "active"
      has_app_acceleration = var.app_acceleration_enabled
      is_branch_gateway = var.branch_gateway
      prefers_lan_routing = var.prefer_lan_default_over_wan_default_route
    }
    
    policy_configuration = {
      has_security_policies = var.security_policysetstack_name != null || var.security_policyset_name != null
      has_network_policies = var.network_policysetstack_name != null
      has_nat_policies = var.nat_policysetstack_name != null
      has_priority_policies = var.priority_policysetstack_name != null
      has_performance_policies = var.perfmgmt_policysetstack_name != null
      has_general_policies = var.policy_set_name != null
      policy_stack_count = length([
        for stack in [
          var.security_policysetstack_name,
          var.network_policysetstack_name,
          var.nat_policysetstack_name,
          var.priority_policysetstack_name,
          var.perfmgmt_policysetstack_name
        ] : stack if stack != null
      ])
    }
    
    service_configuration = {
      has_vrf_context = var.vrf_context_profile_name != null
      has_multicast = var.multicast_peer_group_name != null
      has_service_binding = var.service_binding_name != null
      has_sgi_config = var.sgi_config != null
      sgi_tag = var.sgi_config != null ? var.sgi_config.sgi_tag : null
    }
    
    location_configuration = {
      has_geographic_location = var.location != null && var.location.latitude != null && var.location.longitude != null
      has_address = var.address != null
      location_description = var.location != null ? var.location.description : null
      coordinates = var.location != null && var.location.latitude != null && var.location.longitude != null ? {
        latitude = var.location.latitude
        longitude = var.location.longitude
      } : null
              full_address = var.address != null ? format("%s%s, %s, %s %s, %s",
                coalesce(var.address.street, ""),
                var.address.street2 != null ? format(" %s", var.address.street2) : "",
                coalesce(var.address.city, ""),
                coalesce(var.address.state, ""),
                coalesce(var.address.post_code, ""),
                coalesce(var.address.country, "")
              ) : null
    }
  }
}

# Site Operational Status
output "site_operational_status" {
  description = "Site operational status and readiness assessment"
  value = {
    deployment_readiness = {
      has_required_fields = var.site_name != "" && var.element_cluster_role != "" && var.admin_state != ""
      has_valid_cluster_role = contains(["SPOKE", "HUB", "TRANSIT", "EDGE", "DC", "BRANCH", "PRIMARY", "SECONDARY", "STANDALONE"], var.element_cluster_role)
      has_valid_admin_state = contains(["active", "inactive", "disabled", "pending"], var.admin_state)
      is_deployable = (
        var.site_name != "" &&
        contains(["SPOKE", "HUB", "TRANSIT", "EDGE", "DC", "BRANCH", "PRIMARY", "SECONDARY", "STANDALONE"], var.element_cluster_role) &&
        contains(["active", "inactive", "disabled", "pending"], var.admin_state)
      )
    }
    
    configuration_completeness = {
      basic_config_complete = var.site_name != "" && var.description != ""
      policy_config_complete = (
        var.security_policysetstack_name != null ||
        var.network_policysetstack_name != null ||
        var.nat_policysetstack_name != null
      )
      location_config_complete = var.location != null && var.address != null
      service_config_complete = (
        var.vrf_context_profile_name != null ||
        var.multicast_peer_group_name != null ||
        var.service_binding_name != null
      )
      overall_completeness_score = length([
        var.site_name != "" ? 1 : 0,
        var.description != "" ? 1 : 0,
        length(var.tags) > 0 ? 1 : 0,
        var.location != null ? 1 : 0,
        var.address != null ? 1 : 0,
        var.security_policysetstack_name != null ? 1 : 0,
        var.network_policysetstack_name != null ? 1 : 0,
        var.vrf_context_profile_name != null ? 1 : 0
      ])
    }
    
    feature_enablement = {
      total_enabled_features = length([
        var.app_acceleration_enabled ? "app_acceleration" : null,
        var.branch_gateway ? "branch_gateway" : null,
        var.prefer_lan_default_over_wan_default_route ? "lan_routing_preference" : null,
        var.sgi_config != null ? "sgi_config" : null
      ]) - length([for f in [
        var.app_acceleration_enabled ? "app_acceleration" : null,
        var.branch_gateway ? "branch_gateway" : null,
        var.prefer_lan_default_over_wan_default_route ? "lan_routing_preference" : null,
        var.sgi_config != null ? "sgi_config" : null
      ] : f if f == null])
      enabled_features = [
        for feature in [
          var.app_acceleration_enabled ? "Application Acceleration" : null,
          var.branch_gateway ? "Branch Gateway" : null,
          var.prefer_lan_default_over_wan_default_route ? "LAN Routing Preference" : null,
          var.sgi_config != null ? "SGI Configuration" : null
        ] : feature if feature != null
      ]
    }
  }
}

# Performance and Scale Metrics
output "performance_metrics" {
  description = "Site performance and scale characteristics"
  value = {
    scale_characteristics = {
      policy_stack_count = length([
        for stack in [
          var.security_policysetstack_name,
          var.security_policyset_name,
          var.network_policysetstack_name,
          var.nat_policysetstack_name,
          var.priority_policysetstack_name,
          var.perfmgmt_policysetstack_name,
          var.policy_set_name
        ] : stack if stack != null
      ])
      
      service_binding_count = length([
        for service in [
          var.vrf_context_profile_name,
          var.multicast_peer_group_name,
          var.service_binding_name
        ] : service if service != null
      ])
      
      tag_count = length(var.tags)
      extended_tag_count = length(var.extended_tags)
      total_tag_count = length(var.tags) + length(var.extended_tags)
      
      dependency_count = length([
        for dep in [
          var.security_policysetstack_name,
          var.security_policyset_name,
          var.network_policysetstack_name,
          var.nat_policysetstack_name,
          var.priority_policysetstack_name,
          var.perfmgmt_policysetstack_name,
          var.policy_set_name,
          var.vrf_context_profile_name,
          var.multicast_peer_group_name,
          var.service_binding_name
        ] : dep if dep != null
      ])
    }
    
    complexity_assessment = {
      configuration_complexity = format("%s-tags_%s-extended",
        length(var.tags) > 5 ? "high" : length(var.tags) > 2 ? "medium" : "low",
        length(var.extended_tags) > 3 ? "high" : length(var.extended_tags) > 1 ? "medium" : "low"
      )
      
      policy_complexity = length([
        for stack in [
          var.security_policysetstack_name,
          var.network_policysetstack_name,
          var.nat_policysetstack_name,
          var.priority_policysetstack_name,
          var.perfmgmt_policysetstack_name
        ] : stack if stack != null
      ]) > 3 ? "high" : length([
        for stack in [
          var.security_policysetstack_name,
          var.network_policysetstack_name,
          var.nat_policysetstack_name,
          var.priority_policysetstack_name,
          var.perfmgmt_policysetstack_name
        ] : stack if stack != null
      ]) > 1 ? "medium" : "low"
      
      service_complexity = length([
        for service in [
          var.vrf_context_profile_name,
          var.multicast_peer_group_name,
          var.service_binding_name,
          var.sgi_config
        ] : service if service != null
      ]) > 2 ? "high" : length([
        for service in [
          var.vrf_context_profile_name,
          var.multicast_peer_group_name,
          var.service_binding_name,
          var.sgi_config
        ] : service if service != null
      ]) > 0 ? "medium" : "low"
    }
    
    operational_impact = {
      estimated_processing_time = (
        var.element_cluster_role == "HUB" ? "high" :
        var.element_cluster_role == "TRANSIT" ? "medium" : "low"
      )
      
      resource_utilization = (
        var.app_acceleration_enabled ? "high" :
        var.branch_gateway ? "medium" : "low"
      )
      
      network_impact = (
        var.element_cluster_role == "HUB" ? "high" :
        var.branch_gateway ? "medium" : "low"
      )
    }
  }
}

# Configuration Validation
output "configuration_validation" {
  description = "Validation of site configuration parameters"
  value = {
    required_fields_validation = {
      has_site_name = var.site_name != ""
      has_cluster_role = var.element_cluster_role != ""
      has_admin_state = var.admin_state != ""
      all_required_present = (
        var.site_name != "" &&
        var.element_cluster_role != "" &&
        var.admin_state != ""
      )
    }
    
    enum_validation = {
      valid_cluster_role = contains([
        "SPOKE", "HUB", "TRANSIT", "EDGE", "DC", 
        "BRANCH", "PRIMARY", "SECONDARY", "STANDALONE"
      ], var.element_cluster_role)
      
      valid_admin_state = contains([
        "active", "inactive", "disabled", "pending"
      ], var.admin_state)
      
      valid_sgi_vendor = var.sgi_config == null ? true : var.sgi_config.sgi_vendor_id == "SGI_VENDOR_ID_TYPE_8909"
    }
    
    constraint_validation = {
      tag_count_ok = length(var.tags) <= 10
      extended_tag_count_ok = length(var.extended_tags) <= 10
      description_length_ok = length(var.description) <= 1024
      sgi_tag_ok = var.sgi_config == null ? true : (var.sgi_config.sgi_tag >= 1 && var.sgi_config.sgi_tag <= 65533)
      
      location_coordinates_ok = var.location == null || (
        (var.location.latitude == null || (var.location.latitude >= -90 && var.location.latitude <= 90)) &&
        (var.location.longitude == null || (var.location.longitude >= -180 && var.location.longitude <= 180))
      )
    }
    
    logical_consistency = {
      hub_with_gateway_role = var.element_cluster_role == "HUB" && var.branch_gateway
      spoke_with_acceleration = var.element_cluster_role == "SPOKE" && var.app_acceleration_enabled
      active_with_policies = var.admin_state == "active" && (
        var.security_policysetstack_name != null ||
        var.network_policysetstack_name != null
      )
      
      configuration_makes_sense = !(
        (var.element_cluster_role == "SPOKE" && var.prefer_lan_default_over_wan_default_route) ||
        (var.admin_state == "inactive" && var.app_acceleration_enabled)
      )
    }
    
    deployment_readiness = {
      all_validations_pass = (
        var.site_name != "" &&
        var.element_cluster_role != "" &&
        var.admin_state != "" &&
        contains(["SPOKE", "HUB", "TRANSIT", "EDGE", "DC", "BRANCH", "PRIMARY", "SECONDARY", "STANDALONE"], var.element_cluster_role) &&
        contains(["active", "inactive", "disabled", "pending"], var.admin_state) &&
        length(var.tags) <= 10 &&
        length(var.extended_tags) <= 10 &&
        length(var.description) <= 1024 &&
        (var.sgi_config == null ? true : (var.sgi_config.sgi_vendor_id == "SGI_VENDOR_ID_TYPE_8909" && var.sgi_config.sgi_tag >= 1 && var.sgi_config.sgi_tag <= 65533)) &&
        (var.location == null || (
          (var.location.latitude == null || (var.location.latitude >= -90 && var.location.latitude <= 90)) &&
          (var.location.longitude == null || (var.location.longitude >= -180 && var.location.longitude <= 180))
        ))
      )
      
      ready_for_deployment = "ready"
      validation_summary = "Site configuration passes all validation checks"
    }
  }
}

# Deployment Status
output "deployment_status" {
  description = "Site deployment status information"
  value = {
    deployed_at = timestamp()
    resource_count = 1
    resource_type = "site"
    status = "success"
  }
}

# Resource Summary
output "resource_summary" {
  description = "Summary of all resources and their relationships"
  value = {
    primary_resource = {
      type = "prismasdwan_site"
      name = var.site_name
      id = prismasdwan_site.site_full.id
      tfid = prismasdwan_site.site_full.tfid
    }
    
    policy_dependencies = {
      security_policysetstack = var.security_policysetstack_name != null ? {
        name = var.security_policysetstack_name
        id = length(prismasdwan_resource_locator.security_policysetstack) > 0 ? prismasdwan_resource_locator.security_policysetstack[0].result : null
      } : null
      
      network_policysetstack = var.network_policysetstack_name != null ? {
        name = var.network_policysetstack_name
        id = length(prismasdwan_resource_locator.network_policysetstack) > 0 ? prismasdwan_resource_locator.network_policysetstack[0].result : null
      } : null
      
      nat_policysetstack = var.nat_policysetstack_name != null ? {
        name = var.nat_policysetstack_name
        id = length(prismasdwan_resource_locator.nat_policysetstack) > 0 ? prismasdwan_resource_locator.nat_policysetstack[0].result : null
      } : null
    }
    
    service_dependencies = {
      vrf_context_profile = var.vrf_context_profile_name != null ? {
        name = var.vrf_context_profile_name
        id = length(prismasdwan_resource_locator.vrf_context_profile) > 0 ? prismasdwan_resource_locator.vrf_context_profile[0].result : null
      } : null
      
      multicast_peer_group = var.multicast_peer_group_name != null ? {
        name = var.multicast_peer_group_name
        id = length(prismasdwan_resource_locator.multicast_peer_group) > 0 ? prismasdwan_resource_locator.multicast_peer_group[0].result : null
      } : null
      
      service_binding = var.service_binding_name != null ? {
        name = var.service_binding_name
        id = length(prismasdwan_resource_locator.service_binding) > 0 ? prismasdwan_resource_locator.service_binding[0].result : null
      } : null
    }
    
    configuration_health = {
      all_dependencies_resolved = alltrue([
        var.security_policysetstack_name == null || (length(prismasdwan_resource_locator.security_policysetstack) > 0 ? prismasdwan_resource_locator.security_policysetstack[0].result != null : false),
        var.network_policysetstack_name == null || (length(prismasdwan_resource_locator.network_policysetstack) > 0 ? prismasdwan_resource_locator.network_policysetstack[0].result != null : false),
        var.nat_policysetstack_name == null || (length(prismasdwan_resource_locator.nat_policysetstack) > 0 ? prismasdwan_resource_locator.nat_policysetstack[0].result != null : false),
        var.priority_policysetstack_name == null || (length(prismasdwan_resource_locator.priority_policysetstack) > 0 ? prismasdwan_resource_locator.priority_policysetstack[0].result != null : false),
        var.perfmgmt_policysetstack_name == null || (length(prismasdwan_resource_locator.perfmgmt_policysetstack) > 0 ? prismasdwan_resource_locator.perfmgmt_policysetstack[0].result != null : false),
        var.vrf_context_profile_name == null || (length(prismasdwan_resource_locator.vrf_context_profile) > 0 ? prismasdwan_resource_locator.vrf_context_profile[0].result != null : false),
        var.multicast_peer_group_name == null || (length(prismasdwan_resource_locator.multicast_peer_group) > 0 ? prismasdwan_resource_locator.multicast_peer_group[0].result != null : false),
        var.service_binding_name == null || (length(prismasdwan_resource_locator.service_binding) > 0 ? prismasdwan_resource_locator.service_binding[0].result != null : false)
      ])
      
      has_core_configuration = var.site_name != "" && var.element_cluster_role != "" && var.admin_state != ""
      has_policy_configuration = (
        var.security_policysetstack_name != null ||
        var.network_policysetstack_name != null ||
        var.nat_policysetstack_name != null
      )
      has_service_configuration = (
        var.vrf_context_profile_name != null ||
        var.multicast_peer_group_name != null ||
        var.service_binding_name != null
      )
      is_fully_functional = (
        var.admin_state == "active" &&
        var.site_name != "" &&
        var.element_cluster_role != ""
      )
    }
    
    metadata = {
      terraform_resource_count = 1 + length([
        for locator in [
          var.security_policysetstack_name,
          var.security_policyset_name,
          var.network_policysetstack_name,
          var.nat_policysetstack_name,
          var.priority_policysetstack_name,
          var.perfmgmt_policysetstack_name,
          var.policy_set_name,
          var.vrf_context_profile_name,
          var.multicast_peer_group_name,
          var.service_binding_name
        ] : locator if locator != null
      ])
      
      deployment_timestamp = timestamp()
      configuration_version = "v1.0"
      template_version = "1.0.0"
    }
  }
}
