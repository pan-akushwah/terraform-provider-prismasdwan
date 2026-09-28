## Documentation for Prisma SDWAN Resource "path_policy_rule"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `path_policy_rule` |
| Get Api  | `/sdwan/v2.5/api/networkpolicysets/{policy_set_id}/networkpolicyrules/{policy_rule_id}` (`NetworkPolicyRuleScreenV2N5`) |
| Post Api  | `/sdwan/v2.5/api/networkpolicysets/{policy_set_id}/networkpolicyrules` (`NetworkPolicyRuleScreenV2N5`) |
| Put Api  | `/sdwan/v2.5/api/networkpolicysets/{policy_set_id}/networkpolicyrules/{policy_rule_id}` (`NetworkPolicyRuleScreenV2N5`) |
| Delete Api  | `/sdwan/v2.5/api/networkpolicysets/{policy_set_id}/networkpolicyrules/{policy_rule_id}` |


### JSON Schema

```json
{
  "properties" : {
    "destination_prefixes_id" : {
      "description" : "Destination Prefixes Id",
      "maxLength" : 30,
      "pattern" : "^-?[0-9]{1,30}$",
      "type" : "string"
    },
    "source_prefixes_id" : {
      "description" : "Source Prefixes Id",
      "maxLength" : 30,
      "pattern" : "^-?[0-9]{1,30}$",
      "type" : "string"
    },
    "paths_allowed" : {
      "properties" : {
        "l3_failure_paths" : {
          "description" : "L3 Failure Paths",
          "type" : "array",
          "items" : {
            "properties" : {
              "path_type" : {
                "description" : "Path Type",
                "type" : "string",
                "enum" : [ "vpn", "direct", "servicelink", "pa_vpn" ]
              },
              "label" : {
                "description" : "Label",
                "type" : "string"
              }
            },
            "required" : [ "path_type", "label" ]
          }
        },
        "backup_paths" : {
          "description" : "Backup Paths",
          "type" : "array",
          "items" : {
            "properties" : {
              "path_type" : {
                "description" : "Path Type",
                "type" : "string",
                "enum" : [ "vpn", "direct", "servicelink", "pa_vpn" ]
              },
              "label" : {
                "description" : "Label",
                "type" : "string"
              }
            },
            "required" : [ "path_type", "label" ]
          }
        },
        "active_paths" : {
          "description" : "Active Paths",
          "type" : "array",
          "items" : {
            "properties" : {
              "path_type" : {
                "description" : "Path Type",
                "type" : "string",
                "enum" : [ "vpn", "direct", "servicelink", "pa_vpn" ]
              },
              "label" : {
                "description" : "Label",
                "type" : "string"
              }
            },
            "required" : [ "path_type", "label" ]
          }
        }
      },
      "required" : [ "l3_failure_paths", "backup_paths", "active_paths" ]
    },
    "service_context" : {
      "properties" : {
        "backup_service_label_type" : {
          "description" : "Backup Service Label Type",
          "type" : "string",
          "enum" : [ "CG_TRANSIT", "NON_CG_TRANSIT", "SASE" ]
        },
        "backup_service_label_id" : {
          "description" : "Backup Service Label Id",
          "type" : "string"
        },
        "active_service_label_type" : {
          "description" : "Active Service Label Type",
          "type" : "string",
          "enum" : [ "CG_TRANSIT", "NON_CG_TRANSIT", "SASE" ]
        },
        "active_service_label_id" : {
          "description" : "Active Service Label Id",
          "type" : "string"
        },
        "type" : {
          "description" : "Type",
          "type" : "string",
          "enum" : [ "allowed-transit", "required-transit" ]
        }
      },
      "required" : [ "backup_service_label_type", "backup_service_label_id", "active_service_label_type", "active_service_label_id", "type" ]
    },
    "enabled" : {
      "description" : "Enabled",
      "type" : "boolean"
    },
    "order_number" : {
      "description" : "Order Number",
      "maximum" : 65535,
      "minimum" : 1,
      "type" : "integer"
    },
    "network_context_id" : {
      "description" : "Network Context Id",
      "maxLength" : 30,
      "pattern" : "^-?[0-9]{1,30}$",
      "type" : "string"
    },
    "app_def_ids" : {
      "description" : "App Def Ids",
      "maxItems" : 256,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "App Def Ids",
        "type" : "string"
      }
    },
    "user_or_group" : {
      "properties" : {
        "user_group_ids" : {
          "description" : "User Group Ids",
          "type" : "array",
          "items" : {
            "description" : "User Group Ids",
            "type" : "string"
          }
        },
        "user_ids" : {
          "description" : "User Ids",
          "type" : "array",
          "items" : {
            "description" : "User Ids",
            "type" : "string"
          }
        }
      },
      "required" : [ "user_group_ids", "user_ids" ]
    },
    "dest_device_ids" : {
      "description" : "Dest Device Ids",
      "maxItems" : 10,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Dest Device Ids",
        "type" : "string"
      }
    },
    "src_device_ids" : {
      "description" : "Src Device Ids",
      "maxItems" : 256,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Src Device Ids",
        "type" : "string"
      }
    },
    "best_path_config" : {
      "properties" : {
        "probe_config_id" : {
          "description" : "Probe Config Id",
          "type" : "string"
        },
        "metric" : {
          "description" : "Metric",
          "type" : "string",
          "enum" : [ "LATENCY", "JITTER", "PACKET_LOSS", "INIT_FAILURE_PCT", "DNS_TXN_FAILURE_PCT" ]
        },
        "metric_type" : {
          "description" : "Metric Type",
          "type" : "string",
          "enum" : [ "PROBE", "LQM" ]
        }
      },
      "required" : [ "probe_config_id", "metric", "metric_type" ]
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
  "required" : [ "destination_prefixes_id", "source_prefixes_id", "paths_allowed", "service_context", "enabled", "order_number", "network_context_id", "app_def_ids", "user_or_group", "dest_device_ids", "src_device_ids", "best_path_config", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_path_policy_rule.my_resource_name"
 id="<resource_id>:policy_set_id=<some_policy_set_id>"
}
```

