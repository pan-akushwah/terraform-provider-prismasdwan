## Documentation for Prisma SDWAN Resource "security_policy_rule"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `security_policy_rule` |
| Get Api  | `/sdwan/v2.3/api/ngfwsecuritypolicysets/{policy_set_id}/ngfwsecuritypolicyrules/{policy_rule_id}` (`SecurityPolicyV2RuleScreenV2N3`) |
| Post Api  | `/sdwan/v2.3/api/ngfwsecuritypolicysets/{policy_set_id}/ngfwsecuritypolicyrules` (`SecurityPolicyV2RuleScreenV2N3`) |
| Put Api  | `/sdwan/v2.3/api/ngfwsecuritypolicysets/{policy_set_id}/ngfwsecuritypolicyrules/{policy_rule_id}` (`SecurityPolicyV2RuleScreenV2N3`) |
| Delete Api  | `/sdwan/v2.3/api/ngfwsecuritypolicysets/{policy_set_id}/ngfwsecuritypolicyrules/{policy_rule_id}` |


### JSON Schema

```json
{
  "properties" : {
    "security_profile_group_id" : {
      "description" : "Security Profile Group Id",
      "type" : "string"
    },
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
    "services" : {
      "description" : "Services",
      "type" : "array",
      "items" : {
        "properties" : {
          "destination_ports" : {
            "description" : "Destination Ports",
            "type" : "array",
            "items" : {
              "properties" : {
                "from" : {
                  "description" : "From",
                  "maximum" : 65535,
                  "minimum" : 1,
                  "type" : "integer"
                },
                "to" : {
                  "description" : "To",
                  "maximum" : 65535,
                  "minimum" : 1,
                  "type" : "integer"
                }
              },
              "required" : [ "from", "to" ]
            }
          },
          "source_ports" : {
            "description" : "Source Ports",
            "type" : "array",
            "items" : {
              "properties" : {
                "from" : {
                  "description" : "From",
                  "maximum" : 65535,
                  "minimum" : 1,
                  "type" : "integer"
                },
                "to" : {
                  "description" : "To",
                  "maximum" : 65535,
                  "minimum" : 1,
                  "type" : "integer"
                }
              },
              "required" : [ "from", "to" ]
            }
          },
          "protocol" : {
            "description" : "Protocol",
            "format" : "int32",
            "type" : "integer"
          }
        },
        "required" : [ "destination_ports", "source_ports", "protocol" ]
      }
    },
    "enabled" : {
      "description" : "Enabled",
      "type" : "boolean"
    },
    "action" : {
      "description" : "Action",
      "type" : "string",
      "enum" : [ "ALLOW", "REJECT", "DENY" ]
    },
    "destination_zone_ids" : {
      "description" : "Destination Zone Ids",
      "maxItems" : 16,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Destination Zone Ids",
        "type" : "string"
      }
    },
    "destination_prefix_ids" : {
      "description" : "Destination Prefix Ids",
      "maxItems" : 16,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Destination Prefix Ids",
        "type" : "string"
      }
    },
    "source_prefix_ids" : {
      "description" : "Source Prefix Ids",
      "maxItems" : 16,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Source Prefix Ids",
        "type" : "string"
      }
    },
    "source_zone_ids" : {
      "description" : "Source Zone Ids",
      "maxItems" : 16,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Source Zone Ids",
        "type" : "string"
      }
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
  "required" : [ "security_profile_group_id", "dest_device_ids", "src_device_ids", "user_or_group", "services", "enabled", "action", "destination_zone_ids", "destination_prefix_ids", "source_prefix_ids", "source_zone_ids", "app_def_ids", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_security_policy_rule.my_resource_name"
 id="<resource_id>:policy_set_id=<some_policy_set_id>"
}
```

