## Documentation for Prisma SDWAN Resource "element_multicast_rp"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_multicast_rp` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/multicastrps/{config_id}` (`MulticastRPConfigScreen`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/multicastrps` (`MulticastRPConfigScreen`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/multicastrps/{config_id}` (`MulticastRPConfigScreen`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/multicastrps/{config_id}` |


### JSON Schema

```json
{
  "properties" : {
    "groups" : {
      "description" : "Groups",
      "maxItems" : 1024,
      "minItems" : 1,
      "type" : "array",
      "items" : {
        "properties" : {
          "ipv4_prefix" : {
            "description" : "Ipv4 Prefix",
            "type" : "string"
          },
          "name" : {
            "type" : "string"
          }
        },
        "required" : [ "ipv4_prefix", "name" ]
      }
    },
    "ipv4_address" : {
      "description" : "Ipv4 Address",
      "format" : "ipv4",
      "type" : "string"
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
  "required" : [ "groups", "ipv4_address", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_multicast_rp.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

