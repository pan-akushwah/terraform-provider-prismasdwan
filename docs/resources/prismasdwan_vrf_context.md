## Documentation for Prisma SDWAN Resource "vrf_context"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `vrf_context` |
| Get Api  | `/sdwan/v2.0/api/vrfcontexts/{vrf_context_id}` (`VRFContextScreen`) |
| Post Api  | `/sdwan/v2.0/api/vrfcontexts` (`VRFContextScreen`) |
| Put Api  | `/sdwan/v2.0/api/vrfcontexts/{vrf_context_id}` (`VRFContextScreen`) |
| Delete Api  | `/sdwan/v2.0/api/vrfcontexts/{vrf_context_id}` |


### JSON Schema

```json
{
  "properties" : {
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
      "description" : "Description: Size(max = 256, error = VRF_CONTEXT_CONFIG_DESCRIPTION_INVALID: Vrf context config description invalid., min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: NotBlank(error = VRF_CONTEXT_NAME_INVALID: Vrf context config name required) Size(max = 128, error = VRF_CONTEXT_NAME_EXCEEDS_LIMIT: Vrf Context Name exceeds limit, min = 0) Pattern(error = VRF_CONTEXT_NAME_INVALID: Vrf context config name required, regexp = ^[A-Za-z][A-Za-z0-9_\\\\s-]*$) ",
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
  "required" : [ "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_vrf_context.my_resource_name"
 id="<resource_id>"
}
```

