## Documentation for Prisma SDWAN Resource "performance_policy_stack"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `performance_policy_stack` |
| Get Api  | `/sdwan/v2.0/api/perfmgmtpolicysetstacks/{id}` (`PerfMgmtPolicySetStack`) |
| Post Api  | `/sdwan/v2.0/api/perfmgmtpolicysetstacks` (`PerfMgmtPolicySetStack`) |
| Put Api  | `/sdwan/v2.0/api/perfmgmtpolicysetstacks/{id}` (`PerfMgmtPolicySetStack`) |
| Delete Api  | `/sdwan/v2.0/api/perfmgmtpolicysetstacks/{id}` |


### JSON Schema

```json
{
  "properties" : {
    "default_policysetstack" : {
      "description" : "Default Policysetstack",
      "type" : "boolean"
    },
    "defaultrule_policyset_id" : {
      "description" : "Defaultrule Policyset Id: Required(error = POLICYSETSTACK_CONFIG_DEFAULTRULE_POLICYSET_REQUIRED: Please specify defaultrule policyset for stack.) Digits(fraction = 0, integer = 30, error = INVALID_DEFAULTRULE_POLICYSET_ID_FORMAT: Defaultrule policyset id is in invalid format.) ",
      "type" : "string"
    },
    "policyset_ids" : {
      "description" : "Policyset Ids: Size(max = 4, error = POLICYSETSTACK_CONFIG_INVALID_POLICYSETLIST_SIZE: Invalid number of policysets. Should be between 1-4., min = 0) ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = POLICYSETSTACK_CONFIG_DUPLICATE_POLICYSETID: PolicySet Stack configuration is not valid. Duplicate policy set id present in the policy set list., noTrim = false, regex = [0-9]{1,30}, required = false) ",
      "type" : "array",
      "items" : {
        "description" : "Policyset Ids",
        "type" : "string"
      }
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
  "required" : [ "defaultrule_policyset_id", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_performance_policy_stack.my_resource_name"
 id="<resource_id>"
}
```

