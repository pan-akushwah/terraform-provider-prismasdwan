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
      "description" : "Community List: Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "community_str" : {
            "description" : "Community Str: NotNull(COMMUNITY_STRING_MISSING) Size(max = 256, COMMUNITY_STRING_EXCEEDS_LIMIT, min = 0) Pattern(message = INVALID_COMMUNITY_STRING, regexp = internet|no-export|no-advertise|local-AS|(0|6553[0-5]|655[0-2][0-9]|65[0-4](\\\\d){2}|6[0-4](\\\\d){3}|[1-5](\\\\d){4}|[1-9](\\\\d){0,3}):(0|6553[0-5]|655[0-2][0-9]|65[0-4](\\\\d){2}|6[0-4](\\\\d){3}|[1-5](\\\\d){4}|[1-9](\\\\d){0,3})) ",
            "type" : "string"
          },
          "permit" : {
            "description" : "Permit",
            "type" : "boolean"
          }
        },
        "required" : [ "community_str" ]
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
  "required" : [ "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_routing_ipcommunitylist.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

