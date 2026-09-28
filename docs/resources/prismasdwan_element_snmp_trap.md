## Documentation for Prisma SDWAN Resource "element_snmp_trap"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_snmp_trap` |
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
          },
          "required" : [ "enc_phrase", "enc_type", "auth_phrase", "auth_type", "security_level", "engine_id", "user_name" ]
        }
      },
      "required" : [ "user_access" ]
    },
    "v2_config" : {
      "properties" : {
        "community" : {
          "description" : "Community",
          "type" : "string"
        }
      },
      "required" : [ "community" ]
    },
    "source_interface" : {
      "description" : "Source Interface",
      "type" : "string"
    },
    "version" : {
      "description" : "Version",
      "type" : "string",
      "enum" : [ "v2", "v3" ]
    },
    "server_ip" : {
      "description" : "Server Ip",
      "format" : "ipv4",
      "type" : "string"
    },
    "enabled" : {
      "description" : "Enabled",
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
  "required" : [ "v3_config", "v2_config", "source_interface", "version", "server_ip", "enabled", "description", "tags", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_snmp_trap.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

