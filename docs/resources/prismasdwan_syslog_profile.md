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
    "remote_ca_certificate" : {
      "description" : "Remote Ca Certificate",
      "type" : "string"
    },
    "enable_flow_logging" : {
      "description" : "Enable Flow Logging",
      "type" : "boolean"
    },
    "severity_level" : {
      "description" : "Severity Level: ValidateEnum(enumClass = classOf[SyslogSeverityLevel], error = SYSLOGSERVER_PROFILE_INVALID_SEVERITY_LEVEL: Invalid syslog severity level value.Should be either major, minor or critical, nullAllowed = false) ",
      "type" : "string"
    },
    "protocol" : {
      "description" : "Protocol: ValidateEnum(enumClass = classOf[SyslogProtocol], error = SYSLOGSERVER_PROFILE_INVALID_PROTOCOL: Invalid syslog protocol value. Should be either tcp, udp or tls., nullAllowed = false) ",
      "type" : "string"
    },
    "server_port" : {
      "description" : "Server Port: Min(error = SYSLOGSERVER_PROFILE_INVALID_PORT_RANGE: Invalid port range.Should be between 1-65535, value = 1L) Max(error = SYSLOGSERVER_PROFILE_INVALID_PORT_RANGE: Invalid port range.Should be between 1-65535, value = 65535L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "server_fqdn" : {
      "description" : "Server Fqdn",
      "type" : "string"
    },
    "server_ip" : {
      "description" : "Server Ip: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = SYSLOGSERVER_PROFILE_INVALID_IP: Invalid IP address for syslog server profile, type = IP) ",
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
  "required" : [ "severity_level", "protocol", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_syslog_profile.my_resource_name"
 id="<resource_id>"
}
```

