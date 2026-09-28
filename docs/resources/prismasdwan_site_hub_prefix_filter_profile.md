## Documentation for Prisma SDWAN Resource "site_hub_prefix_filter_profile"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_hub_prefix_filter_profile` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/pathprefixdistributionfilters/{pathprefixdistributionfilter_id}` (`PathPrefixDistributionFilters`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/pathprefixdistributionfilters` (`PathPrefixDistributionFilters`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/pathprefixdistributionfilters/{pathprefixdistributionfilter_id}` (`PathPrefixDistributionFilters`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/pathprefixdistributionfilters/{pathprefixdistributionfilter_id}` |


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
            "description" : "Path Prefix Filters",
            "type" : "array",
            "items" : {
              "properties" : {
                "ipv6_prefix" : {
                  "description" : "Ipv6 Prefix",
                  "format" : "ipv4",
                  "type" : "string"
                },
                "ipv4_prefix" : {
                  "description" : "Ipv4 Prefix",
                  "format" : "ipv4",
                  "type" : "string"
                },
                "permit" : {
                  "description" : "Permit",
                  "type" : "boolean"
                },
                "order" : {
                  "description" : "Order",
                  "format" : "int32",
                  "maximum" : 65535,
                  "minimum" : 1,
                  "type" : "integer"
                }
              },
              "required" : [ "ipv6_prefix", "ipv4_prefix", "permit", "order" ]
            }
          },
          "vrf_context_id" : {
            "description" : "Vrf Context Id",
            "type" : "string"
          }
        },
        "required" : [ "path_prefix_filters", "vrf_context_id" ]
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
  "required" : [ "path_prefix_filter_list", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_hub_prefix_filter_profile.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

