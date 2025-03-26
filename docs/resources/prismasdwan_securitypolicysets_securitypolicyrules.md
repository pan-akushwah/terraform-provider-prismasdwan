## Documentation for Prisma SDWAN Resource "securitypolicysets_securitypolicyrules"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `securitypolicysets_securitypolicyrules` |
| Get Api  | `/sdwan/v2.0/api/securitypolicysets/{policy_set_id}/securitypolicyrules/{policy_rule_id}` (`SecurityPolicyRuleScreen`) |
| Post Api  | `/sdwan/v2.0/api/securitypolicysets/{policy_set_id}/securitypolicyrules` (`SecurityPolicyRuleScreen`) |
| Put Api  | `/sdwan/v2.0/api/securitypolicysets/{policy_set_id}/securitypolicyrules/{policy_rule_id}` (`SecurityPolicyRuleScreen`) |
| Delete Api  | `/sdwan/v2.0/api/securitypolicysets/{policy_set_id}/securitypolicyrules/{policy_rule_id}` |


### JSON Schema

```json
{
  "properties" : {
    "disabled_flag" : {
      "description" : "Disabled Flag",
      "type" : "boolean"
    },
    "action" : {
      "description" : "Action",
      "type" : "string"
    },
    "application_ids" : {
      "description" : "Application Ids: Valid Required(error = SECURITY_POLICY_RULE_APPLICATION_NAME_REQUIRED: Security policy rule application name required.) ",
      "type" : "array",
      "items" : {
        "description" : "Application Ids",
        "type" : "string"
      }
    },
    "destination_filter_ids" : {
      "description" : "Destination Filter Ids",
      "type" : "array",
      "items" : {
        "description" : "Destination Filter Ids",
        "type" : "string"
      }
    },
    "source_filter_ids" : {
      "description" : "Source Filter Ids",
      "type" : "array",
      "items" : {
        "description" : "Source Filter Ids",
        "type" : "string"
      }
    },
    "destination_zone_ids" : {
      "description" : "Destination Zone Ids: Valid Required(error = SECURITY_POLICY_RULE_DESTINATION_ZONE_REQUIRED: Security policy rule destination zone required.) ",
      "type" : "array",
      "items" : {
        "description" : "Destination Zone Ids",
        "type" : "string"
      }
    },
    "source_zone_ids" : {
      "description" : "Source Zone Ids: Valid Required(error = SECURITY_POLICY_RULE_SOURCE_ZONE_REQUIRED: Security policy rule zone required.) ",
      "type" : "array",
      "items" : {
        "description" : "Source Zone Ids",
        "type" : "string"
      }
    },
    "description" : {
      "description" : "Description: Size(max = 128, error = SECURITY_POLICY_RULE_DESCRIPTION_INVALID: Security policy rule description invalid, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Size(max = 128, error = SECURITY_POLICY_RULE_NAME_INVALID: Security policy rule name invalid., min = 0) Required(error = SECURITY_POLICYRULE_NAME_REQUIRED: Name is mandatory and should be unique for security policyrule.) ",
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
  "required" : [ "application_ids", "destination_zone_ids", "source_zone_ids", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_securitypolicysets_securitypolicyrules.my_resource_name"
 id="<resource_id>:policy_set_id=<some_policy_set_id>"
}
```

