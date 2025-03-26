## Documentation for Prisma SDWAN Resource "sites_demsiteconfigs"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `sites_demsiteconfigs` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/demsiteconfigs/{config_id}` (`DemSiteConfigScreen`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/demsiteconfigs` (`DemSiteConfigScreen`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/demsiteconfigs/{config_id}` (`DemSiteConfigScreen`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/demsiteconfigs/{config_id}` |


### JSON Schema

```json
{
  "properties" : {
    "adem_enabled" : {
      "description" : "Adem Enabled",
      "type" : "boolean"
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
  "required" : [ "site_id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_sites_demsiteconfigs.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

