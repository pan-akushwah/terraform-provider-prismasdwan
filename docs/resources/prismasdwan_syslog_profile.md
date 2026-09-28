## Documentation for Prisma SDWAN Resource "syslog_profile"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `syslog_profile` |
| Get Api  | `/sdwan/v2.1/api/syslogserverprofiles/{profile_id}` (`SyslogServerProfileScreenV2N1`) |
| Post Api  | `/sdwan/v2.1/api/syslogserverprofiles` (`SyslogServerProfileScreenV2N1`) |
| Put Api  | `/sdwan/v2.1/api/syslogserverprofiles/{profile_id}` (`SyslogServerProfileScreenV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/syslogserverprofiles/{profile_id}` |


### JSON Schema

```json
{
  "properties" : {
    "enable_url_logging" : {
      "description" : "Enable Url Logging",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "enable_dns_logging" : {
      "description" : "Enable Dns Logging",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "enable_threat_logging" : {
      "description" : "Enable Threat Logging",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "remote_ca_certificate" : {
      "description" : "Remote Ca Certificate",
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "enable_flow_logging" : {
      "description" : "Enable Flow Logging",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "severity_level" : {
      "description" : "Severity Level",
      "type" : "string",
      "enum" : [ "major", "minor", "critical" ]
    },
    "protocol" : {
      "description" : "Protocol",
      "type" : "string",
      "enum" : [ "tcp", "udp", "tls" ]
    },
    "server_port" : {
      "description" : "Server Port",
      "format" : "int32",
      "maximum" : 65535,
      "minimum" : 1,
      "type" : "integer"
    },
    "server_fqdn" : {
      "description" : "Server Fqdn",
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
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
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
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
  "required" : [ "enable_url_logging", "enable_dns_logging", "enable_threat_logging", "remote_ca_certificate", "enable_flow_logging", "severity_level", "protocol", "server_port", "server_fqdn", "server_ip", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_syslog_profile.my_resource_name"
 id="<resource_id>"
}
```

