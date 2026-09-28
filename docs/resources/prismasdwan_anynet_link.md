## Documentation for Prisma SDWAN Resource "anynet_link"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `anynet_link` |
| Get Api  | `/sdwan/v4.0/api/anynetlinks/{anynet_id}` (`AnynetLinkV4`) |
| Post Api  | `/sdwan/v4.0/api/anynetlinks` (`AnynetLinkV4`) |
| Put Api  | `/sdwan/v4.0/api/anynetlinks/{anynet_id}` (`AnynetLinkV4`) |
| Delete Api  | `/sdwan/v4.0/api/anynetlinks/{anynet_id}` |


### JSON Schema

```json
{
  "properties" : {
    "ep2_hub_cluster_id" : {
      "description" : "Ep2 Hub Cluster Id",
      "type" : "string"
    },
    "ep1_hub_cluster_id" : {
      "description" : "Ep1 Hub Cluster Id",
      "type" : "string"
    },
    "vpnlink_configuration" : {
      "properties" : {
        "keep_alive_failure_count" : {
          "description" : "Keep Alive Failure Count",
          "maximum" : 30,
          "minimum" : 3,
          "type" : "integer",
          "additionalProperties" : {
            "properties" : {
              "x_flag_required" : {
                "type" : "boolean"
              }
            }
          }
        },
        "keep_alive_interval" : {
          "description" : "Keep Alive Interval",
          "maximum" : 1740000,
          "minimum" : 100,
          "type" : "integer",
          "additionalProperties" : {
            "properties" : {
              "x_flag_required" : {
                "type" : "boolean"
              }
            }
          }
        }
      },
      "required" : [ "keep_alive_failure_count", "keep_alive_interval" ]
    },
    "admin_up" : {
      "description" : "Admin Up",
      "type" : "boolean"
    },
    "forced" : {
      "description" : "Forced",
      "type" : "boolean"
    },
    "type" : {
      "description" : "Type",
      "type" : "string",
      "enum" : [ "AUTO", "MANUAL", "AUTO_PRIVATE", "MANUAL_PRIVATE", "AUTO_SASE", "DCI_MANUAL_PUBLIC", "DCI_MANUAL_PRIVATE" ]
    },
    "ep2_wan_interface_id" : {
      "description" : "Ep2 Wan Interface Id",
      "type" : "string"
    },
    "ep2_site_id" : {
      "description" : "Ep2 Site Id",
      "type" : "string"
    },
    "ep1_wan_interface_id" : {
      "description" : "Ep1 Wan Interface Id",
      "type" : "string"
    },
    "ep1_site_id" : {
      "description" : "Ep1 Site Id",
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
    "tenant_id" : {
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
  "required" : [ "ep2_hub_cluster_id", "ep1_hub_cluster_id", "admin_up", "forced", "type", "ep2_wan_interface_id", "ep2_site_id", "ep1_wan_interface_id", "ep1_site_id", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_anynet_link.my_resource_name"
 id="<resource_id>"
}
```

