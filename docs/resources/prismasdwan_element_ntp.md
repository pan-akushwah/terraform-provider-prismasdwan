## Documentation for Prisma SDWAN Resource "element_ntp"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_ntp` |
| Get Api  | `/sdwan/v2.1/api/elements/{element_id}/ntp/{ntp_id}` (`ElementNTPV2N1`) |
| Put Api  | `/sdwan/v2.1/api/elements/{element_id}/ntp/{ntp_id}` (`ElementNTPV2N1`) |


### JSON Schema

```json
{
  "properties" : {
    "source_interface_ids" : {
      "description" : "Source Interface Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 10, error = NTP_CONFIG_INVALID_INTERFACE_IDS: Source interface ids cannot be empty and should be valid.Interface ids should not be port that is part of logical interface group like bypass pair., noTrim = false, regex = , required = false) ",
      "type" : "array",
      "items" : {
        "description" : "Source Interface Ids",
        "type" : "string"
      }
    },
    "ntp_servers" : {
      "description" : "Ntp Servers: NotEmpty(error = NTP_CONFIG_INVALID_SERVER_SIZE: A minimum of 1 and a maximum of 10 NTP servers can be configured.) Size(max = 10, error = NTP_CONFIG_INVALID_SERVER_SIZE: A minimum of 1 and a maximum of 10 NTP servers can be configured., min = 1) Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "max_poll" : {
            "description" : "Max Poll: Required(message = required) ValidateDecimal(allowZero = false, increment = 0, max = 0, error = NTP_CONFIG_INVALID_MAXPOLL_VALUE: The range for maximum poll values is between 4-17., min = 0) ",
            "format" : "int32",
            "type" : "integer"
          },
          "min_poll" : {
            "description" : "Min Poll: Required(message = required) ValidateDecimal(allowZero = false, increment = 0, max = 0, error = NTP_CONFIG_INVALID_MINPOLL_VALUE: The range for minimum poll values is between 4-17., min = 0) ",
            "format" : "int32",
            "type" : "integer"
          },
          "version" : {
            "description" : "Version: Required(message = required) ValidateDecimal(allowZero = false, increment = 0, max = 0, error = NTP_CONFIG_INVALID_VERSION: Allowed versions are 2,3 & 4., min = 0) ",
            "format" : "int32",
            "type" : "integer"
          },
          "host" : {
            "description" : "Host: ValidateHostName(allowNull = false, error = NTP_CONFIG_INVALID_HOST: Host can be only domain name or IP address.) ",
            "type" : "string"
          }
        },
        "required" : [ "max_poll", "min_poll", "version", "host" ]
      }
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
      "description" : "Description: Size(max = 256, error = NTP_CONFIG_DESCRIPTION_INVALID: NTP description is invalid. The maximum length is 256., min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: NotEmpty(error = NTP_CONFIG_NAME_REQD: Name is mandatory for NTP configuration.) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
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
  "required" : [ "ntp_servers", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_ntp.my_resource_name"
 id="<resource_id>"
}
```

