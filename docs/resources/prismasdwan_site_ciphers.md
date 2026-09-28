## Documentation for Prisma SDWAN Resource "site_ciphers"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_ciphers` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/siteciphers` (`SiteCipherScreenV2N1`) |
| Put Api  | `/sdwan/v2.1/api/sites/{site_id}/siteciphers` (`SiteCipherScreenV2N1`) |


### JSON Schema

```json
{
  "properties" : {
    "tls13_controller_connection_cipher" : {
      "description" : "Tls13 Controller Connection Cipher",
      "type" : "string",
      "enum" : [ "TLS_AES_256_GCM_SHA384", "TLS_CHACHA20_POLY1305_SHA256", "TLS_AES_128_GCM_SHA256" ]
    },
    "tls13_enabled" : {
      "description" : "Tls13 Enabled",
      "type" : "boolean"
    },
    "controller_connection_cipher" : {
      "description" : "Controller Connection Cipher",
      "type" : "string",
      "enum" : [ "RSA-AES256-GCM-SHA384", "RSA-AES128-GCM-SHA256" ]
    },
    "vpn_ciphers" : {
      "description" : "Vpn Ciphers",
      "maxItems" : 4,
      "type" : "array",
      "items" : {
        "description" : "Vpn Ciphers",
        "type" : "string",
        "enum" : [ "AES_256_GCM", "AES_256_CBC", "AES_128_GCM", "AES_128_CBC" ]
      }
    },
    "site_id" : {
      "description" : "Site Id",
      "maxLength" : 50,
      "pattern" : "^-?[0-9]{1,50}$",
      "type" : "string"
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
  "required" : [ "tls13_controller_connection_cipher", "tls13_enabled", "controller_connection_cipher", "vpn_ciphers", "site_id", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_ciphers.my_resource_name"
 id="<resource_id>"
}
```

