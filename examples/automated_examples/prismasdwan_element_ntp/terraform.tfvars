# Element NTP Configuration
element_name = "BR-SITE1-ELEM1"

# NTP Configuration
ntp_name = "default"
description = "Default NTP template created by Terraform for time synchronization"
tags = ["terraform", "ntp", "time-sync", "default"]

# NTP Servers Configuration (based on provided payload)
ntp_servers = [
  {
    host     = "0.cloudgenix.pool.ntp.org"
    version  = 4
    min_poll = 9
    max_poll = 10
  },
  {
    host     = "1.cloudgenix.pool.ntp.org"
    version  = 4
    min_poll = 9
    max_poll = 10
  },
  {
    host     = "2.cloudgenix.pool.ntp.org"
    version  = 4
    min_poll = 9
    max_poll = 10
  },
  {
    host     = "3.cloudgenix.pool.ntp.org"
    version  = 4
    min_poll = 9
    max_poll = 10
  },
  {
    host     = "time.nist.gov"
    version  = 4
    min_poll = 13
    max_poll = 15
  },
  {
    host     = "test.com"
    version  = 4
    min_poll = 6
    max_poll = 10
  }
]

# Source Interface Configuration (optional)
source_interface_names = null  # Set to interface names if using resource locator lookup
source_interface_ids = null