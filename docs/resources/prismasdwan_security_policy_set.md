## Documentation for Prisma SDWAN Resource "security_policy_set"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `security_policy_set` |
| Get Api  | `/sdwan/v2.0/api/ngfwsecuritypolicysets/{policy_set_id}` (`SecurityPolicyV2SetScreen`) |
| Post Api  | `/sdwan/v2.0/api/ngfwsecuritypolicysets` (`SecurityPolicyV2SetScreen`) |
| Put Api  | `/sdwan/v2.0/api/ngfwsecuritypolicysets/{policy_set_id}` (`SecurityPolicyV2SetScreen`) |
| Delete Api  | `/sdwan/v2.0/api/ngfwsecuritypolicysets/{policy_set_id}` |


### JSON Schema

```json
{
  "properties" : {
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
    "defaultrule_policyset" : {
      "description" : "Defaultrule Policyset",
      "type" : "boolean"
    },
    "clone_from" : {
      "description" : "Clone From: Digits(fraction = 0, integer = 20, INVALID_CLONE_FROM) ",
      "type" : "string"
    },
    "tags" : {
      "description" : "Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 128, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\\\s]+, required = false) ",
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
      "description" : "Description: Size(max = 256, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Required(error = NAME_REQD: Please provide resource name.) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
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
 to="prismasdwan_security_policy_set.my_resource_name"
 id="<resource_id>"
}
```

