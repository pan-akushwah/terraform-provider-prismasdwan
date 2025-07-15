## Documentation for Prisma SDWAN Resource "site_hub_distribution_fabric"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_hub_distribution_fabric` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/prefixdistributionspokelists/{id}` (`PrefixDistributionSpokeList`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/prefixdistributionspokelists` (`PrefixDistributionSpokeList`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/prefixdistributionspokelists/{id}` (`PrefixDistributionSpokeList`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/prefixdistributionspokelists/{id}` |


### JSON Schema

```json
{
  "properties" : {
    "spoke_site_ids" : {
      "description" : "Spoke Site Ids",
      "type" : "array",
      "items" : {
        "description" : "Spoke Site Ids",
        "type" : "string"
      }
    },
    "tags" : {
      "description" : "Tags",
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
      "description" : "Description",
      "type" : "string"
    },
    "name" : {
      "description" : "Name",
      "type" : "string"
    },
    "id" : {
      "description" : "Id: Transient ",
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
 to="prismasdwan_site_hub_distribution_fabric.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

