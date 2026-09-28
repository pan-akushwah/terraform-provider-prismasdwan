## Documentation for Prisma SDWAN Resource "performance_policy_rule"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `performance_policy_rule` |
| Get Api  | `/sdwan/v2.3/api/perfmgmtpolicysets/{perfmgmtpolicyset_id}/perfmgmtpolicyrules/{perfmgmtpolicyrule_id}` (`PerfMgmtPolicyRuleScreenV2N3`) |
| Post Api  | `/sdwan/v2.3/api/perfmgmtpolicysets/{perfmgmtpolicyset_id}/perfmgmtpolicyrules` (`PerfMgmtPolicyRuleScreenV2N3`) |
| Put Api  | `/sdwan/v2.3/api/perfmgmtpolicysets/{perfmgmtpolicyset_id}/perfmgmtpolicyrules/{perfmgmtpolicyrule_id}` (`PerfMgmtPolicyRuleScreenV2N3`) |
| Delete Api  | `/sdwan/v2.3/api/perfmgmtpolicysets/{perfmgmtpolicyset_id}/perfmgmtpolicyrules/{perfmgmtpolicyrule_id}` |


### JSON Schema

```json
{
  "properties" : {
    "path_filters" : {
      "description" : "Path Filters",
      "maxItems" : 32,
      "type" : "array",
      "items" : {
        "properties" : {
          "path_type" : {
            "description" : "Path Type",
            "type" : "string",
            "enum" : [ "vpn", "direct", "servicelink", "pa_vpn", "all" ]
          },
          "label" : {
            "description" : "Label",
            "type" : "string"
          }
        },
        "required" : [ "path_type", "label" ]
      }
    },
    "network_context_ids" : {
      "description" : "Network Context Ids",
      "type" : "array",
      "items" : {
        "description" : "Network Context Ids",
        "type" : "string"
      }
    },
    "actions" : {
      "description" : "Actions",
      "type" : "array",
      "items" : {
        "properties" : {
          "always_on" : {
            "description" : "Always On",
            "type" : "boolean"
          },
          "action_type" : {
            "description" : "Action Type",
            "type" : "string",
            "enum" : [ "raise_alarm", "move_flows", "move_flows_forced", "fec", "visibility", "app_acceleration", "packet_duplication" ]
          },
          "circuit_utilization_perf" : {
            "properties" : {
              "monitoring_approach" : {
                "description" : "Monitoring Approach",
                "type" : "string",
                "enum" : [ "aggressive", "moderate", "conservative" ]
              },
              "bad_health_thresholds" : {
                "properties" : {
                  "clear_below" : {
                    "description" : "Clear Below",
                    "format" : "int32",
                    "maximum" : 80,
                    "minimum" : 1,
                    "type" : "integer"
                  },
                  "raise_above" : {
                    "description" : "Raise Above",
                    "format" : "int32",
                    "maximum" : 100,
                    "minimum" : 10,
                    "type" : "integer"
                  }
                },
                "required" : [ "clear_below", "raise_above" ]
              }
            },
            "required" : [ "monitoring_approach", "bad_health_thresholds" ]
          },
          "sys_perf" : {
            "properties" : {
              "monitoring_approach" : {
                "description" : "Monitoring Approach",
                "type" : "string",
                "enum" : [ "aggressive", "moderate", "conservative" ]
              },
              "bad_health_thresholds" : {
                "properties" : {
                  "clear_below" : {
                    "description" : "Clear Below",
                    "format" : "int32",
                    "maximum" : 80,
                    "minimum" : 1,
                    "type" : "integer"
                  },
                  "raise_above" : {
                    "description" : "Raise Above",
                    "format" : "int32",
                    "maximum" : 100,
                    "minimum" : 10,
                    "type" : "integer"
                  }
                },
                "required" : [ "clear_below", "raise_above" ]
              }
            },
            "required" : [ "monitoring_approach", "bad_health_thresholds" ]
          },
          "probe_perf" : {
            "properties" : {
              "monitoring_approach" : {
                "description" : "Monitoring Approach",
                "type" : "string",
                "enum" : [ "aggressive", "moderate", "conservative" ]
              },
              "bad_health_thresholds" : {
                "properties" : {
                  "clear_below" : {
                    "description" : "Clear Below",
                    "format" : "int32",
                    "maximum" : 80,
                    "minimum" : 1,
                    "type" : "integer"
                  },
                  "raise_above" : {
                    "description" : "Raise Above",
                    "format" : "int32",
                    "maximum" : 100,
                    "minimum" : 10,
                    "type" : "integer"
                  }
                },
                "required" : [ "clear_below", "raise_above" ]
              }
            },
            "required" : [ "monitoring_approach", "bad_health_thresholds" ]
          },
          "app_perf" : {
            "properties" : {
              "monitoring_approach" : {
                "description" : "Monitoring Approach",
                "type" : "string",
                "enum" : [ "aggressive", "moderate", "conservative" ]
              },
              "bad_health_thresholds" : {
                "properties" : {
                  "clear_below" : {
                    "description" : "Clear Below",
                    "format" : "int32",
                    "maximum" : 80,
                    "minimum" : 1,
                    "type" : "integer"
                  },
                  "raise_above" : {
                    "description" : "Raise Above",
                    "format" : "int32",
                    "maximum" : 100,
                    "minimum" : 10,
                    "type" : "integer"
                  }
                },
                "required" : [ "clear_below", "raise_above" ]
              }
            },
            "required" : [ "monitoring_approach", "bad_health_thresholds" ]
          },
          "lqm_perf" : {
            "properties" : {
              "monitoring_approach" : {
                "description" : "Monitoring Approach",
                "type" : "string",
                "enum" : [ "aggressive", "moderate", "conservative" ]
              },
              "bad_health_thresholds" : {
                "properties" : {
                  "clear_below" : {
                    "description" : "Clear Below",
                    "format" : "int32",
                    "maximum" : 80,
                    "minimum" : 1,
                    "type" : "integer"
                  },
                  "raise_above" : {
                    "description" : "Raise Above",
                    "format" : "int32",
                    "maximum" : 100,
                    "minimum" : 10,
                    "type" : "integer"
                  }
                },
                "required" : [ "clear_below", "raise_above" ]
              }
            },
            "required" : [ "monitoring_approach", "bad_health_thresholds" ]
          }
        },
        "required" : [ "always_on", "action_type", "circuit_utilization_perf", "sys_perf", "probe_perf", "app_perf", "lqm_perf" ]
      }
    },
    "type" : {
      "description" : "Type",
      "type" : "string",
      "enum" : [ "app_circuit_health", "system_site_health" ]
    },
    "enabled" : {
      "description" : "Enabled",
      "type" : "boolean"
    },
    "thresholdprofile_id" : {
      "description" : "Thresholdprofile Id",
      "type" : "string"
    },
    "service_label_ids" : {
      "description" : "Service Label Ids",
      "maxItems" : 32,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Service Label Ids",
        "type" : "string"
      }
    },
    "app_filters" : {
      "properties" : {
        "app_transfer_types" : {
          "description" : "App Transfer Types",
          "maxItems" : 4,
          "type" : "array",
          "items" : {
            "description" : "App Transfer Types",
            "type" : "string",
            "enum" : [ "rt-audio", "rt-video", "transactional", "bulk" ]
          }
        },
        "application_ids" : {
          "description" : "Application Ids",
          "maxItems" : 64,
          "type" : "array",
          "uniqueItems" : true,
          "items" : {
            "description" : "Application Ids",
            "type" : "string"
          }
        }
      },
      "required" : [ "app_transfer_types", "application_ids" ]
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
  "required" : [ "path_filters", "network_context_ids", "actions", "type", "enabled", "thresholdprofile_id", "service_label_ids", "app_filters", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_performance_policy_rule.my_resource_name"
 id="<resource_id>:perfmgmtpolicyset_id=<some_perfmgmtpolicyset_id>"
}
```

