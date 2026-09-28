## Documentation for Prisma SDWAN Resource "wan_network"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `wan_network` |
| Get Api  | `/sdwan/v2.1/api/wannetworks/{wan_network_id}` (`WANNetworkScreenV2N1`) |
| Post Api  | `/sdwan/v2.1/api/wannetworks` (`WANNetworkScreenV2N1`) |
| Put Api  | `/sdwan/v2.1/api/wannetworks/{wan_network_id}` (`WANNetworkScreenV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/wannetworks/{wan_network_id}` |


### JSON Schema

```json
{
  "properties" : {
    "provider_as_numbers" : {
      "description" : "Provider As Numbers",
      "type" : "array",
      "items" : {
        "description" : "Provider As Numbers",
        "maximum" : 65535,
        "minimum" : 1,
        "type" : "integer"
      },
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "type" : {
      "description" : "Type",
      "type" : "string",
      "enum" : [ "publicwan", "privatewan" ],
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
  "required" : [ "provider_as_numbers", "type", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_wan_network.my_resource_name"
 id="<resource_id>"
}
```

