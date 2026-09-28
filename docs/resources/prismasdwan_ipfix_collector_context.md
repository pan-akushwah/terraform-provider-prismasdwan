## Documentation for Prisma SDWAN Resource "ipfix_collector_context"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `ipfix_collector_context` |
| Get Api  | `/sdwan/v2.0/api/ipfixcollectorcontexts/{context_id}` (`IPFixContextScreen`) |
| Post Api  | `/sdwan/v2.0/api/ipfixcollectorcontexts` (`IPFixContextScreen`) |
| Put Api  | `/sdwan/v2.0/api/ipfixcollectorcontexts/{context_id}` (`IPFixContextScreen`) |
| Delete Api  | `/sdwan/v2.0/api/ipfixcollectorcontexts/{context_id}` |


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
 to="prismasdwan_ipfix_collector_context.my_resource_name"
 id="<resource_id>"
}
```

