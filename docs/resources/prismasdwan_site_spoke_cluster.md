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
      "description" : "Advertisement Interval: Required(error = ADVERTISEMENT_INTERVAL_REQD: Advertisement interval required.) ValidateDouble(max = 0, error = ADVERTISEMENT_INTERVAL_INVALID_DECIMAL: Advertisement interval invalid decimal., min = 2, precision = 3) ",
      "format" : "double",
      "type" : "number"
    },
    "preempt" : {
      "description" : "Preempt: Required(PREEMPT_REQD) ",
      "type" : "boolean"
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
      "description" : "Description: Size(max = 1024, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Required(error = NAME_REQD: Please provide resource name.) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
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
  "required" : [ "advertisement_interval", "preempt", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_spoke_cluster.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

