## Documentation for Prisma SDWAN Resource "site_hub_prefix_filter_association"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_hub_prefix_filter_association` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/pathprefixdistributionfilterassociation/{id}` (`PathPrefixDistributionFiltersAssociation`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/pathprefixdistributionfilterassociation` (`PathPrefixDistributionFiltersAssociation`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/pathprefixdistributionfilterassociation/{id}` (`PathPrefixDistributionFiltersAssociation`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/pathprefixdistributionfilterassociation/{id}` |


### JSON Schema

```json
{
  "properties" : {
    "peer_site_ids" : {
      "description" : "Peer Site Ids",
      "type" : "array",
      "items" : {
        "description" : "Peer Site Ids",
        "type" : "string"
      }
    },
    "path_prefix_distribution_filter_id" : {
      "description" : "Path Prefix Distribution Filter Id",
      "type" : "string"
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
 to="prismasdwan_site_hub_prefix_filter_association.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

