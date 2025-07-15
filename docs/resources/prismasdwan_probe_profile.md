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
      "description" : "Probe Config Ids: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 8, error = PROBE_PROFILE_MAX_PROBE_CONFIGS_LIMIT_EXCEEDED_OR_DUPLICATES: More than 8 probe configs or duplicates are not allowed in the probe config ids, noTrim = false, regex = , required = false) Required(error = PROBE_PROFILE_PROBE_CONFIG_IDS_REQUIRED: Probe config ids are required) ",
      "type" : "array",
      "items" : {
        "description" : "Probe Config Ids",
        "type" : "string"
      }
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
  "required" : [ "probe_config_ids", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_probe_profile.my_resource_name"
 id="<resource_id>"
}
```

