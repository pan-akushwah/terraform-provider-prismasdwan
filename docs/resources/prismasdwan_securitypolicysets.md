## Documentation for Prisma SDWAN Resource "securitypolicysets"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `securitypolicysets` |
| Get Api  | `/sdwan/v2.0/api/securitypolicysets/{policy_set_id}` (`SecurityPolicySetPOSTScreen`) |
| Post Api  | `/sdwan/v2.0/api/securitypolicysets` (`SecurityPolicySetPOSTScreen`) |
| Put Api  | `/sdwan/v2.0/api/securitypolicysets/{policy_set_id}` (`SecurityPolicySetPOSTScreen`) |
| Delete Api  | `/sdwan/v2.0/api/securitypolicysets/{policy_set_id}` |


### JSON Schema

```json
{
  "properties" : {
    "clone_from" : {
      "description" : "Clone From",
      "type" : "string"
    },
    "policyrule_order" : {
      "description" : "Policyrule Order",
      "type" : "array",
      "items" : {
        "description" : "Policyrule Order",
        "type" : "string"
      },
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "description" : {
      "description" : "Description: Size(max = 256, error = SECURITY_POLICYSET_INVALID_DESCRIPTION: Security policy set invalid description., min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Size(max = 128, error = SECURITY_POLICYSET_INVALID_NAME: Security policy set invalid name., min = 0) Required(error = SECURITY_POLICYSET_NAME_REQUIRED: Security policyset name required.) ",
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
 to="prismasdwan_securitypolicysets.my_resource_name"
 id="<resource_id>"
}
```

