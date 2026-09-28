## Documentation for Prisma SDWAN Resource "service_endpoint"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `service_endpoint` |
| Get Api  | `/sdwan/v3.1/api/serviceendpoints/{service_endpoint_id}` (`ServiceEndpointV3N1`) |
| Post Api  | `/sdwan/v3.1/api/serviceendpoints` (`ServiceEndpointV3N1`) |
| Put Api  | `/sdwan/v3.1/api/serviceendpoints/{service_endpoint_id}` (`ServiceEndpointV3N1`) |
| Delete Api  | `/sdwan/v3.1/api/serviceendpoints/{service_endpoint_id}` |


### JSON Schema

```json
{
  "properties" : {
    "liveliness_probe" : {
      "properties" : {
        "use_tunnel_for_url_dns_resolution" : {
          "description" : "Use Tunnel For Url Dns Resolution",
          "type" : "boolean"
        },
        "http" : {
          "description" : "Http",
          "type" : "array",
          "items" : {
            "properties" : {
              "http_status_codes" : {
                "description" : "Http Status Codes",
                "maxItems" : 8,
                "type" : "array",
                "uniqueItems" : true,
                "items" : {
                  "description" : "Http Status Codes",
                  "maximum" : 600,
                  "minimum" : 100,
                  "type" : "integer"
                }
              },
              "failure_count" : {
                "description" : "Failure Count",
                "maximum" : 300,
                "minimum" : 3,
                "type" : "integer"
              },
              "interval" : {
                "description" : "Interval",
                "maximum" : 3600,
                "minimum" : 10,
                "type" : "integer"
              },
              "url" : {
                "description" : "Url",
                "maxLength" : 1024,
                "type" : "string"
              }
            },
            "required" : [ "http_status_codes", "failure_count", "interval", "url" ]
          }
        },
        "icmp_ping" : {
          "description" : "Icmp Ping",
          "type" : "array",
          "items" : {
            "properties" : {
              "failure_count" : {
                "description" : "Failure Count",
                "maximum" : 300,
                "minimum" : 3,
                "type" : "integer"
              },
              "interval" : {
                "description" : "Interval",
                "maximum" : 30,
                "minimum" : 1,
                "type" : "integer"
              },
              "ip_addresses" : {
                "description" : "Ip Addresses",
                "maxItems" : 8,
                "type" : "array",
                "items" : {
                  "description" : "Ip Addresses",
                  "format" : "ipv4",
                  "type" : "string"
                }
              }
            },
            "required" : [ "failure_count", "interval", "ip_addresses" ]
          }
        }
      },
      "required" : [ "use_tunnel_for_url_dns_resolution", "http", "icmp_ping" ]
    },
    "sase_properties" : {
      "properties" : {
        "lqm_enabled" : {
          "description" : "Lqm Enabled",
          "type" : "boolean"
        },
        "active" : {
          "description" : "Active",
          "type" : "boolean"
        }
      },
      "required" : [ "lqm_enabled", "active" ]
    },
    "is_sase" : {
      "description" : "Is Sase",
      "type" : "boolean"
    },
    "disable_tunnel_reoptimization" : {
      "description" : "Disable Tunnel Reoptimization",
      "type" : "boolean"
    },
    "location" : {
      "properties" : {
        "description" : {
          "description" : "Description",
          "type" : "string"
        },
        "latitude" : {
          "description" : "Latitude",
          "format" : "float",
          "maximum" : 90,
          "minimum" : -90,
          "type" : "number"
        },
        "longitude" : {
          "description" : "Longitude",
          "format" : "float",
          "maximum" : 180,
          "minimum" : -180,
          "type" : "number"
        }
      },
      "required" : [ "description", "latitude", "longitude" ]
    },
    "address" : {
      "properties" : {
        "country" : {
          "description" : "Country",
          "maxLength" : 100,
          "type" : "string"
        },
        "post_code" : {
          "description" : "Post Code",
          "maxLength" : 100,
          "type" : "string"
        },
        "state" : {
          "description" : "State",
          "maxLength" : 100,
          "type" : "string"
        },
        "city" : {
          "description" : "City",
          "maxLength" : 100,
          "type" : "string"
        },
        "street2" : {
          "description" : "Street2",
          "maxLength" : 100,
          "type" : "string"
        },
        "street" : {
          "description" : "Street",
          "maxLength" : 100,
          "type" : "string"
        }
      },
      "required" : [ "city", "country", "street2", "state", "street", "post_code" ]
    },
    "allow_enterprise_traffic" : {
      "description" : "Allow Enterprise Traffic",
      "type" : "boolean"
    },
    "service_link_peers" : {
      "properties" : {
        "hostnames" : {
          "description" : "Hostnames",
          "maxItems" : 128,
          "type" : "array",
          "items" : {
            "description" : "Hostnames",
            "type" : "string"
          }
        },
        "ip_addresses" : {
          "description" : "Ip Addresses",
          "maxItems" : 128,
          "type" : "array",
          "items" : {
            "description" : "Ip Addresses",
            "format" : "ipv4",
            "type" : "string"
          }
        }
      },
      "required" : [ "hostnames", "ip_addresses" ]
    },
    "site_id" : {
      "description" : "Site Id",
      "type" : "string"
    },
    "admin_up" : {
      "description" : "Admin Up",
      "type" : "boolean"
    },
    "type" : {
      "description" : "Type",
      "type" : "string",
      "enum" : [ "cg-transit", "non-cg-transit", "sase" ]
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
  "required" : [ "liveliness_probe", "sase_properties", "is_sase", "disable_tunnel_reoptimization", "location", "address", "allow_enterprise_traffic", "service_link_peers", "site_id", "admin_up", "type", "description", "name", "tags", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_service_endpoint.my_resource_name"
 id="<resource_id>"
}
```

