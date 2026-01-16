# VRF Context Profile Configuration
vrf_context_profile_name = "ProductionProfile"
description = "Production VRF context profile for network segmentation"
tags = ["terraform", "production", "vrf-context", "enterprise"]
default_vrf_context_profile = false

# VRF Context Names (will be resolved to IDs using resource locators)
vrf_context_names = ["Global","test"]