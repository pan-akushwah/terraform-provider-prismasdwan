## Documentation for Prisma SDWAN Resource "external_ca_config"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `external_ca_config` |
| Get Api  | `/sdwan/v2.0/api/externalcaconfigs/{id}` (`CertificateAuthorityConfig`) |
| Post Api  | `/sdwan/v2.0/api/externalcaconfigs` (`CertificateAuthorityConfig`) |
| Put Api  | `/sdwan/v2.0/api/externalcaconfigs/{id}` (`CertificateAuthorityConfig`) |
| Delete Api  | `/sdwan/v2.0/api/externalcaconfigs/{id}` |


### JSON Schema

```json
{
  "properties" : {
    "scep_config" : {
      "properties" : {
        "https" : {
          "description" : "Https",
          "type" : "boolean"
        },
        "enrollment_uri" : {
          "description" : "Enrollment Uri",
          "type" : "string"
        },
        "challenge_uri" : {
          "description" : "Challenge Uri",
          "type" : "string"
        },
        "server_certificate" : {
          "description" : "Server Certificate",
          "type" : "string"
        },
        "num_challenge_passwords" : {
          "description" : "Num Challenge Passwords",
          "type" : "integer",
          "additionalProperties" : {
            "properties" : {
              "x_flag_sensitive" : {
                "type" : "boolean"
              }
            }
          }
        },
        "server_password" : {
          "description" : "Server Password",
          "type" : "string",
          "additionalProperties" : {
            "properties" : {
              "x_flag_sensitive" : {
                "type" : "boolean"
              }
            }
          }
        },
        "server_username" : {
          "description" : "Server Username",
          "type" : "string"
        },
        "server_primary_address" : {
          "description" : "Server Primary Address",
          "type" : "string"
        }
      }
    },
    "ca_sign_timeout" : {
      "description" : "Ca Sign Timeout: Required(message = required) Range(max = 300L, CA_SIGN_TIMEOUT_OUT_OF_RANGE, min = 10L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "manual_renew_trigger_threshold" : {
      "description" : "Manual Renew Trigger Threshold: Required(message = required) Range(max = 1440L, MANUAL_RENEW_TRIGGER_THRESHOLD_OUT_OF_RANGE, min = 5L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "renewal_window_from_expiry" : {
      "description" : "Renewal Window From Expiry: Required(message = required) Range(max = 90L, RENEWAL_WINDOW_FROM_EXPIRY_OUT_OF_RANGE, min = 30L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "type" : {
      "description" : "Type: Required(message = required) ValidateEnum(enumClass = classOf[CertificateAuthorityConfigType], message = Invalid enum string., nullAllowed = false) ",
      "type" : "string",
      "enum" : [ "LOCAL", "SCEP" ]
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
  "required" : [ "ca_sign_timeout", "manual_renew_trigger_threshold", "renewal_window_from_expiry", "type" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_external_ca_config.my_resource_name"
 id="<resource_id>"
}
```

