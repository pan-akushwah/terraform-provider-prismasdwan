## Documentation for Prisma SDWAN Resource "site_security_zone"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_security_zone` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/sitesecurityzones/{zone_id}` (`SecurityZoneNetworkAssociation`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/sitesecurityzones` (`SecurityZoneNetworkAssociation`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/sitesecurityzones/{zone_id}` (`SecurityZoneNetworkAssociation`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/sitesecurityzones/{zone_id}` |


### JSON Schema

```json
{
  "properties" : {
    "networks" : {
      "description" : "Networks: Required(error = SECURITYZONE_INVALID_CONTEXT: Context id or site id not found.) Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "network_type" : {
            "description" : "Network Type: ValidateEnum(enumClass = classOf[ContextType], error = SECURITYZONE_INVALID_CONTEXTTYPE: Context type not supported., nullAllowed = false) ",
            "type" : "string",
            "enum" : [ "wan_network", "lan_network", "wan_overlay" ]
          },
          "network_id" : {
            "description" : "Network Id",
            "type" : "string"
          }
        },
        "required" : [ "network_type" ]
      }
    },
    "zone_id" : {
      "description" : "Zone Id: Required(error = SECURITYZONE_INVALID_ZONE: Zone cannot be changed in the PUT.) ",
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
  },
  "required" : [ "networks", "zone_id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_security_zone.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

