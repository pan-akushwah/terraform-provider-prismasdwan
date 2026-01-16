## Documentation for Prisma SDWAN Resource "site_hub_prefix_filter_profile"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_hub_prefix_filter_profile` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/pathprefixdistributionfilters/{id}` (`PathPrefixDistributionFilters`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/pathprefixdistributionfilters` (`PathPrefixDistributionFilters`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/pathprefixdistributionfilters/{id}` (`PathPrefixDistributionFilters`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/pathprefixdistributionfilters/{id}` |


### JSON Schema

```json
{
  "properties" : {
    "path_prefix_filter_list" : {
      "description" : "Path Prefix Filter List",
      "type" : "array",
      "items" : {
        "properties" : {
          "path_prefix_filters" : {
            "description" : "Path Prefix Filters: Valid ",
            "type" : "array",
            "items" : {
              "properties" : {
                "ipv6_prefix" : {
                  "description" : "Ipv6 Prefix: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = PATH_PREFIX_DISTRIBUTION_FILTERS_INVALID_IPV6_PREFIX: Path Prefix distribution filter has invalid ipv6 prefix., type = GATEWAYCIDRV6) ",
                  "type" : "string"
                },
                "ipv4_prefix" : {
                  "description" : "Ipv4 Prefix: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = PATH_PREFIX_DISTRIBUTION_FILTERS_INVALID_IPV4_PREFIX: Path Prefix distribution filter has invalid ipv4 prefix., type = PREFIXCIDR_ALL_1) ",
                  "type" : "string"
                },
                "permit" : {
                  "description" : "Permit",
                  "type" : "boolean"
                },
                "order" : {
                  "description" : "Order: Range(max = 65535L, error = PATH_PREFIX_DISTRIBUTION_FILTERS_INVALID_ORDER: Order needs to be in range of 1 - 65535 for Path Prefix distribution filter., min = 1L) ",
                  "format" : "int32",
                  "type" : "integer"
                }
              }
            }
          },
          "vrf_context_id" : {
            "description" : "Vrf Context Id",
            "type" : "string"
          }
        }
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
      "description" : "Description",
      "type" : "string"
    },
    "name" : {
      "description" : "Name",
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
  }
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_hub_prefix_filter_profile.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

