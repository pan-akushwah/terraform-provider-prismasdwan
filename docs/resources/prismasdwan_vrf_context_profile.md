## Documentation for Prisma SDWAN Resource "vrf_context_profile"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `vrf_context_profile` |
| Get Api  | `/sdwan/v2.0/api/vrfcontextprofiles/{vrf_context_profile_id}` (`VRFContextProfileScreen`) |
| Post Api  | `/sdwan/v2.0/api/vrfcontextprofiles` (`VRFContextProfileScreen`) |
| Put Api  | `/sdwan/v2.0/api/vrfcontextprofiles/{vrf_context_profile_id}` (`VRFContextProfileScreen`) |
| Delete Api  | `/sdwan/v2.0/api/vrfcontextprofiles/{vrf_context_profile_id}` |


### JSON Schema

```json
{
  "properties" : {
    "vrf_context_route_leak_rules" : {
      "description" : "Vrf Context Route Leak Rules: Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "ipv4_prefixes" : {
            "description" : "Ipv4 Prefixes",
            "type" : "array",
            "items" : {
              "description" : "Ipv4 Prefixes",
              "type" : "string"
            }
          },
          "dest_vrf_context_id" : {
            "description" : "Dest Vrf Context Id",
            "type" : "string"
          },
          "src_vrf_context_id" : {
            "description" : "Src Vrf Context Id",
            "type" : "string"
          },
          "description" : {
            "description" : "Description",
            "type" : "string"
          },
          "name" : {
            "description" : "Name",
            "type" : "string"
          }
        }
      }
    },
    "vrf_context_ids" : {
      "description" : "Vrf Context Ids: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, INVALID_STRING, noTrim = false, regex = , required = false) ",
      "type" : "array",
      "items" : {
        "description" : "Vrf Context Ids",
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
    "default_vrf_context_profile" : {
      "description" : "Default Vrf Context Profile: JsonIgnore(value = true) ",
      "type" : "boolean"
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
      "description" : "Description: Size(max = 256, error = VRF_CONTEXT_PROFILE_DESCRIPTION_INVALID: Vrf profile description exceeds limit, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: NotBlank(error = VRF_CONTEXT_PROFILE_NAME_INVALID: Vrf context profile name is invalid) Size(max = 128, error = VRF_CONTEXT_PROFILE_NAME_EXCEEDS_LIMIT: Vrf context profile name exceeds limit, min = 0) Pattern(error = VRF_CONTEXT_PROFILE_NAME_INVALID: Vrf context profile name is invalid, regexp = ^[A-Za-z][A-Za-z0-9_\\\\s-]*$) ",
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
 to="prismasdwan_vrf_context_profile.my_resource_name"
 id="<resource_id>"
}
```

