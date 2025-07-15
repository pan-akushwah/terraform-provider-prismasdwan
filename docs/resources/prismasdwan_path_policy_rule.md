## Documentation for Prisma SDWAN Resource "path_policy_rule"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `path_policy_rule` |
| Get Api  | `/sdwan/v2.4/api/networkpolicysets/{policy_set_id}/networkpolicyrules/{policy_rule_id}` (`NetworkPolicyRuleScreenV2N4`) |
| Post Api  | `/sdwan/v2.4/api/networkpolicysets/{policy_set_id}/networkpolicyrules` (`NetworkPolicyRuleScreenV2N4`) |
| Put Api  | `/sdwan/v2.4/api/networkpolicysets/{policy_set_id}/networkpolicyrules/{policy_rule_id}` (`NetworkPolicyRuleScreenV2N4`) |
| Delete Api  | `/sdwan/v2.4/api/networkpolicysets/{policy_set_id}/networkpolicyrules/{policy_rule_id}` |


### JSON Schema

```json
{
  "properties" : {
    "dest_device_ids" : {
      "description" : "Dest Device Ids: JsonInclude(content = ALWAYS, contentFilter = classOf[Void], value = NON_NULL, valueFilter = classOf[Void]) ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, DUPLICATE_DEST_DEVICE_IDS, noTrim = false, regex = , required = false) Size(max = 10, DEST_DEVICE_ID_LIST_SIZE_EXCEEDED, min = 0) ",
      "type" : "array",
      "items" : {
        "description" : "Dest Device Ids",
        "type" : "string"
      }
    },
    "src_device_ids" : {
      "description" : "Src Device Ids: JsonInclude(content = ALWAYS, contentFilter = classOf[Void], value = NON_NULL, valueFilter = classOf[Void]) ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, DUPLICATE_SRC_DEVICE_IDS, noTrim = false, regex = , required = false) Size(max = 256, SRC_DEVICE_ID_LIST_SIZE_EXCEEDED, min = 0) ",
      "type" : "array",
      "items" : {
        "description" : "Src Device Ids",
        "type" : "string"
      }
    },
    "best_path_config" : {
      "properties" : {
        "probe_config_id" : {
          "description" : "Probe Config Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
          "type" : "string"
        },
        "metric_type" : {
          "description" : "Metric Type: Required(error = METRIC_TYPE_MISSING: Metric type is required) ValidateEnum(enumClass = classOf[ProbeMetricType], error = NETWORK_POLICY_INVALID_PROBE_METRIC_TYPE: Probe metric type is invalid. It should be lqm or probe, nullAllowed = false) ",
          "type" : "string",
          "enum" : [ "PROBE", "LQM" ]
        },
        "metric" : {
          "description" : "Metric: Required(error = METRIC_PARAMETER_MISSING: Metric parameter is required) ValidateEnum(enumClass = classOf[LQMMetricType], error = NETWORK_POLICY_INVALID_PROBE_METRIC: Probe metric is invalid. It should be latency, jitter, packet_loss, init_failure_pct or dns_txn_failure_pct, nullAllowed = false) ",
          "type" : "string",
          "enum" : [ "LATENCY", "JITTER", "PACKET_LOSS", "INIT_FAILURE_PCT", "DNS_TXN_FAILURE_PCT" ]
        }
      },
      "required" : [ "metric_type", "metric" ]
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
    "destination_prefixes_id" : {
      "description" : "Destination Prefixes Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) Digits(fraction = 0, integer = 30, error = INVALID_DESTINATION_PREFIXES_ID: Specified destination prefix is invalid.) ",
      "type" : "string"
    },
    "source_prefixes_id" : {
      "description" : "Source Prefixes Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) Digits(fraction = 0, integer = 30, error = INVALID_SOURCE_PREFIXES_ID: Specified source prefix is invalid.) ",
      "type" : "string"
    },
    "paths_allowed" : {
      "properties" : {
        "l3_failure_paths" : {
          "description" : "L3 Failure Paths",
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
          "description" : "Backup Paths",
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
          "description" : "Active Paths",
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
      }
    },
    "service_context" : {
      "properties" : {
        "backup_service_label_type" : {
          "description" : "Backup Service Label Type: Transient ",
          "type" : "string",
          "enum" : [ "CG_TRANSIT", "NON_CG_TRANSIT", "SASE" ]
        },
        "backup_service_label_id" : {
          "description" : "Backup Service Label Id",
          "type" : "string"
        },
        "active_service_label_type" : {
          "description" : "Active Service Label Type: Transient ",
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
      "description" : "Network Context Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) Digits(fraction = 0, integer = 30, error = INVALID_NETWORK_CONTEXT_ID: Specified network context is invalid.) ",
      "type" : "string"
    },
    "app_def_ids" : {
      "description" : "App Def Ids: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = DUPLICATE_APP_DEF_IDS: Duplicate app ids are specified., noTrim = false, regex = , required = false) Size(max = 256, error = APP_DEF_ID_LIST_SIZE_EXCEEDED: Maximum 256 applications can be specified in a rule., min = 0) ",
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
  "required" : [ "paths_allowed", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_path_policy_rule.my_resource_name"
 id="<resource_id>:policy_set_id=<some_policy_set_id>"
}
```

