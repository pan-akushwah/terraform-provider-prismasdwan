## Documentation for Prisma SDWAN Resource "element_shell"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_shell` |
| Get Api  | `/sdwan/v2.1/api/sites/{site_id}/elementshells/{element_shell_id}` (`ElementShellV2N1`) |
| Post Api  | `/sdwan/v2.1/api/sites/{site_id}/elementshells` (`ElementShellV2N1`) |
| Put Api  | `/sdwan/v2.1/api/sites/{site_id}/elementshells/{element_shell_id}` (`ElementShellV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/sites/{site_id}/elementshells/{element_shell_id}` |


### JSON Schema

```json
{
  "properties" : {
    "hub_cluster_config" : {
      "properties" : {
        "intra_cluster_tunnel" : {
          "properties" : {
            "status" : {
              "description" : "Status",
              "type" : "string"
            },
            "destination_ip" : {
              "description" : "Destination Ip",
              "type" : "string"
            },
            "source_ip" : {
              "description" : "Source Ip",
              "type" : "string"
            }
          }
        },
        "track" : {
          "properties" : {
            "hosts" : {
              "description" : "Hosts: Size(max = 1, message = HUB_CLUSTER_CONFIG_TRACK_HOST_SIZE_EXCEEDS_LIMIT, min = 0) ",
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
                }
              }
            }
          }
        }
      }
    },
    "device_mode" : {
      "description" : "Device Mode",
      "type" : "string",
      "enum" : [ "none", "l3-mode", "l2-mode" ]
    },
    "led_config" : {
      "properties" : {
        "service_led_on" : {
          "description" : "Service Led On",
          "type" : "boolean"
        }
      }
    },
    "switch_config" : {
      "properties" : {
        "stp_priority" : {
          "description" : "Stp Priority: Range(max = 61440L, error = INVALID_STP_PRIORITY: Invalid STP priority. Value should be in the multiples of 4096., min = 0L) ",
          "format" : "int32",
          "type" : "integer"
        },
        "stp_forward_delay" : {
          "description" : "Stp Forward Delay: Range(max = 30L, error = INVALID_STP_FORWARD_DELAY: Invalid STP forward delay. Allowed range is 4-30 and given value should also meet the criteria: (2 * (stp_forward_delay - 1)) >= stp_max_age., min = 4L) ",
          "format" : "int32",
          "type" : "integer"
        },
        "stp_hello_time" : {
          "description" : "Stp Hello Time: Range(max = 10L, error = INVALID_STP_HELLO_TIME: Invalid STP hello time. Allowed range is 1-10., min = 1L) ",
          "format" : "int32",
          "type" : "integer"
        },
        "stp_aging_timer" : {
          "description" : "Stp Aging Timer: Range(max = 1000000L, error = INVALID_STP_AGING_TIMER: Invalid STP aging timer. Allowed range is 10-1000000., min = 10L) ",
          "format" : "int32",
          "type" : "integer"
        },
        "stp_max_age" : {
          "description" : "Stp Max Age: Range(max = 40L, error = INVALID_STP_MAX_AGE: Invalid STP max age. Allowed range is 6-40., min = 6L) ",
          "format" : "int32",
          "type" : "integer"
        },
        "stp_mode" : {
          "description" : "Stp Mode: ValidateEnum(enumClass = classOf[STPMode], error = INVALID_STP_MODE: Invalid STP mode. Allowed values are stp, rstp or mstp., nullAllowed = false) ",
          "type" : "string",
          "enum" : [ "RSTP" ]
        },
        "default_vlan_id" : {
          "description" : "Default Vlan Id: Range(max = 4000L, error = INVALID_VLAN_ID: Invalid VLAN id. VLAN id must be between 1-4000., min = 1L) ",
          "format" : "int32",
          "type" : "integer"
        },
        "mstp_enabled" : {
          "description" : "Mstp Enabled",
          "type" : "boolean"
        }
      },
      "required" : [ "stp_mode" ]
    },
    "device_profile_id" : {
      "description" : "Device Profile Id",
      "type" : "string"
    },
    "main_power_usage_threshold" : {
      "description" : "Main Power Usage Threshold: ValidateDecimal(allowZero = true, increment = 0, max = 0, error = INVALID_MAIN_POWER_USAGE_THRESHOLD: Invalid main power usage threshold. Allowed range is 50-100., min = 0) ",
      "format" : "int32",
      "type" : "integer"
    },
    "vpn_to_vpn_forwarding" : {
      "description" : "Vpn To Vpn Forwarding",
      "type" : "boolean"
    },
    "l3_lan_forwarding" : {
      "description" : "L3 Lan Forwarding",
      "type" : "boolean"
    },
    "l3_direct_private_wan_forwarding" : {
      "description" : "L3 Direct Private Wan Forwarding",
      "type" : "boolean"
    },
    "nat_policysetstack_id" : {
      "description" : "Nat Policysetstack Id: Digits(fraction = 0, integer = 20, error = INVALID_NAT_POLICYSETSTACK_ID: Invalid nat policy set stack id.) Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
      "type" : "string"
    },
    "spoke_ha_config" : {
      "properties" : {
        "track" : {
          "properties" : {
            "waninterfaces" : {
              "description" : "Waninterfaces: Valid ",
              "type" : "array",
              "items" : {
                "properties" : {
                  "reduce_priority" : {
                    "description" : "Reduce Priority: Range(max = 254L, SPOKEHA_CONFIG_INVALID_REDUCE_PRIORITY, min = 1L) ",
                    "format" : "int32",
                    "type" : "integer"
                  },
                  "wan_interface_id" : {
                    "description" : "Wan Interface Id",
                    "type" : "string"
                  }
                }
              }
            },
            "interfaces" : {
              "description" : "Interfaces: Valid ",
              "type" : "array",
              "items" : {
                "properties" : {
                  "reduce_priority" : {
                    "description" : "Reduce Priority: Range(max = 254L, SPOKEHA_CONFIG_INVALID_REDUCE_PRIORITY, min = 1L) ",
                    "format" : "int32",
                    "type" : "integer"
                  },
                  "interface_id" : {
                    "description" : "Interface Id",
                    "type" : "string"
                  }
                }
              }
            }
          }
        },
        "source_interface" : {
          "description" : "Source Interface: Required(SPOKEHA_CONFIG_SOURCE_INTERFACE_ID_REQD) ",
          "type" : "string"
        },
        "priority" : {
          "description" : "Priority: Required(SPOKEHA_CONFIG_PRIORITY_REQD) Range(max = 254L, SPOKEHA_CONFIG_INVALID_PRIORITY, min = 1L) ",
          "format" : "int32",
          "type" : "integer"
        },
        "enable" : {
          "description" : "Enable: Required(SPOKEHA_CONFIG_ENABLE_REQD) ",
          "type" : "boolean"
        },
        "cluster_id" : {
          "description" : "Cluster Id: Required(SPOKEHA_CONFIG_CLUSTER_ID_REQD) ",
          "type" : "string"
        }
      },
      "required" : [ "source_interface", "priority", "enable", "cluster_id" ]
    },
    "priority_policysetstack_id" : {
      "description" : "Priority Policysetstack Id: Digits(fraction = 0, integer = 20, error = INVALID_PRIORITY_POLICYSETSTACK_ID: Invalid priority policy set stack id) ",
      "type" : "string"
    },
    "network_policysetstack_id" : {
      "description" : "Network Policysetstack Id: Digits(fraction = 0, integer = 20, error = INVALID_NETWORK_POLICYSETSTACK_ID: Invalid network policy set stack id) ",
      "type" : "string"
    },
    "cluster_insertion_mode" : {
      "description" : "Cluster Insertion Mode",
      "type" : "string",
      "enum" : [ "AUTO", "MANUAL" ]
    },
    "cluster_id" : {
      "description" : "Cluster Id",
      "type" : "string"
    },
    "cluster_member_id" : {
      "description" : "Cluster Member Id",
      "type" : "string"
    },
    "element_id" : {
      "description" : "Element Id",
      "type" : "string"
    },
    "allowed_roles" : {
      "description" : "Allowed Roles",
      "type" : "array",
      "items" : {
        "description" : "Allowed Roles",
        "type" : "string",
        "enum" : [ "NONE", "HUB", "SPOKE", "PA_WE_BR", "PA_WE_DC", "PA_CONN" ]
      }
    },
    "state" : {
      "description" : "State",
      "type" : "string",
      "enum" : [ "ACTIVE_INIT", "ACTIVE_INVENTORY_IN_PROGRESS", "ACTIVE_INVENTORY_OPERATION_FAILED", "ACTIVE_INVENTORY_GET_PENDING", "ACTIVE_INVENTORY_GET_COMPLETE", "ACTIVE_INVENTORY_POST_PENDING", "ACTIVE_INTF_CONFIG_GET_FAILED", "ACTIVE_INTF_STATE_GET_FAILED", "ACTIVE_READY", "ACTIVE_BOUND_IN_PROGRESS", "ACTIVE_UNBOUND_IN_PROGRESS", "ACTIVE_UNBOUND_FROM_SITE_FAILED", "ACTIVE_BOUND_TO_SITE", "ACTIVE_BOUND_TO_SITE_FAILED", "OOS", "ACTIVE_DECLAIM_IN_PROGRESS", "ACTIVE_DECLAIMED" ]
    },
    "role" : {
      "description" : "Role",
      "type" : "string",
      "enum" : [ "NONE", "HUB", "SPOKE", "PA_WE_BR", "PA_WE_DC", "PA_CONN" ]
    },
    "model_name" : {
      "description" : "Model Name: Required(ELEMENT_SHELL_MODEL_NAME_REQUIRED) ",
      "type" : "string"
    },
    "hw_id" : {
      "description" : "Hw Id",
      "type" : "string"
    },
    "software_version" : {
      "description" : "Software Version: Required(ELEMENT_SHELL_SOFTWARE_VERSION_REQUIRED) ",
      "type" : "string"
    },
    "description" : {
      "description" : "Description: Size(max = 256, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
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
    "site_id" : {
      "description" : "Site Id: Transient Required(ELEMENT_SHELL_SITE_ID_REQUIRED) Size(max = 21, ELEMENT_SHELL_SITE_ID_EXCEEDS_LIMIT, min = 0) Pattern(error = ID_HAS_INVALID_CHARS: ID has invalid chars., regexp = [0-9]*) ",
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
  "required" : [ "model_name", "software_version", "site_id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_shell.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

