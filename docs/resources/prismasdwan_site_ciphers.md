## Documentation for Prisma SDWAN Resource "site_ciphers"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_ciphers` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/siteciphers` (`SiteCipherScreen`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/siteciphers` (`SiteCipherScreen`) |


### JSON Schema

```json
{
  "properties" : {
    "controller_connection_cipher" : {
      "description" : "Controller Connection Cipher: ValidateEnum(enumClass = classOf[ControllerConnectionCipher], message = Invalid enum string., nullAllowed = false) ",
      "type" : "string",
      "enum" : [ "RSA-AES256-GCM-SHA384", "RSA-AES128-GCM-SHA256" ]
    },
    "vpn_ciphers" : {
      "description" : "Vpn Ciphers: ListEnum(enumClass = classOf[VPNCiphers], length = 0, listMaxSize = 4, SITECIPHER_CONFIG_INVALID_CIPHERS, nullAllowed = false) ",
      "type" : "array",
      "items" : {
        "description" : "Vpn Ciphers",
        "type" : "string"
      }
    },
    "site_id" : {
      "description" : "Site Id: Transient Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) Digits(fraction = 0, integer = 50, SITEID_INVALID) NotNull ",
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
  "required" : [ "controller_connection_cipher", "vpn_ciphers", "site_id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_ciphers.my_resource_name"
 id="<resource_id>"
}
```

