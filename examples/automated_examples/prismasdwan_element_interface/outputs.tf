# Element Interface Details
output "element_interface_details" {
  description = "Complete element interface configuration details"
  value = {
    id = prismasdwan_element_interface.element_interface_minimal.id
    tfid = prismasdwan_element_interface.element_interface_minimal.tfid
    name = var.interface_name
    type = var.interface_type
    used_for = var.used_for
    scope = var.scope
    #site_id = prismasdwan_element_interface.element_interface_minimal.site_id
    #element_id = prismasdwan_element_interface.element_interface_minimal.element_id
    description = var.description
    tags = var.tags
    admin_up = var.admin_up
    mtu = var.mtu
    x_etag = prismasdwan_element_interface.element_interface_minimal.x_etag
    x_schema = prismasdwan_element_interface.element_interface_minimal.x_schema
  }
}

# Primary Resource IDs
output "element_interface_id" {
  description = "Element interface ID"
  value = prismasdwan_element_interface.element_interface_minimal.id
}

output "element_interface_name" {
  description = "Element interface name"
  value = var.interface_name
}

output "element_interface_tfid" {
  description = "Element interface Terraform ID"
  value = prismasdwan_element_interface.element_interface_minimal.tfid
}

# Deployment Status
output "deployment_status" {
  description = "Deployment status and metadata"
  value = {
    deployed_at = timestamp()
    resource_count = 1
    resource_type = "element_interface"
    status = "success"
  }
}