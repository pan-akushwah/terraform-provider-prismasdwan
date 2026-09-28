## Documentation for Prisma SDWAN Resource "domain"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `domain` |
| Get Api  | `/sdwan/v2.1/api/servicebindingmaps/{map_id}` (`ServiceBindingMapScreenV2N1`) |
| Post Api  | `/sdwan/v2.1/api/servicebindingmaps` (`ServiceBindingMapScreenV2N1`) |
| Put Api  | `/sdwan/v2.1/api/servicebindingmaps/{map_id}` (`ServiceBindingMapScreenV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/servicebindingmaps/{map_id}` |


### JSON Schema

```json
{
  "properties" : {
    "is_default" : {
      "description" : "Is Default",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_required" : {
            "type" : "boolean"
          }
        }
      }
    },
    "service_bindings" : {
      "description" : "Service Bindings",
      "type" : "array",
      "items" : {
        "properties" : {
          "service_endpoint_ids" : {
            "description" : "Service Endpoint Ids",
            "type" : "array",
            "items" : {
              "description" : "Service Endpoint Ids",
              "type" : "string"
            }
          },
          "service_label_id" : {
            "description" : "Service Label Id",
            "type" : "string"
          }
        },
        "required" : [ "service_endpoint_ids", "service_label_id" ]
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
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_required" : {
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
  "required" : [ "is_default", "service_bindings", "description", "name", "tags", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_domain.my_resource_name"
 id="<resource_id>"
}
```

