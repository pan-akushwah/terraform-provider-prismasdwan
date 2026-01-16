# Site and Element Configuration
site_name = "Enterprise-Branch-Site-01"
element_name = "Branch-ION-Device-01"

# IPFIX Configuration
ipfix_config_name = "Enterprise-IPFIX-Monitoring-Config"
ipfixprofile_name = "Standard-Enterprise-IPFIX-Profile"
ipfixtemplate_name = "Custom-Flow-Template-v1"

# Basic Configuration
description = "Enterprise IPFIX configuration for comprehensive network flow monitoring, traffic analysis, and security visibility"
tags = ["terraform", "ipfix", "enterprise", "monitoring", "security", "flow-analysis", "network-visibility"]

# Export Settings
export_cache_timeout = 60

# Sampling Configuration
sampler_algorithm = "time_based"
sampler_time_interval = 300
sampler_time_spacing = 60

# Collector Configuration (1-4 collectors supported)
collector_configs = [
  {
    host                     = "10.100.1.100"
    host_port               = 2055
    protocol                = "udp"
    max_message_size        = 1400
    ipfixcollectorcontext_name = "Primary-Collector-Context"
  },
  {
    host                     = "10.100.1.101"
    host_port               = 2055
    protocol                = "tcp"
    max_message_size        = 8192
    ipfixcollectorcontext_name = "Secondary-Collector-Context"
  }
]

# Filter Configuration
enable_filter_1 = true

# Filter 1 - Traffic Direction and Type
filter_1_wan_path_direction = "ingress"
filter_1_rtp_transport_type = "rtp_udp"

# Filter 1 - Application Filtering
app_def_name_1 = "Microsoft-Office-365"
app_def_name_2 = "Salesforce-CRM"
app_def_name_3 = "Zoom-Video-Conferencing"

# Filter 1 - Traffic Classification
filter_1_priority_traffic_types = ["business_critical", "real_time", "interactive"]
filter_1_protocols = ["tcp", "udp"]

# Filter 1 - Network Segmentation
src_prefix_filter_name = "Internal-Network-Prefixes"
dst_prefix_filter_name = "External-Service-Prefixes"

# Filter 1 - IPFIX Filter Contexts
ipfix_filter_context_name_1 = "Security-Analysis-Context"
ipfix_filter_context_name_2 = "Performance-Monitoring-Context"

# Filter 1 - Port Configuration
filter_1_enable_src_ports = true
filter_1_src_port_start = 1024
filter_1_src_port_end = 65535

filter_1_enable_dst_ports = true
filter_1_dst_port_start = 80
filter_1_dst_port_end = 8080

# Validation helpers (always true)
validate_port_ranges = true
validate_sampling_config = true