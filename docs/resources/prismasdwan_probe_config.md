## Documentation for Prisma SDWAN Resource "probe_config"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `probe_config` |
| Get Api  | `/sdwan/v2.0/api/probeconfigs/{config_id}` (`ProbeConfigScreen`) |
| Post Api  | `/sdwan/v2.0/api/probeconfigs` (`ProbeConfigScreen`) |
| Put Api  | `/sdwan/v2.0/api/probeconfigs/{config_id}` (`ProbeConfigScreen`) |
| Delete Api  | `/sdwan/v2.0/api/probeconfigs/{config_id}` |


### JSON Schema

```json
{
  "properties" : {
    "enabled" : {
      "description" : "Enabled",
      "type" : "boolean"
    },
    "endpoints" : {
      "description" : "Endpoints: Required(error = PROBE_ENDPOINTS_REQUIRED: Probe endpoint configuration is required) Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "http_response_string" : {
            "description" : "Http Response String",
            "type" : "string"
          },
          "http_response_codes" : {
            "description" : "Http Response Codes",
            "type" : "array",
            "items" : {
              "description" : "Http Response Codes",
              "type" : "integer"
            },
            "additionalProperties" : {
              "properties" : {
                "x_flag_computed" : {
                  "type" : "boolean"
                },
                "x_flag_null_if_empty" : {
                  "type" : "boolean"
                }
              }
            }
          },
          "allow_insecure_https_connection" : {
            "description" : "Allow Insecure Https Connection",
            "type" : "boolean"
          },
          "path_types" : {
            "description" : "Path Types",
            "type" : "array",
            "items" : {
              "description" : "Path Types",
              "type" : "string",
              "enum" : [ "vpn", "direct", "servicelink", "all" ]
            }
          },
          "probe_count" : {
            "description" : "Probe Count",
            "format" : "int32",
            "type" : "integer"
          },
          "probe_cycle_duration" : {
            "description" : "Probe Cycle Duration",
            "format" : "int32",
            "type" : "integer"
          },
          "protocol" : {
            "description" : "Protocol",
            "type" : "string",
            "enum" : [ "http", "https", "icmp", "dns" ]
          },
          "fqdn" : {
            "description" : "Fqdn",
            "type" : "string"
          },
          "dns_server_ip" : {
            "description" : "Dns Server Ip",
            "type" : "string"
          },
          "ipv4_address" : {
            "description" : "Ipv4 Address",
            "type" : "string"
          }
        }
      }
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
  "required" : [ "endpoints", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_probe_config.my_resource_name"
 id="<resource_id>"
}
```

