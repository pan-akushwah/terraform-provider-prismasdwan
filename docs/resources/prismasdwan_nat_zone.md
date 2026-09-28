## Documentation for Prisma SDWAN Resource "nat_zone"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `nat_zone` |
| Get Api  | `/sdwan/v2.0/api/natzones/{nat_policy_zone_id}` (`NATPolicyZone`) |
| Post Api  | `/sdwan/v2.0/api/natzones` (`NATPolicyZone`) |
| Put Api  | `/sdwan/v2.0/api/natzones/{nat_policy_zone_id}` (`NATPolicyZone`) |
| Delete Api  | `/sdwan/v2.0/api/natzones/{nat_policy_zone_id}` |


### JSON Schema

```json
{
  "properties" : {
    "default_for_public_interfaces" : {
      "description" : "Default For Public Interfaces",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
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
    "region" : {
      "description" : "Region",
      "type" : "string"
    },
    "disabled_reason" : {
      "description" : "Disabled Reason",
      "maxLength" : 5000,
      "type" : "string"
    },
    "disabled" : {
      "description" : "Disabled",
      "type" : "boolean"
    },
    "inactive_reason" : {
      "description" : "Inactive Reason",
      "maxLength" : 5000,
      "type" : "string"
    },
    "inactive" : {
      "description" : "Inactive",
      "type" : "boolean"
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
  "required" : [ "default_for_public_interfaces", "tags", "description", "name", "region", "disabled_reason", "disabled", "inactive_reason", "inactive", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_nat_zone.my_resource_name"
 id="<resource_id>"
}
```

