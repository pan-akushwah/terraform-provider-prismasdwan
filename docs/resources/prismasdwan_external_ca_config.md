## Documentation for Prisma SDWAN Resource "external_ca_config"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `external_ca_config` |
| Get Api  | `/sdwan/v2.0/api/externalcaconfigs/{externalcaconfig_id}` (`CertificateAuthorityConfig`) |
| Post Api  | `/sdwan/v2.0/api/externalcaconfigs` (`CertificateAuthorityConfig`) |
| Put Api  | `/sdwan/v2.0/api/externalcaconfigs/{externalcaconfig_id}` (`CertificateAuthorityConfig`) |
| Delete Api  | `/sdwan/v2.0/api/externalcaconfigs/{externalcaconfig_id}` |


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
          "type" : "integer"
        },
        "server_password" : {
          "description" : "Server Password",
          "type" : "string"
        },
        "server_username" : {
          "description" : "Server Username",
          "type" : "string"
        },
        "server_primary_address" : {
          "description" : "Server Primary Address",
          "type" : "string"
        }
      },
      "required" : [ "https", "enrollment_uri", "challenge_uri", "server_certificate", "num_challenge_passwords", "server_password", "server_username", "server_primary_address" ]
    },
    "ca_sign_timeout" : {
      "description" : "Ca Sign Timeout",
      "format" : "int32",
      "maximum" : 300,
      "minimum" : 10,
      "type" : "integer"
    },
    "manual_renew_trigger_threshold" : {
      "description" : "Manual Renew Trigger Threshold",
      "format" : "int32",
      "maximum" : 1440,
      "minimum" : 5,
      "type" : "integer"
    },
    "renewal_window_from_expiry" : {
      "description" : "Renewal Window From Expiry",
      "format" : "int32",
      "maximum" : 90,
      "minimum" : 30,
      "type" : "integer"
    },
    "type" : {
      "description" : "Type",
      "type" : "string",
      "enum" : [ "LOCAL", "SCEP" ]
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
    },
    "id" : {
      "description" : "Id",
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
    }
  },
  "required" : [ "scep_config", "ca_sign_timeout", "manual_renew_trigger_threshold", "renewal_window_from_expiry", "type", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_external_ca_config.my_resource_name"
 id="<resource_id>"
}
```

