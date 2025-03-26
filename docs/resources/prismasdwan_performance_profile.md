## Documentation for Prisma SDWAN Resource "performance_profile"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `performance_profile` |
| Get Api  | `/sdwan/v2.1/api/perfmgmtthresholdprofiles/{profile_id}` (`PerfMgmtThresholdProfileScreenV2N1`) |
| Post Api  | `/sdwan/v2.1/api/perfmgmtthresholdprofiles` (`PerfMgmtThresholdProfileScreenV2N1`) |
| Put Api  | `/sdwan/v2.1/api/perfmgmtthresholdprofiles/{profile_id}` (`PerfMgmtThresholdProfileScreenV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/perfmgmtthresholdprofiles/{profile_id}` |


### JSON Schema

```json
{
  "properties" : {
    "flow_metrics_thresholds" : {
      "properties" : {
        "percentage_flow_utilization" : {
          "description" : "Percentage Flow Utilization: Range(max = 100L, message = PERFMGMT_FLOW_METRICS_THRESHOLD_RANGE_INVALID, min = 1L) ",
          "type" : "integer"
        }
      }
    },
    "circuit_utilization_metrics_thresholds" : {
      "properties" : {
        "percentage_circuit_utilization" : {
          "description" : "Percentage Circuit Utilization",
          "type" : "integer"
        }
      }
    },
    "system_health_metrics_thresholds" : {
      "properties" : {
        "disk_utilization" : {
          "description" : "Disk Utilization",
          "format" : "int32",
          "type" : "integer"
        },
        "memory_utilization" : {
          "description" : "Memory Utilization",
          "format" : "int32",
          "type" : "integer"
        },
        "cpu_utilization" : {
          "description" : "Cpu Utilization",
          "format" : "int32",
          "type" : "integer"
        }
      }
    },
    "synthetic_probe_thresholds" : {
      "properties" : {
        "dns_txn_failure_pct" : {
          "properties" : {
            "value" : {
              "description" : "Value",
              "type" : "integer"
            },
            "probe_config_id" : {
              "description" : "Probe Config Id",
              "type" : "string"
            }
          }
        },
        "packet_loss" : {
          "properties" : {
            "value" : {
              "description" : "Value",
              "type" : "integer"
            },
            "probe_config_id" : {
              "description" : "Probe Config Id",
              "type" : "string"
            }
          }
        },
        "jitter" : {
          "properties" : {
            "value" : {
              "description" : "Value",
              "type" : "integer"
            },
            "probe_config_id" : {
              "description" : "Probe Config Id",
              "type" : "string"
            }
          }
        },
        "latency" : {
          "properties" : {
            "value" : {
              "description" : "Value",
              "type" : "integer"
            },
            "probe_config_id" : {
              "description" : "Probe Config Id",
              "type" : "string"
            }
          }
        },
        "init_failure_pct" : {
          "properties" : {
            "value" : {
              "description" : "Value",
              "type" : "integer"
            },
            "probe_config_id" : {
              "description" : "Probe Config Id",
              "type" : "string"
            }
          }
        }
      }
    },
    "hard_limit_app_metrics" : {
      "properties" : {
        "udp_trt" : {
          "description" : "Udp Trt",
          "type" : "integer"
        },
        "max_rtt" : {
          "description" : "Max Rtt: Range(max = 500L, message = PERFMGMT_MAX_RTT_THRESHOLD_RANGE_INVALID, min = 0L) ",
          "type" : "integer"
        },
        "max_init_failure_rate" : {
          "description" : "Max Init Failure Rate: Range(max = 100L, message = PERFMGMT_MAX_INIT_FAILURE_RATE_THRESHOLD_RANGE_INVALID, min = 0L) ",
          "type" : "integer"
        }
      }
    },
    "soft_limit_app_metrics" : {
      "properties" : {
        "udp_trt" : {
          "description" : "Udp Trt",
          "type" : "integer"
        },
        "max_rtt" : {
          "description" : "Max Rtt: Range(max = 500L, message = PERFMGMT_MAX_RTT_THRESHOLD_RANGE_INVALID, min = 0L) ",
          "type" : "integer"
        },
        "max_init_failure_rate" : {
          "description" : "Max Init Failure Rate: Range(max = 100L, message = PERFMGMT_MAX_INIT_FAILURE_RATE_THRESHOLD_RANGE_INVALID, min = 0L) ",
          "type" : "integer"
        }
      }
    },
    "lqm_thresholds" : {
      "properties" : {
        "min_mos" : {
          "description" : "Min Mos",
          "type" : "integer"
        },
        "max_packet_loss" : {
          "description" : "Max Packet Loss",
          "type" : "integer"
        },
        "max_jitter" : {
          "description" : "Max Jitter",
          "type" : "integer"
        },
        "max_latency" : {
          "description" : "Max Latency",
          "type" : "integer"
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
  "required" : [ "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_performance_profile.my_resource_name"
 id="<resource_id>"
}
```

