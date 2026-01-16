resource "prismasdwan_nat_zone" "zone_58411832" {
  name                          = var.nat_zone_name
  description                   = var.description
  tags                          = var.tags
  default_for_public_interfaces = var.default_for_public_interfaces
}
