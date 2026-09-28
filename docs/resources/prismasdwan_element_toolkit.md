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
      "description" : "Account Disable Interval",
      "format" : "int32",
      "maximum" : 60,
      "minimum" : 5,
      "type" : "integer"
    },
    "retry_login_count" : {
      "description" : "Retry Login Count",
      "format" : "int32",
      "maximum" : 20,
      "minimum" : 5,
      "type" : "integer"
    },
    "inactive_interval" : {
      "description" : "Inactive Interval",
      "format" : "int32",
      "maximum" : 60,
      "minimum" : 15,
      "type" : "integer"
    },
    "ssh_enabled" : {
      "description" : "Ssh Enabled",
      "type" : "boolean"
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
  "required" : [ "ssh_outbound_enabled", "otpkey_version", "account_disable_interval", "retry_login_count", "inactive_interval", "ssh_enabled", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_toolkit.my_resource_name"
 id="<resource_id>"
}
```

