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
      "description" : "Ipv4 Prefixes: ListIPAddress(bcast = DENY, listMaxSize = 0, error = INVALID_PREFIX: Prefix is not valid OR not within the valid prefix range., required = false, type = PREFIXCIDR_ALL) ",
      "type" : "array",
      "items" : {
        "description" : "Ipv4 Prefixes",
        "type" : "string"
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
    "description" : {
      "description" : "Description: Size(max = 256, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Required(error = NAME_REQD: Please provide resource name.) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
      "type" : "string"
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
  "required" : [ "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_nat_global_prefix.my_resource_name"
 id="<resource_id>"
}
```

