## Documentation for Prisma SDWAN Resource "wan_network"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `wan_network` |
| Get Api  | `/sdwan/v2.1/api/wannetworks/{wan_network_id}` (`WANNetworkScreenV2N1`) |
| Post Api  | `/sdwan/v2.1/api/wannetworks` (`WANNetworkScreenV2N1`) |
| Put Api  | `/sdwan/v2.1/api/wannetworks/{wan_network_id}` (`WANNetworkScreenV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/wannetworks/{wan_network_id}` |


### JSON Schema

```json
{
  "properties" : {
    "provider_as_numbers" : {
      "description" : "Provider As Numbers: ListNumber(duplicate = true, max = 65535, error = WAN_CONFIG_PROVIDER_AS_OUT_OF_RANGE: AS numbers of the private network is not within 1-65535., min = 1) ",
      "type" : "array",
      "items" : {
        "description" : "Provider As Numbers",
        "type" : "integer"
      }
    },
    "type" : {
      "description" : "Type: Required(error = NETWORK_TYPE_REQUIRED: WAN Network type (publicwan | privatewan) is a mandatory attribute.) ValidateEnum(enumClass = classOf[WANNetworkType], message = Invalid enum string., nullAllowed = false) ",
      "type" : "string",
      "enum" : [ "PUBLIC_WAN", "PRIVATE_WAN" ]
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
      "description" : "Name: Required(NAME_REQUIRED) Size(max = 128, WANNETWORK_NAME_INVALID_0001, min = 0) ",
      "type" : "string"
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
  },
  "required" : [ "type", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_wan_network.my_resource_name"
 id="<resource_id>"
}
```

