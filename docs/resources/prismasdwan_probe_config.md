## Documentation for Prisma SDWAN Resource "probe_config"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `probe_config` |
| Get Api  | `/sdwan/v2.1/api/probeconfigs/{config_id}` (`ProbeConfigScreenV2N1`) |
| Post Api  | `/sdwan/v2.1/api/probeconfigs` (`ProbeConfigScreenV2N1`) |
| Put Api  | `/sdwan/v2.1/api/probeconfigs/{config_id}` (`ProbeConfigScreenV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/probeconfigs/{config_id}` |


### JSON Schema

```json
{
  "properties" : {
    "enabled" : {
      "description" : "Enabled",
      "type" : "boolean"
    },
    "endpoints" : {
      "description" : "Endpoints",
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
              "enum" : [ "vpn", "direct", "servicelink", "pa_vpn", "all" ]
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
        },
        "required" : [ "http_response_string", "http_response_codes", "allow_insecure_https_connection", "path_types", "probe_count", "probe_cycle_duration", "protocol", "fqdn", "dns_server_ip", "ipv4_address" ]
      }
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
  "required" : [ "enabled", "endpoints", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_probe_config.my_resource_name"
 id="<resource_id>"
}
```

