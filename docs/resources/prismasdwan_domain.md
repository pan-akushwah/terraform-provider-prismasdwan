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
      "description" : "Service Bindings: NotNull(error = SERVICEBINDINGMAP_CONFIG_SERVICE_BINDINGS_NULL: Service bindings cannot be null.) Valid ",
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
        }
      }
    },
    "description" : {
      "description" : "Description: Size(max = 256, error = DESCRIPTION_SIZE_EXCEEDED: Description size exceeded., min = 0) Valid ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Required(error = SERVICEBINDINGMAP_NAME_REQD: Service binding map name required.) Size(max = 128, error = SERVICEBINDING_NAME_EXCEEDS_LIMIT: Service binding name exceeds limit., min = 0) Valid ",
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
  "required" : [ "service_bindings", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_domain.my_resource_name"
 id="<resource_id>"
}
```

