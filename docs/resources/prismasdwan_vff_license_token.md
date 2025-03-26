## Documentation for Prisma SDWAN Resource "vff_license_token"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `vff_license_token` |
| Get Api  | `/sdwan/v2.0/api/vfflicenses/{license_id}/tokens/{token_id}` (`VffTokenScreen`) |
| Post Api  | `/sdwan/v2.0/api/vfflicenses/{license_id}/tokens` (`VffTokenScreen`) |
| Put Api  | `/sdwan/v2.0/api/vfflicenses/{license_id}/tokens/{token_id}` (`VffTokenScreen`) |


### JSON Schema

```json
{
  "properties" : {
    "is_expired" : {
      "description" : "Is Expired",
      "type" : "boolean"
    },
    "valid_till_secs" : {
      "description" : "Valid Till Secs",
      "format" : "int64",
      "type" : "integer"
    },
    "secret_key" : {
      "description" : "Secret Key",
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_sensitive" : {
            "type" : "boolean"
          }
        }
      }
    },
    "ion_key" : {
      "description" : "Ion Key",
      "type" : "string"
    },
    "vfflicense_id" : {
      "description" : "Vfflicense Id",
      "type" : "string"
    },
    "is_revoked" : {
      "description" : "Is Revoked",
      "type" : "boolean"
    },
    "is_used" : {
      "description" : "Is Used",
      "type" : "boolean"
    },
    "is_multiuse" : {
      "description" : "Is Multiuse",
      "type" : "boolean"
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
  }
}
```

### Terraform Import
```json
import {
 to="prismasdwan_vff_license_token.my_resource_name"
 id="<resource_id>:license_id=<some_license_id>"
}
```

