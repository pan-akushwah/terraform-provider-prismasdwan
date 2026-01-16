## Documentation for Prisma SDWAN Resource "element_ospf_config"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_ospf_config` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/ospfconfigs/{ospf_config_id}` (`OspfConfigScreen`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/ospfconfigs` (`OspfConfigScreen`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/ospfconfigs/{ospf_config_id}` (`OspfConfigScreen`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/ospfconfigs/{ospf_config_id}` |


### JSON Schema

```json
{
  "properties" : {
    "interfaces" : {
      "description" : "Interfaces: Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "ospf_config_override" : {
            "properties" : {
              "dead_interval" : {
                "description" : "Dead Interval",
                "type" : "integer"
              },
              "hello_interval" : {
                "description" : "Hello Interval",
                "type" : "integer"
              },
              "transmit_delay" : {
                "description" : "Transmit Delay",
                "type" : "integer"
              },
              "retransmit_interval" : {
                "description" : "Retransmit Interval",
                "type" : "integer"
              },
              "cost" : {
                "description" : "Cost",
                "type" : "integer"
              },
              "md5_secret" : {
                "description" : "Md5 Secret",
                "type" : "string",
                "additionalProperties" : {
                  "properties" : {
                    "x_flag_sensitive" : {
                      "type" : "boolean"
                    }
                  }
                }
              },
              "md5_key_id" : {
                "description" : "Md5 Key Id",
                "type" : "integer"
              }
            }
          },
          "area_id" : {
            "description" : "Area Id",
            "type" : "integer"
          },
          "interface_id" : {
            "description" : "Interface Id",
            "type" : "string"
          }
        }
      }
    },
    "areas" : {
      "description" : "Areas: Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "area_type" : {
            "description" : "Area Type",
            "type" : "string",
            "enum" : [ "NORMAL", "STUB", "NSSA" ]
          },
          "area_id" : {
            "description" : "Area Id",
            "type" : "integer"
          }
        }
      }
    },
    "shutdown" : {
      "description" : "Shutdown",
      "type" : "boolean"
    },
    "scope" : {
      "description" : "Scope",
      "type" : "string"
    },
    "redistribute_route_map_id" : {
      "description" : "Redistribute Route Map Id",
      "type" : "string"
    },
    "redistribute_bgp" : {
      "description" : "Redistribute Bgp",
      "type" : "boolean"
    },
    "prefix_adv_route_map_id" : {
      "description" : "Prefix Adv Route Map Id",
      "type" : "string"
    },
    "prefix_adv_type_to_lan" : {
      "description" : "Prefix Adv Type To Lan",
      "type" : "string"
    },
    "router_id" : {
      "description" : "Router Id: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, message = OSPF_CONFIG_INVALID_ROUTER_ID, type = IP) ",
      "type" : "string"
    },
    "vrf_context_id" : {
      "description" : "Vrf Context Id: Digits(fraction = 0, integer = 20, error = VRF_CONTEXT_ID_INVALID: VRF Context ID is empty or invalid.) NotNull(message = OSPF_CONFIG_NO_VRF_CONTEXT) ",
      "type" : "string"
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
  "required" : [ "vrf_context_id", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_ospf_config.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

