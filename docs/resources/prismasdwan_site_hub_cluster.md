## Documentation for Prisma SDWAN Resource "site_hub_cluster"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_hub_cluster` |
| Get Api  | `/sdwan/v4.0/api/sites/{site_id}/hubclusters/{hub_cluster_id}` (`HubClusterV4`) |
| Post Api  | `/sdwan/v4.0/api/sites/{site_id}/hubclusters` (`HubClusterV4`) |
| Put Api  | `/sdwan/v4.0/api/sites/{site_id}/hubclusters/{hub_cluster_id}` (`HubClusterV4`) |
| Delete Api  | `/sdwan/v4.0/api/sites/{site_id}/hubclusters/{hub_cluster_id}` |


### JSON Schema

```json
{
  "properties" : {
    "elements" : {
      "description" : "Elements",
      "type" : "array",
      "items" : {
        "properties" : {
          "hub_element_id" : {
            "description" : "Hub Element Id",
            "type" : "string"
          },
          "locked" : {
            "description" : "Locked",
            "type" : "boolean"
          }
        },
        "required" : [ "hubClusterElementNumber", "hub_element_id", "locked" ]
      }
    },
    "peer_sites" : {
      "description" : "Peer Sites",
      "maxItems" : 2147483647,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Peer Sites",
        "type" : "string"
      }
    },
    "site_count_alarm_threshold" : {
      "description" : "Site Count Alarm Threshold",
      "exclusiveMinimum" : true,
      "minimum" : 0,
      "type" : "integer"
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
      "maxLength" : 4096,
      "type" : "string"
    },
    "default_cluster" : {
      "description" : "Default Cluster",
      "type" : "boolean"
    },
    "name" : {
      "description" : "Name",
      "maxLength" : 128,
      "minLength" : 1,
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
  "required" : [ "elements", "peer_sites", "site_count_alarm_threshold", "tags", "description", "default_cluster", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_hub_cluster.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

