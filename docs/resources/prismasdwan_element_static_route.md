## Documentation for Prisma SDWAN Resource "element_static_route"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_static_route` |
| Get Api  | `/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/staticroutes/{static_route_id}` (`StaticRouteV2N3`) |
| Post Api  | `/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/staticroutes` (`StaticRouteV2N3`) |
| Put Api  | `/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/staticroutes/{static_route_id}` (`StaticRouteV2N3`) |
| Delete Api  | `/sdwan/v2.3/api/sites/{site_id}/elements/{element_id}/staticroutes/{static_route_id}` |


### JSON Schema

```json
{
  "properties" : {
    "vrf_context_id" : {
      "description" : "Vrf Context Id",
      "type" : "string"
    },
    "address_family" : {
      "description" : "Address Family: ValidateEnum(enumClass = classOf[IPAddressFamily], error = STATICROUTE_CONFIG_ADDRESS_FAMILY_INVALID: Static Route address family is invalid., nullAllowed = false) ",
      "type" : "string"
    },
    "nexthop_reachability_probe" : {
      "description" : "Nexthop Reachability Probe",
      "type" : "boolean"
    },
    "network_context_id" : {
      "description" : "Network Context Id",
      "type" : "string"
    },
    "scope" : {
      "description" : "Scope: ValidateEnum(enumClass = classOf[NetworkScope], message = Invalid enum string., nullAllowed = false) ",
      "type" : "string",
      "enum" : [ "GLOBAL", "LOCAL" ]
    },
    "nexthops" : {
      "description" : "Nexthops: Required(message = required) Size(max = 8, NEXTHOPLIST_SIZE_EXCEEDED, min = 0) Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "self" : {
            "description" : "Self",
            "type" : "boolean"
          },
          "admin_distance" : {
            "description" : "Admin Distance",
            "type" : "integer"
          },
          "nexthop_interface_id" : {
            "description" : "Nexthop Interface Id",
            "type" : "string"
          },
          "nexthop_ip" : {
            "description" : "Nexthop Ip",
            "type" : "string"
          }
        }
      }
    },
    "destination_prefix" : {
      "description" : "Destination Prefix: Required(DESTINATION_PREFIX_REQD) ",
      "type" : "string"
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
      "description" : "Description: Size(max = 256, error = DESCRIPTION_SIZE_EXCEEDED: Description size exceeded., min = 0) Valid ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
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
  "required" : [ "address_family", "scope", "nexthops", "destination_prefix" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_static_route.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

