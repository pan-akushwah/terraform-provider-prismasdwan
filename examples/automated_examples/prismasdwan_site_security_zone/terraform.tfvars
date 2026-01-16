# Site Security Zone Association Configuration
site_name = "London"
zone_name = "Corporate-Internal-Security-Zone"

# Network Associations
wan_network_names = [
  "Primary-Internet-WAN",
  "Secondary-MPLS-WAN",
  "Backup-4G-WAN"
]

lan_network_names = [
  "Corporate-Internal-LAN",
  "DMZ-LAN",
  "Management-LAN"
]

wan_overlay_network_names = [
  "VPN-Overlay-Network"
]

# Validation
validate_networks = true