## Documentation for Prisma SDWAN Resource "site_wan_interface"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_wan_interface` |
| Get Api  | `/sdwan/v2.10/api/sites/{site_id}/waninterfaces/{wan_interface_id}` (`WANInterfaceScreenV2N10`) |
| Post Api  | `/sdwan/v2.10/api/sites/{site_id}/waninterfaces` (`WANInterfaceScreenV2N10`) |
| Put Api  | `/sdwan/v2.10/api/sites/{site_id}/waninterfaces/{wan_interface_id}` (`WANInterfaceScreenV2N10`) |
| Delete Api  | `/sdwan/v2.10/api/sites/{site_id}/waninterfaces/{wan_interface_id}` |


### JSON Schema

```json
{
  "properties" : {
    "app_acceleration_enabled" : {
      "description" : "App Acceleration Enabled",
      "type" : "boolean"
    },
    "lqm_config" : {
      "properties" : {
        "use_prisma_access_service_endpoints" : {
          "description" : "Use Prisma Access Service Endpoints",
          "type" : "boolean"
        },
        "use_hub_sites" : {
          "description" : "Use Hub Sites",
          "type" : "boolean"
        },
        "inter_packet_gap" : {
          "description" : "Inter Packet Gap",
          "format" : "int32",
          "type" : "integer"
        },
        "statistic" : {
          "description" : "Statistic",
          "type" : "string"
        },
        "hub_site_ids" : {
          "description" : "Hub Site Ids",
          "type" : "array",
          "items" : {
            "description" : "Hub Site Ids",
            "type" : "string"
          }
        }
      },
      "required" : [ "use_prisma_access_service_endpoints", "use_hub_sites", "inter_packet_gap", "statistic", "hub_site_ids" ]
    },
    "probe_profile_id" : {
      "description" : "Probe Profile Id",
      "type" : "string"
    },
    "l3_reachability" : {
      "properties" : {
        "probe_config_ids" : {
          "description" : "Probe Config Ids",
          "type" : "array",
          "items" : {
            "description" : "Probe Config Ids",
            "type" : "string"
          }
        },
        "use_element_default" : {
          "description" : "Use Element Default",
          "type" : "boolean",
          "additionalProperties" : {
            "properties" : {
              "x_flag_required" : {
                "type" : "boolean"
              }
            }
          }
        }
      },
      "required" : [ "probe_config_ids", "use_element_default" ]
    },
    "bwc_enabled" : {
      "description" : "Bwc Enabled",
      "type" : "boolean"
    },
    "use_lqm_for_non_hub_paths" : {
      "description" : "Use Lqm For Non Hub Paths",
      "type" : "boolean"
    },
    "lqm_enabled" : {
      "description" : "Lqm Enabled",
      "type" : "boolean"
    },
    "use_for_application_reachability_probes" : {
      "description" : "Use For Application Reachability Probes",
      "type" : "boolean"
    },
    "use_for_controller_connections" : {
      "description" : "Use For Controller Connections",
      "type" : "boolean"
    },
    "type" : {
      "description" : "Type",
      "type" : "string",
      "enum" : [ "PUBLIC_WAN", "PRIVATE_WAN" ]
    },
    "vpnlink_configuration" : {
      "properties" : {
        "keep_alive_failure_count" : {
          "description" : "Keep Alive Failure Count",
          "maximum" : 30,
          "minimum" : 3,
          "type" : "integer",
          "additionalProperties" : {
            "properties" : {
              "x_flag_required" : {
                "type" : "boolean"
              }
            }
          }
        },
        "keep_alive_interval" : {
          "description" : "Keep Alive Interval",
          "maximum" : 1740000,
          "minimum" : 100,
          "type" : "integer",
          "additionalProperties" : {
            "properties" : {
              "x_flag_required" : {
                "type" : "boolean"
              }
            }
          }
        }
      },
      "required" : [ "keep_alive_failure_count", "keep_alive_interval" ]
    },
    "cost" : {
      "description" : "Cost",
      "maximum" : 1024,
      "minimum" : 0,
      "type" : "integer"
    },
    "label_id" : {
      "description" : "Label Id",
      "minLength" : 1,
      "type" : "string"
    },
    "bfd_mode" : {
      "description" : "Bfd Mode",
      "type" : "string",
      "enum" : [ "aggressive", "non_aggressive" ]
    },
    "bw_config_mode" : {
      "description" : "Bw Config Mode",
      "type" : "string",
      "enum" : [ "auto", "manual", "manual_bwm_disabled" ]
    },
    "link_bw_up" : {
      "description" : "Link Bw Up",
      "format" : "double",
      "readOnly" : true,
      "type" : "number",
      "x-json-ignore" : true
    },
    "link_bw_down" : {
      "description" : "Link Bw Down",
      "format" : "double",
      "readOnly" : true,
      "type" : "number",
      "x-json-ignore" : true
    },
    "network_id" : {
      "description" : "Network Id",
      "minLength" : 1,
      "type" : "string"
    },
    "tags" : {
      "description" : "Tags",
      "maxItems" : 10,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Tags",
        "maxLength" : 128,
        "pattern" : "[^,\\s]+",
        "type" : "string"
      },
      "additionalProperties" : {
        "properties" : {
          "x_flag_unordered" : {
            "type" : "boolean"
          }
        }
      }
    },
    "description" : {
      "description" : "Description",
      "maxLength" : 256,
      "type" : "string"
    },
    "name" : {
      "description" : "Name",
      "maxLength" : 128,
      "type" : "string"
    },
    "_etag" : {
      "description" : "Etag for this object",
      "minimum" : 1,
      "type" : "integer",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "id" : {
      "description" : "Id",
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "_schema" : {
      "description" : "Schema version for this object",
      "minimum" : 1,
      "type" : "integer",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    }
  },
  "required" : [ "app_acceleration_enabled", "lqm_config", "probe_profile_id", "l3_reachability", "bwc_enabled", "use_lqm_for_non_hub_paths", "lqm_enabled", "use_for_application_reachability_probes", "use_for_controller_connections", "type", "cost", "label_id", "bfd_mode", "bw_config_mode", "link_bw_up", "link_bw_down", "network_id", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_wan_interface.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

