## Documentation for Prisma SDWAN Resource "element_routing_prefixlist"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_routing_prefixlist` |
| Get Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/routing_prefixlists/{routing_prefixlist_id}` (`RoutingPrefixListScreenV2N1`) |
| Post Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/routing_prefixlists` (`RoutingPrefixListScreenV2N1`) |
| Put Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/routing_prefixlists/{routing_prefixlist_id}` (`RoutingPrefixListScreenV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/routing_prefixlists/{routing_prefixlist_id}` |


### JSON Schema

```json
{
  "properties" : {
    "auto_generated" : {
      "description" : "Auto Generated",
      "type" : "boolean"
    },
    "prefix_filter_list" : {
      "description" : "Prefix Filter List: Valid Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "le" : {
            "description" : "Le: Range(max = 128L, error = PREFIX_FILTER_INVALID_OPERATOR_RANGE: Value for le or ge operator should be within the range 1-32 and 1-128 for IPv4 and IPv6 respectively , min = 0L) ",
            "format" : "int32",
            "type" : "integer"
          },
          "ge" : {
            "description" : "Ge: Range(max = 128L, error = PREFIX_FILTER_INVALID_OPERATOR_RANGE: Value for le or ge operator should be within the range 1-32 and 1-128 for IPv4 and IPv6 respectively , min = 0L) ",
            "format" : "int32",
            "type" : "integer"
          },
          "ipv6_prefix" : {
            "description" : "Ipv6 Prefix: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, IPV6_PREFIX_INVALID, type = GATEWAYCIDRV6) ",
            "type" : "string"
          },
          "prefix" : {
            "description" : "Prefix: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = PREFIXFILTER_INVALID_PREFIX: IP prefix is not valid OR not within the valid prefix range., type = PREFIXCIDR_ALL_1) ",
            "type" : "string"
          },
          "permit" : {
            "description" : "Permit",
            "type" : "boolean"
          },
          "order" : {
            "description" : "Order: Range(max = 65535L, PREFIX_LIST_INVALID_ORDER, min = 1L) ",
            "format" : "int32",
            "type" : "integer"
          }
        }
      }
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
  "required" : [ "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_routing_prefixlist.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

