## Documentation for Prisma SDWAN Resource "nat_policy_rule"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `nat_policy_rule` |
| Get Api  | `/sdwan/v2.0/api/natpolicysets/{nat_policy_set_id}/natpolicyrules/{nat_policy_rule_id}` (`NATPolicyRule`) |
| Post Api  | `/sdwan/v2.0/api/natpolicysets/{nat_policy_set_id}/natpolicyrules` (`NATPolicyRule`) |
| Put Api  | `/sdwan/v2.0/api/natpolicysets/{nat_policy_set_id}/natpolicyrules/{nat_policy_rule_id}` (`NATPolicyRule`) |
| Delete Api  | `/sdwan/v2.0/api/natpolicysets/{nat_policy_set_id}/natpolicyrules/{nat_policy_rule_id}` |


### JSON Schema

```json
{
  "properties" : {
    "enabled" : {
      "description" : "Enabled",
      "type" : "boolean"
    },
    "destination_zone_id" : {
      "description" : "Destination Zone Id",
      "maxLength" : 30,
      "pattern" : "^-?[0-9]{1,30}$",
      "type" : "string"
    },
    "source_zone_id" : {
      "description" : "Source Zone Id",
      "maxLength" : 30,
      "pattern" : "^-?[0-9]{1,30}$",
      "type" : "string"
    },
    "destination_prefixes_id" : {
      "description" : "Destination Prefixes Id",
      "maxLength" : 30,
      "pattern" : "^-?[0-9]{1,30}$",
      "type" : "string"
    },
    "source_prefixes_id" : {
      "description" : "Source Prefixes Id",
      "maxLength" : 30,
      "pattern" : "^-?[0-9]{1,30}$",
      "type" : "string"
    },
    "actions" : {
      "description" : "Actions",
      "maxItems" : 4,
      "minItems" : 1,
      "type" : "array",
      "items" : {
        "properties" : {
          "protocols" : {
            "description" : "Protocols",
            "maxItems" : 4,
            "type" : "array",
            "uniqueItems" : true,
            "items" : {
              "description" : "Protocols",
              "pattern" : "sip|ftp|tftp|pptp",
              "type" : "string"
            }
          },
          "port" : {
            "description" : "Port",
            "maximum" : 65535,
            "minimum" : 1,
            "type" : "integer"
          },
          "nat_pool_id" : {
            "description" : "Nat Pool Id",
            "type" : "string"
          },
          "type" : {
            "description" : "Type",
            "type" : "string",
            "enum" : [ "no_nat", "source_nat_dynamic", "source_nat_static", "destination_nat_dynamic", "destination_nat_static", "alg_disable" ]
          }
        },
        "required" : [ "protocols", "port", "nat_pool_id", "type" ]
      }
    },
    "protocol" : {
      "description" : "Protocol",
      "maximum" : 255,
      "minimum" : 1,
      "type" : "integer"
    },
    "destination_ports" : {
      "description" : "Destination Ports",
      "maxItems" : 16,
      "type" : "array",
      "items" : {
        "properties" : {
          "from" : {
            "description" : "From",
            "maximum" : 65535,
            "minimum" : 1,
            "type" : "integer"
          },
          "to" : {
            "description" : "To",
            "maximum" : 65535,
            "minimum" : 1,
            "type" : "integer"
          }
        },
        "required" : [ "from", "to" ]
      }
    },
    "source_ports" : {
      "description" : "Source Ports",
      "maxItems" : 16,
      "type" : "array",
      "items" : {
        "properties" : {
          "from" : {
            "description" : "From",
            "maximum" : 65535,
            "minimum" : 1,
            "type" : "integer"
          },
          "to" : {
            "description" : "To",
            "maximum" : 65535,
            "minimum" : 1,
            "type" : "integer"
          }
        },
        "required" : [ "from", "to" ]
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
  "required" : [ "enabled", "destination_zone_id", "source_zone_id", "destination_prefixes_id", "source_prefixes_id", "actions", "protocol", "destination_ports", "source_ports", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_nat_policy_rule.my_resource_name"
 id="<resource_id>:nat_policy_set_id=<some_nat_policy_set_id>"
}
```

