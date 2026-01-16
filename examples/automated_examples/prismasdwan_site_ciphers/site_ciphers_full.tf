# Resource locator for site
resource "prismasdwan_resource_locator" "site" {
  resource_type = "prismasdwan_site"
  resource_property = "name"
  resource_property_value = var.site_name
}

resource "prismasdwan_site_ciphers" "site_ciphers_full" {
  #site_id                       = prismasdwan_resource_locator.site.result
  controller_connection_cipher  = var.controller_connection_cipher
  vpn_ciphers                  = var.vpn_ciphers
  x_parameters = {
    site_id = prismasdwan_resource_locator.site.result
  }
}