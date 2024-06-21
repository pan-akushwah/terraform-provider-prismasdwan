resource "prismasdwan_lan_network" "example" {
  name        = "lan-network-test1"
  description = "lan network created using Terraform SCM provider"
  site_id     = "123456789"
  scope       = "global"
}
