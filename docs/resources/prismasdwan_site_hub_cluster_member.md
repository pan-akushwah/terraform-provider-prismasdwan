## Documentation for Prisma SDWAN Resource "site_hub_cluster_member"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_hub_cluster_member` |
| Get Api  | `/sdwan/v3.0/api/sites/{site_id}/hubclusters/{hub_cluster_id}/hubclustermembers/{hub_cluster_member_id}` (`HubClusterMemberScreen`) |
| Post Api  | `/sdwan/v3.0/api/sites/{site_id}/hubclusters/{hub_cluster_id}/hubclustermembers` (`HubClusterMemberScreen`) |
| Put Api  | `/sdwan/v3.0/api/sites/{site_id}/hubclusters/{hub_cluster_id}/hubclustermembers/{hub_cluster_member_id}` (`HubClusterMemberScreen`) |
| Delete Api  | `/sdwan/v3.0/api/sites/{site_id}/hubclusters/{hub_cluster_id}/hubclustermembers/{hub_cluster_member_id}` |


### JSON Schema

```json
{
  "properties" : {
    "load_factors" : {
      "description" : "Load Factors",
      "type" : "array",
      "items" : {
        "properties" : {
          "threshold" : {
            "properties" : {
              "subscription_factor" : {
                "description" : "Subscription Factor",
                "format" : "double",
                "type" : "number"
              },
              "critical_alarm" : {
                "description" : "Critical Alarm",
                "format" : "int32",
                "type" : "integer"
              },
              "major_alarm" : {
                "description" : "Major Alarm",
                "format" : "int32",
                "type" : "integer"
              }
            }
          },
          "alarm_threshold" : {
            "description" : "Alarm Threshold",
            "format" : "int32",
            "type" : "integer"
          },
          "subscription_factor" : {
            "description" : "Subscription Factor",
            "format" : "double",
            "type" : "number"
          },
          "allocated" : {
            "description" : "Allocated",
            "format" : "int64",
            "type" : "integer"
          },
          "type" : {
            "description" : "Type",
            "type" : "string",
            "enum" : [ "forwarding-capacity", "flow" ]
          }
        }
      }
    },
    "headend2_site_ids" : {
      "description" : "Headend2 Site Ids",
      "type" : "array",
      "items" : {
        "description" : "Headend2 Site Ids",
        "type" : "string"
      }
    },
    "headend1_site_ids" : {
      "description" : "Headend1 Site Ids",
      "type" : "array",
      "items" : {
        "description" : "Headend1 Site Ids",
        "type" : "string"
      }
    },
    "hub_element_id" : {
      "description" : "Hub Element Id",
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
  }
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_hub_cluster_member.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:hub_cluster_id=<some_hub_cluster_id>"
}
```

