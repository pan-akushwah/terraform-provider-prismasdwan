# NTP Template Configuration
template_name = "TerraformNTPTemplate"
description = "NTP template managed by Terraform"
tags = ["terraform", "ntp", "template"]
default_template = false

ntp_servers = [
  {
    host     = "10.1.1.2"
    version  = 4
    min_poll = 4
    max_poll = 10
  },
  {
    host     = "time.google.com"
    version  = 4
    min_poll = 4
    max_poll = 10
  }
]