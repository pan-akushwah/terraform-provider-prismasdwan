# Resource locator for site
resource "prismasdwan_resource_locator" "site" {
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.site_name
}

resource "prismasdwan_site_spoke_cluster" "spoke_cluster_full" {
  # Required fields
  name                  = var.spoke_cluster_name
  advertisement_interval = var.advertisement_interval
  preempt              = var.preempt

  # X_parameters with site ID
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
  }
  
  # Optional fields
  description = var.description
  tags        = var.tags
}