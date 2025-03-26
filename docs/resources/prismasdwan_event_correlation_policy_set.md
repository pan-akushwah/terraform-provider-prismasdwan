## Documentation for Prisma SDWAN Resource "event_correlation_policy_set"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `event_correlation_policy_set` |
| Get Api  | `/sdwan/v2.0/api/eventcorrelationpolicysets/{policy_set_id}` (`ListQueryResponseEventCorrelationPolicySetQueryFilter`) |
| Post Api  | `/sdwan/v2.0/api/eventcorrelationpolicysets` (`ListQueryResponseEventCorrelationPolicySetQueryFilter`) |
| Put Api  | `/sdwan/v2.0/api/eventcorrelationpolicysets/{policy_set_id}` (`ListQueryResponseEventCorrelationPolicySetQueryFilter`) |
| Delete Api  | `/sdwan/v2.0/api/eventcorrelationpolicysets/{policy_set_id}` |


### JSON Schema

```json
{
  "properties" : {
    "deleted_ids" : {
      "type" : "array",
      "items" : {
        "type" : "string"
      }
    },
    "deleted_count" : {
      "format" : "int64",
      "type" : "integer"
    },
    "total_count" : {
      "format" : "int64",
      "type" : "integer"
    },
    "next_query" : {
      "type" : "object"
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
    "items" : {
      "type" : "array",
      "items" : {
        "properties" : {
          "severity_priority_mapping" : {
            "description" : "Severity Priority Mapping",
            "type" : "array",
            "items" : {
              "properties" : {
                "priority" : {
                  "description" : "Priority: ValidateEnum(enumClass = classOf[EventPriority], error = EVENT_CORRELATION_CONFIG_INVALID_PRIORITY: Invalid priority, valid values are p1,p2,p3,p4,p5, nullAllowed = false) ",
                  "type" : "string",
                  "enum" : [ "p1", "p2", "p3", "p4", "p5", "none" ]
                },
                "severity" : {
                  "description" : "Severity: ValidateEnum(enumClass = classOf[EventSeverity], error = EVENT_CORRELATION_CONFIG_INVALID_SEVERITY: Event correlation invalid severity., nullAllowed = false) ",
                  "type" : "string",
                  "enum" : [ "major", "minor", "critical" ]
                }
              },
              "required" : [ "priority", "severity" ]
            }
          },
          "active_policyset" : {
            "description" : "Active Policyset",
            "type" : "boolean"
          },
          "policyrule_order" : {
            "description" : "Policyrule Order",
            "type" : "array",
            "items" : {
              "description" : "Policyrule Order",
              "type" : "string"
            }
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
  "type" : "object"
}
```

### Terraform Import
```json
import {
 to="prismasdwan_event_correlation_policy_set.my_resource_name"
 id="<resource_id>"
}
```

