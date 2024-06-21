resource "prismasdwan_static_route" "example" {
  site_id                    = "1234567890"
  element_id                 = "1234567890"
  address_family             = "ipv4"
  description                = "Example static route"
  destination_prefix         = "1.1.1.0/24"
  name                       = "example-static-route"
  network_context_id         = null
  nexthop_reachability_probe = false
  nexthops = [{
    admin_distance = 1
    self           = "true",
  }]
  scope          = "local"
  vrf_context_id = "1234567890"
}
