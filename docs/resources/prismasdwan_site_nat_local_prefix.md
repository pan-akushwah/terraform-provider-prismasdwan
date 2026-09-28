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
      "description" : "Ipv4 Prefixes",
      "type" : "array",
      "items" : {
        "description" : "Ipv4 Prefixes",
        "format" : "ipv4",
        "type" : "string"
      }
    },
    "prefix_id" : {
      "description" : "Prefix Id",
      "type" : "string"
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
  "required" : [ "ipv4_prefixes", "prefix_id", "tags", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_nat_local_prefix.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

