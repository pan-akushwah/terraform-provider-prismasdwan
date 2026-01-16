## Documentation for Prisma SDWAN Resource "element_bgp_peer"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_bgp_peer` |
| Get Api  | `/sdwan/v2.6/api/sites/{site_id}/elements/{element_id}/bgppeers/{bgp_peer_id}` (`BGPPeerConfigScreenV2N6`) |
| Post Api  | `/sdwan/v2.6/api/sites/{site_id}/elements/{element_id}/bgppeers` (`BGPPeerConfigScreenV2N6`) |
| Put Api  | `/sdwan/v2.6/api/sites/{site_id}/elements/{element_id}/bgppeers/{bgp_peer_id}` (`BGPPeerConfigScreenV2N6`) |
| Delete Api  | `/sdwan/v2.6/api/sites/{site_id}/elements/{element_id}/bgppeers/{bgp_peer_id}` |


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
            }
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
      }
    },
    "advertise_default_route" : {
      "description" : "Advertise Default Route",
      "type" : "boolean"
    },
    "update_source_v6" : {
      "description" : "Update Source V6: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, PEER_CONFIG_INVALID_UPDATE_SOURCE_IP, type = IPV6) ",
      "type" : "string"
    },
    "allow_v6_prefixes" : {
      "description" : "Allow V6 Prefixes: Required(message = ALLOW_IPV6_PREFIXES_REQUIRED) ",
      "type" : "boolean"
    },
    "allow_v4_prefixes" : {
      "description" : "Allow V4 Prefixes: Required(message = ALLOW_IPV4_PREFIXES_REQUIRED) ",
      "type" : "boolean"
    },
    "peer_ip_v6" : {
      "description" : "Peer Ip V6: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, PEER_CONFIG_INVALID_PEER_IPV6, type = IPV6) ",
      "type" : "string"
    },
    "router_id" : {
      "description" : "Router Id: Size(max = 256, error = ROUTER_ID_EXCEEDS_LIMIT: Router_id exceeds limit. Maximum length is 256, min = 0) IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = BGP_CONFIG_INVALID_ROUTER_ID: Invalid IP address for router_id. Please use a valid IP Address., type = IP) ",
      "type" : "string"
    },
    "vrf_context_id" : {
      "description" : "Vrf Context Id: Digits(fraction = 0, integer = 20, error = VRF_CONTEXT_ID_INVALID: VRF Context ID is empty or invalid.) ",
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
      }
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
      "description" : "Update Source: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, PEER_CONFIG_INVALID_UPDATE_SOURCE_IP, type = IP) ",
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
      "description" : "Remote As Num: NotEmpty(REQUIRED_REMOTE_AS_NUM) ",
      "type" : "string"
    },
    "peer_ip" : {
      "description" : "Peer Ip: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = PEER_CONFIG_INVALID_PEER_IP: Invalid IP address for routing peer. Please use a valid IPv4 address., type = IP) ",
      "type" : "string"
    },
    "tags" : {
      "description" : "Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 1024, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\\\s]+, required = false) ",
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
      "description" : "Description: Size(max = 1024, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Required(error = NAME_REQD: Please provide resource name.) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
      "type" : "string"
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
  },
  "required" : [ "allow_v6_prefixes", "allow_v4_prefixes", "remote_as_num", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_bgp_peer.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

