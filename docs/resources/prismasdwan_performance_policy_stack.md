## Documentation for Prisma SDWAN Resource "performance_policy_stack"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `performance_policy_stack` |
| Get Api  | `/sdwan/v2.0/api/perfmgmtpolicysetstacks/{perfmgmtpolicysetstack_id}` (`PerfMgmtPolicySetStack`) |
| Post Api  | `/sdwan/v2.0/api/perfmgmtpolicysetstacks` (`PerfMgmtPolicySetStack`) |
| Put Api  | `/sdwan/v2.0/api/perfmgmtpolicysetstacks/{perfmgmtpolicysetstack_id}` (`PerfMgmtPolicySetStack`) |
| Delete Api  | `/sdwan/v2.0/api/perfmgmtpolicysetstacks/{perfmgmtpolicysetstack_id}` |


### JSON Schema

```json
{
  "properties" : {
    "defaultrule_policyset" : {
      "properties" : {
        "defaultrule_policyset" : {
          "description" : "Defaultrule Policyset",
          "type" : "boolean"
        },
        "link_health_rules" : {
          "description" : "Link Health Rules",
          "type" : "array",
          "items" : {
            "properties" : {
              "network_context_ids" : {
                "description" : "Network Context Ids",
                "type" : "array",
                "items" : {
                  "description" : "Network Context Ids",
                  "type" : "string"
                }
              },
              "path_filter_update" : {
                "description" : "Path Filter Update",
                "type" : "boolean"
              },
              "app_acceleration_update" : {
                "description" : "App Acceleration Update",
                "type" : "boolean"
              },
              "thresholdprofile" : {
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
                        "maximum" : 100,
                        "minimum" : 0,
                        "type" : "integer"
                      },
                      "memory_utilization" : {
                        "description" : "Memory Utilization",
                        "maximum" : 100,
                        "minimum" : 0,
                        "type" : "integer"
                      },
                      "cpu_utilization" : {
                        "description" : "Cpu Utilization",
                        "maximum" : 100,
                        "minimum" : 0,
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
                  "is_default" : {
                    "description" : "Is Default",
                    "type" : "boolean"
                  },
                  "hard_limit_app_metrics" : {
                    "properties" : {
                      "udp_trt" : {
                        "description" : "Udp Trt",
                        "maximum" : 500,
                        "minimum" : 0,
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
                        "maximum" : 500,
                        "minimum" : 0,
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
                        "maximum" : 5,
                        "minimum" : 1,
                        "type" : "integer"
                      },
                      "max_packet_loss" : {
                        "description" : "Max Packet Loss",
                        "maximum" : 20,
                        "minimum" : 0,
                        "type" : "integer"
                      },
                      "max_jitter" : {
                        "description" : "Max Jitter",
                        "maximum" : 100,
                        "minimum" : 0,
                        "type" : "integer"
                      },
                      "max_latency" : {
                        "description" : "Max Latency",
                        "maximum" : 500,
                        "minimum" : 0,
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
                  "region" : {
                    "description" : "Region",
                    "type" : "string"
                  },
                  "disabled_reason" : {
                    "description" : "Disabled Reason",
                    "maxLength" : 5000,
                    "type" : "string"
                  },
                  "disabled" : {
                    "description" : "Disabled",
                    "type" : "boolean"
                  },
                  "inactive_reason" : {
                    "description" : "Inactive Reason",
                    "maxLength" : 5000,
                    "type" : "string"
                  },
                  "inactive" : {
                    "description" : "Inactive",
                    "type" : "boolean"
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
                "required" : [ "flow_metrics_thresholds", "circuit_utilization_metrics_thresholds", "system_health_metrics_thresholds", "synthetic_probe_thresholds", "is_default", "hard_limit_app_metrics", "soft_limit_app_metrics", "lqm_thresholds", "tags", "description", "name", "region", "disabled_reason", "disabled", "inactive_reason", "inactive", "id" ]
              },
              "default_rule" : {
                "description" : "Default Rule",
                "type" : "boolean"
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
                      "pattern" : "(public|private)-((([1-9])|([1-2][0-9])|(3[0-2]))|([*]))",
                      "type" : "string"
                    }
                  },
                  "required" : [ "path_type", "label" ]
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
              "policyset_id" : {
                "description" : "Policyset Id",
                "maxLength" : 30,
                "pattern" : "^-?[0-9]{1,30}$",
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
              "region" : {
                "description" : "Region",
                "type" : "string"
              },
              "disabled_reason" : {
                "description" : "Disabled Reason",
                "maxLength" : 5000,
                "type" : "string"
              },
              "disabled" : {
                "description" : "Disabled",
                "type" : "boolean"
              },
              "inactive_reason" : {
                "description" : "Inactive Reason",
                "maxLength" : 5000,
                "type" : "string"
              },
              "inactive" : {
                "description" : "Inactive",
                "type" : "boolean"
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
            "required" : [ "network_context_ids", "path_filter_update", "app_acceleration_update", "thresholdprofile", "default_rule", "type", "enabled", "actions", "thresholdprofile_id", "service_label_ids", "path_filters", "app_filters", "policyset_id", "tags", "description", "name", "region", "disabled_reason", "disabled", "inactive_reason", "inactive", "id" ]
          }
        },
        "link_health_policyrule_order" : {
          "description" : "Link Health Policyrule Order",
          "type" : "array",
          "items" : {
            "description" : "Link Health Policyrule Order",
            "type" : "string"
          },
          "additionalProperties" : {
            "properties" : {
              "x_flag_computed" : {
                "type" : "boolean"
              }
            }
          }
        },
        "policy_rules" : {
          "description" : "Policy Rules",
          "type" : "array",
          "items" : {
            "properties" : {
              "policyset_id" : {
                "description" : "Policyset Id",
                "maxLength" : 30,
                "pattern" : "^-?[0-9]{1,30}$",
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
              "region" : {
                "description" : "Region",
                "type" : "string"
              },
              "disabled_reason" : {
                "description" : "Disabled Reason",
                "maxLength" : 5000,
                "type" : "string"
              },
              "disabled" : {
                "description" : "Disabled",
                "type" : "boolean"
              },
              "inactive_reason" : {
                "description" : "Inactive Reason",
                "maxLength" : 5000,
                "type" : "string"
              },
              "inactive" : {
                "description" : "Inactive",
                "type" : "boolean"
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
            "required" : [ "policyset_id", "tags", "description", "name", "region", "disabled_reason", "disabled", "inactive_reason", "inactive", "id" ]
          }
        },
        "send_to_element" : {
          "description" : "Send To Element",
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
        "region" : {
          "description" : "Region",
          "type" : "string"
        },
        "disabled_reason" : {
          "description" : "Disabled Reason",
          "maxLength" : 5000,
          "type" : "string"
        },
        "disabled" : {
          "description" : "Disabled",
          "type" : "boolean"
        },
        "inactive_reason" : {
          "description" : "Inactive Reason",
          "maxLength" : 5000,
          "type" : "string"
        },
        "inactive" : {
          "description" : "Inactive",
          "type" : "boolean"
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
      "required" : [ "defaultrule_policyset", "link_health_rules", "link_health_policyrule_order", "policy_rules", "send_to_element", "clone_from", "tags", "description", "name", "region", "disabled_reason", "disabled", "inactive_reason", "inactive", "id" ]
    },
    "defaultrule_policyset_id" : {
      "description" : "Defaultrule Policyset Id",
      "maxLength" : 30,
      "pattern" : "^-?[0-9]{1,30}$",
      "type" : "string"
    },
    "default_policysetstack" : {
      "description" : "Default Policysetstack",
      "type" : "boolean"
    },
    "policyset_ids_update" : {
      "description" : "Policyset Ids Update",
      "type" : "boolean"
    },
    "policysets" : {
      "description" : "Policysets",
      "type" : "array",
      "items" : {
        "properties" : {
          "policy_rules" : {
            "description" : "Policy Rules",
            "type" : "array",
            "items" : {
              "properties" : {
                "policyset_id" : {
                  "description" : "Policyset Id",
                  "maxLength" : 30,
                  "pattern" : "^-?[0-9]{1,30}$",
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
                "region" : {
                  "description" : "Region",
                  "type" : "string"
                },
                "disabled_reason" : {
                  "description" : "Disabled Reason",
                  "maxLength" : 5000,
                  "type" : "string"
                },
                "disabled" : {
                  "description" : "Disabled",
                  "type" : "boolean"
                },
                "inactive_reason" : {
                  "description" : "Inactive Reason",
                  "maxLength" : 5000,
                  "type" : "string"
                },
                "inactive" : {
                  "description" : "Inactive",
                  "type" : "boolean"
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
              "required" : [ "policyset_id", "tags", "description", "name", "region", "disabled_reason", "disabled", "inactive_reason", "inactive", "id" ]
            }
          },
          "send_to_element" : {
            "description" : "Send To Element",
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
          "region" : {
            "description" : "Region",
            "type" : "string"
          },
          "disabled_reason" : {
            "description" : "Disabled Reason",
            "maxLength" : 5000,
            "type" : "string"
          },
          "disabled" : {
            "description" : "Disabled",
            "type" : "boolean"
          },
          "inactive_reason" : {
            "description" : "Inactive Reason",
            "maxLength" : 5000,
            "type" : "string"
          },
          "inactive" : {
            "description" : "Inactive",
            "type" : "boolean"
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
        "required" : [ "policy_rules", "send_to_element", "clone_from", "tags", "description", "name", "region", "disabled_reason", "disabled", "inactive_reason", "inactive", "id" ]
      }
    },
    "policyset_ids" : {
      "description" : "Policyset Ids",
      "maxItems" : 4,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Policyset Ids",
        "pattern" : "[0-9]{1,30}",
        "type" : "string"
      }
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
    "region" : {
      "description" : "Region",
      "type" : "string"
    },
    "disabled_reason" : {
      "description" : "Disabled Reason",
      "maxLength" : 5000,
      "type" : "string"
    },
    "disabled" : {
      "description" : "Disabled",
      "type" : "boolean"
    },
    "inactive_reason" : {
      "description" : "Inactive Reason",
      "maxLength" : 5000,
      "type" : "string"
    },
    "inactive" : {
      "description" : "Inactive",
      "type" : "boolean"
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
  "required" : [ "defaultrule_policyset", "defaultrule_policyset_id", "default_policysetstack", "policyset_ids_update", "policysets", "policyset_ids", "tags", "description", "name", "region", "disabled_reason", "disabled", "inactive_reason", "inactive", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_performance_policy_stack.my_resource_name"
 id="<resource_id>"
}
```

