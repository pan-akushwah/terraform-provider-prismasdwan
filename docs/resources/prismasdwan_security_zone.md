## Documentation for Prisma SDWAN Resource "security_zone"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `security_zone` |
| Get Api  | `/sdwan/v2.2/api/securityzones/{zone_id}` (`SecurityZoneV2N2`) |
| Post Api  | `/sdwan/v2.2/api/securityzones` (`SecurityZoneV2N2`) |
| Put Api  | `/sdwan/v2.2/api/securityzones/{zone_id}` (`SecurityZoneV2N2`) |
| Delete Api  | `/sdwan/v2.2/api/securityzones/{zone_id}` |


### JSON Schema

```json
{
  "properties" : {
    "is_l2" : {
      "description" : "Is L2",
      "type" : "boolean"
    },
    "tcp_allow_non_syn" : {
      "description" : "Tcp Allow Non Syn",
      "type" : "boolean"
    },
    "description" : {
      "description" : "Description",
      "maxLength" : 256,
      "type" : "string"
    },
    "name" : {
      "description" : "Name",
      "maxLength" : 128,
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
  "required" : [ "is_l2", "tcp_allow_non_syn", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_security_zone.my_resource_name"
 id="<resource_id>"
}
```

