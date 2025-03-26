## Documentation for Prisma SDWAN Resource "machines_software"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `machines_software` |
| Get Api  | `/sdwan/v2.0/api/machines/{machine_id}/software/{software_id}` (`MachineSoftware`) |
| Put Api  | `/sdwan/v2.0/api/machines/{machine_id}/software/{software_id}` (`MachineSoftware`) |


### JSON Schema

```json
{
  "properties" : {
    "upgrade_interval" : {
      "description" : "Upgrade Interval: Range(max = 59L, error = MACHINE_SOFTWARE_CONFIG_INVALID_INTERVAL: Invalid upgrade interval.Should be between [0-59]., min = 0L) ",
      "type" : "integer"
    },
    "scheduled_upgrade" : {
      "description" : "Scheduled Upgrade: Pattern(message = ELEMENT_STATE_UPDATE_INVALID_TIME, regexp = ^(0?[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])-(201?[8-9]|20?[2-5][0-9])\\\\s+([0-1][0-9]|2?[0-3])\\\\:([0-5][0-9])\\\\:([0-5][0-9])$) Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
      "type" : "string"
    },
    "upgrade_version" : {
      "description" : "Upgrade Version: NotEmpty(error = MACHINE_SOFTWARE_CONFIG_MISSING_UPGRADE_VERSION: Upgrade version can neither be null or empty.) Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
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
  "required" : [ "upgrade_version" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_machines_software.my_resource_name"
 id="<resource_id>"
}
```

