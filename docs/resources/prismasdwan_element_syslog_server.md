## Documentation for Prisma SDWAN Resource "element_syslog_server"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_syslog_server` |
| Get Api  | `/sdwan/v2.2/api/sites/{site_id}/elements/{element_id}/syslogservers/{syslogserver_id}` (`SyslogServerScreenV2N2`) |
| Post Api  | `/sdwan/v2.2/api/sites/{site_id}/elements/{element_id}/syslogservers` (`SyslogServerScreenV2N2`) |
| Put Api  | `/sdwan/v2.2/api/sites/{site_id}/elements/{element_id}/syslogservers/{syslogserver_id}` (`SyslogServerScreenV2N2`) |
| Delete Api  | `/sdwan/v2.2/api/sites/{site_id}/elements/{element_id}/syslogservers/{syslogserver_id}` |


### JSON Schema

```json
{
  "properties" : {
    "enable_flow_logging" : {
      "description" : "Enable Flow Logging",
      "type" : "boolean"
    },
    "remote_ca_certificate" : {
      "description" : "Remote Ca Certificate",
      "type" : "string"
    },
    "syslog_profile_id" : {
      "description" : "Syslog Profile Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
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
      "description" : "Server Port: Range(max = 65535L, error = SYSLOGSERVER_CONFIG_INVALID_RANGE: Invalid port range.Should be between 1-65535., min = 1L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "server_ip" : {
      "description" : "Server Ip: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = SYSLOGSERVER_CONFIG_INVALID_IP: Invalid IP address for syslog server, type = IP) ",
      "type" : "string"
    },
    "tags" : {
      "description" : "Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 1024, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\\\s]+, required = false) ",
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
      "description" : "Description: Size(max = 1024, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Required(error = NAME_REQD: Please provide resource name.) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
      "type" : "string"
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
  "required" : [ "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_syslog_server.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

