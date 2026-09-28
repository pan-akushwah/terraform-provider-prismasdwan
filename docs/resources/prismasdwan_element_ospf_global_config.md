## Documentation for Prisma SDWAN Resource "element_ospf_global_config"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_ospf_global_config` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/ospfglobalconfigs/{ospf_config_id}` (`OSPFGlobalConfigScreen`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/ospfglobalconfigs/{ospf_config_id}` (`OSPFGlobalConfigScreen`) |


### JSON Schema

```json
{
  "properties" : {
    "prefix_adv_type_to_lan" : {
      "description" : "Prefix Adv Type To Lan",
      "type" : "string"
    },
    "retransmit_interval" : {
      "description" : "Retransmit Interval",
      "format" : "int32",
      "maximum" : 65535,
      "minimum" : 1,
      "type" : "integer"
    },
    "cost" : {
      "description" : "Cost",
      "maximum" : 65535,
      "minimum" : 1,
      "type" : "integer"
    },
    "md5_key_id" : {
      "description" : "Md5 Key Id",
      "maximum" : 255,
      "minimum" : 1,
      "type" : "integer"
    },
    "md5_secret" : {
      "description" : "Md5 Secret",
      "maxLength" : 16,
      "minLength" : 1,
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_sensitive" : {
            "type" : "boolean"
          }
        }
      }
    },
    "dead_interval" : {
      "description" : "Dead Interval",
      "format" : "int32",
      "maximum" : 65535,
      "minimum" : 1,
      "type" : "integer"
    },
    "hello_interval" : {
      "description" : "Hello Interval",
      "format" : "int32",
      "maximum" : 65535,
      "minimum" : 1,
      "type" : "integer"
    },
    "transmit_delay" : {
      "description" : "Transmit Delay",
      "format" : "int32",
      "maximum" : 65535,
      "minimum" : 1,
      "type" : "integer"
    },
    "router_id" : {
      "description" : "Router Id",
      "format" : "ipv4",
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
  "required" : [ "prefix_adv_type_to_lan", "retransmit_interval", "cost", "md5_key_id", "md5_secret", "dead_interval", "hello_interval", "transmit_delay", "router_id", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_ospf_global_config.my_resource_name"
 id="<resource_id>"
}
```

