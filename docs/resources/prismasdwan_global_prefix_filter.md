## Documentation for Prisma SDWAN Resource "global_prefix_filter"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `global_prefix_filter` |
| Get Api  | `/sdwan/v2.0/api/globalprefixfilters/{filter_id}` (`GlobalPrefixFilterScreen`) |
| Post Api  | `/sdwan/v2.0/api/globalprefixfilters` (`GlobalPrefixFilterScreen`) |
| Put Api  | `/sdwan/v2.0/api/globalprefixfilters/{filter_id}` (`GlobalPrefixFilterScreen`) |
| Delete Api  | `/sdwan/v2.0/api/globalprefixfilters/{filter_id}` |


### JSON Schema

```json
{
  "properties" : {
    "filters" : {
      "description" : "Filters: Embedded(concreteClass = classOf[Object], value = .) Required(PREFIXFILTER_REQUIRED) Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "type" : {
            "description" : "Type",
            "type" : "string"
          }
        }
      }
    },
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
  "required" : [ "filters", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_global_prefix_filter.my_resource_name"
 id="<resource_id>"
}
```

