## Documentation for Prisma SDWAN Resource "app_def_override"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `app_def_override` |
| Get Api  | `/sdwan/v2.3/api/appdefs/{appdef_id}/overrides/{override_id}` (`AppdefOverrideScreenV2N3`) |
| Post Api  | `/sdwan/v2.3/api/appdefs/{appdef_id}/overrides` (`AppdefOverrideScreenV2N3`) |
| Put Api  | `/sdwan/v2.3/api/appdefs/{appdef_id}/overrides/{override_id}` (`AppdefOverrideScreenV2N3`) |
| Delete Api  | `/sdwan/v2.3/api/appdefs/{appdef_id}/overrides/{override_id}` |


### JSON Schema

```json
{
  "properties" : {
    "p_category" : {
      "description" : "P Category",
      "type" : "string",
      "enum" : [ "business-systems", "collaboration", "general-internet", "media", "networking", "saas" ]
    },
    "ip_rules" : {
      "description" : "Ip Rules",
      "maxItems" : 16,
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
      "description" : "Udp Rules",
      "maxItems" : 16,
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
      "description" : "Tcp Rules",
      "maxItems" : 16,
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
    "app_unreachability_detection" : {
      "description" : "App Unreachability Detection",
      "type" : "boolean"
    },
    "use_parentapp_network_policy" : {
      "description" : "Use Parentapp Network Policy",
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
    "overrides_disable" : {
      "description" : "Overrides Disable",
      "type" : "boolean"
    },
    "override_default_ip_rules" : {
      "description" : "Override Default Ip Rules",
      "type" : "boolean"
    },
    "override_default_udp_rules" : {
      "description" : "Override Default Udp Rules",
      "type" : "boolean"
    },
    "override_default_tcp_rules" : {
      "description" : "Override Default Tcp Rules",
      "type" : "boolean"
    },
    "override_domains" : {
      "description" : "Override Domains",
      "type" : "boolean"
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
    "conn_idle_timeout" : {
      "description" : "Conn Idle Timeout",
      "maximum" : 44000,
      "minimum" : 1,
      "type" : "integer"
    },
    "aggregate_flows" : {
      "description" : "Aggregate Flows",
      "type" : "boolean"
    },
    "session_timeout" : {
      "description" : "Session Timeout",
      "maximum" : 44000,
      "minimum" : 1,
      "type" : "integer"
    },
    "path_affinity" : {
      "description" : "Path Affinity",
      "type" : "string",
      "enum" : [ "none", "weak", "strict" ]
    },
    "transfer_type" : {
      "description" : "Transfer Type",
      "type" : "string",
      "enum" : [ "transactional", "bulk", "rt-audio", "rt-video" ]
    },
    "ingress_traffic_pct" : {
      "description" : "Ingress Traffic Pct",
      "maximum" : 99,
      "minimum" : 1,
      "type" : "integer"
    },
    "category" : {
      "description" : "Category",
      "type" : "string",
      "enum" : [ "anonymity", "anti-virus", "auth", "backup", "cad", "collaboration", "conference", "crm", "db-mgmt", "email", "enterprise", "file-sharing", "file-system", "file-transfer", "gaming", "intercomm", "logging", "management", "messaging", "net-discovery", "net-mgmt", "net-monitor", "news-server", "notification", "p2p", "printing", "proxy", "recreational", "remote-desk", "remote-mgmt", "replication", "routing", "saas", "secure-browsing", "storage", "streaming", "tunnel", "utility", "voip", "wan-opt", "web-browsing", "wireless-mgmt", "ip-protocol", "multicast", "security", "i23v5", "printer", "default" ]
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
  "required" : [ "p_category", "ip_rules", "udp_rules", "tcp_rules", "app_unreachability_detection", "use_parentapp_network_policy", "description", "tags", "overrides_disable", "override_default_ip_rules", "override_default_udp_rules", "override_default_tcp_rules", "override_domains", "domains", "conn_idle_timeout", "aggregate_flows", "session_timeout", "path_affinity", "transfer_type", "ingress_traffic_pct", "category", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_app_def_override.my_resource_name"
 id="<resource_id>:appdef_id=<some_appdef_id>"
}
```

