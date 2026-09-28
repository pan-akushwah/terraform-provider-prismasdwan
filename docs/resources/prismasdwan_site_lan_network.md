## Documentation for Prisma SDWAN Resource "site_lan_network"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_lan_network` |
| Get Api  | `/sdwan/v3.3/api/sites/{site_id}/lannetworks/{lannetwork_id}` (`LANNetworkScreenV3N3`) |
| Post Api  | `/sdwan/v3.3/api/sites/{site_id}/lannetworks` (`LANNetworkScreenV3N3`) |
| Put Api  | `/sdwan/v3.3/api/sites/{site_id}/lannetworks/{lannetwork_id}` (`LANNetworkScreenV3N3`) |
| Delete Api  | `/sdwan/v3.3/api/sites/{site_id}/lannetworks/{lannetwork_id}` |


### JSON Schema

```json
{
  "properties" : {
    "vrf_context_id" : {
      "description" : "Vrf Context Id",
      "maxLength" : 20,
      "pattern" : "^-?[0-9]{1,20}$",
      "type" : "string"
    },
    "ipv6_config" : {
      "properties" : {
        "prefixes" : {
          "description" : "Prefixes",
          "type" : "array",
          "items" : {
            "description" : "Prefixes",
            "format" : "ipv6",
            "type" : "string"
          }
        },
        "default_routers" : {
          "description" : "Default Routers",
          "type" : "array",
          "items" : {
            "description" : "Default Routers",
            "format" : "ipv6",
            "type" : "string"
          }
        }
      },
      "required" : [ "prefixes", "default_routers" ]
    },
    "network_context_id" : {
      "description" : "Network Context Id",
      "maxLength" : 30,
      "pattern" : "^-?[0-9]{1,30}$",
      "type" : "string"
    },
    "ipv4_config" : {
      "properties" : {
        "dhcp_server" : {
          "properties" : {
            "domain_name_servers" : {
              "description" : "Domain Name Servers",
              "type" : "array",
              "items" : {
                "description" : "Domain Name Servers",
                "type" : "string"
              }
            },
            "domain_name" : {
              "description" : "Domain Name",
              "type" : "string"
            },
            "lease_expiry_time" : {
              "description" : "Lease Expiry Time",
              "type" : "integer"
            },
            "lease_renew_time" : {
              "description" : "Lease Renew Time",
              "type" : "integer"
            },
            "ip_address_pool" : {
              "description" : "Ip Address Pool",
              "type" : "array",
              "items" : {
                "properties" : {
                  "end" : {
                    "description" : "End",
                    "format" : "ipv4",
                    "type" : "string"
                  },
                  "start" : {
                    "description" : "Start",
                    "format" : "ipv4",
                    "type" : "string"
                  }
                },
                "required" : [ "end", "start" ]
              }
            }
          },
          "required" : [ "domain_name_servers", "domain_name", "lease_expiry_time", "lease_renew_time", "ip_address_pool" ]
        },
        "dhcp_relay" : {
          "properties" : {
            "source_interface" : {
              "description" : "Source Interface",
              "type" : "string"
            },
            "option_82" : {
              "properties" : {
                "reforwarding_policy" : {
                  "description" : "Reforwarding Policy",
                  "type" : "string",
                  "enum" : [ "replace", "keep", "append", "drop" ]
                },
                "remote_id" : {
                  "description" : "Remote Id",
                  "maxLength" : 255,
                  "type" : "string"
                },
                "circuit_id" : {
                  "description" : "Circuit Id",
                  "maxLength" : 255,
                  "type" : "string"
                },
                "enabled" : {
                  "description" : "Enabled",
                  "type" : "boolean"
                }
              },
              "required" : [ "reforwarding_policy", "remote_id", "circuit_id", "enabled" ]
            },
            "enabled" : {
              "description" : "Enabled",
              "type" : "boolean"
            },
            "server_ips" : {
              "description" : "Server Ips",
              "maxItems" : 16,
              "type" : "array",
              "items" : {
                "description" : "Server Ips",
                "format" : "ipv4",
                "type" : "string"
              }
            }
          },
          "required" : [ "source_interface", "option_82", "enabled", "server_ips" ]
        },
        "prefixes" : {
          "description" : "Prefixes",
          "type" : "array",
          "items" : {
            "description" : "Prefixes",
            "format" : "ipv4",
            "type" : "string"
          }
        },
        "default_routers" : {
          "description" : "Default Routers",
          "type" : "array",
          "items" : {
            "description" : "Default Routers",
            "format" : "ipv4",
            "type" : "string"
          }
        }
      },
      "required" : [ "dhcp_server", "dhcp_relay", "prefixes", "default_routers" ]
    },
    "scope" : {
      "description" : "Scope",
      "type" : "string",
      "enum" : [ "global", "local" ]
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
  "required" : [ "vrf_context_id", "ipv6_config", "network_context_id", "ipv4_config", "scope", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_lan_network.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

