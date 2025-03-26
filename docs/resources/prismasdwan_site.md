## Documentation for Prisma SDWAN Resource "site"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site` |
| Get Api  | `/sdwan/v4.12/api/sites/{site_id}` (`SiteScreenV4N12`) |
| Post Api  | `/sdwan/v4.12/api/sites` (`SiteScreenV4N12`) |
| Put Api  | `/sdwan/v4.12/api/sites/{site_id}` (`SiteScreenV4N12`) |
| Delete Api  | `/sdwan/v4.12/api/sites/{site_id}` |


### JSON Schema

```json
{
  "properties" : {
    "sgi_config" : {
      "properties" : {
        "sgi_tag" : {
          "description" : "Sgi Tag: Range(max = 65533L, INVALID_SGI_CONFIG, min = 1L) ",
          "format" : "int32",
          "type" : "integer"
        },
        "sgi_vendor_id" : {
          "description" : "Sgi Vendor Id: ValidateEnum(enumClass = classOf[SGI_vendor], INVALID_SGI_CONFIG, nullAllowed = false) ",
          "type" : "string",
          "enum" : [ "SGI_VENDOR_ID_TYPE_8909" ]
        }
      },
      "required" : [ "sgi_vendor_id" ]
    },
    "app_acceleration_enabled" : {
      "description" : "App Acceleration Enabled: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
      "type" : "boolean"
    },
    "prefer_lan_default_over_wan_default_route" : {
      "description" : "Prefer Lan Default Over Wan Default Route",
      "type" : "boolean"
    },
    "branch_gateway" : {
      "description" : "Branch Gateway",
      "type" : "boolean"
    },
    "perfmgmt_policysetstack_id" : {
      "description" : "Perfmgmt Policysetstack Id: Digits(fraction = 0, integer = 20, error = INVALID_PERFMGMT_POLICYSETSTACK_ID: Invalid performance management policy set stack id) Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
      "type" : "string"
    },
    "vrf_context_profile_id" : {
      "description" : "Vrf Context Profile Id",
      "type" : "string"
    },
    "multicast_peer_group_id" : {
      "description" : "Multicast Peer Group Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
      "type" : "string"
    },
    "security_policysetstack_id" : {
      "description" : "Security Policysetstack Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
      "type" : "string"
    },
    "extended_tags" : {
      "description" : "Extended Tags: Valid ListObject(allowDuplicate = false, allowEmpty = true, allowNull = true, listMaxSize = 10, message = INVALID_EXTENDED_TAG_SIZE_OR_DUPLICATE, required = false) ",
      "type" : "array",
      "items" : {
        "properties" : {
          "value" : {
            "description" : "Value",
            "type" : "string"
          },
          "key" : {
            "description" : "Key",
            "type" : "string"
          },
          "value_type" : {
            "description" : "Value Type",
            "type" : "string"
          }
        }
      }
    },
    "nat_policysetstack_id" : {
      "description" : "Nat Policysetstack Id: Digits(fraction = 0, integer = 20, error = INVALID_NAT_POLICYSETSTACK_ID: Invalid nat policy set stack id.) Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
      "type" : "string"
    },
    "priority_policysetstack_id" : {
      "description" : "Priority Policysetstack Id: Digits(fraction = 0, integer = 20, error = INVALID_PRIORITY_POLICYSETSTACK_ID: Invalid priority policy set stack id) ",
      "type" : "string"
    },
    "network_policysetstack_id" : {
      "description" : "Network Policysetstack Id: Digits(fraction = 0, integer = 20, error = INVALID_NETWORK_POLICYSETSTACK_ID: Invalid network policy set stack id) ",
      "type" : "string"
    },
    "service_binding" : {
      "description" : "Service Binding: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
      "type" : "string"
    },
    "security_policyset_id" : {
      "description" : "Security Policyset Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
      "type" : "string"
    },
    "element_cluster_role" : {
      "description" : "Element Cluster Role: Required(error = SITE_ROLE_MISSING: Site role missing.) ValidateEnum(enumClass = classOf[ElementClusterRole], message = Invalid enum string., nullAllowed = false) ",
      "type" : "string"
    },
    "policy_set_id" : {
      "description" : "Policy Set Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
      "type" : "string"
    },
    "location" : {
      "properties" : {
        "description" : {
          "description" : "Description",
          "type" : "string"
        },
        "latitude" : {
          "description" : "Latitude: Range(max = 90L, INVALID_LATITUDE_VALUE, min = -90L) ",
          "format" : "float",
          "type" : "number"
        },
        "longitude" : {
          "description" : "Longitude: Range(max = 180L, INVALID_LONGITUDE_VALUE, min = -180L) ",
          "format" : "float",
          "type" : "number"
        }
      }
    },
    "address" : {
      "properties" : {
        "country" : {
          "description" : "Country: Length(max = 100, , min = 0) ",
          "type" : "string"
        },
        "post_code" : {
          "description" : "Post Code: Length(max = 100, , min = 0) ",
          "type" : "string"
        },
        "state" : {
          "description" : "State: Length(max = 100, , min = 0) ",
          "type" : "string"
        },
        "city" : {
          "description" : "City: Length(max = 100, , min = 0) ",
          "type" : "string"
        },
        "street2" : {
          "description" : "Street2: Length(max = 100, , min = 0) ",
          "type" : "string"
        },
        "street" : {
          "description" : "Street: Length(max = 100, , min = 0) ",
          "type" : "string"
        }
      }
    },
    "admin_state" : {
      "description" : "Admin State: Required(error = SITE_ADMIN_STATE_MISSING: Site admin state missing.) ValidateEnum(enumClass = classOf[SiteState], message = Invalid enum string., nullAllowed = false) ",
      "type" : "string"
    },
    "tags" : {
      "description" : "Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 1024, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\\\s]+, required = false) ",
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
      "description" : "Description: Size(max = 1024, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0) ",
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
  "required" : [ "element_cluster_role", "admin_state", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site.my_resource_name"
 id="<resource_id>"
}
```

