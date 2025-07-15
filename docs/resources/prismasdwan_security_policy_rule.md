## Documentation for Prisma SDWAN Resource "security_policy_rule"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `security_policy_rule` |
| Get Api  | `/sdwan/v2.2/api/ngfwsecuritypolicysets/{policy_set_id}/ngfwsecuritypolicyrules/{policy_rule_id}` (`SecurityPolicyV2N2RuleScreen`) |
| Post Api  | `/sdwan/v2.2/api/ngfwsecuritypolicysets/{policy_set_id}/ngfwsecuritypolicyrules` (`SecurityPolicyV2N2RuleScreen`) |
| Put Api  | `/sdwan/v2.2/api/ngfwsecuritypolicysets/{policy_set_id}/ngfwsecuritypolicyrules/{policy_rule_id}` (`SecurityPolicyV2N2RuleScreen`) |
| Delete Api  | `/sdwan/v2.2/api/ngfwsecuritypolicysets/{policy_set_id}/ngfwsecuritypolicyrules/{policy_rule_id}` |


### JSON Schema

```json
{
  "properties" : {
    "dest_device_ids" : {
      "description" : "Dest Device Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, DUPLICATE_DEST_DEVICE_IDS, noTrim = false, regex = , required = false) Size(max = 10, DEST_DEVICE_ID_LIST_SIZE_EXCEEDED, min = 0) ",
      "type" : "array",
      "items" : {
        "description" : "Dest Device Ids",
        "type" : "string"
      }
    },
    "src_device_ids" : {
      "description" : "Src Device Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, DUPLICATE_SRC_DEVICE_IDS, noTrim = false, regex = , required = false) Size(max = 256, SRC_DEVICE_ID_LIST_SIZE_EXCEEDED, min = 0) ",
      "type" : "array",
      "items" : {
        "description" : "Src Device Ids",
        "type" : "string"
      }
    },
    "user_or_group" : {
      "properties" : {
        "user_group_ids" : {
          "description" : "User Group Ids: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, DUPLICATE_USER_GROUP_IDS, noTrim = false, regex = , required = false) Size(max = 256, USER_GROUP_ID_LIST_SIZE_EXCEEDED, min = 0) ",
          "type" : "array",
          "items" : {
            "description" : "User Group Ids",
            "type" : "string"
          }
        },
        "user_ids" : {
          "description" : "User Ids: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, DUPLICATE_USER_IDS, noTrim = false, regex = , required = false) Size(max = 256, USER_ID_LIST_SIZE_EXCEEDED, min = 0) ",
          "type" : "array",
          "items" : {
            "description" : "User Ids",
            "type" : "string"
          }
        }
      }
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
                  "description" : "From: Range(max = 65535L, error = INVALID_FROM_PORT_NUMBER: Invalid 'FROM' port number in port range. Must be in range 1 - 65535, min = 1L) ",
                  "type" : "integer"
                },
                "to" : {
                  "description" : "To: Range(max = 65535L, error = INVALID_TO_PORT_NUMBER: Invalid 'TO' port number in port range. Must be in range 1 - 65535, min = 1L) ",
                  "type" : "integer"
                }
              }
            }
          },
          "source_ports" : {
            "description" : "Source Ports",
            "type" : "array",
            "items" : {
              "properties" : {
                "from" : {
                  "description" : "From: Range(max = 65535L, error = INVALID_FROM_PORT_NUMBER: Invalid 'FROM' port number in port range. Must be in range 1 - 65535, min = 1L) ",
                  "type" : "integer"
                },
                "to" : {
                  "description" : "To: Range(max = 65535L, error = INVALID_TO_PORT_NUMBER: Invalid 'TO' port number in port range. Must be in range 1 - 65535, min = 1L) ",
                  "type" : "integer"
                }
              }
            }
          },
          "protocol" : {
            "description" : "Protocol",
            "format" : "int32",
            "type" : "integer"
          }
        }
      }
    },
    "enabled" : {
      "description" : "Enabled: NotNull ",
      "type" : "boolean"
    },
    "action" : {
      "description" : "Action: ValidateEnum(enumClass = classOf[SecurityAction], message = SECURITY_POLICYRULE_INVALID_ACTION, nullAllowed = false) ",
      "type" : "string"
    },
    "destination_zone_ids" : {
      "description" : "Destination Zone Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = DUPLICATE_DESTINATION_ZONE_IDS: Duplicate destination zone IDs found., noTrim = false, regex = , required = false) Size(max = 16, error = DESTINATION_ZONE_ID_LIST_SIZE_EXCEEDED: Too many destination zone IDs. Max = 16., min = 0) ",
      "type" : "array",
      "items" : {
        "description" : "Destination Zone Ids",
        "type" : "string"
      }
    },
    "destination_prefix_ids" : {
      "description" : "Destination Prefix Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = DUPLICATE_DESTINATION_PREFIX_IDS: Duplicate destination prefix IDs found., noTrim = false, regex = , required = false) Size(max = 16, error = DESTINATION_PREFIX_ID_LIST_SIZE_EXCEEDED: Too many destination prefix IDs. Max = 16., min = 0) ",
      "type" : "array",
      "items" : {
        "description" : "Destination Prefix Ids",
        "type" : "string"
      }
    },
    "source_prefix_ids" : {
      "description" : "Source Prefix Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = DUPLICATE_SOURCE_PREFIX_IDS: Duplicate source prefix IDs found., noTrim = false, regex = , required = false) Size(max = 16, error = SOURCE_PREFIX_ID_LIST_SIZE_EXCEEDED: Too many source prefix IDs. Max = 16., min = 0) ",
      "type" : "array",
      "items" : {
        "description" : "Source Prefix Ids",
        "type" : "string"
      }
    },
    "source_zone_ids" : {
      "description" : "Source Zone Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = DUPLICATE_SOURCE_ZONE_IDS: Duplicate source zone IDs found., noTrim = false, regex = , required = false) Size(max = 16, error = SOURCE_ZONE_ID_LIST_SIZE_EXCEEDED: Too many source zone IDs. Max = 16., min = 0) ",
      "type" : "array",
      "items" : {
        "description" : "Source Zone Ids",
        "type" : "string"
      }
    },
    "app_def_ids" : {
      "description" : "App Def Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = DUPLICATE_APP_DEF_IDS: Duplicate app ids are specified., noTrim = false, regex = , required = false) Size(max = 16, error = APP_DEF_ID_LIST_SIZE_EXCEEDED_SIZE_16: Maximum 16 applications can be specified in a rule., min = 0) ",
      "type" : "array",
      "items" : {
        "description" : "App Def Ids",
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
  "required" : [ "enabled", "action", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_security_policy_rule.my_resource_name"
 id="<resource_id>:policy_set_id=<some_policy_set_id>"
}
```

