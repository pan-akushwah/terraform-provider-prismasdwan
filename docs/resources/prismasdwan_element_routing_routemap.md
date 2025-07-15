## Documentation for Prisma SDWAN Resource "element_routing_routemap"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_routing_routemap` |
| Get Api  | `/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/routing_routemaps/{config_id}` (`RoutingRouteMapScreenV2N3`) |
| Post Api  | `/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/routing_routemaps` (`RoutingRouteMapScreenV2N3`) |
| Put Api  | `/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/routing_routemaps/{config_id}` (`RoutingRouteMapScreenV2N3`) |
| Delete Api  | `/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/routing_routemaps/{config_id}` |


### JSON Schema

```json
{
  "properties" : {
    "route_map_entries" : {
      "description" : "Route Map Entries: Valid Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "set" : {
            "properties" : {
              "metric" : {
                "description" : "Metric",
                "format" : "int64",
                "type" : "integer"
              },
              "type" : {
                "description" : "Type",
                "type" : "string",
                "enum" : [ "type-1", "type-2" ]
              },
              "additive_community" : {
                "description" : "Additive Community",
                "type" : "boolean"
              },
              "tag" : {
                "description" : "Tag",
                "format" : "int32",
                "type" : "integer"
              },
              "ip_v6_next_hop" : {
                "description" : "Ip V6 Next Hop",
                "type" : "string"
              },
              "ip_next_hop" : {
                "description" : "Ip Next Hop",
                "type" : "string"
              },
              "community" : {
                "description" : "Community",
                "type" : "string"
              },
              "weight" : {
                "description" : "Weight",
                "format" : "int64",
                "type" : "integer"
              },
              "local_preference" : {
                "description" : "Local Preference",
                "format" : "int64",
                "type" : "integer"
              },
              "as_path_prepend" : {
                "description" : "As Path Prepend",
                "type" : "string"
              }
            }
          },
          "match" : {
            "properties" : {
              "metric" : {
                "description" : "Metric",
                "format" : "int64",
                "type" : "integer"
              },
              "tag" : {
                "description" : "Tag",
                "format" : "int32",
                "type" : "integer"
              },
              "community_list_id" : {
                "description" : "Community List Id",
                "type" : "string"
              },
              "ip_next_hop_id" : {
                "description" : "Ip Next Hop Id",
                "type" : "string"
              },
              "ip_prefix_list_id" : {
                "description" : "Ip Prefix List Id",
                "type" : "string"
              },
              "as_path_id" : {
                "description" : "As Path Id",
                "type" : "string"
              }
            }
          },
          "continue_entry" : {
            "description" : "Continue Entry: Pattern(ROUTE_MAP_INVALID_CONTINUE_ORDER, regexp = ^(0|[1-9][0-9]{0,3}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])$) ",
            "type" : "string"
          },
          "permit" : {
            "description" : "Permit",
            "type" : "boolean"
          },
          "order" : {
            "description" : "Order: Range(max = 65535L, ROUTE_MAP_INVALID_ORDER, min = 1L) ",
            "format" : "int32",
            "type" : "integer"
          }
        }
      }
    },
    "used_for" : {
      "description" : "Used For",
      "type" : "string",
      "enum" : [ "bgp", "ospf" ]
    },
    "auto_generated" : {
      "description" : "Auto Generated",
      "type" : "boolean"
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
  },
  "required" : [ "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_routing_routemap.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

