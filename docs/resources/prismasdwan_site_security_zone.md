## Documentation for Prisma SDWAN Resource "site_security_zone"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_security_zone` |
| Get Api  | `/sdwan/v2.1/api/sites/{site_id}/sitesecurityzones/{zone_id}` (`SecurityZoneNetworkAssociationV2N1`) |
| Post Api  | `/sdwan/v2.1/api/sites/{site_id}/sitesecurityzones` (`SecurityZoneNetworkAssociationV2N1`) |
| Put Api  | `/sdwan/v2.1/api/sites/{site_id}/sitesecurityzones/{zone_id}` (`SecurityZoneNetworkAssociationV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/sites/{site_id}/sitesecurityzones/{zone_id}` |


### JSON Schema

```json
{
  "properties" : {
    "element_interfaces" : {
      "description" : "Element Interfaces: Valid Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "interfaces" : {
            "description" : "Interfaces: NotEmpty(error = SITESECURITYZONE_INTERFACES_REQUIRED: Interfaces list cannot be empty) ",
            "type" : "array",
            "items" : {
              "description" : "Interfaces",
              "type" : "string"
            }
          },
          "element_id" : {
            "description" : "Element Id: NotNull(error = SITESECURITYZONE_ELEMENT_ID_REQUIRED: Element ID is required) ",
            "type" : "string"
          }
        },
        "required" : [ "interfaces", "element_id" ]
      }
    },
    "networks" : {
      "description" : "Networks: Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "network_type" : {
            "description" : "Network Type",
            "type" : "string",
            "enum" : [ "wan_network", "lan_network", "wan_overlay", "pa_network" ]
          },
          "network_id" : {
            "description" : "Network Id",
            "type" : "string"
          }
        }
      }
    },
    "zone_id" : {
      "description" : "Zone Id: Required(error = SECURITYZONE_INVALID_ZONE: Invalid security zone or zone does not exist.) ",
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
  "required" : [ "zone_id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_security_zone.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

