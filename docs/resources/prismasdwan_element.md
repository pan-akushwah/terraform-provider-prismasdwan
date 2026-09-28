## Documentation for Prisma SDWAN Resource "element"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element` |
| Get Api  | `/sdwan/v3.2/api/elements/{element_id}` (`ElementScreenV3N2`) |
| Put Api  | `/sdwan/v3.2/api/elements/{element_id}` (`ElementScreenV3N2`) |


### JSON Schema

```json
{
  "properties" : {
    "hub_cluster_config" : {
      "properties" : {
        "intra_cluster_tunnel" : {
          "properties" : {
            "disabled" : {
              "description" : "Disabled",
              "type" : "boolean"
            },
            "source_interfaces" : {
              "description" : "Source Interfaces",
              "type" : "array",
              "items" : {
                "description" : "Source Interfaces",
                "type" : "string"
              }
            }
          },
          "required" : [ "disabled", "source_interfaces" ]
        },
        "track" : {
          "properties" : {
            "hosts" : {
              "description" : "Hosts",
              "type" : "array",
              "items" : {
                "properties" : {
                  "address_v6" : {
                    "description" : "Address V6",
                    "type" : "string"
                  },
                  "address_v4" : {
                    "description" : "Address V4",
                    "type" : "string"
                  },
                  "vrf_context_id" : {
                    "description" : "Vrf Context Id",
                    "type" : "string"
                  }
                },
                "required" : [ "address_v6", "address_v4", "vrf_context_id" ]
              }
            }
          },
          "required" : [ "hosts" ]
        }
      },
      "required" : [ "intra_cluster_tunnel", "track" ]
    },
    "led_config" : {
      "properties" : {
        "service_led_on" : {
          "description" : "Service Led On",
          "type" : "boolean"
        }
      },
      "required" : [ "service_led_on" ]
    },
    "switch_config" : {
      "properties" : {
        "stp_priority" : {
          "description" : "Stp Priority",
          "format" : "int32",
          "maximum" : 61440,
          "minimum" : 0,
          "type" : "integer"
        },
        "stp_forward_delay" : {
          "description" : "Stp Forward Delay",
          "format" : "int32",
          "maximum" : 30,
          "minimum" : 4,
          "type" : "integer"
        },
        "stp_hello_time" : {
          "description" : "Stp Hello Time",
          "format" : "int32",
          "maximum" : 10,
          "minimum" : 1,
          "type" : "integer"
        },
        "stp_aging_timer" : {
          "description" : "Stp Aging Timer",
          "format" : "int32",
          "maximum" : 1000000,
          "minimum" : 10,
          "type" : "integer"
        },
        "stp_max_age" : {
          "description" : "Stp Max Age",
          "format" : "int32",
          "maximum" : 40,
          "minimum" : 6,
          "type" : "integer"
        },
        "stp_mode" : {
          "description" : "Stp Mode",
          "type" : "string",
          "enum" : [ "rstp" ]
        },
        "default_vlan_id" : {
          "description" : "Default Vlan Id",
          "format" : "int32",
          "maximum" : 4000,
          "minimum" : 1,
          "type" : "integer"
        },
        "mstp_enabled" : {
          "description" : "Mstp Enabled",
          "type" : "boolean"
        }
      },
      "required" : [ "stp_priority", "stp_forward_delay", "stp_hello_time", "stp_aging_timer", "stp_max_age", "stp_mode", "default_vlan_id", "mstp_enabled" ]
    },
    "device_profile_id" : {
      "description" : "Device Profile Id",
      "type" : "string"
    },
    "main_power_usage_threshold" : {
      "description" : "Main Power Usage Threshold",
      "format" : "int32",
      "maximum" : 100,
      "minimum" : 50,
      "type" : "integer",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "vpn_to_vpn_forwarding" : {
      "description" : "Vpn To Vpn Forwarding",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "nat_policysetstack_id" : {
      "description" : "Nat Policysetstack Id",
      "maxLength" : 20,
      "pattern" : "^-?[0-9]{1,20}$",
      "type" : "string"
    },
    "spoke_ha_config" : {
      "properties" : {
        "track" : {
          "properties" : {
            "waninterfaces" : {
              "description" : "Waninterfaces",
              "type" : "array",
              "items" : {
                "properties" : {
                  "reduce_priority" : {
                    "description" : "Reduce Priority",
                    "format" : "int32",
                    "maximum" : 254,
                    "minimum" : 1,
                    "type" : "integer"
                  },
                  "wan_interface_id" : {
                    "description" : "Wan Interface Id",
                    "type" : "string"
                  }
                },
                "required" : [ "reduce_priority", "wan_interface_id" ]
              }
            },
            "interfaces" : {
              "description" : "Interfaces",
              "type" : "array",
              "items" : {
                "properties" : {
                  "reduce_priority" : {
                    "description" : "Reduce Priority",
                    "format" : "int32",
                    "maximum" : 254,
                    "minimum" : 1,
                    "type" : "integer"
                  },
                  "interface_id" : {
                    "description" : "Interface Id",
                    "type" : "string"
                  }
                },
                "required" : [ "reduce_priority", "interface_id" ]
              }
            }
          },
          "required" : [ "waninterfaces", "interfaces" ]
        },
        "source_interface" : {
          "description" : "Source Interface",
          "type" : "string"
        },
        "priority" : {
          "description" : "Priority",
          "format" : "int32",
          "maximum" : 254,
          "minimum" : 1,
          "type" : "integer"
        },
        "enable" : {
          "description" : "Enable",
          "type" : "boolean"
        },
        "cluster_id" : {
          "description" : "Cluster Id",
          "type" : "string"
        }
      },
      "required" : [ "track", "source_interface", "priority", "enable", "cluster_id" ]
    },
    "l3_lan_forwarding" : {
      "description" : "L3 Lan Forwarding",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "l3_direct_private_wan_forwarding" : {
      "description" : "L3 Direct Private Wan Forwarding",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "priority_policysetstack_id" : {
      "description" : "Priority Policysetstack Id",
      "maxLength" : 20,
      "pattern" : "^-?[0-9]{1,20}$",
      "type" : "string"
    },
    "network_policysetstack_id" : {
      "description" : "Network Policysetstack Id",
      "maxLength" : 20,
      "pattern" : "^-?[0-9]{1,20}$",
      "type" : "string"
    },
    "cluster_id" : {
      "description" : "Cluster Id",
      "type" : "string"
    },
    "sw_obj" : {
      "properties" : {
        "location" : {
          "description" : "Location",
          "type" : "string"
        },
        "version" : {
          "description" : "Version",
          "type" : "string"
        }
      },
      "required" : [ "location", "version" ]
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
    "site_id" : {
      "description" : "Site Id",
      "maxLength" : 50,
      "pattern" : "^-?[0-9]{1,50}$",
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
    },
    "tenant_id" : {
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "element_id" : {
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "software_version" : {
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "model_name" : {
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "role" : {
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "cluster_insertion_mode" : {
      "type" : "string"
    },
    "state" : {
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "cluster_member_id" : {
      "type" : "string"
    },
    "device_mode" : {
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "hw_id" : {
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "allowed_roles" : {
      "type" : "array",
      "items" : {
        "type" : "string"
      },
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    }
  },
  "required" : [ "hub_cluster_config", "led_config", "switch_config", "device_profile_id", "main_power_usage_threshold", "vpn_to_vpn_forwarding", "nat_policysetstack_id", "spoke_ha_config", "l3_lan_forwarding", "l3_direct_private_wan_forwarding", "priority_policysetstack_id", "network_policysetstack_id", "cluster_id", "sw_obj", "tags", "description", "name", "site_id", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element.my_resource_name"
 id="<resource_id>"
}
```

