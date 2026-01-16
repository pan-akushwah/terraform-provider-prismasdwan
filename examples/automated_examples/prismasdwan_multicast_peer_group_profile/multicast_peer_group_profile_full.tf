# Resource locators for peer sites (required)
resource "prismasdwan_resource_locator" "peer_sites" {
  count = length(var.peer_site_names)
  
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.peer_site_names[count.index]
}

resource "prismasdwan_multicast_peer_group_profile" "multicast_peer_group_profile_full" {
  # Required fields
  name = var.multicast_peer_group_name
  peer_sites = [
    for locator in prismasdwan_resource_locator.peer_sites : {
      peer_site_id = locator.result
    }
  ]
  
  # Optional fields
  description = var.description
  tags = var.tags
  is_source_site_receiver = var.is_source_site_receiver
}