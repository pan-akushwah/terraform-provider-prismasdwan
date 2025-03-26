## Documentation for Prisma SDWAN Resource "appdefs_overrides"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `appdefs_overrides` |
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
      "description" : "Ip Rules: Valid Size(max = 16, error = APPDEF_CONFIG_MAX_SIZE_EXCEED: Allowed max size is 16 for each of them - tcp_rules, ip_rules and udp_rules., min = 0) Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "dest_prefixes" : {
            "description" : "Dest Prefixes: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 8, error = APPDEF_CONFIG_INVALID_PREFIX: Invalid prefix configured, noTrim = false, regex = , required = false) ListIPAddress(bcast = DENY, listMaxSize = 0, error = APPDEF_CONFIG_INVALID_PREFIX: Invalid prefix configured, required = false, type = APP_GATEWAYCIDR) ",
            "type" : "array",
            "items" : {
              "description" : "Dest Prefixes",
              "type" : "string"
            }
          },
          "dscp" : {
            "properties" : {
              "value" : {
                "description" : "Value: Min(message = INVALID_DSCP_MIN_VALUE, value = 0L) Max(message = INVALID_DSCP_MAX_VALUE, value = 63L) ",
                "format" : "int32",
                "type" : "integer"
              }
            }
          },
          "src_filters" : {
            "description" : "Src Filters: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 8, error = APPDEF_CONFIG_INVALID_IP_LIST: IP List is not valid., noTrim = false, regex = [0-9]{1,30}, required = false) ",
            "type" : "array",
            "items" : {
              "description" : "Src Filters",
              "type" : "string"
            }
          },
          "dest_filters" : {
            "description" : "Dest Filters: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 8, error = APPDEF_CONFIG_INVALID_IP_LIST: IP List is not valid., noTrim = false, regex = [0-9]{1,30}, required = false) ",
            "type" : "array",
            "items" : {
              "description" : "Dest Filters",
              "type" : "string"
            }
          },
          "protocol" : {
            "description" : "Protocol: ValidateEnum(enumClass = classOf[Protocol], error = APPDEF_CONFIG_INVALID_PROTOCOL: Application protocol is invalid., nullAllowed = false) ",
            "type" : "string",
            "enum" : [ "ospf", "ipv6", "is-is-over-ipv4", "ipv6-nonxt", "etherip", "ipv6-icmp", "igmp", "udplite", "ipv6-opts", "icmp", "esp", "crtp", "ipip", "eigrp", "egp", "gre", "l2tpv3", "sctp", "ip-in-ip", "rsvp", "pim", "scps", "mpls-in-ip", "ah", "vrrp", "ipv6-route", "igp", "ipv6-frag" ]
          }
        },
        "required" : [ "protocol" ]
      }
    },
    "udp_rules" : {
      "description" : "Udp Rules: Valid Size(max = 16, error = APPDEF_CONFIG_MAX_SIZE_EXCEED: Allowed max size is 16 for each of them - tcp_rules, ip_rules and udp_rules., min = 0) Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "dest_prefixes" : {
            "description" : "Dest Prefixes: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 8, error = APPDEF_CONFIG_INVALID_PREFIX: Invalid prefix configured, noTrim = false, regex = , required = false) ListIPAddress(bcast = DENY, listMaxSize = 0, error = APPDEF_CONFIG_INVALID_PREFIX: Invalid prefix configured, required = false, type = APP_GATEWAYCIDR) ",
            "type" : "array",
            "items" : {
              "description" : "Dest Prefixes",
              "type" : "string"
            }
          },
          "dscp" : {
            "properties" : {
              "value" : {
                "description" : "Value: Min(message = INVALID_DSCP_MIN_VALUE, value = 0L) Max(message = INVALID_DSCP_MAX_VALUE, value = 63L) ",
                "format" : "int32",
                "type" : "integer"
              }
            }
          },
          "udp_port" : {
            "properties" : {
              "end" : {
                "description" : "End: Range(max = 65535L, error = APPDEF_CONFIG_INVALID_PORT_RANGE: Port number must be between 1 and 65535, min = 1L) ",
                "type" : "integer"
              },
              "start" : {
                "description" : "Start: Range(max = 65535L, error = APPDEF_CONFIG_INVALID_PORT_RANGE: Port number must be between 1 and 65535, min = 1L) ",
                "type" : "integer"
              }
            }
          },
          "udp_filters" : {
            "description" : "Udp Filters: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 8, error = APPDEF_CONFIG_INVALID_IP_LIST: IP List is not valid., noTrim = false, regex = [0-9]{1,30}, required = false) ",
            "type" : "array",
            "items" : {
              "description" : "Udp Filters",
              "type" : "string"
            }
          }
        }
      }
    },
    "tcp_rules" : {
      "description" : "Tcp Rules: Valid Size(max = 16, error = APPDEF_CONFIG_MAX_SIZE_EXCEED: Allowed max size is 16 for each of them - tcp_rules, ip_rules and udp_rules., min = 0) Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "server_prefixes" : {
            "description" : "Server Prefixes: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 8, error = APPDEF_CONFIG_INVALID_PREFIX: Invalid prefix configured, noTrim = false, regex = , required = false) ListIPAddress(bcast = DENY, listMaxSize = 0, error = APPDEF_CONFIG_INVALID_PREFIX: Invalid prefix configured, required = false, type = APP_GATEWAYCIDR) ",
            "type" : "array",
            "items" : {
              "description" : "Server Prefixes",
              "type" : "string"
            }
          },
          "dscp" : {
            "properties" : {
              "value" : {
                "description" : "Value: Min(message = INVALID_DSCP_MIN_VALUE, value = 0L) Max(message = INVALID_DSCP_MAX_VALUE, value = 63L) ",
                "format" : "int32",
                "type" : "integer"
              }
            }
          },
          "client_port" : {
            "properties" : {
              "end" : {
                "description" : "End: Range(max = 65535L, error = APPDEF_CONFIG_INVALID_PORT_RANGE: Port number must be between 1 and 65535, min = 1L) ",
                "type" : "integer"
              },
              "start" : {
                "description" : "Start: Range(max = 65535L, error = APPDEF_CONFIG_INVALID_PORT_RANGE: Port number must be between 1 and 65535, min = 1L) ",
                "type" : "integer"
              }
            }
          },
          "server_port" : {
            "properties" : {
              "end" : {
                "description" : "End: Range(max = 65535L, error = APPDEF_CONFIG_INVALID_PORT_RANGE: Port number must be between 1 and 65535, min = 1L) ",
                "type" : "integer"
              },
              "start" : {
                "description" : "Start: Range(max = 65535L, error = APPDEF_CONFIG_INVALID_PORT_RANGE: Port number must be between 1 and 65535, min = 1L) ",
                "type" : "integer"
              }
            }
          },
          "client_filters" : {
            "description" : "Client Filters: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 8, error = APPDEF_CONFIG_INVALID_IP_LIST: IP List is not valid., noTrim = false, regex = [0-9]{1,30}, required = false) ",
            "type" : "array",
            "items" : {
              "description" : "Client Filters",
              "type" : "string"
            }
          },
          "server_filters" : {
            "description" : "Server Filters: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 8, error = APPDEF_CONFIG_INVALID_IP_LIST: IP List is not valid., noTrim = false, regex = [0-9]{1,30}, required = false) ",
            "type" : "array",
            "items" : {
              "description" : "Server Filters",
              "type" : "string"
            }
          }
        }
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
      "description" : "Description: Size(max = 256, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0) ",
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
      "description" : "Domains: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 256, listMaxSize = 16, error = APPDEF_CONFIG_INVALID_DOMAIN_LIST: Application domain list is invalid. Maximum 16 valid domains are allowed and each domain should not exceed 253 characters., noTrim = false, regex = (?=^.{4,253}$)((^((?!-)[a-zA-Z0-9-]{1,63}(?<!-)))|(^((?!-)[a-zA-Z0-9-]{1,63}(?<!-)\\\\.)+)([a-zA-Z]{2,63}))([:])?([0-9]{1,4}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])?$, required = false) ",
      "type" : "array",
      "items" : {
        "description" : "Domains",
        "type" : "string"
      }
    },
    "conn_idle_timeout" : {
      "description" : "Conn Idle Timeout: Range(max = 44000L, error = APPDEF_CONFIG_INVALID_OVERRIDE_TIMEOUT: Application connection timeout should be in between 1-44000, min = 1L) ",
      "type" : "integer"
    },
    "aggregate_flows" : {
      "description" : "Aggregate Flows",
      "type" : "boolean"
    },
    "session_timeout" : {
      "description" : "Session Timeout: Range(max = 44000L, error = APPDEF_CONFIG_INVALID_OVERRIDE_SESSION_TIMEOUT: Application session timeout should be in between 1-44000, min = 1L) ",
      "type" : "integer"
    },
    "path_affinity" : {
      "description" : "Path Affinity: ValidateEnum(enumClass = classOf[PathAffinity], error = APPDEF_CONFIG_INVALID_PATHAFFINITY: Application path affinity is invalid. Only none, weak, strict is allowed., nullAllowed = true) ",
      "type" : "string",
      "enum" : [ "none", "weak", "strict" ]
    },
    "transfer_type" : {
      "description" : "Transfer Type: ValidateString(allowNull = true, error = APPDEF_CONFIG_INVALID_TRANSFER_TYPE: Application transfer type is invalid. Only transactional, bulk, rt-audio, rt-video is allowed., values = [transactional, bulk, rt-audio, rt-video]) ",
      "type" : "string"
    },
    "ingress_traffic_pct" : {
      "description" : "Ingress Traffic Pct: Range(max = 99L, error = APPDEF_CONFIG_INVALID_INGRESS: Application ingress traffic percentage should be in between 1-99, min = 1L) ",
      "type" : "integer"
    },
    "category" : {
      "description" : "Category: ValidateEnum(enumClass = classOf[AppCategory], error = APPDEF_CONFIG_INVALID_CATEGORY: Application category is invalid., nullAllowed = true) ",
      "type" : "string",
      "enum" : [ "anonymity", "anti-virus", "auth", "backup", "cad", "collaboration", "conference", "crm", "db-mgmt", "email", "enterprise", "file-sharing", "file-system", "file-transfer", "gaming", "intercomm", "logging", "management", "messaging", "net-discovery", "net-mgmt", "net-monitor", "news-server", "notification", "p2p", "printing", "proxy", "recreational", "remote-desk", "remote-mgmt", "replication", "routing", "saas", "secure-browsing", "storage", "streaming", "tunnel", "utility", "voip", "wan-opt", "web-browsing", "wireless-mgmt", "ip-protocol", "multicast", "security", "i23v5", "printer", "default" ]
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
  }
}
```

### Terraform Import
```json
import {
 to="prismasdwan_appdefs_overrides.my_resource_name"
 id="<resource_id>:appdef_id=<some_appdef_id>"
}
```

