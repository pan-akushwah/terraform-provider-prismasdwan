# Element OSPF Global Configuration
site_name = "London"
element_name = "BR-SITE2-ELEM1"

# OSPF Protocol Configuration
prefix_adv_type_to_lan = "default"
cost = 100
router_id = "192.168.1.1"

# OSPF Timing Configuration
hello_interval = 10
dead_interval = 40
retransmit_interval = 5
transmit_delay = 1

# MD5 Authentication (optional)
md5_key_id = 1
md5_secret = "MySecureOSPFKey"

# Validation
enable_interval_validation = true