# Site and Element Configuration
site_name = "London"
element_name = "BR-SITE2-ELEM1"

# Multicast RP Configuration
rp_name = "Corporate-Video-RP"
ipv4_address = "192.168.100.1"

# Multicast Groups Configuration
multicast_groups = [
  {
    name        = "video-streaming"
    ipv4_prefix = "224.1.1.0/24"
  },
  {
    name        = "audio-conference"
    ipv4_prefix = "224.2.1.0/24"
  },
  {
    name        = "corporate-broadcast"
    ipv4_prefix = "224.3.1.0/24"
  },
  {
    name        = "training-sessions"
    ipv4_prefix = "224.4.1.0/24"
  }
]

# Optional Configuration
description = "Multicast Rendezvous Point for corporate video streaming, audio conferencing, and broadcast communications"

tags = [
  "terraform",
  "multicast", 
  "rp",
  "video-streaming",
  "audio-conference"
]