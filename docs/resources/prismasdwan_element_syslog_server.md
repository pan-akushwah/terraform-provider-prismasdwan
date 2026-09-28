## Documentation for Prisma SDWAN Resource "element_syslog_server"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_syslog_server` |
| Get Api  | `/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/syslogservers/{syslogserver_id}` (`SyslogServerScreenV2N3`) |
| Post Api  | `/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/syslogservers` (`SyslogServerScreenV2N3`) |
| Put Api  | `/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/syslogservers/{syslogserver_id}` (`SyslogServerScreenV2N3`) |
| Delete Api  | `/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/syslogservers/{syslogserver_id}` |


### JSON Schema

```json
{
  "properties" : {
    "enable_url_logging" : {
      "description" : "Enable Url Logging",
      "type" : "boolean"
    },
    "enable_dns_logging" : {
      "description" : "Enable Dns Logging",
      "type" : "boolean"
    },
    "enable_threat_logging" : {
      "description" : "Enable Threat Logging",
      "type" : "boolean"
    },
    "enable_flow_logging" : {
      "description" : "Enable Flow Logging",
      "type" : "boolean"
    },
    "remote_ca_certificate" : {
      "description" : "Remote Ca Certificate",
      "type" : "string"
    },
    "syslog_profile_id" : {
      "description" : "Syslog Profile Id",
      "type" : "string"
    },
    "server_fqdn" : {
      "description" : "Server Fqdn",
      "type" : "string"
    },
    "severity_level" : {
      "description" : "Severity Level",
      "type" : "string"
    },
    "source_interface" : {
      "description" : "Source Interface",
      "type" : "string"
    },
    "enabled" : {
      "description" : "Enabled",
      "type" : "boolean"
    },
    "protocol" : {
      "description" : "Protocol",
      "type" : "string"
    },
    "server_port" : {
      "description" : "Server Port",
      "format" : "int32",
      "maximum" : 65535,
      "minimum" : 1,
      "type" : "integer"
    },
    "server_ip" : {
      "description" : "Server Ip",
      "format" : "ipv4",
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
  "required" : [ "enable_url_logging", "enable_dns_logging", "enable_threat_logging", "enable_flow_logging", "remote_ca_certificate", "syslog_profile_id", "server_fqdn", "severity_level", "source_interface", "enabled", "protocol", "server_port", "server_ip", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_syslog_server.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

