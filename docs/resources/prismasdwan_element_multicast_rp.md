## Documentation for Prisma SDWAN Resource "element_multicast_rp"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_multicast_rp` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/multicastrps/{config_id}` (`MulticastRPConfigScreen`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/multicastrps` (`MulticastRPConfigScreen`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/multicastrps/{config_id}` (`MulticastRPConfigScreen`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/multicastrps/{config_id}` |


### JSON Schema

```json
{
  "properties" : {
    "groups" : {
      "description" : "Groups: Valid ListObject(allowDuplicate = true, allowEmpty = false, allowNull = false, listMaxSize = 1024, message = MULTICAST_INVALID_RP_CONFIG_GROUP_LIST, required = false) ",
      "type" : "array",
      "items" : {
        "properties" : {
          "ipv4_prefix" : {
            "description" : "Ipv4 Prefix",
            "type" : "string"
          },
          "name" : {
            "type" : "string"
          }
        }
      }
    },
    "ipv4_address" : {
      "description" : "Ipv4 Address: IPAddress(allowEmpty = false, allowLinkLocal = false, allowNull = false, bcast = DENY, defaultRoute = false, dnsCheck = false, message = MULTICAST_RP_CONFIG_INVALID_ADDRESS, type = IP) ",
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
  "required" : [ "groups", "ipv4_address", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_multicast_rp.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

