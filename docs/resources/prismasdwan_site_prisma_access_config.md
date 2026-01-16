## Documentation for Prisma SDWAN Resource "site_prisma_access_config"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_prisma_access_config` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/prismaaccess_configs/{config_id}` (`PrismaAccessConfig`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/prismaaccess_configs` (`PrismaAccessConfig`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/prismaaccess_configs/{config_id}` (`PrismaAccessConfig`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/prismaaccess_configs/{config_id}` |


### JSON Schema

```json
{
  "properties" : {
    "remote_networks" : {
      "description" : "Remote Networks: Valid Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "edge_location_display" : {
            "description" : "Edge Location Display: JsonIgnore(value = true) ",
            "type" : "string"
          },
          "edge_location_value" : {
            "description" : "Edge Location Value: JsonIgnore(value = true) ",
            "type" : "string"
          },
          "service_link_ids" : {
            "description" : "Service Link Ids: JsonIgnore(value = true) ",
            "type" : "array",
            "items" : {
              "description" : "Service Link Ids",
              "type" : "string"
            }
          },
          "remote_network_names" : {
            "description" : "Remote Network Names",
            "type" : "array",
            "items" : {
              "description" : "Remote Network Names",
              "type" : "string"
            }
          },
          "spn_name" : {
            "description" : "Spn Name",
            "type" : "string"
          }
        }
      }
    },
    "site_id" : {
      "description" : "Site Id: Digits(fraction = 0, integer = 50, SITEID_INVALID) NotNull ",
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
  "required" : [ "site_id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_prisma_access_config.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

