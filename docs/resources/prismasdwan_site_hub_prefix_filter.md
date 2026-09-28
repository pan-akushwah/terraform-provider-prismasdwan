## Documentation for Prisma SDWAN Resource "site_hub_prefix_filter"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_hub_prefix_filter` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/prefixfilters/{filter_id}` (`PrefixFilterAssociation`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/prefixfilters` (`PrefixFilterAssociation`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/prefixfilters/{filter_id}` (`PrefixFilterAssociation`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/prefixfilters/{filter_id}` |


### JSON Schema

```json
{
  "properties" : {
    "filters" : {
      "description" : "Filters: Valid Required(PREFIXFILTER_REQUIRED) Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "ip_prefixes" : {
            "description" : "Ip Prefixes: ListIPAddress(bcast = DENY, listMaxSize = 0, error = PREFIXFILTER_INVALID_PREFIX: IP prefix is not valid OR not within the valid prefix range., required = false, type = APP1_GATEWAYCIDR) ",
            "type" : "array",
            "items" : {
              "description" : "Ip Prefixes",
              "type" : "string"
            }
          },
          "type" : {
            "description" : "Type",
            "type" : "string"
          },
          "wn_path" : {
            "description" : "Wn Path",
            "type" : "array",
            "items" : {
              "description" : "Wn Path",
              "type" : "string"
            }
          },
          "path" : {
            "description" : "Path",
            "type" : "array",
            "items" : {
              "description" : "Path",
              "type" : "string"
            }
          },
          "site" : {
            "description" : "Site",
            "type" : "object"
          },
          "elements" : {
            "description" : "Elements",
            "type" : "array",
            "items" : {
              "description" : "Elements",
              "type" : "string"
            }
          }
        }
      }
    },
    "prefix_filter_id" : {
      "description" : "Prefix Filter Id",
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
  "required" : [ "filters" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_hub_prefix_filter.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

