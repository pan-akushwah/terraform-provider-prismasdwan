resource "prismasdwan_element_ntp" "example" {
  element_id  = "123456789"
  ntp_id      = "123456789"
  name        = "default"
  description = "Default NTP template created by super user."
  ntp_servers = [{
    host     = "0.xxxx.pool.ntp.org"
    max_poll = 10
    min_poll = 9
    version  = 4
    },
    {
      host     = "1.xxxx.pool.ntp.org"
      max_poll = 10
      min_poll = 9
      version  = 4
    },
    {
      host     = "2.xxxx.pool.ntp.org"
      max_poll = 10
      min_poll = 9
      version  = 4
    },
    {
      host     = "3.xxxx.pool.ntp.org"
      max_poll = 10
      min_poll = 9
      version  = 4
    },
    {
      host     = "time.nist.gov"
      max_poll = 15
      min_poll = 13
      version  = 4
    }
  ]
  source_interface_ids = null
  tags                 = null
}
