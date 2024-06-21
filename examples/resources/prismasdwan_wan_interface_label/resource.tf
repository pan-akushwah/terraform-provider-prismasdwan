resource "prismasdwan_wan_interface_label" "example" {
  description            = "terraform test"
  wantinterface_label_id = "1234567890"
  vpnlink_configuration = {
    keep_alive_failure_count = ""
    keep_alive_interval      = ""
  }
  l3_reachability = {
    probe_config_ids    = ""
    use_element_default = ""
  }
  bwc_enabled                             = ""
  lqm_enabled                             = ""
  use_for_application_reachability_probes = ""
  use_for_controller_connections          = ""
  use_lqm_for_non_hub_paths               = ""
  probe_profile_id                        = ""
  label                                   = ""
  name                                    = ""
  tags                                    = ""
}

