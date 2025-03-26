## Documentation for Prisma SDWAN Resource "anynetlinks"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `anynetlinks` |
| Get Api  | `/sdwan/v4.0/api/anynetlinks/{anynet_id}` (`Anynetlink`) |
| Post Api  | `/sdwan/v4.0/api/anynetlinks` (`Anynetlink`) |
| Put Api  | `/sdwan/v4.0/api/anynetlinks/{anynet_id}` (`Anynetlink`) |
| Delete Api  | `/sdwan/v4.0/api/anynetlinks/{anynet_id}` |


### JSON Schema

```json
{
  "properties" : {
    "ep2_hub_cluster_id" : {
      "description" : "Ep2 Hub Cluster Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
      "type" : "string"
    },
    "ep1_hub_cluster_id" : {
      "description" : "Ep1 Hub Cluster Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
      "type" : "string"
    },
    "ep2_branch_gateway" : {
      "description" : "Ep2 Branch Gateway",
      "type" : "boolean"
    },
    "ep1_branch_gateway" : {
      "description" : "Ep1 Branch Gateway",
      "type" : "boolean"
    },
    "target_serviceendpoint_id" : {
      "description" : "Target Serviceendpoint Id",
      "type" : "string"
    },
    "vpnlink_configuration" : {
      "properties" : {
        "keep_alive_failure_count" : {
          "description" : "Keep Alive Failure Count: NotNull(error = VPNLINK_CONFIG_INVALID_KEEP_ALIVE_FAILURE_COUNT: VPN Link keep alive failure count must be between 3 and 30.) Range(max = 30L, error = VPNLINK_CONFIG_INVALID_KEEP_ALIVE_FAILURE_COUNT: VPN Link keep alive failure count must be between 3 and 30., min = 3L) ",
          "type" : "integer"
        },
        "keep_alive_interval" : {
          "description" : "Keep Alive Interval: NotNull(error = VPNLINK_CONFIG_INVALID_KEEP_ALIVE_INTERVAL: VPN Link keep alive interval must be between 100ms-1740,000ms.) Range(max = 1740000L, error = VPNLINK_CONFIG_INVALID_KEEP_ALIVE_INTERVAL: VPN Link keep alive interval must be between 100ms-1740,000ms., min = 100L) ",
          "type" : "integer"
        }
      },
      "required" : [ "keep_alive_failure_count", "keep_alive_interval" ]
    },
    "tags" : {
      "description" : "Tags",
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
      "description" : "Description",
      "type" : "string"
    },
    "name" : {
      "description" : "Name",
      "type" : "string"
    },
    "admin_up" : {
      "description" : "Admin Up",
      "type" : "boolean"
    },
    "type" : {
      "description" : "Type",
      "type" : "string",
      "enum" : [ "AUTO", "MANUAL", "AUTO_PRIVATE", "MANUAL_PRIVATE", "AUTO_SASE", "DCI_MANUAL_PUBLIC", "DCI_MANUAL_PRIVATE" ]
    },
    "ep2_site_role" : {
      "description" : "Ep2 Site Role",
      "type" : "string",
      "enum" : [ "NONE", "HUB", "SPOKE", "PA_WE_BR", "PA_WE_DC", "PA_CONN" ]
    },
    "ep2_wan_interface_id" : {
      "description" : "Ep2 Wan Interface Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
      "type" : "string"
    },
    "ep2_site_id" : {
      "description" : "Ep2 Site Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
      "type" : "string"
    },
    "ep1_site_role" : {
      "description" : "Ep1 Site Role",
      "type" : "string",
      "enum" : [ "NONE", "HUB", "SPOKE", "PA_WE_BR", "PA_WE_DC", "PA_CONN" ]
    },
    "ep1_wan_interface_id" : {
      "description" : "Ep1 Wan Interface Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
      "type" : "string"
    },
    "ep1_site_id" : {
      "description" : "Ep1 Site Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
      "type" : "string"
    },
    "site_id" : {
      "description" : "Site Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) Digits(fraction = 0, integer = 50, SITEID_INVALID) NotNull ",
      "type" : "string"
    },
    "region" : {
      "description" : "Region: Transient ",
      "type" : "string"
    },
    "disabled_reason" : {
      "description" : "Disabled Reason: Size(max = 5000, DISABLED_REASON_INVALID_0001, min = 0) ",
      "type" : "string"
    },
    "disabled" : {
      "description" : "Disabled",
      "type" : "boolean"
    },
    "inactive_reason" : {
      "description" : "Inactive Reason: Size(max = 5000, INACTIVE_REASON_INVALID_0001, min = 0) ",
      "type" : "string"
    },
    "inactive" : {
      "description" : "Inactive",
      "type" : "boolean"
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
 to="prismasdwan_anynetlinks.my_resource_name"
 id="<resource_id>"
}
```

