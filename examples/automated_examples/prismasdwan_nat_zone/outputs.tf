# NAT Zone Details
output "nat_zone_details" {
  description = "Details of the created NAT zone"
  value = {
    id                          = prismasdwan_nat_zone.zone_58411832.id
    name                        = prismasdwan_nat_zone.zone_58411832.name
    description                 = prismasdwan_nat_zone.zone_58411832.description
    tags                        = prismasdwan_nat_zone.zone_58411832.tags
    default_for_public_interfaces = prismasdwan_nat_zone.zone_58411832.default_for_public_interfaces
    tfid                        = prismasdwan_nat_zone.zone_58411832.tfid
    x_etag                      = prismasdwan_nat_zone.zone_58411832.x_etag
    x_schema                    = prismasdwan_nat_zone.zone_58411832.x_schema
  }
}

# Individual outputs for easy access
output "nat_zone_id" {
  description = "ID of the created NAT zone"
  value       = prismasdwan_nat_zone.zone_58411832.id
}

output "nat_zone_name" {
  description = "Name of the created NAT zone"
  value       = prismasdwan_nat_zone.zone_58411832.name
}

output "nat_zone_tfid" {
  description = "Terraform ID of the NAT zone"
  value       = prismasdwan_nat_zone.zone_58411832.tfid
}

output "is_default_for_public" {
  description = "Whether this zone is default for public interfaces"
  value       = prismasdwan_nat_zone.zone_58411832.default_for_public_interfaces
}

# Deployment metadata
output "deployment_status" {
  description = "Deployment status and metadata"
  value = {
    status         = "success"
    deployed_at    = timestamp()
    resource_type  = "nat_zone"
    resource_count = 1
  }
}