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
        "inter_packet_gap" : {
          "description" : "Inter Packet Gap: Range(max = 300L, error = WANINTERFACE_LQM_CONFIG_INVALID_INTER_PACKET_GAP: inter packet gap should be in the range of 50-300 milliseconds., min = 50L) ",
          "format" : "int32",
          "type" : "integer"
        },
        "statistic" : {
          "description" : "Statistic: ValidateEnum(enumClass = classOf[LQMStatistic], error = WANINTERFACE_LQM_CONFIG_INVALID_STATISTIC: Invalid statistic value. Valid values are min, max and avg., nullAllowed = true) ",
          "type" : "string",
          "enum" : [ "min", "max", "avg" ]
        },
        "hub_site_ids" : {
          "description" : "Hub Site Ids: Size(max = 16, error = WANINTERFACE_LQM_CONFIG_INVALID_HUB_SITE_IDS_SIZE: Maximum 16 hub sites can be configured, min = 0) ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = WANINTERFACE_LQM_CONFIG_DUPLICATE_HUB_SITE_IDS: Duplicate hub site ids are not allowed., noTrim = false, regex = , required = false) ",
          "type" : "array",
          "items" : {
            "description" : "Hub Site Ids",
            "type" : "string"
          }
        }
      }
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
          "type" : "boolean"
        }
      }
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
      "description" : "Use For Application Reachability Probes: Valid ",
      "type" : "boolean"
    },
    "use_for_controller_connections" : {
      "description" : "Use For Controller Connections: Valid ",
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
          "description" : "Keep Alive Failure Count: NotNull(error = VPNLINK_CONFIG_INVALID_KEEP_ALIVE_FAILURE_COUNT: VPN Link keep alive failure count must be between 3 and 30.) Range(max = 30L, error = VPNLINK_CONFIG_INVALID_KEEP_ALIVE_FAILURE_COUNT: VPN Link keep alive failure count must be between 3 and 30., min = 3L) ",
          "type" : "integer"
        },
        "keep_alive_interval" : {
          "description" : "Keep Alive Interval: NotNull(error = VPNLINK_CONFIG_INVALID_KEEP_ALIVE_INTERVAL: VPN Link keep alive interval must be between 100ms-1740,000ms.) Range(max = 1740000L, error = VPNLINK_CONFIG_INVALID_KEEP_ALIVE_INTERVAL: VPN Link keep alive interval must be between 100ms-1740,000ms., min = 100L) ",
          "type" : "integer"
        }
      },
      "required" : [ "keep_alive_failure_count", "keep_alive_interval" ]
    },
    "cost" : {
      "description" : "Cost: Range(max = 1024L, error = WANINTERFACE_INVALID_COST_VALUE: Cost value for site WAN interface should be within range 0-1024, min = 0L) ",
      "type" : "integer"
    },
    "label_id" : {
      "description" : "Label Id: NotEmpty(message = WAN_INTERFACE_INVALID_LABEL) ",
      "type" : "string"
    },
    "bfd_mode" : {
      "description" : "Bfd Mode: ValidateEnum(enumClass = classOf[BfdMode], WAN_CONFIG_INVALID_BFD_MODE, nullAllowed = false) ",
      "type" : "string",
      "enum" : [ "aggressive", "non_aggressive" ]
    },
    "bw_config_mode" : {
      "description" : "Bw Config Mode: ValidateEnum(enumClass = classOf[BWConfigMode], message = INVALID_BANDWIDTH_CONFIG_MODE, nullAllowed = false) ",
      "type" : "string",
      "enum" : [ "auto", "manual", "manual_bwm_disabled" ]
    },
    "link_bw_up" : {
      "description" : "Link Bw Up: JsonIgnore(value = true) ",
      "format" : "double",
      "type" : "number"
    },
    "link_bw_down" : {
      "description" : "Link Bw Down: JsonIgnore(value = true) ",
      "format" : "double",
      "type" : "number"
    },
    "network_id" : {
      "description" : "Network Id: NotEmpty(message = NETWORK_ID_REQD) ",
      "type" : "string"
    },
    "tags" : {
      "description" : "Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 128, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\\\s]+, required = false) ",
      "type" : "array",
      "items" : {
        "description" : "Tags",
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
      "description" : "Description: Size(max = 256, WANINTERFACE_CONFIG_DESCRIPTION_EXCEEDS_LIMIT, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Size(max = 128, WANINTERFACE_CONFIG_NAME_EXCEEDS_LIMIT, min = 0) ",
      "type" : "string"
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
    }
  },
  "required" : [ "label_id", "bfd_mode", "bw_config_mode", "network_id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_wan_interface.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

