resource "prismasdwan_dhcp_server" "example" {
  address_family    = "ipv4"
  site_id           = "123456789"
  subnet            = "192.168.10.0/24"
  broadcast_address = "192.168.10.255"
  description       = "test dhcp server"
  ip_ranges = [{
    start_ip = "192.168.10.1",
    end_ip   = "192.168.10.40"
  }]
  default_lease_time = 43200
  max_lease_time     = 86400
}
