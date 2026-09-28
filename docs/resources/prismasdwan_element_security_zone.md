## Documentation for Prisma SDWAN Resource "element_security_zone"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_security_zone` |
| Get Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/securityzones/{security_zone_id}` (`ElementSecurityZoneScreenV2N1`) |
| Post Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/securityzones` (`ElementSecurityZoneScreenV2N1`) |
| Put Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/securityzones/{security_zone_id}` (`ElementSecurityZoneScreenV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/securityzones/{security_zone_id}` |


### JSON Schema

```json
{
  "properties" : {
    "pa_network_id" : {
      "description" : "Pa Network Id",
      "type" : "string"
    },
    "waninterface_ids" : {
      "description" : "Waninterface Ids",
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Waninterface Ids",
        "pattern" : "[0-9]{1,30}",
        "type" : "string"
      }
    },
    "wanoverlay_ids" : {
      "description" : "Wanoverlay Ids",
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Wanoverlay Ids",
        "pattern" : "[0-9]{1,30}",
        "type" : "string"
      }
    },
    "interface_ids" : {
      "description" : "Interface Ids",
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Interface Ids",
        "pattern" : "[0-9]{1,30}",
        "type" : "string"
      }
    },
    "lannetwork_ids" : {
      "description" : "Lannetwork Ids",
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Lannetwork Ids",
        "pattern" : "[0-9]{1,30}",
        "type" : "string"
      }
    },
    "zone_id" : {
      "description" : "Zone Id",
      "maxLength" : 30,
      "pattern" : "^-?[0-9]{1,30}$",
      "type" : "string"
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
  "required" : [ "pa_network_id", "waninterface_ids", "wanoverlay_ids", "interface_ids", "lannetwork_ids", "zone_id", "site_id", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_security_zone.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

