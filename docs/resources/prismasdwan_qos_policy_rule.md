## Documentation for Prisma SDWAN Resource "qos_policy_rule"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `qos_policy_rule` |
| Get Api  | `/sdwan/v2.2/api/prioritypolicysets/{policy_set_id}/prioritypolicyrules/{policy_rule_id}` (`PriorityPolicyRuleV2N2`) |
| Post Api  | `/sdwan/v2.2/api/prioritypolicysets/{policy_set_id}/prioritypolicyrules` (`PriorityPolicyRuleV2N2`) |
| Put Api  | `/sdwan/v2.2/api/prioritypolicysets/{policy_set_id}/prioritypolicyrules/{policy_rule_id}` (`PriorityPolicyRuleV2N2`) |
| Delete Api  | `/sdwan/v2.2/api/prioritypolicysets/{policy_set_id}/prioritypolicyrules/{policy_rule_id}` |


### JSON Schema

```json
{
  "properties" : {
    "dest_device_ids" : {
      "description" : "Dest Device Ids",
      "maxItems" : 10,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Dest Device Ids",
        "type" : "string"
      }
    },
    "src_device_ids" : {
      "description" : "Src Device Ids",
      "maxItems" : 256,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Src Device Ids",
        "type" : "string"
      }
    },
    "user_or_group" : {
      "properties" : {
        "user_group_ids" : {
          "description" : "User Group Ids",
          "type" : "array",
          "items" : {
            "description" : "User Group Ids",
            "type" : "string"
          }
        },
        "user_ids" : {
          "description" : "User Ids",
          "type" : "array",
          "items" : {
            "description" : "User Ids",
            "type" : "string"
          }
        }
      },
      "required" : [ "user_group_ids", "user_ids" ]
    },
    "priority_number" : {
      "description" : "Priority Number",
      "format" : "int32",
      "maximum" : 4,
      "minimum" : 1,
      "type" : "integer"
    },
    "dscp" : {
      "properties" : {
        "value" : {
          "description" : "Value",
          "format" : "int32",
          "maximum" : 63,
          "minimum" : 0,
          "type" : "integer"
        }
      },
      "required" : [ "value" ]
    },
    "destination_prefixes_id" : {
      "description" : "Destination Prefixes Id",
      "maxLength" : 30,
      "pattern" : "^-?[0-9]{1,30}$",
      "type" : "string"
    },
    "source_prefixes_id" : {
      "description" : "Source Prefixes Id",
      "maxLength" : 30,
      "pattern" : "^-?[0-9]{1,30}$",
      "type" : "string"
    },
    "enabled" : {
      "description" : "Enabled",
      "type" : "boolean"
    },
    "order_number" : {
      "description" : "Order Number",
      "maximum" : 65535,
      "minimum" : 1,
      "type" : "integer"
    },
    "network_context_id" : {
      "description" : "Network Context Id",
      "maxLength" : 30,
      "pattern" : "^-?[0-9]{1,30}$",
      "type" : "string"
    },
    "app_def_ids" : {
      "description" : "App Def Ids",
      "maxItems" : 256,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "App Def Ids",
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
  "required" : [ "dest_device_ids", "src_device_ids", "user_or_group", "priority_number", "dscp", "destination_prefixes_id", "source_prefixes_id", "enabled", "order_number", "network_context_id", "app_def_ids", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_qos_policy_rule.my_resource_name"
 id="<resource_id>:policy_set_id=<some_policy_set_id>"
}
```

