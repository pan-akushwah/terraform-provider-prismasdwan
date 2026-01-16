output "vrf_context_profile_details" {
  description = "Details of the created VRF context profile"
  value = {
    id                          = prismasdwan_vrf_context_profile.vrf_context_profile_full.id
    name                        = prismasdwan_vrf_context_profile.vrf_context_profile_full.name
    description                 = prismasdwan_vrf_context_profile.vrf_context_profile_full.description
    tags                        = prismasdwan_vrf_context_profile.vrf_context_profile_full.tags
    default_vrf_context_profile = prismasdwan_vrf_context_profile.vrf_context_profile_full.default_vrf_context_profile
    vrf_context_ids             = prismasdwan_vrf_context_profile.vrf_context_profile_full.vrf_context_ids
    tfid                        = prismasdwan_vrf_context_profile.vrf_context_profile_full.id
    x_etag                      = prismasdwan_vrf_context_profile.vrf_context_profile_full.x_etag
    x_schema                    = prismasdwan_vrf_context_profile.vrf_context_profile_full.x_schema
  }
}

output "vrf_context_profile_id" {
  description = "ID of the created VRF context profile"
  value       = prismasdwan_vrf_context_profile.vrf_context_profile_full.id
}

output "vrf_context_profile_name" {
  description = "Name of the created VRF context profile"
  value       = prismasdwan_vrf_context_profile.vrf_context_profile_full.name
}

output "vrf_context_profile_tfid" {
  description = "Terraform ID of the VRF context profile"
  value       = prismasdwan_vrf_context_profile.vrf_context_profile_full.id
}

output "deployment_status" {
  description = "VRF context profile deployment status"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "vrf_context_profile"
    status         = "success"
  }
}
