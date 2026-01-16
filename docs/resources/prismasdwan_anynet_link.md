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
          "description" : "Keep Alive Failure Count: NotNull(error = VPNLINK_CONFIG_INVALID_KEEP_ALIVE_FAILURE_COUNT: VPN Link keep alive failure count must be between 3 and 30.) Range(max = 30L, error = VPNLINK_CONFIG_INVALID_KEEP_ALIVE_FAILURE_COUNT: VPN Link keep alive failure count must be between 3 and 30., min = 3L) ",
          "type" : "integer"
        },
        "keep_alive_interval" : {
          "description" : "Keep Alive Interval: NotNull(error = VPNLINK_CONFIG_INVALID_KEEP_ALIVE_INTERVAL: VPN Link keep alive interval must be between 100ms-1740,000ms.) Range(max = 1740000L, error = VPNLINK_CONFIG_INVALID_KEEP_ALIVE_INTERVAL: VPN Link keep alive interval must be between 100ms-1740,000ms., min = 100L) ",
          "type" : "integer"
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
 to="prismasdwan_anynet_link.my_resource_name"
 id="<resource_id>"
}
```

