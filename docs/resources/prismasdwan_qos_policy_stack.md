## Documentation for Prisma SDWAN Resource "qos_policy_stack"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `qos_policy_stack` |
| Get Api  | `/sdwan/v2.0/api/prioritypolicysetstacks/{policy_set_id}` (`PriorityPolicySetStack`) |
| Post Api  | `/sdwan/v2.0/api/prioritypolicysetstacks` (`PriorityPolicySetStack`) |
| Put Api  | `/sdwan/v2.0/api/prioritypolicysetstacks/{policy_set_id}` (`PriorityPolicySetStack`) |
| Delete Api  | `/sdwan/v2.0/api/prioritypolicysetstacks/{policy_set_id}` |


### JSON Schema

```json
{
  "properties" : {
    "default_policysetstack" : {
      "description" : "Default Policysetstack",
      "type" : "boolean"
    },
    "defaultrule_policyset_id" : {
      "description" : "Defaultrule Policyset Id",
      "maxLength" : 30,
      "pattern" : "^-?[0-9]{1,30}$",
      "type" : "string"
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
  "required" : [ "default_policysetstack", "defaultrule_policyset_id", "policyset_ids", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_qos_policy_stack.my_resource_name"
 id="<resource_id>"
}
```

