resource "prismasdwan_site" "example" {
  name        = "test_site"
  description = "Created SDWAN Site by Terraform"
  address = {
    street    = "123 Main St",
    street2   = null,
    city      = "San Francisco",
    state     = "California",
    post_code = "99999",
    country   = "United States"
  }
  location = {
    "latitude" : 0,
    "longitude" : 0,
    "description" : null
  }
  element_cluster_role = "SPOKE"
  admin_state          = "disabled"
  tags                 = []
}
