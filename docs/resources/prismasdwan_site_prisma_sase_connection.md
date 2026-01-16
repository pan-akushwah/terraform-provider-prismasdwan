## Documentation for Prisma SDWAN Resource "site_prisma_sase_connection"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_prisma_sase_connection` |
| Get Api  | `/sdwan/v2.1/api/sites/{site_id}/prismasase_connections/{prismasase_connection_id}` (`SaseConnectionScreenV2N1`) |
| Post Api  | `/sdwan/v2.1/api/sites/{site_id}/prismasase_connections` (`SaseConnectionScreenV2N1`) |
| Put Api  | `/sdwan/v2.1/api/sites/{site_id}/prismasase_connections/{prismasase_connection_id}` (`SaseConnectionScreenV2N1`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/prismasase_connections/{prismasase_connection_id}` |


### JSON Schema

```json
{
  "properties" : {
    "license_type" : {
      "description" : "License Type",
      "type" : "string"
    },
    "remote_network_groups" : {
      "description" : "Remote Network Groups",
      "type" : "array",
      "items" : {
        "properties" : {
          "ipsec_tunnels" : {
            "description" : "Ipsec Tunnels",
            "type" : "array",
            "items" : {
              "properties" : {
                "routing_configs" : {
                  "properties" : {
                    "bgp_secret" : {
                      "description" : "Bgp Secret",
                      "type" : "string",
                      "additionalProperties" : {
                        "properties" : {
                          "x_flag_sensitive" : {
                            "type" : "boolean"
                          }
                        }
                      }
                    },
                    "advertise_default_route" : {
                      "description" : "Advertise Default Route",
                      "type" : "boolean"
                    },
                    "export_routes" : {
                      "description" : "Export Routes",
                      "type" : "boolean"
                    },
                    "summarize_mobile_routes_before_advertise" : {
                      "description" : "Summarize Mobile Routes Before Advertise",
                      "type" : "boolean"
                    }
                  }
                },
                "routing" : {
                  "properties" : {
                    "prismaaccess_ip_address" : {
                      "description" : "Prismaaccess Ip Address",
                      "type" : "string"
                    },
                    "branch_as_number" : {
                      "description" : "Branch As Number",
                      "type" : "string"
                    },
                    "branch_ip_address" : {
                      "description" : "Branch Ip Address",
                      "type" : "string"
                    }
                  }
                },
                "authentication" : {
                  "properties" : {
                    "psk" : {
                      "description" : "Psk: JsonIgnore(value = true) ",
                      "type" : "string"
                    },
                    "branch_ike_identification" : {
                      "description" : "Branch Ike Identification",
                      "type" : "string"
                    },
                    "prismaaccess_ike_identification" : {
                      "description" : "Prismaaccess Ike Identification",
                      "type" : "string"
                    }
                  }
                },
                "wan_interface_id" : {
                  "description" : "Wan Interface Id",
                  "type" : "string"
                },
                "name" : {
                  "description" : "Name",
                  "type" : "string"
                }
              }
            }
          },
          "spn_name" : {
            "description" : "Spn Name",
            "type" : "array",
            "items" : {
              "description" : "Spn Name",
              "type" : "string"
            }
          },
          "name" : {
            "description" : "Name",
            "type" : "string"
          }
        }
      }
    },
    "routing_configs" : {
      "properties" : {
        "bgp_secret" : {
          "description" : "Bgp Secret",
          "type" : "string",
          "additionalProperties" : {
            "properties" : {
              "x_flag_sensitive" : {
                "type" : "boolean"
              }
            }
          }
        },
        "advertise_default_route" : {
          "description" : "Advertise Default Route",
          "type" : "boolean"
        },
        "export_routes" : {
          "description" : "Export Routes",
          "type" : "boolean"
        },
        "summarize_mobile_routes_before_advertise" : {
          "description" : "Summarize Mobile Routes Before Advertise",
          "type" : "boolean"
        }
      }
    },
    "ipsec_tunnel_configs" : {
      "properties" : {
        "prismaaccess_ipsec_profile_id" : {
          "description" : "Prismaaccess Ipsec Profile Id",
          "type" : "string"
        },
        "prismaaccess_ike_crypto_profile_id" : {
          "description" : "Prismaaccess Ike Crypto Profile Id",
          "type" : "string"
        },
        "ike_key_exchange" : {
          "description" : "Ike Key Exchange",
          "type" : "string"
        },
        "enable_gre_encapsulation" : {
          "description" : "Enable Gre Encapsulation",
          "type" : "boolean"
        },
        "tunnel_monitoring" : {
          "description" : "Tunnel Monitoring",
          "type" : "boolean"
        },
        "copy_tos" : {
          "description" : "Copy Tos",
          "type" : "boolean"
        },
        "anti_replay" : {
          "description" : "Anti Replay",
          "type" : "boolean"
        }
      }
    },
    "enabled_wan_interface_ids" : {
      "description" : "Enabled Wan Interface Ids",
      "type" : "array",
      "items" : {
        "description" : "Enabled Wan Interface Ids",
        "type" : "string"
      }
    },
    "prismaaccess_qos_cir_mbps" : {
      "description" : "Prismaaccess Qos Cir Mbps",
      "type" : "integer"
    },
    "prismaaccess_qos_profile_id" : {
      "description" : "Prismaaccess Qos Profile Id",
      "type" : "string"
    },
    "is_enabled" : {
      "description" : "Is Enabled",
      "type" : "boolean"
    },
    "is_active" : {
      "description" : "Is Active",
      "type" : "boolean"
    },
    "prismaaccess_edge_location" : {
      "description" : "Prismaaccess Edge Location",
      "type" : "array",
      "items" : {
        "description" : "Prismaaccess Edge Location",
        "type" : "string"
      }
    },
    "site_id" : {
      "description" : "Site Id: Digits(fraction = 0, integer = 50, SITEID_INVALID) NotNull ",
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
  "required" : [ "site_id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_prisma_sase_connection.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

