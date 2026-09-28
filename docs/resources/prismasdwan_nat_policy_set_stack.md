## Documentation for Prisma SDWAN Resource "nat_policy_set_stack"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `nat_policy_set_stack` |
| Get Api  | `/sdwan/v2.0/api/natpolicysetstacks/{natpolicy_set_stack_id}` (`NATPolicySetStackPOSTScreen`) |
| Post Api  | `/sdwan/v2.0/api/natpolicysetstacks` (`NATPolicySetStackPOSTScreen`) |
| Put Api  | `/sdwan/v2.0/api/natpolicysetstacks/{natpolicy_set_stack_id}` (`NATPolicySetStackPOSTScreen`) |
| Delete Api  | `/sdwan/v2.0/api/natpolicysetstacks/{natpolicy_set_stack_id}` |


### JSON Schema

```json
{
  "properties" : {
    "default_policysetstack" : {
      "description" : "Default Policysetstack",
      "type" : "boolean"
    },
    "policyset_ids" : {
      "description" : "Policyset Ids",
      "maxItems" : 4,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Policyset Ids",
        "pattern" : "[0-9]{1,30}",
        "type" : "string"
      }
    },
    "tags" : {
      "description" : "Tags",
      "maxItems" : 10,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Tags",
        "maxLength" : 128,
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
      "maxLength" : 256,
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
  "required" : [ "default_policysetstack", "policyset_ids", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_nat_policy_set_stack.my_resource_name"
 id="<resource_id>"
}
```

