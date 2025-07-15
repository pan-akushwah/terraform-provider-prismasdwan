## Documentation for Prisma SDWAN Resource "qos_policy_set"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `qos_policy_set` |
| Get Api  | `/sdwan/v2.0/api/prioritypolicysets/{policy_set_id}` (`PriorityPolicySet`) |
| Post Api  | `/sdwan/v2.0/api/prioritypolicysets` (`PriorityPolicySet`) |
| Put Api  | `/sdwan/v2.0/api/prioritypolicysets/{policy_set_id}` (`PriorityPolicySet`) |
| Delete Api  | `/sdwan/v2.0/api/prioritypolicysets/{policy_set_id}` |


### JSON Schema

```json
{
  "properties" : {
    "template" : {
      "description" : "Template",
      "type" : "boolean"
    },
    "default_rule_dscp_mappings" : {
      "description" : "Default Rule Dscp Mappings: Valid Size(max = 16, message = INVALID_DSCP_MAPPINGS, min = 0) ",
      "type" : "array",
      "items" : {
        "properties" : {
          "transfer_type" : {
            "description" : "Transfer Type",
            "type" : "string",
            "enum" : [ "RT_AUDIO", "RT_VIDEO", "TRANSACTIONAL", "BULK" ]
          },
          "priority_number" : {
            "description" : "Priority Number",
            "format" : "int32",
            "type" : "integer"
          },
          "dscp" : {
            "description" : "Dscp",
            "type" : "array",
            "items" : {
              "description" : "Dscp",
              "type" : "integer"
            }
          }
        }
      }
    },
    "business_priority_names" : {
      "description" : "Business Priority Names: Required(error = BUSINESS_PRIORITY_NAMES_REQD: Business priority names required.) Size(max = 4, error = BUSINESS_PRIORITY_NAME_LIST_SIZE_EXCEEDED: Business priority name list exceeds the limit of 4., min = 0) Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "priority_name" : {
            "description" : "Priority Name",
            "type" : "string"
          },
          "priority_number" : {
            "format" : "int32",
            "type" : "integer"
          }
        }
      }
    },
    "bandwidth_allocation_schemes" : {
      "description" : "Bandwidth Allocation Schemes: Required(error = BANDWIDTH_ALLOCATION_SCHEME_REQD: Please provide Bandwidth Allocation scheme for set.) Size(max = 4, error = BANDWIDTH_ALLOCATION_SCHEME_LIST_SIZE_EXCEEDED: Bandwidth Allocation scheme list exceeds the limit of 4., min = 0) Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "business_priorities" : {
            "description" : "Business Priorities",
            "type" : "array",
            "items" : {
              "properties" : {
                "bandwidth_split_per_type" : {
                  "properties" : {
                    "bulk" : {
                      "description" : "Bulk",
                      "format" : "double",
                      "type" : "number"
                    },
                    "transactional" : {
                      "description" : "Transactional",
                      "format" : "double",
                      "type" : "number"
                    },
                    "rt_video" : {
                      "description" : "Rt Video",
                      "format" : "double",
                      "type" : "number"
                    },
                    "rt_audio" : {
                      "description" : "Rt Audio",
                      "format" : "double",
                      "type" : "number"
                    }
                  }
                },
                "bandwidth_allocation" : {
                  "description" : "Bandwidth Allocation",
                  "format" : "double",
                  "type" : "number"
                },
                "priority_number" : {
                  "description" : "Priority Number",
                  "format" : "int32",
                  "type" : "integer"
                }
              }
            }
          },
          "bandwidth_range" : {
            "properties" : {
              "high" : {
                "description" : "High",
                "format" : "double",
                "type" : "number"
              },
              "low" : {
                "description" : "Low",
                "format" : "double",
                "type" : "number"
              }
            }
          }
        }
      }
    },
    "defaultrule_policyset" : {
      "description" : "Defaultrule Policyset",
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
  "required" : [ "business_priority_names", "bandwidth_allocation_schemes", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_qos_policy_set.my_resource_name"
 id="<resource_id>"
}
```

