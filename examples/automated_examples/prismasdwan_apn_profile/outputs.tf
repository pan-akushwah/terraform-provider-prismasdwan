# Deployment Status Output
output "deployment_status" {
  description = "Status of the APN profile deployment"
  value = {
    deployed_at    = timestamp()
    resource_count = 1
    resource_type  = "apn_profile"
    status         = "success"
  }
}

# APN Profile ID
output "apn_profile_id" {
  description = "The ID of the created APN profile"
  value       = prismasdwan_apn_profile.profile_main.id
}

# APN Profile Name
output "apn_profile_name" {
  description = "The name of the created APN profile"
  value       = prismasdwan_apn_profile.profile_main.name
}

# APN Profile APN
output "apn_profile_apn" {
  description = "The APN of the created APN profile"
  value       = prismasdwan_apn_profile.profile_main.apn
}

# APN Profile Authentication
output "apn_profile_authentication" {
  description = "The authentication method of the APN profile"
  value       = prismasdwan_apn_profile.profile_main.authentication
}

# APN Profile Username
output "apn_profile_username" {
  description = "The username of the APN profile"
  value       = prismasdwan_apn_profile.profile_main.user_name
  sensitive   = true
}

# Complete APN Profile Details
output "apn_profile_details" {
  description = "Complete details of the created APN profile"
  value = {
    id             = prismasdwan_apn_profile.profile_main.id
    name           = prismasdwan_apn_profile.profile_main.name
    apn            = prismasdwan_apn_profile.profile_main.apn
    authentication = prismasdwan_apn_profile.profile_main.authentication
    user_name      = prismasdwan_apn_profile.profile_main.user_name
    description    = prismasdwan_apn_profile.profile_main.description
    tags           = prismasdwan_apn_profile.profile_main.tags
    clear_password = prismasdwan_apn_profile.profile_main.clear_password
    x_etag         = prismasdwan_apn_profile.profile_main.x_etag
    x_schema       = prismasdwan_apn_profile.profile_main.x_schema
  }
  sensitive = true
}

# Profile Type Output
output "profile_type" {
  description = "The type of profile"
  value       = "apn_profile"
}

# Authentication Method
output "authentication_method" {
  description = "The authentication method used"
  value       = prismasdwan_apn_profile.profile_main.authentication
}