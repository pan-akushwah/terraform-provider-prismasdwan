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
      "description" : "Retransmit Interval: Range(max = 65535L, error = OSPF_CONFIG_INVALID_RETRANSMIT_INTERVAL: Invalid retransmit interval.Value needs to be between 1 and 65535., min = 1L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "cost" : {
      "description" : "Cost: Range(max = 65535L, message = OSPF_CONFIG_INVALID_COST, min = 1L) ",
      "type" : "integer"
    },
    "md5_key_id" : {
      "description" : "Md5 Key Id: Range(max = 255L, message = OSPF_CONFIG_MD5_KEY_ID_LENGTH_EXCEEDS, min = 1L) ",
      "type" : "integer"
    },
    "md5_secret" : {
      "description" : "Md5 Secret: Size(max = 16, error = OSPF_CONFIG_MD5_LENGTH_EXCEEDS: Max length of MD5 secret is 16., min = 1) ",
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
      "description" : "Dead Interval: Range(max = 65535L, error = OSPF_CONFIG_INVALID_DEAD_INTERVAL: Invalid Dead Interval.Value needs to be between 1 and 65535., min = 1L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "hello_interval" : {
      "description" : "Hello Interval: Range(max = 65535L, error = OSPF_CONFIG_INVALID_HELLO_INTERVAL: Invalid Hello Interval.Value needs to be between 1 and 65535., min = 1L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "transmit_delay" : {
      "description" : "Transmit Delay: Range(max = 65535L, error = OSPF_CONFIG_INVALID_TRANSMIT_DELAY: Invalid transmit delay.Value needs to be between 1 and 65535., min = 1L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "router_id" : {
      "description" : "Router Id: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = OSPF_CONFIG_INVALID_ROUTER_ID: Invalid Router Id, type = IP) ",
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
 to="prismasdwan_element_ospf_global_config.my_resource_name"
 id="<resource_id>"
}
```

