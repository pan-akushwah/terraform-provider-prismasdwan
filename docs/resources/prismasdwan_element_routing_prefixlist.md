## Documentation for Prisma SDWAN Resource "element_routing_prefixlist"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_routing_prefixlist` |
| Get Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/routing_prefixlists/{routing_prefixlist_id}` (`RoutingPrefixListScreenV2N1`) |
| Post Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/routing_prefixlists` (`RoutingPrefixListScreenV2N1`) |
| Put Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/routing_prefixlists/{routing_prefixlist_id}` (`RoutingPrefixListScreenV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/routing_prefixlists/{routing_prefixlist_id}` |


### JSON Schema

```json
{
  "properties" : {
    "auto_generated" : {
      "description" : "Auto Generated",
      "type" : "boolean"
    },
    "prefix_filter_list" : {
      "description" : "Prefix Filter List",
      "type" : "array",
      "items" : {
        "properties" : {
          "le" : {
            "description" : "Le",
            "format" : "int32",
            "maximum" : 128,
            "minimum" : 0,
            "type" : "integer"
          },
          "ge" : {
            "description" : "Ge",
            "format" : "int32",
            "maximum" : 128,
            "minimum" : 0,
            "type" : "integer"
          },
          "ipv6_prefix" : {
            "description" : "Ipv6 Prefix",
            "format" : "ipv4",
            "type" : "string"
          },
          "prefix" : {
            "description" : "Prefix",
            "format" : "ipv4",
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
        "required" : [ "le", "ge", "ipv6_prefix", "prefix", "permit", "order" ]
      }
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
  "required" : [ "auto_generated", "prefix_filter_list", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_routing_prefixlist.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

