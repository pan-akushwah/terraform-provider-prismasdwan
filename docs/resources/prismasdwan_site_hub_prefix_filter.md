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
      "description" : "Filters: Valid Embedded(concreteClass = classOf[Object], value = .) Required(PREFIXFILTER_REQUIRED) Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "type" : {
            "description" : "Type",
            "type" : "string"
          }
        }
      }
    },
    "prefix_filter_id" : {
      "description" : "Prefix Filter Id",
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

