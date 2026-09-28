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
      "description" : "Clone From",
      "maxLength" : 20,
      "pattern" : "^-?[0-9]{1,20}$",
      "type" : "string"
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
  "required" : [ "policyrule_order", "defaultrule_policyset", "clone_from", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_security_policy_set.my_resource_name"
 id="<resource_id>"
}
```

