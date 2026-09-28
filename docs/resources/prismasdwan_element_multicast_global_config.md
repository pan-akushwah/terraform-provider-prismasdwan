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
      },
      "required" : [ "query_max_response_time", "last_member_query_interval", "last_member_query_count", "query_interval" ]
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
      },
      "required" : [ "join_prune_interval", "hello_hold_time", "hello_interval" ]
    },
    "dr_priority" : {
      "description" : "Dr Priority",
      "format" : "int64",
      "maximum" : 4294967295,
      "minimum" : 1,
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
  "required" : [ "igmp_protocol_parameters", "pim_protocol_parameters", "dr_priority", "bsm_enabled", "spt_switchover_enabled", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_multicast_global_config.my_resource_name"
 id="<resource_id>"
}
```

