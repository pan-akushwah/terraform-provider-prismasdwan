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
          "dest_device_ids" : {
            "description" : "Dest Device Ids",
            "maxItems" : 10,
            "type" : "array",
            "uniqueItems" : true,
            "items" : {
              "description" : "Dest Device Ids",
              "type" : "string"
            }
          },
          "src_device_ids" : {
            "description" : "Src Device Ids",
            "maxItems" : 256,
            "type" : "array",
            "uniqueItems" : true,
            "items" : {
              "description" : "Src Device Ids",
              "type" : "string"
            }
          },
          "best_path_config" : {
            "properties" : {
              "probe_config_id" : {
                "description" : "Probe Config Id",
                "type" : "string"
              },
              "metric_type" : {
                "description" : "Metric Type",
                "type" : "string",
                "enum" : [ "probe", "lqm" ]
              },
              "metric" : {
                "description" : "Metric",
                "type" : "string",
                "enum" : [ "latency", "jitter", "packet_loss", "init_failure_pct", "dns_txn_failure_pct" ]
              }
            },
            "required" : [ "probe_config_id", "metric_type", "metric" ]
          },
          "destination_prefixes" : {
            "properties" : {
              "ipv6_prefixes" : {
                "description" : "Ipv6 Prefixes",
                "type" : "array",
                "items" : {
                  "description" : "Ipv6 Prefixes",
                  "type" : "string"
                }
              },
              "ipv4_prefixes" : {
                "description" : "Ipv4 Prefixes",
                "type" : "array",
                "items" : {
                  "description" : "Ipv4 Prefixes",
                  "type" : "string"
                }
              },
              "tags" : {
                "description" : "Tags",
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
                "description" : "Description",
                "type" : "string"
              },
              "name" : {
                "description" : "Name",
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
            "required" : [ "ipv6_prefixes", "ipv4_prefixes", "tags", "description", "name", "id" ]
          },
          "source_prefixes" : {
            "properties" : {
              "ipv6_prefixes" : {
                "description" : "Ipv6 Prefixes",
                "type" : "array",
                "items" : {
                  "description" : "Ipv6 Prefixes",
                  "type" : "string"
                }
              },
              "ipv4_prefixes" : {
                "description" : "Ipv4 Prefixes",
                "type" : "array",
                "items" : {
                  "description" : "Ipv4 Prefixes",
                  "type" : "string"
                }
              },
              "tags" : {
                "description" : "Tags",
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
                "description" : "Description",
                "type" : "string"
              },
              "name" : {
                "description" : "Name",
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
            "required" : [ "ipv6_prefixes", "ipv4_prefixes", "tags", "description", "name", "id" ]
          },
          "destination_prefixes_id" : {
            "description" : "Destination Prefixes Id",
            "maxLength" : 30,
            "pattern" : "^-?[0-9]{1,30}$",
            "type" : "string"
          },
          "source_prefixes_id" : {
            "description" : "Source Prefixes Id",
            "maxLength" : 30,
            "pattern" : "^-?[0-9]{1,30}$",
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
                      "description" : "Path Type",
                      "type" : "string",
                      "enum" : [ "vpn", "direct", "servicelink", "pa_vpn" ]
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
              "backup_paths" : {
                "description" : "Backup Paths",
                "type" : "array",
                "items" : {
                  "properties" : {
                    "path_type" : {
                      "description" : "Path Type",
                      "type" : "string",
                      "enum" : [ "vpn", "direct", "servicelink", "pa_vpn" ]
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
              "active_paths" : {
                "description" : "Active Paths",
                "minItems" : 1,
                "type" : "array",
                "items" : {
                  "properties" : {
                    "path_type" : {
                      "description" : "Path Type",
                      "type" : "string",
                      "enum" : [ "vpn", "direct", "servicelink", "pa_vpn" ]
                    },
                    "label" : {
                      "description" : "Label",
                      "pattern" : "(public|private)-((([1-9])|([1-2][0-9])|(3[0-2]))|([*]))",
                      "type" : "string"
                    }
                  },
                  "required" : [ "path_type", "label" ]
                }
              }
            },
            "required" : [ "l3_failure_paths", "backup_paths", "active_paths" ]
          },
          "enabled" : {
            "description" : "Enabled",
            "type" : "boolean"
          },
          "order_number" : {
            "description" : "Order Number",
            "format" : "int32",
            "maximum" : 65535,
            "minimum" : 1,
            "type" : "integer"
          },
          "default_rule" : {
            "description" : "Default Rule",
            "readOnly" : true,
            "type" : "boolean",
            "x-json-ignore" : true
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
                "description" : "Active Service Label Id",
                "type" : "string"
              },
              "type" : {
                "description" : "Type",
                "type" : "string",
                "enum" : [ "allowed-transit", "required-transit" ]
              }
            },
            "required" : [ "backup_service_label_type", "backup_service_label_id", "active_service_label_type", "active_service_label_id", "type" ]
          },
          "network_context_id" : {
            "description" : "Network Context Id",
            "maxLength" : 30,
            "pattern" : "^-?[0-9]{1,30}$",
            "type" : "string"
          },
          "user_or_group" : {
            "properties" : {
              "user_group_ids" : {
                "description" : "User Group Ids",
                "type" : "array",
                "items" : {
                  "description" : "User Group Ids",
                  "type" : "string"
                }
              },
              "user_ids" : {
                "description" : "User Ids",
                "type" : "array",
                "items" : {
                  "description" : "User Ids",
                  "type" : "string"
                }
              }
            },
            "required" : [ "user_group_ids", "user_ids" ]
          },
          "app_def_ids" : {
            "description" : "App Def Ids",
            "maxItems" : 256,
            "type" : "array",
            "uniqueItems" : true,
            "items" : {
              "description" : "App Def Ids",
              "type" : "string"
            }
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
        "required" : [ "dest_device_ids", "src_device_ids", "best_path_config", "destination_prefixes", "source_prefixes", "destination_prefixes_id", "source_prefixes_id", "paths_allowed", "enabled", "order_number", "default_rule", "service_context", "network_context_id", "user_or_group", "app_def_ids", "policyset_id", "tags", "description", "name", "region", "disabled_reason", "disabled", "inactive_reason", "inactive", "id" ]
      }
    },
    "policy_req_version" : {
      "description" : "Policy Req Version",
      "readOnly" : true,
      "type" : "string",
      "x-json-ignore" : true
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
  "required" : [ "policy_rules", "policy_req_version", "defaultrule_policyset", "send_to_element", "clone_from", "tags", "description", "name", "region", "disabled_reason", "disabled", "inactive_reason", "inactive", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_path_policy_set.my_resource_name"
 id="<resource_id>"
}
```

