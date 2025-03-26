## Documentation for Prisma SDWAN Resource "idps"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `idps` |
| Get Api  | `/sdwan/v3.3/api/idps/{idp_id}` (`IdpV3N3`) |
| Post Api  | `/sdwan/v3.3/api/idps` (`IdpV3N3`) |
| Put Api  | `/sdwan/v3.3/api/idps/{idp_id}` (`IdpV3N3`) |
| Delete Api  | `/sdwan/v3.3/api/idps/{idp_id}` |


### JSON Schema

```json
{
  "properties" : {
    "match_email_domain" : {
      "description" : "Match Email Domain",
      "type" : "boolean"
    },
    "is_hob" : {
      "description" : "Is Hob",
      "type" : "boolean"
    },
    "sign_redirect_binding" : {
      "description" : "Sign Redirect Binding",
      "type" : "boolean"
    },
    "auto_provision_roles" : {
      "description" : "Auto Provision Roles",
      "type" : "boolean"
    },
    "auto_provision_operators" : {
      "description" : "Auto Provision Operators",
      "type" : "boolean"
    },
    "session_timeout_s" : {
      "description" : "Session Timeout S: Range(max = 2147483646L, error = SSO_INVALID_SESSION_TIMEOUT_SEC: Invalid range {validatedValue}. Please use a range between 180 to 2147483646 inclusive, min = 180L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "role_map" : {
      "type" : "object"
    },
    "sp_metadata_b64" : {
      "description" : "Sp Metadata B64: Length(max = 1000000, error = SSO_INVALID_SP_METADATA_B64: Invalid size for service provide metadata, min = 1) ",
      "type" : "string"
    },
    "sp_x509_b64" : {
      "description" : "Sp X509 B64: Length(max = 100000, error = SSO_INVALID_SP_X509_B64: Invalid size for service provide x509 cert, min = 1) ",
      "type" : "string"
    },
    "sp_x509_serial_no" : {
      "description" : "Sp X509 Serial No: Length(max = 1024, error = SSO_INVALID_SP_X509_SERIAL_NO: Invalid size for service provide x509 serial no, min = 1) Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = true), sparse = false, unique = false, value = ASC) ",
      "type" : "string"
    },
    "idp_metadata_b64" : {
      "description" : "Idp Metadata B64: Length(max = 1000000, error = SSO_INVALID_IDP_METADATA_B64: Invalid size for IdP metadata, min = 1) ",
      "type" : "string"
    },
    "idp_logout_url" : {
      "description" : "Idp Logout Url: Length(max = 2048, error = SSO_INVALID_IDP_LOGOUT_URL: Invalid size for logout url, min = 1) ",
      "type" : "string"
    },
    "idp_login_url" : {
      "description" : "Idp Login Url: Length(max = 2048, error = SSO_INVALID_IDP_SSO_URL: Invalid size for IdP single sign on Url, min = 1) ",
      "type" : "string"
    },
    "idp_entity_id" : {
      "description" : "Idp Entity Id: Length(max = 2048, error = SSO_INVALID_IDP_ENTITY_ID: Invalid size for entity id in metadata, min = 1) NotEmpty(error = SSO_EMPTY_IDP_ENTITY_ID: Provide entity id for IdP) ",
      "type" : "string"
    },
    "idp_domain_admin_email" : {
      "description" : "Idp Domain Admin Email: Length(max = 1024, error = SSO_INVALID_IDP_DOMAIN_ADMIN_EMAIL: Provide a valid admin email for IdP domain, min = 1) NotEmpty(error = SSO_EMPTY_IDP_DOMAIN_ADMIN_EMAIL: Provide an admin email for IdP) ",
      "type" : "string"
    },
    "idp_domains" : {
      "description" : "Idp Domains: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 128, listMaxSize = 100, error = SSO_INVALID_IDP_EMAIL_DOMAIN: Provide valid and unique IdP domain(s), all in lowercase and consist of letters and numbers only, noTrim = false, regex = [0-9a-z._-]+, required = false) ",
      "type" : "array",
      "items" : {
        "description" : "Idp Domains",
        "type" : "string"
      }
    },
    "disabled_reason" : {
      "description" : "Disabled Reason: Size(max = 5000, DISABLED_REASON_INVALID_0001, min = 0) Size(max = 5000, DISABLED_REASON_INVALID_0001, min = 0) ",
      "type" : "string"
    },
    "disabled" : {
      "description" : "Disabled",
      "type" : "boolean"
    },
    "inactive_reason" : {
      "description" : "Inactive Reason: Size(max = 5000, INACTIVE_REASON_INVALID_0001, min = 0) Size(max = 5000, INACTIVE_REASON_INVALID_0001, min = 0) ",
      "type" : "string"
    },
    "inactive" : {
      "description" : "Inactive",
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
  },
  "required" : [ "idp_entity_id", "idp_domain_admin_email" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_idps.my_resource_name"
 id="<resource_id>"
}
```

