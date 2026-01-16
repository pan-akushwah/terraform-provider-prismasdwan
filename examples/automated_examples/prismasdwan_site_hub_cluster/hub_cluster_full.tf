# Resource locators for peer sites
resource "prismasdwan_resource_locator" "peer_sites" {
  count = length(var.peer_site_names)
  
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.peer_site_names[count.index]
}

# Resource locator for hub site
resource "prismasdwan_resource_locator" "hub_site" {
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.hub_site_name
}


resource "prismasdwan_site_hub_cluster" "hub_cluster_full" {
  # Required fields
  name       = var.hub_cluster_name
  peer_sites = [for locator in prismasdwan_resource_locator.peer_sites : locator.result]

  # X_parameters with hub site ID
  x_parameters = {
    site_id = prismasdwan_resource_locator.hub_site.result
  }
  
  # Optional fields
  description              = var.description
  tags                    = var.tags
  default_cluster         = var.default_cluster
  site_count_alarm_threshold = var.site_count_alarm_threshold
  
  # Note: Elements cannot be included during creation per API requirements
  # Elements must be assigned after cluster creation
}
