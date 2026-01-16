# Resource locator for hub site
resource "prismasdwan_resource_locator" "hub_site" {
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.hub_site_name
}

# Resource locators for spoke sites
resource "prismasdwan_resource_locator" "spoke_sites" {
  count = length(var.spoke_site_names)
  
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.spoke_site_names[count.index]
}

# Validation for spoke site count
resource "null_resource" "spoke_count_validation" {
  lifecycle {
    precondition {
      condition     = length(var.spoke_site_names) <= var.max_spoke_sites
      error_message = "Number of spoke sites (${length(var.spoke_site_names)}) exceeds maximum allowed (${var.max_spoke_sites})."
    }
  }
}

resource "prismasdwan_site_hub_distribution_fabric" "hub_distribution_fabric_full" {
  # Required fields
  name = var.distribution_fabric_name
  spoke_site_ids = [for locator in prismasdwan_resource_locator.spoke_sites : locator.result]

  # X_parameters with hub site ID
  x_parameters = {
    site_id = prismasdwan_resource_locator.hub_site.result
  }
  
  # Optional fields
  description = var.description
  tags        = var.tags
  
  # Ensure validations pass before creating
  depends_on = [null_resource.spoke_count_validation]
}