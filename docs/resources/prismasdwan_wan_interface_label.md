## Documentation for Prisma SDWAN Resource "wan_interface_label"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `wan_interface_label` |
| Get Api  | `/sdwan/v2.5/api/waninterfacelabels/{wantinterface_label_id}` (`WANInterfaceLabelScreenV2N5`) |
| Put Api  | `/sdwan/v2.5/api/waninterfacelabels/{wantinterface_label_id}` (`WANInterfaceLabelScreenV2N5`) |


### JSON Schema

```json
{
  "properties" : {
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
    "label" : {
      "description" : "Label: Pattern(message = INVALID_INTERFACE_LABEL, regexp = (public|private)-(([1-9])|([1-2][0-9])|(3[0-2])|(100[0-9]))) ",
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
      "description" : "Description: Size(max = 256, message = PATHGROUP_INVALID_DESCRIPTION, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Size(max = 128, message = PATHGROUP_INVALID_NAME, min = 0) ",
      "type" : "string"
    },
    "id" : {
      "description" : "Id: Transient Id ",
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
  }
}
```

### Terraform Import
```json
import {
 to="prismasdwan_wan_interface_label.my_resource_name"
 id="<resource_id>"
}
```

