resource "prismasdwan_snmp_trap" "example" {
  site_id          = "1234567890"
  element_id       = "1234567890"
  description      = null
  tags             = null
  enabled          = true
  server_ip        = "1.1.1.1"
  source_interface = "1234567890"
  version          = "v2"
  v2_config = {
    community = "public"
  }
  v3_config = null
}
