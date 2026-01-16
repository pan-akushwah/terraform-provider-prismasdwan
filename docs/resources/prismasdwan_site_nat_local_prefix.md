## Documentation for Prisma SDWAN Resource "site_nat_local_prefix"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_nat_local_prefix` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/natlocalprefixes/{prefix_id}` (`SiteNATPrefixAssociation`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/natlocalprefixes` (`SiteNATPrefixAssociation`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/natlocalprefixes/{prefix_id}` (`SiteNATPrefixAssociation`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/natlocalprefixes/{prefix_id}` |


### JSON Schema

```json
{
  "properties" : {
    "ipv4_prefixes" : {
      "description" : "Ipv4 Prefixes: ListIPAddress(bcast = DENY, listMaxSize = 0, error = INVALID_IPV4_PREFIX: Invalid IPv4 Prefix., required = false, type = APP_GATEWAYCIDR) ",
      "type" : "array",
      "items" : {
        "description" : "Ipv4 Prefixes",
        "type" : "string"
      }
    },
    "prefix_id" : {
      "description" : "Prefix Id",
      "type" : "string"
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
 to="prismasdwan_site_nat_local_prefix.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

