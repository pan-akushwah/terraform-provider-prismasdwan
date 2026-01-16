## Documentation for Prisma SDWAN Resource "event_correlation_policy_set"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `event_correlation_policy_set` |
| Get Api  | `/sdwan/v2.0/api/eventcorrelationpolicysets/{policy_set_id}` (`EventCorrelationPolicySetQuery`) |
| Post Api  | `/sdwan/v2.0/api/eventcorrelationpolicysets` (`EventCorrelationPolicySetQuery`) |
| Put Api  | `/sdwan/v2.0/api/eventcorrelationpolicysets/{policy_set_id}` (`EventCorrelationPolicySetQuery`) |
| Delete Api  | `/sdwan/v2.0/api/eventcorrelationpolicysets/{policy_set_id}` |


### JSON Schema

```json
{
  "properties" : {
    "isReadPreferenceSecondary" : {
      "description" : "IsReadPreferenceSecondary: JsonIgnore(value = true) ",
      "type" : "boolean"
    },
    "last_query_ts" : {
      "description" : "Last Query Ts",
      "format" : "int64",
      "type" : "integer"
    },
    "getDeleted" : {
      "description" : "GetDeleted",
      "type" : "boolean"
    },
    "aggregate" : {
      "properties" : {
        "field" : {
          "description" : "Field",
          "type" : "string"
        },
        "operator" : {
          "description" : "Operator",
          "type" : "string",
          "enum" : [ "max", "count", "min", "avg", "sum" ]
        }
      }
    },
    "group_by" : {
      "description" : "Group By",
      "type" : "array",
      "items" : {
        "description" : "Group By",
        "type" : "string"
      }
    },
    "retrieved_fields" : {
      "description" : "Retrieved Fields",
      "type" : "array",
      "items" : {
        "description" : "Retrieved Fields",
        "type" : "string"
      }
    },
    "retrieved_fields_mask" : {
      "description" : "Retrieved Fields Mask",
      "type" : "boolean"
    },
    "total_count" : {
      "description" : "Total Count",
      "format" : "int64",
      "type" : "integer"
    },
    "dest_page" : {
      "description" : "Dest Page",
      "format" : "int32",
      "type" : "integer"
    },
    "next_query" : {
      "type" : "object"
    },
    "limit" : {
      "description" : "Limit",
      "format" : "int32",
      "type" : "integer"
    },
    "sort_case_insensitive" : {
      "description" : "Sort Case Insensitive",
      "type" : "boolean"
    },
    "sort_params" : {
      "type" : "object"
    },
    "query_params" : {
      "type" : "object"
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
 to="prismasdwan_event_correlation_policy_set.my_resource_name"
 id="<resource_id>"
}
```

