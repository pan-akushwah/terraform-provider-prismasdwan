## Documentation for Prisma SDWAN Resource "nat_global_prefix"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `nat_global_prefix` |
| Get Api  | `/sdwan/v2.0/api/natglobalprefixes/{prefix_id}` (`NATGlobalPrefix`) |
| Post Api  | `/sdwan/v2.0/api/natglobalprefixes` (`NATGlobalPrefix`) |
| Put Api  | `/sdwan/v2.0/api/natglobalprefixes/{prefix_id}` (`NATGlobalPrefix`) |
| Delete Api  | `/sdwan/v2.0/api/natglobalprefixes/{prefix_id}` |


### JSON Schema

```json
{
  "properties" : {
    "ipv4_prefixes" : {
      "description" : "Ipv4 Prefixes",
      "type" : "array",
      "items" : {
        "description" : "Ipv4 Prefixes",
        "format" : "ipv4",
        "type" : "string"
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
  "required" : [ "ipv4_prefixes", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_nat_global_prefix.my_resource_name"
 id="<resource_id>"
}
```

