## Documentation for Prisma SDWAN Resource "element_bgp_peer"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_bgp_peer` |
| Get Api  | `/sdwan/v3.0/api/sites/{site_id}/elements/{element_id}/bgppeers/{bgp_peer_id}` (`BGPPeerConfigScreenV3`) |
| Post Api  | `/sdwan/v3.0/api/sites/{site_id}/elements/{element_id}/bgppeers` (`BGPPeerConfigScreenV3`) |
| Put Api  | `/sdwan/v3.0/api/sites/{site_id}/elements/{element_id}/bgppeers/{bgp_peer_id}` (`BGPPeerConfigScreenV3`) |
| Delete Api  | `/sdwan/v3.0/api/sites/{site_id}/elements/{element_id}/bgppeers/{bgp_peer_id}` |


### JSON Schema

```json
{
  "properties" : {
    "route_aggregation" : {
      "properties" : {
        "aggregate_prefixes" : {
          "description" : "Aggregate Prefixes",
          "type" : "array",
          "items" : {
            "properties" : {
              "ip_prefixes" : {
                "description" : "Ip Prefixes",
                "type" : "array",
                "items" : {
                  "description" : "Ip Prefixes",
                  "type" : "string"
                }
              },
              "type" : {
                "description" : "Type",
                "type" : "string",
                "enum" : [ "ipv4", "ipv6", "ipv4v6" ]
              }
            },
            "required" : [ "ip_prefixes", "type" ]
          }
        },
        "ipv6_prefix_list_id" : {
          "description" : "Ipv6 Prefix List Id",
          "type" : "string"
        },
        "ipv4_prefix_list_id" : {
          "description" : "Ipv4 Prefix List Id",
          "type" : "string"
        },
        "aggregate_type" : {
          "description" : "Aggregate Type",
          "type" : "string",
          "enum" : [ "unaggregated", "aggregate-auto", "aggregate-manual", "aggregate-manual-summary-only", "default" ]
        }
      },
      "required" : [ "aggregate_prefixes", "ipv6_prefix_list_id", "ipv4_prefix_list_id", "aggregate_type" ]
    },
    "advertise_default_route" : {
      "description" : "Advertise Default Route",
      "type" : "boolean"
    },
    "update_source_v6" : {
      "description" : "Update Source V6",
      "format" : "ipv6",
      "type" : "string"
    },
    "allow_v6_prefixes" : {
      "description" : "Allow V6 Prefixes",
      "type" : "boolean"
    },
    "allow_v4_prefixes" : {
      "description" : "Allow V4 Prefixes",
      "type" : "boolean"
    },
    "peer_ip_v6" : {
      "description" : "Peer Ip V6",
      "format" : "ipv6",
      "type" : "string"
    },
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
    },
    "bgp_config" : {
      "properties" : {
        "peer_auth_type" : {
          "description" : "Peer Auth Type",
          "type" : "string",
          "enum" : [ "md5", "none" ]
        },
        "multi_hop_limit" : {
          "description" : "Multi Hop Limit",
          "format" : "int32",
          "type" : "integer"
        },
        "md5_secret" : {
          "description" : "Md5 Secret",
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
          "type" : "integer"
        },
        "adv_interval" : {
          "description" : "Adv Interval",
          "format" : "int32",
          "type" : "integer"
        },
        "hold_time" : {
          "description" : "Hold Time",
          "format" : "int32",
          "type" : "integer"
        },
        "keepalive_time" : {
          "description" : "Keepalive Time",
          "format" : "int32",
          "type" : "integer"
        },
        "local_as_num" : {
          "description" : "Local As Num",
          "type" : "string"
        }
      },
      "required" : [ "peer_auth_type", "multi_hop_limit", "md5_secret", "peer_retry_time", "adv_interval", "hold_time", "keepalive_time", "local_as_num" ]
    },
    "scope" : {
      "description" : "Scope",
      "type" : "string",
      "enum" : [ "GLOBAL", "LOCAL" ]
    },
    "shutdown" : {
      "description" : "Shutdown",
      "type" : "boolean"
    },
    "update_source" : {
      "description" : "Update Source",
      "format" : "ipv4",
      "type" : "string"
    },
    "route_map_out_id" : {
      "description" : "Route Map Out Id",
      "type" : "string"
    },
    "route_map_in_id" : {
      "description" : "Route Map In Id",
      "type" : "string"
    },
    "peer_type" : {
      "description" : "Peer Type",
      "type" : "string"
    },
    "remote_as_num" : {
      "description" : "Remote As Num",
      "minLength" : 1,
      "type" : "string"
    },
    "peer_ip" : {
      "description" : "Peer Ip",
      "format" : "ipv4",
      "type" : "string"
    },
    "tags" : {
      "description" : "Tags",
      "maxItems" : 10,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Tags",
        "maxLength" : 1024,
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
      "maxLength" : 1024,
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
  "required" : [ "route_aggregation", "advertise_default_route", "update_source_v6", "allow_v6_prefixes", "allow_v4_prefixes", "peer_ip_v6", "router_id", "vrf_context_id", "bgp_config", "scope", "shutdown", "update_source", "route_map_out_id", "route_map_in_id", "peer_type", "remote_as_num", "peer_ip", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_bgp_peer.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

