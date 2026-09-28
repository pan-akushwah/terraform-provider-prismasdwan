## Documentation for Prisma SDWAN Resource "app_def"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `app_def` |
| Get Api  | `/sdwan/v2.6/api/appdefs/{appdef_id}` (`AppDefScreenV2N6`) |
| Post Api  | `/sdwan/v2.6/api/appdefs` (`AppDefScreenV2N6`) |
| Put Api  | `/sdwan/v2.6/api/appdefs/{appdef_id}` (`AppDefScreenV2N6`) |
| Delete Api  | `/sdwan/v2.6/api/appdefs/{appdef_id}` |


### JSON Schema

```json
{
  "properties" : {
    "supported_base_software_version" : {
      "description" : "Supported Base Software Version",
      "type" : "string"
    },
    "p_parent_id" : {
      "description" : "P Parent Id",
      "type" : "string"
    },
    "supported_engines" : {
      "description" : "Supported Engines",
      "type" : "string",
      "enum" : [ "ave", "ave-all", "panos", "all", "panos-ml7" ]
    },
    "p_sub_category" : {
      "description" : "P Sub Category",
      "type" : "string",
      "enum" : [ "photo-video", "internet-utility", "database", "audio-streaming", "voip-video", "office-programs", "remote-access", "instant-messaging", "encrypted-tunnel", "management", "infrastructure", "general-business", "auth-service", "erp-crm", "gaming", "file-sharing", "email", "internet-conferencing", "social-business", "proxy", "social-networking", "storage-backup", "marketing", "routing", "ics-protocols", "viop-video", "Management", "medical", "ip-protocol", "software-development", "web-posting", "software-update", "it-management", "design", "hr" ]
    },
    "p_category" : {
      "description" : "P Category",
      "type" : "string",
      "enum" : [ "business-systems", "collaboration", "general-internet", "media", "networking", "saas" ]
    },
    "network_scan_application" : {
      "description" : "Network Scan Application",
      "type" : "boolean"
    },
    "app_unreachability_detection" : {
      "description" : "App Unreachability Detection",
      "type" : "boolean"
    },
    "use_parentapp_network_policy" : {
      "description" : "Use Parentapp Network Policy",
      "type" : "boolean"
    },
    "parent_id" : {
      "description" : "Parent Id",
      "type" : "string"
    },
    "is_deprecated" : {
      "description" : "Is Deprecated",
      "type" : "boolean"
    },
    "description" : {
      "description" : "Description",
      "maxLength" : 256,
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
    "system_app_overridden" : {
      "description" : "System App Overridden",
      "type" : "boolean"
    },
    "overrides_allowed" : {
      "description" : "Overrides Allowed",
      "type" : "boolean"
    },
    "order_number" : {
      "description" : "Order Number",
      "format" : "int32",
      "maximum" : 65535,
      "minimum" : 1,
      "type" : "integer"
    },
    "aggregate_flows" : {
      "description" : "Aggregate Flows",
      "type" : "boolean"
    },
    "session_timeout" : {
      "description" : "Session Timeout",
      "format" : "int32",
      "maximum" : 44000,
      "minimum" : 0,
      "type" : "integer"
    },
    "category" : {
      "description" : "Category",
      "type" : "string",
      "enum" : [ "anonymity", "anti-virus", "auth", "backup", "cad", "collaboration", "conference", "crm", "db-mgmt", "email", "enterprise", "file-sharing", "file-system", "file-transfer", "gaming", "intercomm", "logging", "management", "messaging", "net-discovery", "net-mgmt", "net-monitor", "news-server", "notification", "p2p", "printing", "proxy", "recreational", "remote-desk", "remote-mgmt", "replication", "routing", "saas", "secure-browsing", "storage", "streaming", "tunnel", "utility", "voip", "wan-opt", "web-browsing", "wireless-mgmt", "ip-protocol", "multicast", "security", "i23v5", "printer", "default" ]
    },
    "app_type" : {
      "description" : "App Type",
      "type" : "string",
      "enum" : [ "custom" ]
    },
    "transfer_type" : {
      "description" : "Transfer Type",
      "type" : "string",
      "enum" : [ "transactional", "bulk", "rt-audio", "rt-video" ]
    },
    "ip_rules" : {
      "type" : "array",
      "items" : {
        "properties" : {
          "dest_prefixes" : {
            "description" : "Dest Prefixes",
            "maxItems" : 8,
            "type" : "array",
            "uniqueItems" : true,
            "items" : {
              "description" : "Dest Prefixes",
              "format" : "ipv4",
              "type" : "string"
            }
          },
          "dscp" : {
            "properties" : {
              "value" : {
                "description" : "Value",
                "format" : "int32",
                "maximum" : 63,
                "minimum" : 0,
                "type" : "integer"
              }
            },
            "required" : [ "value" ]
          },
          "src_filters" : {
            "description" : "Src Filters",
            "maxItems" : 8,
            "type" : "array",
            "uniqueItems" : true,
            "items" : {
              "description" : "Src Filters",
              "pattern" : "[0-9]{1,30}",
              "type" : "string"
            }
          },
          "dest_filters" : {
            "description" : "Dest Filters",
            "maxItems" : 8,
            "type" : "array",
            "uniqueItems" : true,
            "items" : {
              "description" : "Dest Filters",
              "pattern" : "[0-9]{1,30}",
              "type" : "string"
            }
          },
          "protocol" : {
            "description" : "Protocol",
            "type" : "string",
            "enum" : [ "ospf", "ipv6", "is-is-over-ipv4", "ipv6-nonxt", "etherip", "ipv6-icmp", "igmp", "udplite", "ipv6-opts", "icmp", "esp", "crtp", "ipip", "eigrp", "egp", "gre", "l2tpv3", "sctp", "ip-in-ip", "rsvp", "pim", "scps", "mpls-in-ip", "ah", "vrrp", "ipv6-route", "igp", "ipv6-frag" ]
          },
          "dest_ipv6_prefixes" : {
            "type" : "array",
            "items" : {
              "type" : "string"
            }
          }
        },
        "required" : [ "dest_prefixes", "dscp", "src_filters", "dest_filters", "protocol" ]
      }
    },
    "udp_rules" : {
      "type" : "array",
      "items" : {
        "properties" : {
          "dest_prefixes" : {
            "description" : "Dest Prefixes",
            "maxItems" : 8,
            "type" : "array",
            "uniqueItems" : true,
            "items" : {
              "description" : "Dest Prefixes",
              "format" : "ipv4",
              "type" : "string"
            }
          },
          "dscp" : {
            "properties" : {
              "value" : {
                "description" : "Value",
                "format" : "int32",
                "maximum" : 63,
                "minimum" : 0,
                "type" : "integer"
              }
            },
            "required" : [ "value" ]
          },
          "udp_port" : {
            "properties" : {
              "end" : {
                "description" : "End",
                "maximum" : 65535,
                "minimum" : 1,
                "type" : "string"
              },
              "start" : {
                "description" : "Start",
                "maximum" : 65535,
                "minimum" : 1,
                "type" : "string"
              }
            },
            "required" : [ "end", "start" ]
          },
          "udp_filters" : {
            "description" : "Udp Filters",
            "maxItems" : 8,
            "type" : "array",
            "uniqueItems" : true,
            "items" : {
              "description" : "Udp Filters",
              "pattern" : "[0-9]{1,30}",
              "type" : "string"
            }
          },
          "dest_ipv6_prefixes" : {
            "type" : "array",
            "items" : {
              "type" : "string"
            }
          }
        },
        "required" : [ "dest_prefixes", "dscp", "udp_port", "udp_filters" ]
      }
    },
    "tcp_rules" : {
      "type" : "array",
      "items" : {
        "properties" : {
          "server_prefixes" : {
            "description" : "Server Prefixes",
            "maxItems" : 8,
            "type" : "array",
            "uniqueItems" : true,
            "items" : {
              "description" : "Server Prefixes",
              "format" : "ipv4",
              "type" : "string"
            }
          },
          "dscp" : {
            "properties" : {
              "value" : {
                "description" : "Value",
                "format" : "int32",
                "maximum" : 63,
                "minimum" : 0,
                "type" : "integer"
              }
            },
            "required" : [ "value" ]
          },
          "client_port" : {
            "properties" : {
              "end" : {
                "description" : "End",
                "maximum" : 65535,
                "minimum" : 1,
                "type" : "string"
              },
              "start" : {
                "description" : "Start",
                "maximum" : 65535,
                "minimum" : 1,
                "type" : "string"
              }
            },
            "required" : [ "end", "start" ]
          },
          "server_port" : {
            "properties" : {
              "end" : {
                "description" : "End",
                "maximum" : 65535,
                "minimum" : 1,
                "type" : "string"
              },
              "start" : {
                "description" : "Start",
                "maximum" : 65535,
                "minimum" : 1,
                "type" : "string"
              }
            },
            "required" : [ "end", "start" ]
          },
          "client_filters" : {
            "description" : "Client Filters",
            "maxItems" : 8,
            "type" : "array",
            "uniqueItems" : true,
            "items" : {
              "description" : "Client Filters",
              "pattern" : "[0-9]{1,30}",
              "type" : "string"
            }
          },
          "server_filters" : {
            "description" : "Server Filters",
            "maxItems" : 8,
            "type" : "array",
            "uniqueItems" : true,
            "items" : {
              "description" : "Server Filters",
              "pattern" : "[0-9]{1,30}",
              "type" : "string"
            }
          },
          "server_ipv6_prefixes" : {
            "type" : "array",
            "items" : {
              "type" : "string"
            }
          }
        },
        "required" : [ "server_prefixes", "dscp", "client_port", "server_port", "client_filters", "server_filters" ]
      }
    },
    "domains" : {
      "description" : "Domains",
      "maxItems" : 16,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Domains",
        "maxLength" : 256,
        "pattern" : "(?=^.{4,253}$)((^((?!-)[a-zA-Z0-9-]{1,63}(?<!-)))|(^((?!-)[a-zA-Z0-9-]{1,63}(?<!-)\\.)+)([a-zA-Z]{2,63}))([:])?([0-9]{1,4}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])?$",
        "type" : "string"
      }
    },
    "abbreviation" : {
      "description" : "Abbreviation",
      "maxLength" : 5,
      "type" : "string"
    },
    "display_name" : {
      "description" : "Display Name",
      "maxLength" : 64,
      "minLength" : 1,
      "type" : "string"
    },
    "conn_idle_timeout" : {
      "description" : "Conn Idle Timeout",
      "format" : "int32",
      "maximum" : 44000,
      "minimum" : 0,
      "type" : "integer"
    },
    "ingress_traffic_pct" : {
      "description" : "Ingress Traffic Pct",
      "format" : "int32",
      "maximum" : 99,
      "minimum" : 1,
      "type" : "integer"
    },
    "path_affinity" : {
      "description" : "Path Affinity",
      "type" : "string",
      "enum" : [ "none", "weak", "strict" ]
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
  "required" : [ "supported_base_software_version", "p_parent_id", "supported_engines", "p_sub_category", "p_category", "network_scan_application", "app_unreachability_detection", "use_parentapp_network_policy", "parent_id", "is_deprecated", "description", "tags", "system_app_overridden", "overrides_allowed", "order_number", "aggregate_flows", "session_timeout", "category", "app_type", "transfer_type", "ip_rules", "udp_rules", "tcp_rules", "domains", "abbreviation", "display_name", "conn_idle_timeout", "ingress_traffic_pct", "path_affinity", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_app_def.my_resource_name"
 id="<resource_id>"
}
```

