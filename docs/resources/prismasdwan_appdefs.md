## Documentation for Prisma SDWAN Resource "appdefs"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `appdefs` |
| Get Api  | `/sdwan/v2.6/api/appdefs/{appdef_id}` (`AppDefScreenV2N5`) |
| Post Api  | `/sdwan/v2.6/api/appdefs` (`AppDefScreenV2N5`) |
| Put Api  | `/sdwan/v2.6/api/appdefs/{appdef_id}` (`AppDefScreenV2N5`) |
| Delete Api  | `/sdwan/v2.6/api/appdefs/{appdef_id}` |


### JSON Schema

```json
{
  "properties" : {
    "p_parent_id" : {
      "description" : "P Parent Id",
      "type" : "string"
    },
    "supported_engines" : {
      "description" : "Supported Engines: ValidateEnum(enumClass = classOf[SupportedEngines], error = APPDEF_CONFIG_INVALID_CATEGORY: Application category is invalid., nullAllowed = true) ",
      "type" : "string",
      "enum" : [ "ave", "ave-all", "panos", "all", "panos-ml7" ]
    },
    "p_sub_category" : {
      "description" : "P Sub Category: ValidateEnum(enumClass = classOf[PAppSubCategory], error = APPDEF_CONFIG_INVALID_CATEGORY: Application category is invalid., nullAllowed = true) ",
      "type" : "string"
    },
    "p_category" : {
      "description" : "P Category: ValidateEnum(enumClass = classOf[PAppCategory], error = APPDEF_CONFIG_INVALID_CATEGORY: Application category is invalid., nullAllowed = true) ",
      "type" : "string"
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
    "system_app_overridden" : {
      "description" : "System App Overridden",
      "type" : "boolean"
    },
    "overrides_allowed" : {
      "description" : "Overrides Allowed",
      "type" : "boolean"
    },
    "order_number" : {
      "description" : "Order Number: Range(max = 65535L, error = APPDEF_CONFIG_INVALID_ORDER_NUMBER: Order number should be between 1-65535, min = 1L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "aggregate_flows" : {
      "description" : "Aggregate Flows",
      "type" : "boolean"
    },
    "session_timeout" : {
      "description" : "Session Timeout: Range(max = 44000L, error = APPDEF_CONFIG_INVALID_SESSION_TIMEOUT: Application session timeout should be in between 0-44000, min = 0L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "category" : {
      "description" : "Category: ValidateEnum(enumClass = classOf[AppCategory], error = APPDEF_CONFIG_INVALID_CATEGORY: Application category is invalid., nullAllowed = true) ",
      "type" : "string",
      "enum" : [ "anonymity", "anti-virus", "auth", "backup", "cad", "collaboration", "conference", "crm", "db-mgmt", "email", "enterprise", "file-sharing", "file-system", "file-transfer", "gaming", "intercomm", "logging", "management", "messaging", "net-discovery", "net-mgmt", "net-monitor", "news-server", "notification", "p2p", "printing", "proxy", "recreational", "remote-desk", "remote-mgmt", "replication", "routing", "saas", "secure-browsing", "storage", "streaming", "tunnel", "utility", "voip", "wan-opt", "web-browsing", "wireless-mgmt", "ip-protocol", "multicast", "security", "i23v5", "printer", "default" ]
    },
    "app_type" : {
      "description" : "App Type: ValidateString(allowNull = false, error = APPDEF_CONFIG_INVALID_TYPE: Only Custom app allowed to create/update., values = [custom]) ",
      "type" : "string"
    },
    "transfer_type" : {
      "description" : "Transfer Type: ValidateString(allowNull = false, error = APPDEF_CONFIG_INVALID_TRANSFER_TYPE: Application transfer type is invalid. Only transactional, bulk, rt-audio, rt-video is allowed., values = [transactional, bulk, rt-audio, rt-video]) ",
      "type" : "string"
    },
    "ip_rules" : {
      "description" : "Ip Rules: Valid Size(max = 16, error = APPDEF_CONFIG_MAX_SIZE_EXCEED: Allowed max size is 16 for each of them - tcp_rules, ip_rules and udp_rules., min = 0) ",
      "type" : "array",
      "items" : {
        "type" : "object"
      }
    },
    "udp_rules" : {
      "description" : "Udp Rules: Valid Size(max = 16, error = APPDEF_CONFIG_MAX_SIZE_EXCEED: Allowed max size is 16 for each of them - tcp_rules, ip_rules and udp_rules., min = 0) ",
      "type" : "array",
      "items" : {
        "type" : "object"
      }
    },
    "tcp_rules" : {
      "description" : "Tcp Rules: Valid Size(max = 16, error = APPDEF_CONFIG_MAX_SIZE_EXCEED: Allowed max size is 16 for each of them - tcp_rules, ip_rules and udp_rules., min = 0) ",
      "type" : "array",
      "items" : {
        "type" : "string"
      }
    },
    "domains" : {
      "description" : "Domains: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 256, listMaxSize = 16, error = APPDEF_CONFIG_INVALID_DOMAIN_LIST: Application domain list is invalid. Maximum 16 valid domains are allowed and each domain should not exceed 253 characters., noTrim = false, regex = (?=^.{4,253}$)((^((?!-)[a-zA-Z0-9-]{1,63}(?<!-)))|(^((?!-)[a-zA-Z0-9-]{1,63}(?<!-)\\\\.)+)([a-zA-Z]{2,63}))([:])?([0-9]{1,4}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])?$, required = false) ",
      "type" : "array",
      "items" : {
        "description" : "Domains",
        "type" : "string"
      }
    },
    "abbreviation" : {
      "description" : "Abbreviation: Size(max = 5, error = APPDEF_CONFIG_INVALID_ABBREVIATION: Abbreviation must not exceed 5 characters., min = 0) ",
      "type" : "string"
    },
    "display_name" : {
      "description" : "Display Name: NotBlank(error = APPDEF_CONFIG_INVALID_DISPLAYNAME: Application display name is required and cannot be null.) Size(max = 64, error = APPDEF_CONFIG_INVALID_DISPLAYNAME: Application display name is required and cannot be null., min = 0) ",
      "type" : "string"
    },
    "conn_idle_timeout" : {
      "description" : "Conn Idle Timeout: DecimalMin(inclusive = true, error = APPDEF_CONFIG_INVALID_TIMEOUT: Application connection timeout should be in between 0-44000, value = 0) DecimalMax(inclusive = true, error = APPDEF_CONFIG_INVALID_TIMEOUT: Application connection timeout should be in between 0-44000, value = 44000) ",
      "format" : "int32",
      "type" : "integer"
    },
    "ingress_traffic_pct" : {
      "description" : "Ingress Traffic Pct: Required(message = required) DecimalMin(inclusive = true, error = APPDEF_CONFIG_INVALID_INGRESS: Application ingress traffic percentage should be in between 1-99, value = 1) DecimalMax(inclusive = true, error = APPDEF_CONFIG_INVALID_INGRESS: Application ingress traffic percentage should be in between 1-99, value = 99) ",
      "format" : "int32",
      "type" : "integer"
    },
    "path_affinity" : {
      "description" : "Path Affinity: ValidateEnum(enumClass = classOf[PathAffinity], error = APPDEF_CONFIG_INVALID_PATHAFFINITY: Application path affinity is invalid. Only none, weak, strict is allowed., nullAllowed = false) ",
      "type" : "string",
      "enum" : [ "none", "weak", "strict" ]
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
  "required" : [ "app_type", "transfer_type", "display_name", "ingress_traffic_pct", "path_affinity" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_appdefs.my_resource_name"
 id="<resource_id>"
}
```

