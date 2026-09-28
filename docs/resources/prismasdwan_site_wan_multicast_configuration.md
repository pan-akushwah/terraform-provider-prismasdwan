## Documentation for Prisma SDWAN Resource "site_wan_multicast_configuration"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_wan_multicast_configuration` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/multicastsourcesiteconfigs/{config_id}` (`MulticastSourceSiteConfigScreen`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/multicastsourcesiteconfigs` (`MulticastSourceSiteConfigScreen`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/multicastsourcesiteconfigs/{config_id}` (`MulticastSourceSiteConfigScreen`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/multicastsourcesiteconfigs/{config_id}` |


### JSON Schema

```json
{
  "properties" : {
    "site_configs" : {
      "description" : "Site Configs",
      "maxItems" : 64,
      "minItems" : 1,
      "type" : "array",
      "items" : {
        "properties" : {
          "source_ipv4_address" : {
            "description" : "Source Ipv4 Address",
            "type" : "string"
          },
          "group_ipv4_prefix" : {
            "description" : "Group Ipv4 Prefix",
            "type" : "string"
          }
        },
        "required" : [ "source_ipv4_address", "group_ipv4_prefix" ]
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
  "required" : [ "site_configs", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_wan_multicast_configuration.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

