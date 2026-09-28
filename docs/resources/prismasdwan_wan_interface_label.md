## Documentation for Prisma SDWAN Resource "wan_interface_label"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `wan_interface_label` |
| Get Api  | `/sdwan/v2.6/api/waninterfacelabels/{wantinterface_label_id}` (`WANInterfaceLabelScreenV2N6`) |
| Put Api  | `/sdwan/v2.6/api/waninterfacelabels/{wantinterface_label_id}` (`WANInterfaceLabelScreenV2N6`) |


### JSON Schema

```json
{
  "properties" : {
    "app_acceleration_enabled" : {
      "description" : "App Acceleration Enabled",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_required" : {
            "type" : "boolean"
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
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_required" : {
            "type" : "boolean"
          }
        }
      }
    },
    "use_lqm_for_non_hub_paths" : {
      "description" : "Use Lqm For Non Hub Paths",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_required" : {
            "type" : "boolean"
          }
        }
      }
    },
    "lqm_enabled" : {
      "description" : "Lqm Enabled",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_required" : {
            "type" : "boolean"
          }
        }
      }
    },
    "use_for_application_reachability_probes" : {
      "description" : "Use For Application Reachability Probes",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_required" : {
            "type" : "boolean"
          }
        }
      }
    },
    "use_for_controller_connections" : {
      "description" : "Use For Controller Connections",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_required" : {
            "type" : "boolean"
          }
        }
      }
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
    "label" : {
      "description" : "Label",
      "pattern" : "(public|private)-(([1-9])|([1-2][0-9])|(3[0-2])|(100[0-9]))",
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_required" : {
            "type" : "boolean"
          }
        }
      }
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
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_required" : {
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
  "required" : [ "app_acceleration_enabled", "probe_profile_id", "l3_reachability", "bwc_enabled", "use_lqm_for_non_hub_paths", "lqm_enabled", "use_for_application_reachability_probes", "use_for_controller_connections", "vpnlink_configuration", "label", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_wan_interface_label.my_resource_name"
 id="<resource_id>"
}
```

