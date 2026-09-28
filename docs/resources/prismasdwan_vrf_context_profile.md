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
      "description" : "Vrf Context Route Leak Rules",
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
        },
        "required" : [ "ipv4_prefixes", "dest_vrf_context_id", "src_vrf_context_id", "description", "name" ]
      }
    },
    "vrf_context_ids" : {
      "description" : "Vrf Context Ids",
      "type" : "array",
      "uniqueItems" : true,
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
      "description" : "Default Vrf Context Profile",
      "readOnly" : true,
      "type" : "boolean",
      "x-json-ignore" : true
    },
    "tags" : {
      "description" : "Tags",
      "maxItems" : 10,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Tags",
        "maxLength" : 1024,
        "pattern" : "[^,\\s]+",
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
      "maxLength" : 256,
      "type" : "string"
    },
    "name" : {
      "description" : "Name",
      "maxLength" : 128,
      "minLength" : 1,
      "pattern" : "^[A-Za-z][A-Za-z0-9_\\s-]*$",
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
  "required" : [ "vrf_context_route_leak_rules", "vrf_context_ids", "default_vrf_context_profile", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_vrf_context_profile.my_resource_name"
 id="<resource_id>"
}
```

