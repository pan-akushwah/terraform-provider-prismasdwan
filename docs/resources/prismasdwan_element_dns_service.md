## Documentation for Prisma SDWAN Resource "element_dns_service"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_dns_service` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/dnsservices/{dnsservice_role_id}` (`DnsService`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/dnsservices` (`DnsService`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/dnsservices/{dnsservice_role_id}` (`DnsService`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/dnsservices/{dnsservice_role_id}` |


### JSON Schema

```json
{
  "properties" : {
    "domains_to_addresses" : {
      "description" : "Domains To Addresses",
      "type" : "array",
      "items" : {
        "properties" : {
          "ipv6_address" : {
            "description" : "Ipv6 Address",
            "format" : "ipv6",
            "type" : "string"
          },
          "ipv4_address" : {
            "description" : "Ipv4 Address",
            "format" : "ipv4",
            "type" : "string"
          },
          "domain_names" : {
            "description" : "Domain Names",
            "type" : "array",
            "uniqueItems" : true,
            "items" : {
              "description" : "Domain Names",
              "type" : "string"
            }
          }
        },
        "required" : [ "ipv6_address", "ipv4_address", "domain_names" ]
      }
    },
    "domains_to_interfaces" : {
      "description" : "Domains To Interfaces",
      "type" : "array",
      "items" : {
        "properties" : {
          "interface_id" : {
            "description" : "Interface Id",
            "minLength" : 1,
            "type" : "string"
          },
          "domain_names" : {
            "description" : "Domain Names",
            "minItems" : 1,
            "type" : "array",
            "uniqueItems" : true,
            "items" : {
              "description" : "Domain Names",
              "type" : "string"
            }
          }
        },
        "required" : [ "interface_id", "domain_names" ]
      }
    },
    "dns_queries_metadata" : {
      "properties" : {
        "add_subnets" : {
          "description" : "Add Subnets",
          "maxItems" : 2,
          "type" : "array",
          "items" : {
            "properties" : {
              "ipv6_prefix_length" : {
                "description" : "Ipv6 Prefix Length",
                "format" : "int32",
                "maximum" : 128,
                "minimum" : 0,
                "type" : "integer"
              },
              "ipv6_address" : {
                "description" : "Ipv6 Address",
                "format" : "ipv6",
                "type" : "string"
              },
              "ipv4_prefix_length" : {
                "description" : "Ipv4 Prefix Length",
                "format" : "int32",
                "maximum" : 32,
                "minimum" : 0,
                "type" : "integer"
              },
              "ipv4_address" : {
                "description" : "Ipv4 Address",
                "format" : "ipv4",
                "type" : "string"
              }
            },
            "required" : [ "ipv6_prefix_length", "ipv6_address", "ipv4_prefix_length", "ipv4_address" ]
          }
        },
        "add_customer_premises_equipment" : {
          "properties" : {
            "identifier_text" : {
              "description" : "Identifier Text",
              "type" : "string"
            },
            "type" : {
              "description" : "Type",
              "type" : "string",
              "enum" : [ "text", "element_id", "element_name" ]
            }
          },
          "required" : [ "identifier_text", "type" ]
        }
      },
      "required" : [ "add_subnets", "add_customer_premises_equipment" ]
    },
    "cache_config" : {
      "properties" : {
        "cache_size" : {
          "description" : "Cache Size",
          "format" : "int32",
          "minimum" : 0,
          "type" : "integer"
        }
      },
      "required" : [ "cache_size" ]
    },
    "max_concurrent_dns_queries" : {
      "description" : "Max Concurrent Dns Queries",
      "format" : "int32",
      "minimum" : 1,
      "type" : "integer"
    },
    "dnsservicerole_bindings" : {
      "description" : "Dnsservicerole Bindings",
      "type" : "array",
      "items" : {
        "properties" : {
          "interfaces" : {
            "description" : "Interfaces",
            "minItems" : 1,
            "type" : "array",
            "items" : {
              "properties" : {
                "interface_ip" : {
                  "description" : "Interface Ip",
                  "type" : "string"
                },
                "interface_id" : {
                  "description" : "Interface Id",
                  "type" : "string"
                }
              },
              "required" : [ "interface_ip", "interface_id" ]
            }
          },
          "dnsservicerole_id" : {
            "description" : "Dnsservicerole Id",
            "type" : "string"
          }
        },
        "required" : [ "interfaces", "dnsservicerole_id" ]
      }
    },
    "dnsservice_profile_id" : {
      "description" : "Dnsservice Profile Id",
      "type" : "string"
    },
    "enabled" : {
      "description" : "Enabled",
      "type" : "boolean"
    },
    "element_id" : {
      "description" : "Element Id",
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "tags" : {
      "description" : "Tags",
      "maxItems" : 10,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Tags",
        "maxLength" : 1024,
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
      "maxLength" : 1024,
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
  "required" : [ "domains_to_addresses", "domains_to_interfaces", "dns_queries_metadata", "cache_config", "max_concurrent_dns_queries", "dnsservicerole_bindings", "dnsservice_profile_id", "enabled", "element_id", "tags", "description", "upperCaseName", "name", "site_id", "region", "disabled_reason", "disabled", "inactive_reason", "inactive", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_dns_service.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

