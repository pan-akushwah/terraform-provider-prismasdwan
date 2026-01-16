## Documentation for Prisma SDWAN Resource "element_snmp_agent"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_snmp_agent` |
| Get Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/snmpagents/{snmpagent_id}` (`SNMPAgentV2N1`) |
| Post Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/snmpagents` (`SNMPAgentV2N1`) |
| Put Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/snmpagents/{snmpagent_id}` (`SNMPAgentV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/snmpagents/{snmpagent_id}` |


### JSON Schema

```json
{
  "properties" : {
    "system_location" : {
      "description" : "System Location",
      "type" : "string"
    },
    "system_contact" : {
      "description" : "System Contact",
      "type" : "string"
    },
    "v3_config" : {
      "properties" : {
        "users_access" : {
          "description" : "Users Access",
          "type" : "array",
          "items" : {
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
        },
        "enabled" : {
          "description" : "Enabled",
          "type" : "boolean"
        }
      }
    },
    "v2_config" : {
      "properties" : {
        "community" : {
          "description" : "Community",
          "type" : "string"
        },
        "enabled" : {
          "description" : "Enabled",
          "type" : "boolean"
        }
      }
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
  }
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_snmp_agent.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

