# DNS Service Role Details
output "dns_service_role_details" {
  description = "Details of the created DNS service role"
  value = {
    id          = prismasdwan_dns_service_role.role_bc867a6f.id
    name        = prismasdwan_dns_service_role.role_bc867a6f.name
    description = prismasdwan_dns_service_role.role_bc867a6f.description
    tags        = prismasdwan_dns_service_role.role_bc867a6f.tags
    tfid        = prismasdwan_dns_service_role.role_bc867a6f.tfid
    x_etag      = prismasdwan_dns_service_role.role_bc867a6f.x_etag
    x_schema    = prismasdwan_dns_service_role.role_bc867a6f.x_schema
  }
}

# Individual outputs for easy access
output "dns_service_role_id" {
  description = "ID of the created DNS service role"
  value       = prismasdwan_dns_service_role.role_bc867a6f.id
}

output "dns_service_role_name" {
  description = "Name of the created DNS service role"
  value       = prismasdwan_dns_service_role.role_bc867a6f.name
}

output "dns_service_role_tfid" {
  description = "Terraform ID of the DNS service role"
  value       = prismasdwan_dns_service_role.role_bc867a6f.tfid
}

# Deployment metadata
output "deployment_status" {
  description = "Deployment status and metadata"
  value = {
    status         = "success"
    deployed_at    = timestamp()
    resource_type  = "dns_service_role"
    resource_count = 1
  }
}