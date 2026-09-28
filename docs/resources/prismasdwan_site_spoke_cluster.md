## Documentation for Prisma SDWAN Resource "site_spoke_cluster"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_spoke_cluster` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/spokeclusters/{spoke_cluster_id}` (`SpokeCluster`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/spokeclusters` (`SpokeCluster`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/spokeclusters/{spoke_cluster_id}` (`SpokeCluster`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/spokeclusters/{spoke_cluster_id}` |


### JSON Schema

```json
{
  "properties" : {
    "advertisement_interval" : {
      "description" : "Advertisement Interval",
      "format" : "double",
      "maximum" : 10,
      "minimum" : 0.2,
      "type" : "number"
    },
    "preempt" : {
      "description" : "Preempt",
      "type" : "boolean"
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
  "required" : [ "advertisement_interval", "preempt", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_spoke_cluster.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

