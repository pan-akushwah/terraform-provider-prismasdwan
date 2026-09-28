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
      "description" : "Element Interfaces",
      "type" : "array",
      "items" : {
        "properties" : {
          "interfaces" : {
            "description" : "Interfaces",
            "minItems" : 1,
            "type" : "array",
            "items" : {
              "description" : "Interfaces",
              "type" : "string"
            }
          },
          "element_id" : {
            "description" : "Element Id",
            "type" : "string"
          }
        },
        "required" : [ "interfaces", "element_id" ]
      }
    },
    "networks" : {
      "description" : "Networks",
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
        },
        "required" : [ "network_type", "network_id" ]
      }
    },
    "zone_id" : {
      "description" : "Zone Id",
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
  "required" : [ "element_interfaces", "networks", "zone_id", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_security_zone.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

