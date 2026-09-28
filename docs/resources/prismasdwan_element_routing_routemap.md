## Documentation for Prisma SDWAN Resource "element_routing_routemap"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_routing_routemap` |
| Get Api  | `/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/routing_routemaps/{config_id}` (`RoutingRouteMapScreenV2N4`) |
| Post Api  | `/sdwan/v2.4/api/sites/{site_id}/elements/{element_id}/routing_routemaps` (`RoutingRouteMapScreenV2N4`) |
| Put Api  | `/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/routing_routemaps/{config_id}` (`RoutingRouteMapScreenV2N4`) |
| Delete Api  | `/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/routing_routemaps/{config_id}` |


### JSON Schema

```json
{
  "properties" : {
    "route_map_entries" : {
      "description" : "Route Map Entries",
      "type" : "array",
      "items" : {
        "properties" : {
          "match" : {
            "properties" : {
              "service_binding_id" : {
                "description" : "Service Binding Id",
                "type" : "string"
              },
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
            },
            "required" : [ "service_binding_id", "metric", "tag", "community_list_id", "ip_next_hop_id", "ip_prefix_list_id", "as_path_id" ]
          },
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
            },
            "required" : [ "metric", "type", "additive_community", "tag", "ip_v6_next_hop", "ip_next_hop", "community", "weight", "local_preference", "as_path_prepend" ]
          },
          "continue_entry" : {
            "description" : "Continue Entry",
            "pattern" : "^(0|[1-9][0-9]{0,3}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])$",
            "type" : "string"
          },
          "permit" : {
            "description" : "Permit",
            "type" : "boolean"
          },
          "order" : {
            "description" : "Order",
            "format" : "int32",
            "maximum" : 65535,
            "minimum" : 1,
            "type" : "integer"
          }
        },
        "required" : [ "match", "set", "continue_entry", "permit", "order" ]
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
  "required" : [ "route_map_entries", "used_for", "auto_generated", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_routing_routemap.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

