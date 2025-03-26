## Documentation for Prisma SDWAN Resource "user_id_agent"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `user_id_agent` |
| Get Api  | `/sdwan/v2.0/api/useridagents/{id}` (`UserIDAgentScreen`) |
| Post Api  | `/sdwan/v2.0/api/useridagents` (`UserIDAgentScreen`) |
| Put Api  | `/sdwan/v2.0/api/useridagents/{id}` (`UserIDAgentScreen`) |
| Delete Api  | `/sdwan/v2.0/api/useridagents/{id}` |


### JSON Schema

```json
{
  "properties" : {
    "enabled" : {
      "description" : "Enabled",
      "type" : "boolean"
    },
    "authentication" : {
      "properties" : {
        "passphrase" : {
          "description" : "Passphrase: Transient ",
          "type" : "string"
        },
        "local_private_key" : {
          "description" : "Local Private Key: Transient ",
          "type" : "string"
        },
        "local_certificate" : {
          "description" : "Local Certificate: Transient ",
          "type" : "string"
        },
        "remote_ca_certificate" : {
          "description" : "Remote Ca Certificate: Transient ",
          "type" : "string"
        },
        "collector_secret_encrypted" : {
          "description" : "Collector Secret Encrypted",
          "type" : "string",
          "additionalProperties" : {
            "properties" : {
              "x_flag_sensitive" : {
                "type" : "boolean"
              }
            }
          }
        },
        "collector_secret" : {
          "description" : "Collector Secret: Transient ",
          "type" : "string",
          "additionalProperties" : {
            "properties" : {
              "x_flag_sensitive" : {
                "type" : "boolean"
              }
            }
          }
        },
        "collector_name" : {
          "description" : "Collector Name",
          "type" : "string"
        }
      }
    },
    "source_interface" : {
      "description" : "Source Interface",
      "type" : "string"
    },
    "port" : {
      "description" : "Port: NotNull Range(max = 65535L, error = USER_AGENT_INVALID_PORT_RANGE: Invalid port. Must be between 1 - 65535, min = 1L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "server_fqdn" : {
      "description" : "Server Fqdn",
      "type" : "string"
    },
    "server_ip" : {
      "description" : "Server Ip: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = USER_AGENT_INVALID_IP: Invalid IP Address, type = IP) ",
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
    "site_id" : {
      "description" : "Site Id: Transient Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) Digits(fraction = 0, integer = 50, SITEID_INVALID) NotNull ",
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
  "required" : [ "port", "name", "site_id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_user_id_agent.my_resource_name"
 id="<resource_id>"
}
```

