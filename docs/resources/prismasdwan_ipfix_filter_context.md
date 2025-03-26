## Documentation for Prisma SDWAN Resource "ipfix_filter_context"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `ipfix_filter_context` |
| Get Api  | `/sdwan/v2.0/api/ipfixfiltercontexts/{context_id}` (`IPFixContextScreen`) |
| Post Api  | `/sdwan/v2.0/api/ipfixfiltercontexts` (`IPFixContextScreen`) |
| Put Api  | `/sdwan/v2.0/api/ipfixfiltercontexts/{context_id}` (`IPFixContextScreen`) |
| Delete Api  | `/sdwan/v2.0/api/ipfixfiltercontexts/{context_id}` |


### JSON Schema

```json
{
  "properties" : {
    "description" : {
      "description" : "Description: Size(max = 256, IPFIX_CONTEXT_CONFIG_DESCRIPTION_INVALID, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: NotEmpty(IPFIX_CONTEXT_CONFIG_NAME_REQD) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
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
 to="prismasdwan_ipfix_filter_context.my_resource_name"
 id="<resource_id>"
}
```

