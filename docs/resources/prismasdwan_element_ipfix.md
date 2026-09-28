## Documentation for Prisma SDWAN Resource "element_ipfix"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_ipfix` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/ipfix/{ipfix_id}` (`IPFixConfigScreen`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/ipfix` (`IPFixConfigScreen`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/ipfix/{ipfix_id}` (`IPFixConfigScreen`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/ipfix/{ipfix_id}` |


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
      },
      "required" : [ "time_spacing", "time_interval", "algorithm" ]
    },
    "export_cache_timeout" : {
      "description" : "Export Cache Timeout",
      "maximum" : 600,
      "minimum" : 10,
      "type" : "integer"
    },
    "ipfixtemplate_id" : {
      "description" : "Ipfixtemplate Id",
      "type" : "string"
    },
    "filters" : {
      "description" : "Filters",
      "maxItems" : 8,
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
                "start" : {
                  "type" : "integer"
                },
                "end" : {
                  "type" : "integer"
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
                "start" : {
                  "type" : "integer"
                },
                "end" : {
                  "type" : "integer"
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
        },
        "required" : [ "rtp_transport_type", "app_def_ids", "wan_path_direction", "priority_traffic_types", "protocols", "src_ports", "src_prefixes_id", "dst_ports", "dst_prefixes_id", "ipfixfiltercontext_ids" ]
      }
    },
    "collector_config" : {
      "description" : "Collector Config",
      "maxItems" : 4,
      "minItems" : 1,
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
        },
        "required" : [ "max_message_size", "ipfixcollectorcontext_id", "protocol", "host_port", "host" ]
      }
    },
    "ipfixprofile_id" : {
      "description" : "Ipfixprofile Id",
      "type" : "string"
    },
    "tags" : {
      "description" : "Tags",
      "maxItems" : 10,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Tags",
        "maxLength" : 1024,
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
      "maxLength" : 1024,
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
  "required" : [ "sampler", "export_cache_timeout", "ipfixtemplate_id", "filters", "collector_config", "ipfixprofile_id", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_ipfix.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

