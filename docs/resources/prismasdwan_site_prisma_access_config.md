## Documentation for Prisma SDWAN Resource "site_prisma_access_config"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_prisma_access_config` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/prismaaccess_configs/{config_id}` (`PrismaAccessConfig`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/prismaaccess_configs` (`PrismaAccessConfig`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/prismaaccess_configs/{config_id}` (`PrismaAccessConfig`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/prismaaccess_configs/{config_id}` |


### JSON Schema

```json
{
  "properties" : {
    "remote_networks" : {
      "description" : "Remote Networks: Valid Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "edge_location_display" : {
            "description" : "Edge Location Display: JsonIgnore(value = true) ",
            "type" : "string"
          },
          "edge_location_value" : {
            "description" : "Edge Location Value: JsonIgnore(value = true) ",
            "type" : "string"
          },
          "service_link_ids" : {
            "description" : "Service Link Ids: JsonIgnore(value = true) ",
            "type" : "array",
            "items" : {
              "description" : "Service Link Ids",
              "type" : "string"
            }
          },
          "remote_network_names" : {
            "description" : "Remote Network Names",
            "type" : "array",
            "items" : {
              "description" : "Remote Network Names",
              "type" : "string"
            }
          },
          "spn_name" : {
            "description" : "Spn Name: NotNull(error = DEM_INVALID_SPN_NAME: Security processing name is not specified) ",
            "type" : "string"
          }
        },
        "required" : [ "spn_name" ]
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
  "required" : [ "site_id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_prisma_access_config.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

