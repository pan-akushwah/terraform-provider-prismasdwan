## Documentation for Prisma SDWAN Resource "element_routing_ipcommunitylist"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_routing_ipcommunitylist` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/routing_ipcommunitylists/{config_id}` (`RoutingCommunityListScreen`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/routing_ipcommunitylists` (`RoutingCommunityListScreen`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/routing_ipcommunitylists/{config_id}` (`RoutingCommunityListScreen`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/routing_ipcommunitylists/{config_id}` |


### JSON Schema

```json
{
  "properties" : {
    "auto_generated" : {
      "description" : "Auto Generated",
      "type" : "boolean"
    },
    "community_list" : {
      "description" : "Community List",
      "type" : "array",
      "items" : {
        "properties" : {
          "community_str" : {
            "description" : "Community Str",
            "maxLength" : 256,
            "pattern" : "internet|no-export|no-advertise|local-AS|(0|6553[0-5]|655[0-2][0-9]|65[0-4](\\d){2}|6[0-4](\\d){3}|[1-5](\\d){4}|[1-9](\\d){0,3}):(0|6553[0-5]|655[0-2][0-9]|65[0-4](\\d){2}|6[0-4](\\d){3}|[1-5](\\d){4}|[1-9](\\d){0,3})",
            "type" : "string"
          },
          "permit" : {
            "description" : "Permit",
            "type" : "boolean"
          }
        },
        "required" : [ "community_str", "permit" ]
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
  "required" : [ "auto_generated", "community_list", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_routing_ipcommunitylist.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

