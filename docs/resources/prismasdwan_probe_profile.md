## Documentation for Prisma SDWAN Resource "probe_profile"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `probe_profile` |
| Get Api  | `/sdwan/v2.0/api/probeprofiles/{profile_id}` (`ProbeProfileScreen`) |
| Post Api  | `/sdwan/v2.0/api/probeprofiles` (`ProbeProfileScreen`) |
| Put Api  | `/sdwan/v2.0/api/probeprofiles/{profile_id}` (`ProbeProfileScreen`) |
| Delete Api  | `/sdwan/v2.0/api/probeprofiles/{profile_id}` |


### JSON Schema

```json
{
  "properties" : {
    "probe_config_ids" : {
      "description" : "Probe Config Ids",
      "maxItems" : 8,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Probe Config Ids",
        "type" : "string"
      }
    },
    "tags" : {
      "description" : "Tags",
      "maxItems" : 10,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Tags",
        "maxLength" : 128,
        "pattern" : "[^,\\s]+",
        "type" : "string"
      },
      "additionalProperties" : {
        "properties" : {
          "x_flag_unordered" : {
            "type" : "boolean"
          }
        }
      }
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
  "required" : [ "probe_config_ids", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_probe_profile.my_resource_name"
 id="<resource_id>"
}
```

