## Documentation for Prisma SDWAN Resource "element_routing_aspathaccesslist"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_routing_aspathaccesslist` |
| Get Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/routing_aspathaccesslists/{config_id}` (`RoutingAccessListScreenV2N1`) |
| Post Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/routing_aspathaccesslists` (`RoutingAccessListScreenV2N1`) |
| Put Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/routing_aspathaccesslists/{config_id}` (`RoutingAccessListScreenV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/routing_aspathaccesslists/{config_id}` |


### JSON Schema

```json
{
  "properties" : {
    "auto_generated" : {
      "description" : "Auto Generated",
      "type" : "boolean"
    },
    "as_path_regex_list" : {
      "description" : "As Path Regex List",
      "type" : "array",
      "items" : {
        "properties" : {
          "as_path_regex" : {
            "description" : "As Path Regex",
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
        "required" : [ "as_path_regex", "permit", "order" ]
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
  "required" : [ "auto_generated", "as_path_regex_list", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_routing_aspathaccesslist.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

