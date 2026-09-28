## Documentation for Prisma SDWAN Resource "element_static_route"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_static_route` |
| Get Api  | `/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/staticroutes/{static_route_id}` (`StaticRouteV2N3`) |
| Post Api  | `/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/staticroutes` (`StaticRouteV2N3`) |
| Put Api  | `/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/staticroutes/{static_route_id}` (`StaticRouteV2N3`) |
| Delete Api  | `/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/staticroutes/{static_route_id}` |


### JSON Schema

```json
{
  "properties" : {
    "vrf_context_id" : {
      "description" : "Vrf Context Id",
      "maxLength" : 20,
      "pattern" : "^-?[0-9]{1,20}$",
      "type" : "string"
    },
    "address_family" : {
      "description" : "Address Family",
      "type" : "string",
      "enum" : [ "ipv4", "ipv6" ]
    },
    "nexthop_reachability_probe" : {
      "description" : "Nexthop Reachability Probe",
      "type" : "boolean"
    },
    "network_context_id" : {
      "description" : "Network Context Id",
      "type" : "string"
    },
    "scope" : {
      "description" : "Scope",
      "type" : "string",
      "enum" : [ "global", "local" ]
    },
    "nexthops" : {
      "description" : "Nexthops",
      "type" : "array",
      "items" : {
        "properties" : {
          "self" : {
            "description" : "Self",
            "type" : "boolean"
          },
          "admin_distance" : {
            "description" : "Admin Distance",
            "type" : "integer"
          },
          "nexthop_interface_id" : {
            "description" : "Nexthop Interface Id",
            "type" : "string"
          },
          "nexthop_ip" : {
            "description" : "Nexthop Ip",
            "type" : "string"
          }
        },
        "required" : [ "self", "admin_distance", "nexthop_interface_id", "nexthop_ip" ]
      }
    },
    "destination_prefix" : {
      "description" : "Destination Prefix",
      "type" : "string"
    },
    "tags" : {
      "description" : "Tags",
      "maxItems" : 10,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Tags",
        "maxLength" : 128,
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
      "maxLength" : 256,
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
  "required" : [ "vrf_context_id", "address_family", "nexthop_reachability_probe", "network_context_id", "scope", "nexthops", "destination_prefix", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_static_route.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

