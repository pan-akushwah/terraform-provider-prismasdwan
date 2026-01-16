## Documentation for Prisma SDWAN Resource "path_policy_set"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `path_policy_set` |
| Get Api  | `/sdwan/v2.0/api/networkpolicysets/{policy_set_id}` (`NetworkPolicySet`) |
| Post Api  | `/sdwan/v2.0/api/networkpolicysets` (`NetworkPolicySet`) |
| Put Api  | `/sdwan/v2.0/api/networkpolicysets/{policy_set_id}` (`NetworkPolicySet`) |
| Delete Api  | `/sdwan/v2.0/api/networkpolicysets/{policy_set_id}` |


### JSON Schema

```json
{
  "properties" : {
    "policy_rules" : {
      "description" : "Policy Rules",
      "type" : "array",
      "items" : {
        "properties" : {
          "destination_prefixes_id" : {
            "description" : "Destination Prefixes Id: Digits(fraction = 0, integer = 30, error = INVALID_DESTINATION_PREFIXES_ID: Specified destination prefix is invalid.) ",
            "type" : "string"
          },
          "source_prefixes_id" : {
            "description" : "Source Prefixes Id: Digits(fraction = 0, integer = 30, error = INVALID_SOURCE_PREFIXES_ID: Specified source prefix is invalid.) ",
            "type" : "string"
          },
          "paths_allowed" : {
            "properties" : {
              "l3_failure_paths" : {
                "description" : "L3 Failure Paths: Valid ",
                "type" : "array",
                "items" : {
                  "properties" : {
                    "path_type" : {
                      "description" : "Path Type: ValidateEnum(enumClass = classOf[PathType], message = INVALID_PATH_TYPE, nullAllowed = false) ",
                      "type" : "string",
                      "enum" : [ "vpn", "direct", "servicelink" ]
                    },
                    "label" : {
                      "description" : "Label: Pattern(message = INVALID_PATH_LABEL, regexp = (public|private)-((([1-9])|([1-2][0-9])|(3[0-2]))|([*]))) ",
                      "type" : "string"
                    }
                  },
                  "required" : [ "path_type" ]
                }
              },
              "backup_paths" : {
                "description" : "Backup Paths: Valid ",
                "type" : "array",
                "items" : {
                  "properties" : {
                    "path_type" : {
                      "description" : "Path Type: ValidateEnum(enumClass = classOf[PathType], message = INVALID_PATH_TYPE, nullAllowed = false) ",
                      "type" : "string",
                      "enum" : [ "vpn", "direct", "servicelink" ]
                    },
                    "label" : {
                      "description" : "Label: Pattern(message = INVALID_PATH_LABEL, regexp = (public|private)-((([1-9])|([1-2][0-9])|(3[0-2]))|([*]))) ",
                      "type" : "string"
                    }
                  },
                  "required" : [ "path_type" ]
                }
              },
              "active_paths" : {
                "description" : "Active Paths: Valid NotNull(error = NETWORKPOLICY_RULE_CONFIG_INVALID_ACTIVE_PATHS: Active paths can not be null or empty.) Size(max = 2147483647, error = NETWORKPOLICY_RULE_CONFIG_INVALID_ACTIVE_PATHS: Active paths can not be null or empty., min = 1) ",
                "type" : "array",
                "items" : {
                  "properties" : {
                    "path_type" : {
                      "description" : "Path Type: ValidateEnum(enumClass = classOf[PathType], message = INVALID_PATH_TYPE, nullAllowed = false) ",
                      "type" : "string",
                      "enum" : [ "vpn", "direct", "servicelink" ]
                    },
                    "label" : {
                      "description" : "Label: Pattern(message = INVALID_PATH_LABEL, regexp = (public|private)-((([1-9])|([1-2][0-9])|(3[0-2]))|([*]))) ",
                      "type" : "string"
                    }
                  },
                  "required" : [ "path_type" ]
                }
              }
            },
            "required" : [ "active_paths" ]
          },
          "service_context" : {
            "properties" : {
              "backup_service_label_type" : {
                "description" : "Backup Service Label Type",
                "type" : "string",
                "enum" : [ "CG_TRANSIT", "NON_CG_TRANSIT", "SASE" ]
              },
              "backup_service_label_id" : {
                "description" : "Backup Service Label Id",
                "type" : "string"
              },
              "active_service_label_type" : {
                "description" : "Active Service Label Type",
                "type" : "string",
                "enum" : [ "CG_TRANSIT", "NON_CG_TRANSIT", "SASE" ]
              },
              "active_service_label_id" : {
                "description" : "Active Service Label Id: Required(ACTIVE_SERVICE_LABEL_REQD) ",
                "type" : "string"
              },
              "type" : {
                "description" : "Type: ValidateEnum(enumClass = classOf[ServiceContextType], message = Invalid enum string., nullAllowed = false) ",
                "type" : "string",
                "enum" : [ "ALLOWED_TRANSIT", "REQUIRED_TRANSIT" ]
              }
            },
            "required" : [ "active_service_label_id", "type" ]
          },
          "enabled" : {
            "description" : "Enabled",
            "type" : "boolean"
          },
          "order_number" : {
            "description" : "Order Number: Min(error = INVALID_ORDER_NUMBER_MINIMUM_VAL: Policy Rule order number should not be less than 1., value = 1L) Max(error = INVALID_ORDER_NUMBER_MAXIMUM_VAL: Policy Rule order number should not be greater than 65535., value = 65535L) ",
            "type" : "integer"
          },
          "network_context_id" : {
            "description" : "Network Context Id: Digits(fraction = 0, integer = 30, error = INVALID_NETWORK_CONTEXT_ID: Specified network context is invalid.) ",
            "type" : "string"
          },
          "app_def_ids" : {
            "description" : "App Def Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = DUPLICATE_APP_DEF_IDS: Duplicate app ids are specified., noTrim = false, regex = , required = false) Size(max = 256, error = APP_DEF_ID_LIST_SIZE_EXCEEDED: Maximum 256 applications can be specified in a rule., min = 0) ",
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
        "required" : [ "paths_allowed", "name" ]
      }
    },
    "policy_req_version" : {
      "description" : "Policy Req Version: JsonIgnore(value = true) ",
      "type" : "string"
    },
    "defaultrule_policyset" : {
      "description" : "Defaultrule Policyset",
      "type" : "boolean"
    },
    "send_to_element" : {
      "description" : "Send To Element",
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
    "region" : {
      "description" : "Region",
      "type" : "string"
    },
    "disabled_reason" : {
      "description" : "Disabled Reason: Size(max = 5000, DISABLED_REASON_INVALID_0001, min = 0) ",
      "type" : "string"
    },
    "disabled" : {
      "description" : "Disabled",
      "type" : "boolean"
    },
    "inactive_reason" : {
      "description" : "Inactive Reason: Size(max = 5000, INACTIVE_REASON_INVALID_0001, min = 0) ",
      "type" : "string"
    },
    "inactive" : {
      "description" : "Inactive",
      "type" : "boolean"
    },
    "id" : {
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
 to="prismasdwan_path_policy_set.my_resource_name"
 id="<resource_id>"
}
```

