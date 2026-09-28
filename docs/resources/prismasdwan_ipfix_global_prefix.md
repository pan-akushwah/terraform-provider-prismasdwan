## Documentation for Prisma SDWAN Resource "ipfix_global_prefix"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `ipfix_global_prefix` |
| Get Api  | `/sdwan/v2.0/api/ipfixglobalprefixes/{prefix_id}` (`IPFixGlobalPrefixScreen`) |
| Post Api  | `/sdwan/v2.0/api/ipfixglobalprefixes` (`IPFixGlobalPrefixScreen`) |
| Put Api  | `/sdwan/v2.0/api/ipfixglobalprefixes/{prefix_id}` (`IPFixGlobalPrefixScreen`) |
| Delete Api  | `/sdwan/v2.0/api/ipfixglobalprefixes/{prefix_id}` |


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
 to="prismasdwan_ipfix_global_prefix.my_resource_name"
 id="<resource_id>"
}
```

