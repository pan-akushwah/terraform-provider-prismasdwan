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
      "description" : "Authentication: ValidateEnum(enumClass = classOf[APNAuthentication], message = APN_PROFILE_INVALID_APN_AUTH, nullAllowed = false) ",
      "type" : "string",
      "enum" : [ "none", "pap", "chap", "pap_or_chap" ]
    },
    "clear_password" : {
      "description" : "Clear Password: Transient ",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_sensitive" : {
            "type" : "boolean"
          }
        }
      }
    },
    "password" : {
      "description" : "Password: Transient Transient ",
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
      "description" : "User Name: Size(max = 100, error = APN_PROFILE_USERNAME_INVALID: Invalid APN config. APN username is invalid. APN username allowed max length is 100., min = 0) ",
      "type" : "string"
    },
    "apn" : {
      "description" : "Apn: Size(max = 100, error = APN_PROFILE_NAME_INVALID: Invalid APN Profile config. APN name is invalid. APN name must be greater than one character and an allowed max length is 100. Valid characters are alphanumeric, hyphen (-), and period (.). Must begin and end with an alphanumeric character., min = 0) ",
      "type" : "string"
    },
    "tags" : {
      "description" : "Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 128, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\\\s]+, required = false) ",
      "type" : "array",
      "items" : {
        "description" : "Tags",
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
      "description" : "Description: Size(max = 256, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Required(error = NAME_REQD: Please provide resource name.) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
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
  "required" : [ "authentication", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_apn_profile.my_resource_name"
 id="<resource_id>"
}
```

