## Documentation for Prisma SDWAN Resource "element_multicast_global_config"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_multicast_global_config` |
| Get Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/multicastglobalconfigs/{config_id}` (`MulticastGlobalConfigScreenV2N1`) |
| Put Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/multicastglobalconfigs/{config_id}` (`MulticastGlobalConfigScreenV2N1`) |


### JSON Schema

```json
{
  "properties" : {
    "igmp_protocol_parameters" : {
      "properties" : {
        "query_max_response_time" : {
          "description" : "Query Max Response Time",
          "format" : "int64",
          "type" : "integer"
        },
        "last_member_query_interval" : {
          "description" : "Last Member Query Interval",
          "format" : "int64",
          "type" : "integer"
        },
        "last_member_query_count" : {
          "description" : "Last Member Query Count",
          "format" : "int64",
          "type" : "integer"
        },
        "query_interval" : {
          "description" : "Query Interval",
          "format" : "int64",
          "type" : "integer"
        }
      }
    },
    "pim_protocol_parameters" : {
      "properties" : {
        "join_prune_interval" : {
          "description" : "Join Prune Interval",
          "format" : "int64",
          "type" : "integer"
        },
        "hello_hold_time" : {
          "description" : "Hello Hold Time",
          "format" : "int64",
          "type" : "integer"
        },
        "hello_interval" : {
          "description" : "Hello Interval",
          "format" : "int64",
          "type" : "integer"
        }
      }
    },
    "dr_priority" : {
      "description" : "Dr Priority: Range(max = 4294967295L, message = MULTICAST_INVALID_DR_PRIORITY, min = 1L) ",
      "format" : "int64",
      "type" : "integer"
    },
    "bsm_enabled" : {
      "description" : "Bsm Enabled",
      "type" : "boolean"
    },
    "spt_switchover_enabled" : {
      "description" : "Spt Switchover Enabled",
      "type" : "boolean"
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
 to="prismasdwan_element_multicast_global_config.my_resource_name"
 id="<resource_id>"
}
```

