## Documentation for Prisma SDWAN Resource "security_policy_local_prefix"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `security_policy_local_prefix` |
| Get Api  | `/sdwan/v2.0/api/ngfwsecuritypolicylocalprefixes/{prefix_id}` (`SecurityPolicyV2LocalPrefixScreen`) |
| Post Api  | `/sdwan/v2.0/api/ngfwsecuritypolicylocalprefixes` (`SecurityPolicyV2LocalPrefixScreen`) |
| Put Api  | `/sdwan/v2.0/api/ngfwsecuritypolicylocalprefixes/{prefix_id}` (`SecurityPolicyV2LocalPrefixScreen`) |
| Delete Api  | `/sdwan/v2.0/api/ngfwsecuritypolicylocalprefixes/{prefix_id}` |


### JSON Schema

```json
{
  "properties" : {
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
  "required" : [ "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_security_policy_local_prefix.my_resource_name"
 id="<resource_id>"
}
```

