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
      "description" : "Default Rule Dscp Mappings",
      "maxItems" : 16,
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
        },
        "required" : [ "transfer_type", "priority_number", "dscp" ]
      }
    },
    "business_priority_names" : {
      "description" : "Business Priority Names",
      "maxItems" : 4,
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
        },
        "required" : [ "priority_name", "priority_number" ]
      }
    },
    "bandwidth_allocation_schemes" : {
      "description" : "Bandwidth Allocation Schemes",
      "maxItems" : 4,
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
                  },
                  "required" : [ "bulk", "transactional", "rt_video", "rt_audio" ]
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
              },
              "required" : [ "bandwidth_split_per_type", "bandwidth_allocation", "priority_number" ]
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
            },
            "required" : [ "high", "low" ]
          }
        },
        "required" : [ "business_priorities", "bandwidth_range" ]
      }
    },
    "defaultrule_policyset" : {
      "description" : "Defaultrule Policyset",
      "type" : "boolean"
    },
    "clone_from" : {
      "description" : "Clone From",
      "maxLength" : 20,
      "pattern" : "^-?[0-9]{1,20}$",
      "type" : "string"
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
  "required" : [ "template", "default_rule_dscp_mappings", "business_priority_names", "bandwidth_allocation_schemes", "defaultrule_policyset", "clone_from", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_qos_policy_set.my_resource_name"
 id="<resource_id>"
}
```

