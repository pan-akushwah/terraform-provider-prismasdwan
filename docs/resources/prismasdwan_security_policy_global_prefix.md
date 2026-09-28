## Documentation for Prisma SDWAN Resource "security_policy_global_prefix"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `security_policy_global_prefix` |
| Get Api  | `/sdwan/v2.1/api/ngfwsecuritypolicyglobalprefixes/{prefix_id}` (`SecurityPolicyGlobalPrefixScreenV2N1`) |
| Post Api  | `/sdwan/v2.1/api/ngfwsecuritypolicyglobalprefixes` (`SecurityPolicyGlobalPrefixScreenV2N1`) |
| Put Api  | `/sdwan/v2.1/api/ngfwsecuritypolicyglobalprefixes/{prefix_id}` (`SecurityPolicyGlobalPrefixScreenV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/ngfwsecuritypolicyglobalprefixes/{prefix_id}` |


### JSON Schema

```json
{
  "properties" : {
    "ipv6_prefixes" : {
      "description" : "Ipv6 Prefixes",
      "type" : "array",
      "items" : {
        "description" : "Ipv6 Prefixes",
        "format" : "ipv6",
        "type" : "string"
      }
    },
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
  "required" : [ "ipv6_prefixes", "ipv4_prefixes", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_security_policy_global_prefix.my_resource_name"
 id="<resource_id>"
}
```

