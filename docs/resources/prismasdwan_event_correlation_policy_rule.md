## Documentation for Prisma SDWAN Resource "event_correlation_policy_rule"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `event_correlation_policy_rule` |
| Get Api  | `/sdwan/v2.1/api/eventcorrelationpolicysets/{policy_set_id}/eventcorrelationpolicyrules/{policy_rule_id}` (`EventCorrelationPolicyRuleScreenV2N1`) |
| Post Api  | `/sdwan/v2.1/api/eventcorrelationpolicysets/{policy_set_id}/eventcorrelationpolicyrules` (`EventCorrelationPolicyRuleScreenV2N1`) |
| Put Api  | `/sdwan/v2.1/api/eventcorrelationpolicysets/{policy_set_id}/eventcorrelationpolicyrules/{policy_rule_id}` (`EventCorrelationPolicyRuleScreenV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/eventcorrelationpolicysets/{policy_set_id}/eventcorrelationpolicyrules/{policy_rule_id}` |


### JSON Schema

```json
{
  "properties" : {
    "dampening_duration" : {
      "description" : "Dampening Duration",
      "maximum" : 10080,
      "minimum" : 5,
      "type" : "integer"
    },
    "escalation_rules" : {
      "properties" : {
        "flap_rule" : {
          "properties" : {
            "flap_duration" : {
              "description" : "Flap Duration",
              "maximum" : 10080,
              "minimum" : 5,
              "type" : "integer"
            },
            "flap_rate" : {
              "description" : "Flap Rate",
              "maximum" : 512,
              "minimum" : 2,
              "type" : "integer"
            }
          },
          "required" : [ "flap_duration", "flap_rate" ]
        },
        "standing_rule" : {
          "properties" : {
            "priority" : {
              "description" : "Priority",
              "type" : "string",
              "enum" : [ "p1", "p2", "p3", "p4", "p5", "none" ]
            },
            "standing_for" : {
              "description" : "Standing For",
              "maximum" : 10080,
              "minimum" : 5,
              "type" : "integer"
            }
          },
          "required" : [ "priority", "standing_for" ]
        }
      },
      "required" : [ "flap_rule", "standing_rule" ]
    },
    "enabled" : {
      "description" : "Enabled",
      "type" : "boolean"
    },
    "priority" : {
      "description" : "Priority",
      "type" : "string",
      "enum" : [ "p1", "p2", "p3", "p4", "p5", "none" ]
    },
    "suppress" : {
      "description" : "Suppress",
      "type" : "string",
      "enum" : [ "yes", "no", "none" ]
    },
    "event_codes" : {
      "description" : "Event Codes",
      "type" : "array",
      "items" : {
        "description" : "Event Codes",
        "type" : "string",
        "enum" : [ "DEVICEHW_POWER_LOST", "DEVICEHW_INTERFACE_DOWN", "DEVICEHW_INTERFACE_HALFDUPLEX", "DEVICEHW_INTERFACE_ERRORS", "DEVICEHW_DISKUTIL_PARTITIONSPACE", "DEVICEHW_DISKENC_SYSTEM", "DEVICEHW_MEMUTIL_SWAPSPACE", "DEVICESW_GENERAL_PROCESSRESTART", "DEVICESW_GENERAL_PROCESSSTOP", "DEVICESW_CRITICAL_PROCESSRESTART", "DEVICESW_CRITICAL_PROCESSSTOP", "DEVICESW_LICENSE_VERIFICATION_FAILED", "DEVICESW_MONITOR_DISABLED", "DEVICESW_SYSTEM_BOOT", "DEVICESW_TOKEN_VERIFICATION_FAILED", "DEVICESW_IMAGE_UNSUPPORTED", "DEVICESW_DHCPSERVER_RESTART", "DEVICESW_DHCPRELAY_RESTART", "DEVICESW_DHCPSERVER_ERRORS", "DEVICESW_SNMP_AGENT_RESTART", "DEVICESW_SNMP_AGENT_FAILED_TO_START", "DEVICESW_SYSLOGSERVERS_DOWN", "DEVICESW_NTP_NO_SYNC", "DEVICEIF_ADDRESS_DUPLICATE", "DEVICEIF_IPV6_ADDRESS_DUPLICATE", "NETWORK_VPNLINK_DOWN", "NETWORK_VPNPEER_UNAVAILABLE", "NETWORK_VPNPEER_UNREACHABLE", "NETWORK_VPNSS_MISMATCH", "NETWORK_VPNSS_UNAVAILABLE", "NETWORK_VPNBFD_DOWN", "NETWORK_VPNLINKCIPHERS_INCOMPATIBLE", "NETWORK_DIRECTPRIVATE_DOWN", "NETWORK_DIRECTINTERNET_DOWN", "NETWORK_PRIVATEWAN_UNREACHABLE", "NETWORK_PRIVATEWAN_DEGRADED", "PEERING_EDGE_DOWN", "PEERING_CORE_DOWN", "PEERING_BGP_DOWN", "APPLICATION_APP_UNREACHABLE", "APPLICATION_IP_COLLISION", "APPLICATION_UNKNOWNS_HIGH", "APPLICATION_FLOWCTRL_APPUNREACHABLE", "APPLICATION_FLOWCTRL_APPREACHABLE", "APPLICATION_FLOWCTRL_APPWITHINSLA", "APPLICATION_FLOWCTRL_APPOUTSIDESLA", "OPERATOR_SIGNUP_TOKEN_DISABLED", "DEVICESW_FPS_LIMIT_EXCEEDED", "DEVICESW_CONCURRENT_FLOW_SOFTLIMIT_EXCEEDED", "DEVICESW_CONCURRENT_FLOWLIMIT_EXCEEDED", "SITE_CIRCUIT_ABSENT_FOR_POLICY", "NETWORK_POLICY_RULE_CONFLICT", "PRIORITY_POLICY_RULE_CONFLICT", "APPLICATION_CUSTOM_RULE_CONFLICT", "NETWORK_POLICY_RULE_DROPPED", "PRIORITY_POLICY_RULE_DROPPED", "DEVICESW_DISCONNECTED_FROM_CONTROLLER", "DEVICESW_USERIDAGENTS_DOWN", "SPOKEHA_STATE_UPDATE", "SPOKEHA_MULTIPLE_ACTIVE_DEVICES", "SPOKEHA_CLUSTER_DEGRADED", "SPOKEHA_CLUSTER_DOWN", "NAT_POLICY_LEGACY_ALG_CONFIG_OVERRIDE", "NAT_POLICY_STATIC_NATPOOL_OVERRUN", "DEVICESW_CONNTRACK_FLOWLIMIT_EXCEEDED", "DEVICESW_INITIATED_CONNECTION_ON_EXCLUDED_PATH", "NETWORK_ANYNETLINK_DEGRADED", "NETWORK_ANYNETLINK_DOWN", "CLAIMCERT_RENEWAL_RETRY_LIMIT_EXCEEDED", "CLAIMCERT_RENEWAL_FAILED", "CLAIMCERT_AUTO_RENEWAL_DISABLED", "CLAIMCERT_RENEWALS_TOO_FREQUENT", "FLAP_RATE_EXCEEDED", "DEVICESW_ANALYTICS_DISCONNECTED_FROM_CONTROLLER", "DEVICESW_FLOWS_DISCONNECTED_FROM_CONTROLLER", "APPLICATION_PROBE_DISABLED", "SITE_CONNECTIVITY_DOWN", "NETWORK_STANDARD_VPN_ENDPOINT_DOWN", "SECURITY_POLICY_RULE_INCOMPLETE", "SITE_NETWORK_SERVICE_ABSENT_FOR_POLICY", "DEVICESW_IPFIX_COLLECTORS_DOWN", "SITE_CONNECTIVITY_DEGRADED", "CLAIMCERT_EXPIRY_WARNING", "DEVICE_CELLULAR_ROAMING", "DEVICE_CELLULAR_SIM_REMOVAL", "DEVICE_CELLULAR_SIM_SWITCHOVER", "DEVICE_CELLULAR_SIGNAL_STRENGTH_THRESH", "DEVICE_CELLULAR_INTERNAL_MODEM_ERROR", "DEVICE_CELLULAR_TECH_CHANGE", "DEVICE_CELLULAR_SIM_PIN_ERROR", "DEVICE_CELLULAR_SIM_PUK_NEEDED", "DEVICE_CELLULAR_MODEM_TEMP_HIGH", "DEVICE_CELLULAR_MTU_MISMATCH", "DEVICE_CELLULAR_MODEM_DETECTION_ERROR", "DEVICE_CELLULAR_SIM_SECURITY_ERROR", "DEVICE_CELLULAR_FIRMWARE_NOT_AVAILABLE", "DEVICE_CELLULAR_MODEM_GPS_DC_BIOS_FAULT", "DEVICEHW_ION9000X722FW_OUTOFDATE", "DEVICESW_APPDEF_SIGFILE_MISMATCH", "SECURITY_POLICY_LIMITS_EXCEEDED", "SASE_SERVICEENDPOINT_BANDWIDTH_LIMIT_EXCEEDED", "SASE_SERVICEENDPOINT_BANDWIDTH_SOFT_LIMIT_EXCEEDED", "VION_BANDWIDTH_LIMIT_EXCEEDED", "VION_BANDWIDTH_SOFT_LIMIT_EXCEEDED", "SPN_BANDWIDTH_LIMIT_EXCEEDED", "SPN_BANDWIDTH_SOFT_LIMIT_EXCEEDED", "DEVICE_POE_PORT_POWER_STATUS", "DEVICE_POE_PORT_POWER_OVER_THRESHOLD", "DEVICE_POE_MAIN_POWER_OVER_THRESHOLD", "DEVICE_POE_MAIN_POWER_FAULT", "DOT1X_RADIUS_SERVER_UNREACHABLE", "DOT1X_DYNAMIC_VLAN_NOT_CONFIGURED", "DOT1X_CLIENT_AUTH_FAIL", "HUB_CLUSTER_SITE_COUNT_THRESHOLD_EXCEEDED", "DEVICEHW_DISKUTIL_FRUSSD", "DEVICEHW_TEMPERATURE_SENSOR", "USER_ID_DIRECTORY_SYNC_FAILED", "USER_ID_HUB_SELECTION_FAILED", "CUID_SYNC_FAILED", "DEVICE_POE_SHUT_CPU_TEMP_OVER_THRESHOLD", "DEVICESW_INTERFACE_CONFIG_OUTOFSYNC", "DEVICE_CELLULAR_INTERFACE_CONFIG_OUTOFSYNC", "DEVICE_CELLULAR_MODULE_CONFIG_OUTOFSYNC", "CARRIER_PERFORMANCE_DEGRADED", "CIRCUIT_PERFORMANCE_DEGRADED", "APPLICATION_PERFORMANCE_DEGRADED", "DEVICE_ID_HUB_SELECTION_FAILED", "NETWORK_VPNKEK_UNAVAILABLE", "DEVICEHW_FAN_LOST", "DEVICESW_MFGCERT_RENEWAL_FAILED", "DEVICESW_MFGCERT_EXPIRY_WARNING", "DEVICEHW_POWER_MISSING", "SYSTEM_CIRCUIT_UTILIZATION_THRESHOLD_EXCEEDED", "SYSTEM_CPU_THRESHOLD_EXCEEDED", "SYSTEM_MEMORY_THRESHOLD_EXCEEDED", "SYSTEM_DISK_THRESHOLD_EXCEEDED", "SYSTEM_CONCURRENT_FLOW_THRESHOLD_EXCEEDED", "DEVICESW_MCTD_INITIALIZATION_FAILURE", "DEVICESW_MCTD_CONTENT_LOAD_FAILURE", "DEVICESW_MCTD_LOG_BUFFER_FULL", "DEVICESW_URLCLOUDSERVER_DOWN", "DEVICESW_DNSSECCLOUDSERVER_DOWN", "DEVICESW_SLSCONNECTION_DOWN", "ALL_INCIDENTS", "ALL_ALERTS", "DEVICESW_TACACS_SERVERS_DOWN", "BRANCH_GATEWAY_CLUSTER_SITE_COUNT_THRESHOLD_EXCEEDED", "FLOW_LIMIT_PER_SOURCE_EXCEEDED", "SECURITY_POLICY_RULES_FAILED", "NPNSPN_INSUFFICIENT_VALID_GENEVE_KEYS", "INCONSISTENT_IPSEC_TUNNEL_HA_STATE", "NPN_MP_CPU_HIGH" ]
      }
    },
    "end_time" : {
      "description" : "End Time",
      "format" : "int64",
      "type" : "integer"
    },
    "start_time" : {
      "description" : "Start Time",
      "format" : "int64",
      "type" : "integer"
    },
    "resource_ids" : {
      "description" : "Resource Ids",
      "maxItems" : 2000,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Resource Ids",
        "pattern" : "[0-9]{1,20}",
        "type" : "string"
      }
    },
    "sub_resource_type" : {
      "description" : "Sub Resource Type",
      "type" : "string",
      "enum" : [ "spoke", "hub", "public", "private" ]
    },
    "resource_type" : {
      "description" : "Resource Type",
      "type" : "string",
      "enum" : [ "site", "element", "anynetlink", "bgppeer", "interface", "waninterface", "wannetwork", "networkpolicyset", "prioritypolicyset", "natpolicyset", "securitypolicyset", "appdef", "serviceendpoint", "cellular_module", "hubcluster", "useridagent", "directoryservice", "cuid", "deviceidconfig", "machine", "spokecluster", "user_id" ]
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
  "required" : [ "dampening_duration", "escalation_rules", "enabled", "priority", "suppress", "event_codes", "end_time", "start_time", "resource_ids", "sub_resource_type", "resource_type", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_event_correlation_policy_rule.my_resource_name"
 id="<resource_id>:policy_set_id=<some_policy_set_id>"
}
```

