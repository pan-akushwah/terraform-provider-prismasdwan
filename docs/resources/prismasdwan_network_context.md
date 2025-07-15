## Documentation for Prisma SDWAN Resource "network_context"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `network_context` |
| Get Api  | `/sdwan/v2.0/api/networkcontexts/{network_context_id}` (`NetworkContextScreen`) |
| Post Api  | `/sdwan/v2.0/api/networkcontexts` (`NetworkContextScreen`) |
| Put Api  | `/sdwan/v2.0/api/networkcontexts/{network_context_id}` (`NetworkContextScreen`) |
| Delete Api  | `/sdwan/v2.0/api/networkcontexts/{network_context_id}` |


### JSON Schema

```json
{
  "properties" : {
    "description" : {
      "description" : "Description: Size(max = 256, error = NETWORK_CONTEXT_CONFIG_DESCRIPTION_INVALID: Network context config description invalid., min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Required(error = NETWORK_CONTEXT_CONFIG_NAME_REQD: Network context config name required) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
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
 to="prismasdwan_network_context.my_resource_name"
 id="<resource_id>"
}
```

