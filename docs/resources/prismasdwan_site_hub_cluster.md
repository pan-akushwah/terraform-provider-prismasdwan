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
        }
      }
    },
    "peer_sites" : {
      "description" : "Peer Sites: ListString(allowDuplicate = false, allowEmpty = true, allowNull = false, length = 0, listMaxSize = 2147483647, message = INVALID_PEER_SITES_PRESENT, noTrim = false, regex = , required = false) ",
      "type" : "array",
      "items" : {
        "description" : "Peer Sites",
        "type" : "string"
      }
    },
    "site_count_alarm_threshold" : {
      "description" : "Site Count Alarm Threshold: Positive(message = SITE_COUNT_ALARM_THRESHOLD_NEITHER_NULL_NOR_NON_NEGATIVE) ",
      "type" : "integer"
    },
    "tags" : {
      "description" : "Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 1024, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\\\s]+, required = false) ",
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
      "description" : "Description: Size(max = 4096, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0) ",
      "type" : "string"
    },
    "default_cluster" : {
      "description" : "Default Cluster",
      "type" : "boolean"
    },
    "name" : {
      "description" : "Name: NotBlank(error = HUB_CLUSTER_NAME_NULL_OR_EMPTY: Hub Cluster name cannot be null or empty.) Size(max = 128, error = HUB_CLUSTER_NAME_EXCEEDS_LIMIT: Hub Cluster name exceeds limit.(128 chars)., min = 0) ",
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
  },
  "required" : [ "peer_sites", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_hub_cluster.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

