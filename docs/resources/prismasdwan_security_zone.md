## Documentation for Prisma SDWAN Resource "security_zone"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `security_zone` |
| Get Api  | `/sdwan/v2.1/api/securityzones/{zone_id}` (`SecurityZoneV2N1`) |
| Post Api  | `/sdwan/v2.1/api/securityzones` (`SecurityZoneV2N1`) |
| Put Api  | `/sdwan/v2.1/api/securityzones/{zone_id}` (`SecurityZoneV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/securityzones/{zone_id}` |


### JSON Schema

```json
{
  "properties" : {
    "tcp_allow_non_syn" : {
      "description" : "Tcp Allow Non Syn",
      "type" : "boolean"
    },
    "description" : {
      "description" : "Description: Size(max = 256, error = SECURITYZONE_DESCRIPTION_INVALID: Security zone description exceeds limit., min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Size(max = 128, error = SECURITYZONE_NAME_INVALID: Security zone name exceeds limit., min = 0) Required(error = SECURITYZONE_NAME_REQUIRED: Security zone name required.) ",
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
  "required" : [ "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_security_zone.my_resource_name"
 id="<resource_id>"
}
```

