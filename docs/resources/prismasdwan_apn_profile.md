## Documentation for Prisma SDWAN Resource "apn_profile"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `apn_profile` |
| Get Api  | `/sdwan/v2.0/api/apnprofiles/{apnprofile_id}` (`APNProfileScreen`) |
| Post Api  | `/sdwan/v2.0/api/apnprofiles` (`APNProfileScreen`) |
| Put Api  | `/sdwan/v2.0/api/apnprofiles/{apnprofile_id}` (`APNProfileScreen`) |
| Delete Api  | `/sdwan/v2.0/api/apnprofiles/{apnprofile_id}` |


### JSON Schema

```json
{
  "properties" : {
    "authentication" : {
      "description" : "Authentication",
      "type" : "string",
      "enum" : [ "none", "pap", "chap", "pap_or_chap" ],
      "additionalProperties" : {
        "properties" : {
          "x_flag_required" : {
            "type" : "boolean"
          }
        }
      }
    },
    "clear_password" : {
      "description" : "Clear Password",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_required" : {
            "type" : "boolean"
          }
        }
      }
    },
    "password" : {
      "description" : "Password",
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_sensitive" : {
            "type" : "boolean"
          }
        }
      }
    },
    "user_name" : {
      "description" : "User Name",
      "maxLength" : 100,
      "type" : "string"
    },
    "apn" : {
      "description" : "Apn",
      "maxLength" : 100,
      "type" : "string"
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
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_required" : {
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
  "required" : [ "authentication", "clear_password", "password", "user_name", "apn", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_apn_profile.my_resource_name"
 id="<resource_id>"
}
```

