# TACACS+ Profile Configuration
tacacs_plus_profile_name = "EnterpriseTACACSAuthentication"
authentication_protocol = "chap"
description = "Enterprise TACACS+ profile for centralized authentication, authorization, and accounting with enhanced security and high availability"

# TACACS+ Servers Configuration
tacacs_plus_servers = [
  {
    server_ip   = "192.168.100.10"
    server_port = 49
    timeout     = 5
    secret      = "primarytest123"
  },
  {
    server_ip   = "192.168.100.11"
    server_port = 49
    timeout     = 5
    secret      = "secondarytest123"
  },
  {
    server_fqdn = "tacacs-backup.enterprise.local"
    server_port = 49
    timeout     = 10
    secret      = "backuptest123"
  },
  {
    server_ipv6 = "2001:db8::10"
    server_port = 49
    timeout     = 8
    secret      = "ipv6test123"
  }
]

# Tags for organization and management
tags = ["terraform", "tacacs", "authentication", "enterprise", "aaa", "security"]