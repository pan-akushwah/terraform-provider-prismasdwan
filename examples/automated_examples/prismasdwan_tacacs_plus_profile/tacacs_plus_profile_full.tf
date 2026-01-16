resource "prismasdwan_tacacs_plus_profile" "tacacs_plus_profile_full" {
  # Required fields
  name = var.tacacs_plus_profile_name
  authentication_protocol = var.authentication_protocol
  
  # TACACS+ Servers Configuration (Required - 1 to 4 servers)
  tacacs_plus_servers = [
    for server in var.tacacs_plus_servers : {
      server_ip = lookup(server, "server_ip", null)
      server_ipv6 = lookup(server, "server_ipv6", null)
      server_fqdn = lookup(server, "server_fqdn", null)
      server_port = lookup(server, "server_port", 49)
      timeout = lookup(server, "timeout", 5)
      secret = server.secret
    }
  ]
  
  # Optional fields
  description = var.description
  tags = var.tags
}