## Documentation for Prisma SDWAN Resource "element_toolkit"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_toolkit` |
| Get Api  | `/sdwan/v2.2/api/elements/{element_id}/elementaccessconfigs` (`ElementAccessConfigScreenV2N2`) |
| Put Api  | `/sdwan/v2.2/api/elements/{element_id}/elementaccessconfigs/{element_access_id}` (`ElementAccessConfigScreenV2N2`) |


### JSON Schema

```json
{
  "properties" : {
    "ssh_outbound_enabled" : {
      "description" : "Ssh Outbound Enabled",
      "type" : "boolean"
    },
    "otpkey_version" : {
      "description" : "Otpkey Version",
      "format" : "int32",
      "type" : "integer"
    },
    "account_disable_interval" : {
      "description" : "Account Disable Interval: Range(max = 60L, error = ELEMENT_ACCESS_CONFIG_INVALID_ACCOUNT_DISABLE_INTERVAL: Invalid account disable interval value, it should be in range 5-60., min = 5L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "retry_login_count" : {
      "description" : "Retry Login Count: Range(max = 20L, error = ELEMENT_ACCESS_CONFIG_INVALID_RETRY_LOGIN_COUNT: Invalid retry login count value, it should be in range 5-20., min = 5L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "inactive_interval" : {
      "description" : "Inactive Interval: Range(max = 60L, error = ELEMENT_ACCESS_CONFIG_INVALID_INACTIVE_INTERVAL: Invalid inactive interval value, it should be in range 15-60., min = 15L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "ssh_enabled" : {
      "description" : "Ssh Enabled",
      "type" : "boolean"
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
  }
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_toolkit.my_resource_name"
 id="<resource_id>"
}
```

