## Documentation for Prisma SDWAN Resource "site"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site` |
| Get Api  | `/sdwan/v4.13/api/sites/{site_id}` (`SiteScreenV4N13`) |
| Post Api  | `/sdwan/v4.13/api/sites` (`SiteScreenV4N13`) |
| Put Api  | `/sdwan/v4.13/api/sites/{site_id}` (`SiteScreenV4N13`) |
| Delete Api  | `/sdwan/v4.13/api/sites/{site_id}` |


### JSON Schema

```json
{
  "properties" : {
    "element_system_limit_profile_id" : {
      "description" : "Element System Limit Profile Id",
      "type" : "string"
    },
    "sgi_config" : {
      "properties" : {
        "sgi_tag" : {
          "description" : "Sgi Tag",
          "format" : "int32",
          "maximum" : 65533,
          "minimum" : 1,
          "type" : "integer"
        },
        "sgi_vendor_id" : {
          "description" : "Sgi Vendor Id",
          "type" : "string",
          "enum" : [ "SGI_VENDOR_ID_TYPE_8909" ]
        }
      },
      "required" : [ "sgi_tag", "sgi_vendor_id" ]
    },
    "app_acceleration_enabled" : {
      "description" : "App Acceleration Enabled",
      "type" : "boolean"
    },
    "prefer_lan_default_over_wan_default_route" : {
      "description" : "Prefer Lan Default Over Wan Default Route",
      "type" : "boolean"
    },
    "branch_gateway" : {
      "description" : "Branch Gateway",
      "type" : "boolean"
    },
    "perfmgmt_policysetstack_id" : {
      "description" : "Perfmgmt Policysetstack Id",
      "maxLength" : 20,
      "pattern" : "^-?[0-9]{1,20}$",
      "type" : "string"
    },
    "vrf_context_profile_id" : {
      "description" : "Vrf Context Profile Id",
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "multicast_peer_group_id" : {
      "description" : "Multicast Peer Group Id",
      "type" : "string"
    },
    "security_policysetstack_id" : {
      "description" : "Security Policysetstack Id",
      "type" : "string"
    },
    "extended_tags" : {
      "description" : "Extended Tags",
      "maxItems" : 10,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "properties" : {
          "value" : {
            "description" : "Value",
            "type" : "string"
          },
          "key" : {
            "description" : "Key",
            "type" : "string"
          },
          "value_type" : {
            "description" : "Value Type",
            "type" : "string"
          }
        },
        "required" : [ "value", "key", "value_type" ]
      }
    },
    "nat_policysetstack_id" : {
      "description" : "Nat Policysetstack Id",
      "maxLength" : 20,
      "pattern" : "^-?[0-9]{1,20}$",
      "type" : "string"
    },
    "priority_policysetstack_id" : {
      "description" : "Priority Policysetstack Id",
      "maxLength" : 20,
      "pattern" : "^-?[0-9]{1,20}$",
      "type" : "string"
    },
    "network_policysetstack_id" : {
      "description" : "Network Policysetstack Id",
      "maxLength" : 20,
      "pattern" : "^-?[0-9]{1,20}$",
      "type" : "string"
    },
    "service_binding" : {
      "description" : "Service Binding",
      "type" : "string"
    },
    "security_policyset_id" : {
      "description" : "Security Policyset Id",
      "type" : "string"
    },
    "element_cluster_role" : {
      "description" : "Element Cluster Role",
      "type" : "string",
      "enum" : [ "NONE", "HUB", "SPOKE", "PA_WE_BR", "PA_WE_DC", "PA_CONN" ]
    },
    "policy_set_id" : {
      "description" : "Policy Set Id",
      "type" : "string"
    },
    "location" : {
      "properties" : {
        "description" : {
          "description" : "Description",
          "type" : "string"
        },
        "latitude" : {
          "description" : "Latitude",
          "format" : "float",
          "maximum" : 90,
          "minimum" : -90,
          "type" : "number"
        },
        "longitude" : {
          "description" : "Longitude",
          "format" : "float",
          "maximum" : 180,
          "minimum" : -180,
          "type" : "number"
        }
      },
      "required" : [ "description", "latitude", "longitude" ]
    },
    "address" : {
      "properties" : {
        "country" : {
          "description" : "Country",
          "maxLength" : 100,
          "type" : "string"
        },
        "post_code" : {
          "description" : "Post Code",
          "maxLength" : 100,
          "type" : "string"
        },
        "state" : {
          "description" : "State",
          "maxLength" : 100,
          "type" : "string"
        },
        "city" : {
          "description" : "City",
          "maxLength" : 100,
          "type" : "string"
        },
        "street2" : {
          "description" : "Street2",
          "maxLength" : 100,
          "type" : "string"
        },
        "street" : {
          "description" : "Street",
          "maxLength" : 100,
          "type" : "string"
        }
      },
      "required" : [ "city", "country", "street2", "state", "street", "post_code" ]
    },
    "admin_state" : {
      "description" : "Admin State",
      "type" : "string",
      "enum" : [ "monitor", "active", "disabled" ]
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
      "maxLength" : 1024,
      "type" : "string"
    },
    "name" : {
      "description" : "Name",
      "maxLength" : 128,
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
  "required" : [ "element_system_limit_profile_id", "sgi_config", "app_acceleration_enabled", "prefer_lan_default_over_wan_default_route", "branch_gateway", "perfmgmt_policysetstack_id", "vrf_context_profile_id", "multicast_peer_group_id", "security_policysetstack_id", "extended_tags", "nat_policysetstack_id", "priority_policysetstack_id", "network_policysetstack_id", "service_binding", "security_policyset_id", "element_cluster_role", "policy_set_id", "location", "address", "admin_state", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site.my_resource_name"
 id="<resource_id>"
}
```

