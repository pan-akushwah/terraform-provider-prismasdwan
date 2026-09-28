## Documentation for Prisma SDWAN Resource "element_ospf_config"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_ospf_config` |
| Get Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/ospfconfigs/{ospf_config_id}` (`OspfConfigScreenV2N1`) |
| Post Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/ospfconfigs` (`OspfConfigScreenV2N1`) |
| Put Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/ospfconfigs/{ospf_config_id}` (`OspfConfigScreenV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/sites/{site_id}/elements/{element_id}/ospfconfigs/{ospf_config_id}` |


### JSON Schema

```json
{
  "properties" : {
    "cost_for_default_route" : {
      "description" : "Cost For Default Route",
      "maximum" : 16777214,
      "minimum" : 0,
      "type" : "integer"
    },
    "advertise_fabric_default_route" : {
      "description" : "Advertise Fabric Default Route",
      "type" : "boolean"
    },
    "interfaces" : {
      "description" : "Interfaces",
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
            },
            "required" : [ "dead_interval", "hello_interval", "transmit_delay", "retransmit_interval", "cost", "md5_secret", "md5_key_id" ]
          },
          "area_id" : {
            "description" : "Area Id",
            "type" : "integer"
          },
          "interface_id" : {
            "description" : "Interface Id",
            "type" : "string"
          }
        },
        "required" : [ "ospf_config_override", "area_id", "interface_id" ]
      }
    },
    "areas" : {
      "description" : "Areas",
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
        },
        "required" : [ "area_type", "area_id" ]
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
      "description" : "Router Id",
      "format" : "ipv4",
      "type" : "string"
    },
    "vrf_context_id" : {
      "description" : "Vrf Context Id",
      "maxLength" : 20,
      "pattern" : "^-?[0-9]{1,20}$",
      "type" : "string"
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
  "required" : [ "cost_for_default_route", "advertise_fabric_default_route", "interfaces", "areas", "shutdown", "scope", "redistribute_route_map_id", "redistribute_bgp", "prefix_adv_route_map_id", "prefix_adv_type_to_lan", "router_id", "vrf_context_id", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_ospf_config.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

