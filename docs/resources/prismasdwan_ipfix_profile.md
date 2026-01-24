## Documentation for Prisma SDWAN Resource "ipfix_profile"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `ipfix_profile` |
| Get Api  | `/sdwan/v2.0/api/ipfixprofiles/{profile_id}` (`IPFixProfileScreen`) |
| Post Api  | `/sdwan/v2.0/api/ipfixprofiles` (`IPFixProfileScreen`) |
| Put Api  | `/sdwan/v2.0/api/ipfixprofiles/{profile_id}` (`IPFixProfileScreen`) |
| Delete Api  | `/sdwan/v2.0/api/ipfixprofiles/{profile_id}` |


### JSON Schema

```json
{
  "properties" : {
    "sampler" : {
      "properties" : {
        "time_spacing" : {
          "description" : "Time Spacing",
          "type" : "integer"
        },
        "time_interval" : {
          "description" : "Time Interval",
          "type" : "integer"
        },
        "algorithm" : {
          "description" : "Algorithm",
          "type" : "string",
          "enum" : [ "time_based", "none" ]
        }
      }
    },
    "export_cache_timeout" : {
      "description" : "Export Cache Timeout: Range(max = 600L, error = IPFIX_INVALID_EXPORT_CACHE_TIMEOUT: Export cache timeout should be in range 10-600, min = 10L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "ipfixtemplate_id" : {
      "description" : "Ipfixtemplate Id: NotNull(error = IPFIX_PROFILE_TEMPLATE_ID_REQUIRED: IPFix template id is required) ",
      "type" : "string"
    },
    "filters" : {
      "description" : "Filters: Valid Size(max = 8, error = IPFIX_FILTERS_MAX_SIZE: Maximum 8 filters can be configured, min = 0) ",
      "type" : "array",
      "items" : {
        "properties" : {
          "rtp_transport_type" : {
            "description" : "Rtp Transport Type",
            "type" : "string",
            "enum" : [ "audio", "video" ]
          },
          "app_def_ids" : {
            "description" : "App Def Ids",
            "type" : "array",
            "items" : {
              "description" : "App Def Ids",
              "type" : "string"
            }
          },
          "wan_path_direction" : {
            "description" : "Wan Path Direction",
            "type" : "string",
            "enum" : [ "lan_to_wan", "wan_to_lan" ]
          },
          "priority_traffic_types" : {
            "description" : "Priority Traffic Types",
            "type" : "array",
            "items" : {
              "description" : "Priority Traffic Types",
              "type" : "string",
              "enum" : [ "P1_Video", "P1_Audio", "P1_Xact", "P1_Bulk", "P2_Video", "P2_Audio", "P2_Xact", "P2_Bulk", "P3_Video", "P3_Audio", "P3_Xact", "P3_Bulk", "P4_Video", "P4_Audio", "P4_Xact", "P4_Bulk" ]
            }
          },
          "protocols" : {
            "description" : "Protocols",
            "type" : "array",
            "items" : {
              "description" : "Protocols",
              "type" : "string",
              "enum" : [ "tcp", "udp", "ospf", "ipv6", "is-is-over-ipv4", "ipv6-nonxt", "etherip", "ipv6-icmp", "igmp", "udplite", "ipv6-opts", "icmp", "esp", "crtp", "ipip", "eigrp", "egp", "gre", "l2tpv3", "sctp", "ip-in-ip", "rsvp", "pim", "scps", "mpls-in-ip", "ah", "vrrp", "ipv6-route", "igp", "ipv6-frag" ]
            }
          },
          "src_ports" : {
            "description" : "Src Ports",
            "type" : "array",
            "items" : {
              "properties" : {
                "end" : {
                  "description" : "End: Range(max = 65535L, error = APPDEF_CONFIG_INVALID_PORT_RANGE: Port number must be between 1 and 65535, min = 1L) ",
                  "type" : "string"
                },
                "start" : {
                  "description" : "Start: Range(max = 65535L, error = APPDEF_CONFIG_INVALID_PORT_RANGE: Port number must be between 1 and 65535, min = 1L) ",
                  "type" : "string"
                }
              }
            }
          },
          "src_prefixes_id" : {
            "description" : "Src Prefixes Id",
            "type" : "string"
          },
          "dst_ports" : {
            "description" : "Dst Ports",
            "type" : "array",
            "items" : {
              "properties" : {
                "end" : {
                  "description" : "End: Range(max = 65535L, error = APPDEF_CONFIG_INVALID_PORT_RANGE: Port number must be between 1 and 65535, min = 1L) ",
                  "type" : "string"
                },
                "start" : {
                  "description" : "Start: Range(max = 65535L, error = APPDEF_CONFIG_INVALID_PORT_RANGE: Port number must be between 1 and 65535, min = 1L) ",
                  "type" : "string"
                }
              }
            }
          },
          "dst_prefixes_id" : {
            "description" : "Dst Prefixes Id",
            "type" : "string"
          },
          "ipfixfiltercontext_ids" : {
            "description" : "Ipfixfiltercontext Ids",
            "type" : "array",
            "items" : {
              "description" : "Ipfixfiltercontext Ids",
              "type" : "string"
            }
          }
        }
      }
    },
    "collector_config" : {
      "description" : "Collector Config: Valid Size(max = 4, error = IPFIX_PROFILE_COLLECTOR_CONFIG_REQUIRED: Minimum 1 and maximum 4 collectors can be configured, min = 1) NotNull(error = IPFIX_PROFILE_COLLECTOR_CONFIG_REQUIRED: Minimum 1 and maximum 4 collectors can be configured) ",
      "type" : "array",
      "items" : {
        "properties" : {
          "max_message_size" : {
            "description" : "Max Message Size",
            "format" : "int32",
            "type" : "integer"
          },
          "ipfixcollectorcontext_id" : {
            "description" : "Ipfixcollectorcontext Id",
            "type" : "string"
          },
          "protocol" : {
            "description" : "Protocol",
            "type" : "string",
            "enum" : [ "tcp", "udp" ]
          },
          "host_port" : {
            "description" : "Host Port",
            "format" : "int32",
            "type" : "integer"
          },
          "host" : {
            "description" : "Host",
            "type" : "string"
          }
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
  "required" : [ "ipfixtemplate_id", "collector_config", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_ipfix_profile.my_resource_name"
 id="<resource_id>"
}
```

