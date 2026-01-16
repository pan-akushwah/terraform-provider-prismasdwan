# Element Interface Configuration
interface_name = "8.1"
interface_type = "sub_interface"
used_for = "public"
scope = "local"
peer_bypasspair_wan_port_type = "none"

# Site and Element References (use either ID or name)
site_name = "London"
element_name = "BR-SITE2-ELEM1"

# Basic Properties
description = "Primary WAN interface for enterprise connectivity"
tags = ["terraform", "enterprise", "wan", "primary"]
admin_up = true
mtu = 1500