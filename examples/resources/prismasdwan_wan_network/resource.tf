resource "prismasdwan_wan_network" "example" {
  name                = "test_wan_network"
  description         = "ATT Public WAN Network"
  type                = "publicwan"
  tags                = ["public", "wan", "att"]
  provider_as_numbers = [1234]
}
