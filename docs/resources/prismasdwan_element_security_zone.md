## Documentation for Prisma SDWAN Resource "element_security_zone"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_security_zone` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/securityzones/{security_zone_id}` (`ElementSecurityZoneScreen`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/securityzones` (`ElementSecurityZoneScreen`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/securityzones/{security_zone_id}` (`ElementSecurityZoneScreen`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/securityzones/{security_zone_id}` |


### JSON Schema

```json
{
  "properties" : {
    "waninterface_ids" : {
      "description" : "Waninterface Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_WANINTERFACE_IDS: Specified site wan interface ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false) ",
      "type" : "array",
      "items" : {
        "description" : "Waninterface Ids",
        "type" : "string"
      }
    },
    "wanoverlay_ids" : {
      "description" : "Wanoverlay Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_WANOVERLAY_IDS: Specified wanoverlay ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false) ",
      "type" : "array",
      "items" : {
        "description" : "Wanoverlay Ids",
        "type" : "string"
      }
    },
    "interface_ids" : {
      "description" : "Interface Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_INTERFACE_IDS: Specified interface ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false) ",
      "type" : "array",
      "items" : {
        "description" : "Interface Ids",
        "type" : "string"
      }
    },
    "lannetwork_ids" : {
      "description" : "Lannetwork Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = ELEMENT_SECURITYZONE_INVALID_LANNETWORK_IDS: Specified lan network ids are invalid., noTrim = false, regex = [0-9]{1,30}, required = false) ",
      "type" : "array",
      "items" : {
        "description" : "Lannetwork Ids",
        "type" : "string"
      }
    },
    "zone_id" : {
      "description" : "Zone Id: Required(error = ELEMENT_SECURITYZONE_ZONEID_REQUIRED: Security zone id is required for element level association.) Digits(fraction = 0, integer = 30, ELEMENT_SECURITYZONE_INVALID_ZONEID) ",
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
  "required" : [ "zone_id", "site_id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_security_zone.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

