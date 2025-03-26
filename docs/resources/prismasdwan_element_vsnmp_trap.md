## Documentation for Prisma SDWAN Resource "element_vsnmp_trap"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_vsnmp_trap` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/snmptraps/{snmptrap_id}` (`SNMPTrap`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/snmptraps` (`SNMPTrap`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/snmptraps/{snmptrap_id}` (`SNMPTrap`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/snmptraps/{snmptrap_id}` |


### JSON Schema

```json
{
  "properties" : {
    "v3_config" : {
      "properties" : {
        "user_access" : {
          "properties" : {
            "enc_phrase" : {
              "description" : "Enc Phrase",
              "type" : "string",
              "additionalProperties" : {
                "properties" : {
                  "x_flag_sensitive" : {
                    "type" : "boolean"
                  }
                }
              }
            },
            "enc_type" : {
              "description" : "Enc Type",
              "type" : "string",
              "enum" : [ "NONE", "AES", "DES" ]
            },
            "auth_phrase" : {
              "description" : "Auth Phrase",
              "type" : "string",
              "additionalProperties" : {
                "properties" : {
                  "x_flag_sensitive" : {
                    "type" : "boolean"
                  }
                }
              }
            },
            "auth_type" : {
              "description" : "Auth Type",
              "type" : "string",
              "enum" : [ "NONE", "MD5", "SHA" ]
            },
            "security_level" : {
              "description" : "Security Level",
              "type" : "string",
              "enum" : [ "NOAUTH", "AUTH", "PRIVATE" ]
            },
            "engine_id" : {
              "description" : "Engine Id",
              "type" : "string"
            },
            "user_name" : {
              "description" : "User Name",
              "type" : "string"
            }
          }
        }
      }
    },
    "v2_config" : {
      "properties" : {
        "community" : {
          "description" : "Community",
          "type" : "string"
        }
      }
    },
    "source_interface" : {
      "description" : "Source Interface",
      "type" : "string"
    },
    "version" : {
      "description" : "Version: ValidateEnum(enumClass = classOf[SNMPVersion], error = SNMPTRAP_CONFIG_INVALID_VERSION: Unsupported snmp version specified, nullAllowed = false) ",
      "type" : "string",
      "enum" : [ "V2", "V3" ]
    },
    "server_ip" : {
      "description" : "Server Ip: NotNull(error = SNMPTRAP_CONFIG_SERVER_IP_MISSING: SNMP Server ip cannot be null) IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, INVALID_IP_ADDRESS_001, type = IP) ",
      "type" : "string"
    },
    "enabled" : {
      "description" : "Enabled",
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
  "required" : [ "version", "server_ip" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_vsnmp_trap.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

