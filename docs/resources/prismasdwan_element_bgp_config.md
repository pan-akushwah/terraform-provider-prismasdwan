## Documentation for Prisma SDWAN Resource "element_bgp_config"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_bgp_config` |
| Get Api  | `/sdwan/v2.4/api/sites/{site_id}/elements/{element_id}/bgpconfigs/{bgp_config_id}` (`BGPGlobalConfigScreenV2N4`) |
| Put Api  | `/sdwan/v2.4/api/sites/{site_id}/elements/{element_id}/bgpconfigs/{bgp_config_id}` (`BGPGlobalConfigScreenV2N4`) |


### JSON Schema

```json
{
  "properties" : {
    "ospf_redistribution" : {
      "description" : "Ospf Redistribution",
      "type" : "array",
      "items" : {
        "properties" : {
          "route_map_id" : {
            "description" : "Route Map Id",
            "type" : "string"
          },
          "vrf_context_id" : {
            "description" : "Vrf Context Id",
            "type" : "string"
          }
        }
      }
    },
    "ipv6_prefixes_to_adv_to_wan" : {
      "description" : "Ipv6 Prefixes To Adv To Wan: ListIPv6Address(bcast = DENY, listMaxSize = 0, error = BGP_CONFIG_INVALID_PREFIX: IP prefix is not valid OR is not within the valid prefix range, required = false, type = GATEWAYCIDRV6) ",
      "type" : "array",
      "items" : {
        "description" : "Ipv6 Prefixes To Adv To Wan",
        "type" : "string"
      }
    },
    "peer_auth_type" : {
      "description" : "Peer Auth Type: Transient ",
      "type" : "string",
      "enum" : [ "md5", "none" ]
    },
    "prefix_adv_type_to_lan" : {
      "description" : "Prefix Adv Type To Lan",
      "type" : "string"
    },
    "prefixes_to_adv_to_wan" : {
      "description" : "Prefixes To Adv To Wan: ListIPAddress(bcast = DENY, listMaxSize = 0, error = BGP_CONFIG_INVALID_PREFIX: IP prefix is not valid OR is not within the valid prefix range, required = false, type = APP_GATEWAYCIDR) ",
      "type" : "array",
      "items" : {
        "description" : "Prefixes To Adv To Wan",
        "type" : "string"
      }
    },
    "prefix_adv_type" : {
      "description" : "Prefix Adv Type",
      "type" : "string"
    },
    "stalepath_time" : {
      "description" : "Stalepath Time: Range(max = 3600L, error = BGP_CONFIG_INVALID_STALEPATH_TIME: STTALEPATH TIME should be in the range 1-3600, min = 1L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "graceful_restart" : {
      "description" : "Graceful Restart",
      "type" : "boolean"
    },
    "admin_distance" : {
      "description" : "Admin Distance: Range(max = 255L, error = BGP_CONFIG_INVALID_ADMIN_DISTANCE: ADMIN DISTANCE should be in the range 1-255, min = 1L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "maximum_paths" : {
      "description" : "Maximum Paths: Range(max = 255L, error = BGP_CONFIG_INVALID_MAXIMUM_PATHS: MAX PATHS should be in the range 1-255, min = 1L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "multi_hop_limit" : {
      "description" : "Multi Hop Limit: Range(max = 255L, error = BGP_CONFIG_INVALID_MULTI_HOP_LIMIT: MULTI HOP LIMIT should be in the range 1-255, min = 1L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "md5_secret" : {
      "description" : "Md5 Secret: Size(max = 32, error = BGP_CONFIG_MD5_LENGTH_EXCEEDS: MD5 SECRETE length should not exceed 32 characters, min = 0) ",
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_sensitive" : {
            "type" : "boolean"
          }
        }
      }
    },
    "peer_retry_time" : {
      "description" : "Peer Retry Time: Range(max = 65535L, error = BGP_CONFIG_INVALID_PEER_RETRY_TIME: PEER RETRY TIME should be in the range 0-65535, min = 0L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "adv_interval" : {
      "description" : "Adv Interval: Range(max = 600L, error = BGP_CONFIG_INVALID_ADV_INTERVAL: ADVERTISE INTERVAL should be in the range 0-600, min = 0L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "hold_time" : {
      "description" : "Hold Time: Range(max = 600L, error = BGP_CONFIG_INVALID_HOLD_TIME: Hold TIME should be in the range 3-600, min = 3L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "keepalive_time" : {
      "description" : "Keepalive Time: Range(max = 200L, error = BGP_CONFIG_INVALID_KEEPALIVE_TIME: KEEPALIVE TIME should be in the range 1-200, min = 1L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "local_as_num" : {
      "description" : "Local As Num: Size(max = 256, error = LOCAL_AS_NUM_EXCEEDS_LIMIT: Local as number exceeds limit, min = 0) ",
      "type" : "string"
    },
    "router_id" : {
      "description" : "Router Id: Size(max = 256, ROUTER_ID_EXCEEDS_LIMIT, min = 0) IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, BGP_CONFIG_INVALID_ROUTER_ID, type = IP) ",
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
 to="prismasdwan_element_bgp_config.my_resource_name"
 id="<resource_id>"
}
```

