## Documentation for Prisma SDWAN Resource "performance_policy_rule"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `performance_policy_rule` |
| Get Api  | `/sdwan/v2.2/api/perfmgmtpolicysets/{perfmgmtpolicyset_id}/perfmgmtpolicyrules/{perfmgmtpolicyrule_id}` (`PerfMgmtPolicyRuleScreenV2N2`) |
| Post Api  | `/sdwan/v2.2/api/perfmgmtpolicysets/{perfmgmtpolicyset_id}/perfmgmtpolicyrules` (`PerfMgmtPolicyRuleScreenV2N2`) |
| Put Api  | `/sdwan/v2.2/api/perfmgmtpolicysets/{perfmgmtpolicyset_id}/perfmgmtpolicyrules/{perfmgmtpolicyrule_id}` (`PerfMgmtPolicyRuleScreenV2N2`) |
| Delete Api  | `/sdwan/v2.2/api/perfmgmtpolicysets/{perfmgmtpolicyset_id}/perfmgmtpolicyrules/{perfmgmtpolicyrule_id}` |


### JSON Schema

```json
{
  "properties" : {
    "network_context_ids" : {
      "description" : "Network Context Ids",
      "type" : "array",
      "items" : {
        "description" : "Network Context Ids",
        "type" : "string"
      }
    },
    "actions" : {
      "description" : "Actions: Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "always_on" : {
            "description" : "Always On",
            "type" : "boolean"
          },
          "action_type" : {
            "description" : "Action Type: ValidateEnum(enumClass = classOf[PerfMgmtActionType], error = PERFMGMT_INVALID_ACTION_TYPE: Invalid action type specified in actions, nullAllowed = false) ",
            "type" : "string",
            "enum" : [ "RAISE_ALARM", "MOVE_FLOWS", "MOVE_FLOWS_FORCED", "FEC", "VISIBILITY", "APP_ACCELERATION", "PACKET_DUPLICATION" ]
          },
          "circuit_utilization_perf" : {
            "properties" : {
              "monitoring_approach" : {
                "description" : "Monitoring Approach: ValidateEnum(enumClass = classOf[MonitoringApproach], error = PERFMGMT_INVALID_MONITORING_APPROACH: Invalid monitoring approach, nullAllowed = false) ",
                "type" : "string",
                "enum" : [ "AGGRESSIVE", "MODERATE", "CONSERVATIVE" ]
              },
              "bad_health_thresholds" : {
                "properties" : {
                  "clear_below" : {
                    "description" : "Clear Below: Range(max = 80L, error = PERFMGMT_INVALID_CLEAR_BELOW: Invalid clear below. Value should be between 1-80, min = 1L) ",
                    "format" : "int32",
                    "type" : "integer"
                  },
                  "raise_above" : {
                    "description" : "Raise Above: Range(max = 100L, error = PERFMGMT_INVALID_RAISE_ABOVE: Invalid raise above. Value should be between 10-100, min = 10L) ",
                    "format" : "int32",
                    "type" : "integer"
                  }
                }
              }
            },
            "required" : [ "monitoring_approach" ]
          },
          "sys_perf" : {
            "properties" : {
              "monitoring_approach" : {
                "description" : "Monitoring Approach: ValidateEnum(enumClass = classOf[MonitoringApproach], error = PERFMGMT_INVALID_MONITORING_APPROACH: Invalid monitoring approach, nullAllowed = false) ",
                "type" : "string",
                "enum" : [ "AGGRESSIVE", "MODERATE", "CONSERVATIVE" ]
              },
              "bad_health_thresholds" : {
                "properties" : {
                  "clear_below" : {
                    "description" : "Clear Below: Range(max = 80L, error = PERFMGMT_INVALID_CLEAR_BELOW: Invalid clear below. Value should be between 1-80, min = 1L) ",
                    "format" : "int32",
                    "type" : "integer"
                  },
                  "raise_above" : {
                    "description" : "Raise Above: Range(max = 100L, error = PERFMGMT_INVALID_RAISE_ABOVE: Invalid raise above. Value should be between 10-100, min = 10L) ",
                    "format" : "int32",
                    "type" : "integer"
                  }
                }
              }
            },
            "required" : [ "monitoring_approach" ]
          },
          "probe_perf" : {
            "properties" : {
              "monitoring_approach" : {
                "description" : "Monitoring Approach: ValidateEnum(enumClass = classOf[MonitoringApproach], error = PERFMGMT_INVALID_MONITORING_APPROACH: Invalid monitoring approach, nullAllowed = false) ",
                "type" : "string",
                "enum" : [ "AGGRESSIVE", "MODERATE", "CONSERVATIVE" ]
              },
              "bad_health_thresholds" : {
                "properties" : {
                  "clear_below" : {
                    "description" : "Clear Below: Range(max = 80L, error = PERFMGMT_INVALID_CLEAR_BELOW: Invalid clear below. Value should be between 1-80, min = 1L) ",
                    "format" : "int32",
                    "type" : "integer"
                  },
                  "raise_above" : {
                    "description" : "Raise Above: Range(max = 100L, error = PERFMGMT_INVALID_RAISE_ABOVE: Invalid raise above. Value should be between 10-100, min = 10L) ",
                    "format" : "int32",
                    "type" : "integer"
                  }
                }
              }
            },
            "required" : [ "monitoring_approach" ]
          },
          "app_perf" : {
            "properties" : {
              "monitoring_approach" : {
                "description" : "Monitoring Approach: ValidateEnum(enumClass = classOf[MonitoringApproach], error = PERFMGMT_INVALID_MONITORING_APPROACH: Invalid monitoring approach, nullAllowed = false) ",
                "type" : "string",
                "enum" : [ "AGGRESSIVE", "MODERATE", "CONSERVATIVE" ]
              },
              "bad_health_thresholds" : {
                "properties" : {
                  "clear_below" : {
                    "description" : "Clear Below: Range(max = 80L, error = PERFMGMT_INVALID_CLEAR_BELOW: Invalid clear below. Value should be between 1-80, min = 1L) ",
                    "format" : "int32",
                    "type" : "integer"
                  },
                  "raise_above" : {
                    "description" : "Raise Above: Range(max = 100L, error = PERFMGMT_INVALID_RAISE_ABOVE: Invalid raise above. Value should be between 10-100, min = 10L) ",
                    "format" : "int32",
                    "type" : "integer"
                  }
                }
              }
            },
            "required" : [ "monitoring_approach" ]
          },
          "lqm_perf" : {
            "properties" : {
              "monitoring_approach" : {
                "description" : "Monitoring Approach: ValidateEnum(enumClass = classOf[MonitoringApproach], error = PERFMGMT_INVALID_MONITORING_APPROACH: Invalid monitoring approach, nullAllowed = false) ",
                "type" : "string",
                "enum" : [ "AGGRESSIVE", "MODERATE", "CONSERVATIVE" ]
              },
              "bad_health_thresholds" : {
                "properties" : {
                  "clear_below" : {
                    "description" : "Clear Below: Range(max = 80L, error = PERFMGMT_INVALID_CLEAR_BELOW: Invalid clear below. Value should be between 1-80, min = 1L) ",
                    "format" : "int32",
                    "type" : "integer"
                  },
                  "raise_above" : {
                    "description" : "Raise Above: Range(max = 100L, error = PERFMGMT_INVALID_RAISE_ABOVE: Invalid raise above. Value should be between 10-100, min = 10L) ",
                    "format" : "int32",
                    "type" : "integer"
                  }
                }
              }
            },
            "required" : [ "monitoring_approach" ]
          }
        },
        "required" : [ "action_type" ]
      }
    },
    "type" : {
      "description" : "Type: ValidateEnum(enumClass = classOf[PerfMgmtRuleType], error = PERFMGMT_INVALID_RULE_TYPE: Performance policy rule type is invalid, nullAllowed = false) Required(error = PERFMGMT_RULE_TYPE_REQUIRED: Rule type is required) ",
      "type" : "string",
      "enum" : [ "APP_CIRCUIT_HEALTH", "SYSTEM_SITE_HEALTH" ]
    },
    "enabled" : {
      "description" : "Enabled",
      "type" : "boolean"
    },
    "thresholdprofile_id" : {
      "description" : "Thresholdprofile Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
      "type" : "string"
    },
    "service_label_ids" : {
      "description" : "Service Label Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = PERFMGMT_RULE_DUPLICATE_SERVICE_LABEL_IDS: Duplicate service label ids are not allowed in policy rule, noTrim = false, regex = , required = false) Size(max = 32, error = SERVICE_LABEL_ID_LIST_SIZE_EXCEEDED: Maximum 32 service labels are supported, min = 0) ",
      "type" : "array",
      "items" : {
        "description" : "Service Label Ids",
        "type" : "string"
      }
    },
    "path_filters" : {
      "description" : "Path Filters: Valid Size(max = 32, error = PERFMGMT_PATH_FILTERS_LIST_SIZE_EXCEEDED: Maximum 32 path filters are supported, min = 0) ",
      "type" : "array",
      "items" : {
        "properties" : {
          "path_type" : {
            "description" : "Path Type: ValidateEnum(enumClass = classOf[PathFilterType], error = PERFMGMT_INVALID_PATH_TYPE: Invalid path type specified in path filter, nullAllowed = false) ",
            "type" : "string",
            "enum" : [ "vpn", "direct", "servicelink", "all" ]
          },
          "label" : {
            "description" : "Label: Pattern(message = PERFMGMT_RULE_INVALID_PATH_LABELS, regexp = (public|private)-((([1-9])|([1-2][0-9])|(3[0-2]))|([*]))) ",
            "type" : "string"
          }
        },
        "required" : [ "path_type" ]
      }
    },
    "app_filters" : {
      "properties" : {
        "app_transfer_types" : {
          "description" : "App Transfer Types: Size(max = 4, error = PERFMGMT_APP_TRANSFER_TYPE_LIST_SIZE_EXCEEDED: Maximum 4 app transfer types supported, min = 0) ValidateEnum(enumClass = classOf[TransferType], error = PERFMGMT_INVALID_APP_TRANSFER_TYPE: Invalid app transfer type specified in app filter, nullAllowed = true) ",
          "type" : "array",
          "items" : {
            "description" : "App Transfer Types",
            "type" : "string",
            "enum" : [ "RT_AUDIO", "RT_VIDEO", "TRANSACTIONAL", "BULK" ]
          }
        },
        "application_ids" : {
          "description" : "Application Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = PERFMGMT_RULE_DUPLICATE_APPLICATION_IDS: Duplicate application ids are not allowed in app filter for policy rule, noTrim = false, regex = , required = false) Size(max = 64, error = APP_DEF_ID_LIST_SIZE_EXCEEDED_64: Maximum 64 applications can be specified in a rule., min = 0) Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
          "type" : "array",
          "items" : {
            "description" : "Application Ids",
            "type" : "string"
          }
        }
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
  "required" : [ "type", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_performance_policy_rule.my_resource_name"
 id="<resource_id>:perfmgmtpolicyset_id=<some_perfmgmtpolicyset_id>"
}
```

