## Documentation for Prisma SDWAN Resource "local_prefix_filter"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `local_prefix_filter` |
| Get Api  | `/sdwan/v2.0/api/localprefixfilters/{localprefixfilter_id}` (`LocalPrefixFilterScreen`) |
| Post Api  | `/sdwan/v2.0/api/localprefixfilters` (`LocalPrefixFilterScreen`) |
| Put Api  | `/sdwan/v2.0/api/localprefixfilters/{localprefixfilter_id}` (`LocalPrefixFilterScreen`) |
| Delete Api  | `/sdwan/v2.0/api/localprefixfilters/{localprefixfilter_id}` |


### JSON Schema

```json
{
  "properties" : {
    "description" : {
      "description" : "Description",
      "maxLength" : 256,
      "type" : "string"
    },
    "name" : {
      "description" : "Name",
      "maxLength" : 128,
      "minLength" : 1,
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
  "required" : [ "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_local_prefix_filter.my_resource_name"
 id="<resource_id>"
}
```

