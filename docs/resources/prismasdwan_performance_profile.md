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
          "description" : "Percentage Flow Utilization",
          "maximum" : 100,
          "minimum" : 1,
          "type" : "integer"
        }
      },
      "required" : [ "percentage_flow_utilization" ]
    },
    "circuit_utilization_metrics_thresholds" : {
      "properties" : {
        "percentage_circuit_utilization" : {
          "description" : "Percentage Circuit Utilization",
          "maximum" : 100,
          "minimum" : 1,
          "type" : "integer"
        }
      },
      "required" : [ "percentage_circuit_utilization" ]
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
      },
      "required" : [ "disk_utilization", "memory_utilization", "cpu_utilization" ]
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
          },
          "required" : [ "value", "probe_config_id" ]
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
          },
          "required" : [ "value", "probe_config_id" ]
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
          },
          "required" : [ "value", "probe_config_id" ]
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
          },
          "required" : [ "value", "probe_config_id" ]
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
          },
          "required" : [ "value", "probe_config_id" ]
        }
      },
      "required" : [ "dns_txn_failure_pct", "packet_loss", "jitter", "latency", "init_failure_pct" ]
    },
    "hard_limit_app_metrics" : {
      "properties" : {
        "udp_trt" : {
          "description" : "Udp Trt",
          "type" : "integer"
        },
        "max_rtt" : {
          "description" : "Max Rtt",
          "maximum" : 500,
          "minimum" : 0,
          "type" : "integer"
        },
        "max_init_failure_rate" : {
          "description" : "Max Init Failure Rate",
          "maximum" : 100,
          "minimum" : 0,
          "type" : "integer"
        }
      },
      "required" : [ "udp_trt", "max_rtt", "max_init_failure_rate" ]
    },
    "soft_limit_app_metrics" : {
      "properties" : {
        "udp_trt" : {
          "description" : "Udp Trt",
          "type" : "integer"
        },
        "max_rtt" : {
          "description" : "Max Rtt",
          "maximum" : 500,
          "minimum" : 0,
          "type" : "integer"
        },
        "max_init_failure_rate" : {
          "description" : "Max Init Failure Rate",
          "maximum" : 100,
          "minimum" : 0,
          "type" : "integer"
        }
      },
      "required" : [ "udp_trt", "max_rtt", "max_init_failure_rate" ]
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
      },
      "required" : [ "min_mos", "max_packet_loss", "max_jitter", "max_latency" ]
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
  "required" : [ "flow_metrics_thresholds", "circuit_utilization_metrics_thresholds", "system_health_metrics_thresholds", "synthetic_probe_thresholds", "hard_limit_app_metrics", "soft_limit_app_metrics", "lqm_thresholds", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_performance_profile.my_resource_name"
 id="<resource_id>"
}
```

