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
      "description" : "Site Configs: Valid NotNull(message = MULTICAST_INVALID_SOURCE_SITE_CONFIG) ListObject(allowDuplicate = true, allowEmpty = false, allowNull = false, listMaxSize = 64, message = MULTICAST_INVALID_SITE_CONFIG_LIST, required = false) ",
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
  "required" : [ "site_configs" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_wan_multicast_configuration.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

