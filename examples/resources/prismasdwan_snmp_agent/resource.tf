resource "prismasdwan_snmp_agent" "example" {
  site_id         = "1234567890"
  element_id      = "1234567890"
  description     = "terraform test"
  system_contact  = null
  system_location = null
  tags            = null
  v2_config = {
    community = "public"
  }
  v3_config = null
}
