## Documentation for Prisma SDWAN Resource "element_bgp_config"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_bgp_config` |
| Get Api  | `/sdwan/v2.5/api/sites/{site_id}/elements/{element_id}/bgpconfigs/{bgp_config_id}` (`BGPGlobalConfigScreenV2N5`) |
| Put Api  | `/sdwan/v2.5/api/sites/{site_id}/elements/{element_id}/bgpconfigs/{bgp_config_id}` (`BGPGlobalConfigScreenV2N5`) |


### JSON Schema

```json
{
  "properties" : {
    "vrf_router_id_map" : {
      "description" : "Vrf Router Id Map",
      "type" : "array",
      "items" : {
        "properties" : {
          "router_id" : {
            "description" : "Router Id",
            "format" : "ipv4",
            "type" : "string"
          },
          "vrf_context_id" : {
            "description" : "Vrf Context Id",
            "maxLength" : 20,
            "pattern" : "^-?[0-9]{1,20}$",
            "type" : "string"
          }
        },
        "required" : [ "router_id", "vrf_context_id" ]
      }
    },
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
        },
        "required" : [ "route_map_id", "vrf_context_id" ]
      }
    },
    "ipv6_prefixes_to_adv_to_wan" : {
      "description" : "Ipv6 Prefixes To Adv To Wan",
      "type" : "array",
      "items" : {
        "description" : "Ipv6 Prefixes To Adv To Wan",
        "format" : "ipv6",
        "type" : "string"
      }
    },
    "peer_auth_type" : {
      "description" : "Peer Auth Type",
      "type" : "string",
      "enum" : [ "md5", "none" ]
    },
    "prefix_adv_type_to_lan" : {
      "description" : "Prefix Adv Type To Lan",
      "type" : "string"
    },
    "prefixes_to_adv_to_wan" : {
      "description" : "Prefixes To Adv To Wan",
      "type" : "array",
      "items" : {
        "description" : "Prefixes To Adv To Wan",
        "format" : "ipv4",
        "type" : "string"
      }
    },
    "prefix_adv_type" : {
      "description" : "Prefix Adv Type",
      "type" : "string"
    },
    "stalepath_time" : {
      "description" : "Stalepath Time",
      "format" : "int32",
      "maximum" : 3600,
      "minimum" : 1,
      "type" : "integer"
    },
    "graceful_restart" : {
      "description" : "Graceful Restart",
      "type" : "boolean"
    },
    "admin_distance" : {
      "description" : "Admin Distance",
      "format" : "int32",
      "maximum" : 255,
      "minimum" : 1,
      "type" : "integer"
    },
    "maximum_paths" : {
      "description" : "Maximum Paths",
      "format" : "int32",
      "maximum" : 255,
      "minimum" : 1,
      "type" : "integer"
    },
    "multi_hop_limit" : {
      "description" : "Multi Hop Limit",
      "format" : "int32",
      "maximum" : 255,
      "minimum" : 1,
      "type" : "integer"
    },
    "md5_secret" : {
      "description" : "Md5 Secret",
      "maxLength" : 32,
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
      "description" : "Peer Retry Time",
      "format" : "int32",
      "maximum" : 65535,
      "minimum" : 1,
      "type" : "integer"
    },
    "adv_interval" : {
      "description" : "Adv Interval",
      "format" : "int32",
      "maximum" : 600,
      "minimum" : 0,
      "type" : "integer"
    },
    "hold_time" : {
      "description" : "Hold Time",
      "format" : "int32",
      "maximum" : 600,
      "minimum" : 3,
      "type" : "integer"
    },
    "keepalive_time" : {
      "description" : "Keepalive Time",
      "format" : "int32",
      "maximum" : 200,
      "minimum" : 1,
      "type" : "integer"
    },
    "local_as_num" : {
      "description" : "Local As Num",
      "maxLength" : 256,
      "type" : "string"
    },
    "router_id" : {
      "description" : "Router Id",
      "format" : "ipv4",
      "maxLength" : 256,
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
  "required" : [ "vrf_router_id_map", "ospf_redistribution", "ipv6_prefixes_to_adv_to_wan", "peer_auth_type", "prefix_adv_type_to_lan", "prefixes_to_adv_to_wan", "prefix_adv_type", "stalepath_time", "graceful_restart", "admin_distance", "maximum_paths", "multi_hop_limit", "md5_secret", "peer_retry_time", "adv_interval", "hold_time", "keepalive_time", "local_as_num", "router_id", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_bgp_config.my_resource_name"
 id="<resource_id>"
}
```

