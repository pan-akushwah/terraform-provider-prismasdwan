# Site and Element Configuration
site_name = "London"
element_name = "BR-SITE2-ELEM1"

# Protocol Enable Controls
enable_igmp = true
enable_pim = true

# IGMP Protocol Parameters
igmp_query_max_response_time = 10
igmp_last_member_query_interval = 1000
igmp_last_member_query_count = 2
igmp_query_interval = 125

# PIM Protocol Parameters
pim_join_prune_interval = 60
pim_hello_hold_time = 105
pim_hello_interval = 30

# Multicast Global Configuration Parameters
dr_priority = 1
bsm_enabled = false
spt_switchover_enabled = true