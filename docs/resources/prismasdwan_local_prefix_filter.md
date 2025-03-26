## Documentation for Prisma SDWAN Resource "local_prefix_filter"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `local_prefix_filter` |
| Get Api  | `/sdwan/v2.0/api/localprefixfilters/{id}` (`LocalPrefixFilterScreen`) |
| Post Api  | `/sdwan/v2.0/api/localprefixfilters` (`LocalPrefixFilterScreen`) |
| Put Api  | `/sdwan/v2.0/api/localprefixfilters/{id}` (`LocalPrefixFilterScreen`) |
| Delete Api  | `/sdwan/v2.0/api/localprefixfilters/{id}` |


### JSON Schema

```json
{
  "properties" : {
    "description" : {
      "description" : "Description: Size(max = 256, error = PREFIXFILTER_INVALID_DESCRIPTION: Prefix filter description exceeds limit., min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Size(max = 128, error = PREFIXFILTER_INVALID_NAME: Prefix filter name exceeds limit., min = 1) Required(error = PREFIXFILTER_NAME_REQUIRED: Prefix filter name required.) ",
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
 to="prismasdwan_local_prefix_filter.my_resource_name"
 id="<resource_id>"
}
```

