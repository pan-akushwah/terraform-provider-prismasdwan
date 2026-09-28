## Documentation for Prisma SDWAN Resource "event_correlation_policy_set"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `event_correlation_policy_set` |
| Get Api  | `/sdwan/v2.0/api/eventcorrelationpolicysets/{policy_set_id}` (`EventCorrelationPolicySetScreen`) |
| Post Api  | `/sdwan/v2.0/api/eventcorrelationpolicysets` (`EventCorrelationPolicySetScreen`) |
| Put Api  | `/sdwan/v2.0/api/eventcorrelationpolicysets/{policy_set_id}` (`EventCorrelationPolicySetScreen`) |
| Delete Api  | `/sdwan/v2.0/api/eventcorrelationpolicysets/{policy_set_id}` |


### JSON Schema

```json
{
  "properties" : {
    "severity_priority_mapping" : {
      "description" : "Severity Priority Mapping",
      "minItems" : 1,
      "type" : "array",
      "items" : {
        "properties" : {
          "priority" : {
            "description" : "Priority",
            "type" : "string",
            "enum" : [ "p1", "p2", "p3", "p4", "p5", "none" ]
          },
          "severity" : {
            "description" : "Severity",
            "type" : "string",
            "enum" : [ "major", "minor", "critical" ]
          }
        },
        "required" : [ "priority", "severity" ]
      }
    },
    "active_policyset" : {
      "description" : "Active Policyset",
      "type" : "boolean"
    },
    "policyrule_order" : {
      "description" : "Policyrule Order",
      "maxItems" : 1024,
      "type" : "array",
      "items" : {
        "description" : "Policyrule Order",
        "type" : "string"
      },
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "clone_from" : {
      "description" : "Clone From",
      "maxLength" : 20,
      "pattern" : "^-?[0-9]{1,20}$",
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
  "required" : [ "severity_priority_mapping", "active_policyset", "policyrule_order", "clone_from", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_event_correlation_policy_set.my_resource_name"
 id="<resource_id>"
}
```

