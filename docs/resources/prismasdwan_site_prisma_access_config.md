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
      "description" : "Remote Networks",
      "type" : "array",
      "items" : {
        "properties" : {
          "edge_location_display" : {
            "description" : "Edge Location Display",
            "readOnly" : true,
            "type" : "string",
            "x-json-ignore" : true
          },
          "edge_location_value" : {
            "description" : "Edge Location Value",
            "readOnly" : true,
            "type" : "string",
            "x-json-ignore" : true
          },
          "service_link_ids" : {
            "description" : "Service Link Ids",
            "readOnly" : true,
            "type" : "array",
            "items" : {
              "description" : "Service Link Ids",
              "type" : "string"
            },
            "x-json-ignore" : true
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
        },
        "required" : [ "edge_location_display", "edge_location_value", "service_link_ids", "remote_network_names", "spn_name" ]
      }
    },
    "site_id" : {
      "description" : "Site Id",
      "maxLength" : 50,
      "pattern" : "^-?[0-9]{1,50}$",
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
  "required" : [ "remote_networks", "site_id", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_prisma_access_config.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

