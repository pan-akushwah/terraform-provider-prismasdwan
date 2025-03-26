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
      "description" : "As Path Regex List: Valid Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "as_path_regex" : {
            "description" : "As Path Regex: NotNull(ASPATH_ACCESS_LIST_REGEX_MISSING) ",
            "type" : "string"
          },
          "permit" : {
            "description" : "Permit",
            "type" : "boolean"
          },
          "order" : {
            "description" : "Order: Range(max = 65535L, ASPATH_ACCESS_LIST_INVALID_ORDER, min = 1L) ",
            "format" : "int32",
            "type" : "integer"
          }
        },
        "required" : [ "as_path_regex" ]
      }
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
 to="prismasdwan_element_routing_aspathaccesslist.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

