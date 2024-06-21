resource "prismasdwan_syslog_server" "example" {
  element_id            = "1234567890"
  enabled               = true
  name                  = "terraform test"
  description           = "terraform test syslog server"
  tags                  = null
  syslog_profile_id     = null
  source_interface      = null
  enable_flow_logging   = true
  severity_level        = "major"
  protocol              = "udp"
  server_ip             = "1.1.1.1"
  server_fqdn           = null
  server_port           = 514
  remote_ca_certificate = null
}
