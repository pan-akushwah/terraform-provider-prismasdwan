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
      "description" : "Vrf Context Id: Digits(fraction = 0, integer = 20, error = VRF_CONTEXT_ID_INVALID: VRF Context ID is empty or invalid.) ",
      "type" : "string"
    },
    "ipv6_config" : {
      "properties" : {
        "prefixes" : {
          "description" : "Prefixes: ListIPv6Address(bcast = DENY, listMaxSize = 0, message = LAN_CONFIG_INVALID_PREFIX_V6, required = false, type = GATEWAYCIDRV6) ",
          "type" : "array",
          "items" : {
            "description" : "Prefixes",
            "type" : "string"
          }
        },
        "default_routers" : {
          "description" : "Default Routers: ListIPv6Address(bcast = DENY, listMaxSize = 0, message = LAN_CONFIG_V6_INVALID_DEFAULT_ROUTERS, required = false, type = IPCIDR_128) ",
          "type" : "array",
          "items" : {
            "description" : "Default Routers",
            "type" : "string"
          }
        }
      }
    },
    "network_context_id" : {
      "description" : "Network Context Id: Digits(fraction = 0, integer = 30, error = INVALID_NETWORK_CONTEXT_ID: Specified network context is invalid.) ",
      "type" : "string"
    },
    "ipv4_config" : {
      "properties" : {
        "dhcp_server" : {
          "properties" : {
            "custom_options" : {
              "description" : "Custom Options: Valid ",
              "type" : "array",
              "items" : {
                "properties" : {
                  "option_value" : {
                    "description" : "Option Value: NotEmpty(groups = [classOf[Value]], error = DHCPSERVER_CONFIG_CUSTOM_OPTIONS_VAL_UNSUPPORTED: Custom option value is not supported) Size(groups = [classOf[Value]], max = 8192, error = DHCPSERVER_CONFIG_OPTION_VAL_EXCEEDS_LIMIT: Custom option value length exceeds maximum limit, min = 0) ",
                    "type" : "string"
                  },
                  "option_definition" : {
                    "description" : "Option Definition: NotEmpty(groups = [classOf[Definition]], error = DHCPSERVER_CONFIG_CUSTOM_OPTIONS_DEF_UNSUPPORTED: Custom option definition is not supported) Size(groups = [classOf[Definition]], max = 1024, error = DHCPSERVER_CONFIG_OPTION_DEF_EXCEEDS_LIMIT: Custom option definition length exceeeds maximum limit, min = 0) ",
                    "type" : "string"
                  }
                },
                "required" : [ "option_value", "option_definition" ]
              }
            },
            "static_mappings" : {
              "description" : "Static Mappings: Valid ",
              "type" : "array",
              "items" : {
                "properties" : {
                  "ip_address" : {
                    "description" : "Ip Address: NotNull(error = DHCPSERVER_CONFIG_STATIC_MAPPING_MISSING: Provide all required attributes for static mappings.) ",
                    "type" : "string"
                  },
                  "mac" : {
                    "description" : "Mac: MACAddressFiveColons(error = DHCPSERVER_CONFIG_INVALID_STATIC_MAPPING_MAC_ADDR: Invalid mac address provided for static mapping) ",
                    "type" : "string"
                  },
                  "name" : {
                    "description" : "Name: NotNull(error = DHCPSERVER_CONFIG_STATIC_MAPPING_MISSING: Provide all required attributes for static mappings.) Size(max = 256, error = DHCPSERVER_CONFIG_STATIC_MAPPING_NAME_EXCEEDS_LIMIT: Static Mapping name execeeds the maximum limit, min = 0) Pattern(error = DHCPSERVER_CONFIG_STATIC_MAPPING_UNSUPPORTED_NAME: Provide valid static mapping name, regexp = ^[a-zA-Z0-9]+(([a-zA-Z0-9\\\\-_])|(\\\\.?[a-zA-Z0-9\\\\-]))*\\\\.?$) ",
                    "type" : "string"
                  }
                },
                "required" : [ "ip_address", "name" ]
              }
            },
            "ip_ranges" : {
              "description" : "Ip Ranges: NotNull(error = DHCPSERVER_CONFIG_IP_RANGE_MISSING: Provide valid IPv4/IPv6 address range for defined subnet.) Size(max = 2147483647, error = DHCPSERVER_CONFIG_IP_RANGE_MISSING: Provide valid IPv4/IPv6 address range for defined subnet., min = 1) Valid ",
              "type" : "array",
              "items" : {
                "properties" : {
                  "end_ip" : {
                    "description" : "End Ip: NotNull(error = DHCPSERVER_CONFIG_IP_RANGE_MISSING: Provide valid IPv4/IPv6 address range for defined subnet.) ",
                    "type" : "string"
                  },
                  "start_ip" : {
                    "description" : "Start Ip: NotNull(error = DHCPSERVER_CONFIG_IP_RANGE_MISSING: Provide valid IPv4/IPv6 address range for defined subnet.) ",
                    "type" : "string"
                  }
                },
                "required" : [ "end_ip", "start_ip" ]
              }
            },
            "max_lease_time" : {
              "description" : "Max Lease Time: Min(error = DHCPSERVER_CONFIG_UNSUPPORTED_MAX_LEASE_TIME: Max lease time should be between 300 and 2^32-1 seconds respectively., value = 300L) Max(error = DHCPSERVER_CONFIG_UNSUPPORTED_MAX_LEASE_TIME: Max lease time should be between 300 and 2^32-1 seconds respectively., value = 4294967295L) ",
              "format" : "int64",
              "type" : "integer"
            },
            "default_lease_time" : {
              "description" : "Default Lease Time: Min(error = DHCPSERVER_CONFIG_UNSUPPORTED_DEFAULT_LEASE_TIME: Default lease time should be between 300 and 2^32-1 seconds respectively., value = 300L) Max(error = DHCPSERVER_CONFIG_UNSUPPORTED_DEFAULT_LEASE_TIME: Default lease time should be between 300 and 2^32-1 seconds respectively., value = 4294967295L) ",
              "format" : "int64",
              "type" : "integer"
            },
            "dns_servers" : {
              "description" : "Dns Servers: Size(max = 3, error = DHCPSERVER_CONFIG_DNS_ENTRIES_EXCEEDS_LIMIT: Name servers count exceeds the maximum limit, min = 0) ",
              "type" : "array",
              "items" : {
                "description" : "Dns Servers",
                "type" : "string"
              }
            },
            "domain_name" : {
              "description" : "Domain Name: Size(max = 256, error = DHCPSERVER_CONFIG_INVALID_DOMAIN_NAME: Domain name exceeds the maximum limit., min = 0) ",
              "type" : "string"
            },
            "broadcast_address" : {
              "description" : "Broadcast Address",
              "type" : "string"
            },
            "gateway" : {
              "description" : "Gateway",
              "type" : "string"
            },
            "subnet" : {
              "description" : "Subnet: NotNull(error = DHCPSERVER_CONFIG_INVALID_SUBNET_ADDR: Invalid IPv4 subnet address.) ",
              "type" : "string"
            },
            "network_context_id" : {
              "description" : "Network Context Id: Digits(fraction = 0, integer = 50, error = INVALID_NETWORK_CTX_ID: Invalid network ctrx id.) ",
              "type" : "string"
            },
            "description" : {
              "description" : "Description: Size(max = 256, error = DHCPSERVER_CONFIG_DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds the maximum limit., min = 0) ",
              "type" : "string"
            },
            "tags" : {
              "description" : "Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 128, listMaxSize = 10, error = DHCPSERVER_CONFIG_INVALID_TAGS: Tags config is invalid- maximum 10 tags are supported, tag should not exceed maximum limit of 128 characters, it should not have duplicates., noTrim = false, regex = [^,\\\\s]+, required = false) ",
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
            "disabled" : {
              "description" : "Disabled",
              "type" : "boolean"
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
          "required" : [ "ip_ranges", "subnet" ]
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
                  "description" : "Reforwarding Policy: ValidateEnum(enumClass = classOf[DHCPRelayReforwardingPolicy], error = INVALID_DHCP_RELAY_REFWDING_POLICY: Option 82 invalid reforwarding policy, nullAllowed = false) ",
                  "type" : "string",
                  "enum" : [ "REPLACE", "KEEP", "APPEND", "DROP" ]
                },
                "remote_id" : {
                  "description" : "Remote Id: Size(max = 255, error = DHCPRELAY_REMOTE_ID_EXCEEDS_LIMIT: Option 82 Remote ID exceeds maximum length, min = 0) ",
                  "type" : "string"
                },
                "circuit_id" : {
                  "description" : "Circuit Id: Size(max = 255, error = DHCPRELAY_CIRCUIT_ID_EXCEEDS_LIMIT: Option 82 Circuid ID exceeds maximum length, min = 0) ",
                  "type" : "string"
                },
                "enabled" : {
                  "description" : "Enabled",
                  "type" : "boolean"
                }
              },
              "required" : [ "reforwarding_policy" ]
            },
            "enabled" : {
              "description" : "Enabled",
              "type" : "boolean"
            },
            "server_ips" : {
              "description" : "Server Ips: ListIPAddress(bcast = DENY, listMaxSize = 0, error = INTERFACE_CONFIG_INVALID_DHCP_RELAY_LIST: DHCP Servers IP specified in the list are invalid, required = true, type = IP) Size(max = 16, error = INTERFACE_CONFIG_DHCP_RELAY_LIST_EXCEEDS_LIMIT: DHCP Servers specified in the list exceeds maximum limit, min = 0) ",
              "type" : "array",
              "items" : {
                "description" : "Server Ips",
                "type" : "string"
              }
            }
          }
        },
        "prefixes" : {
          "description" : "Prefixes: ListIPAddress(bcast = DENY, listMaxSize = 0, error = LAN_CONFIG_INVALID_PREFIX: Invalid prefix ip., required = false, type = PREFIXCIDR_32) ",
          "type" : "array",
          "items" : {
            "description" : "Prefixes",
            "type" : "string"
          }
        },
        "default_routers" : {
          "description" : "Default Routers: ListIPAddress(bcast = DENY, listMaxSize = 0, error = LAN_CONFIG_INVALID_DEFAULT_ROUTERS: Invalid ip for default routers., required = false, type = IPCIDR_32) ",
          "type" : "array",
          "items" : {
            "description" : "Default Routers",
            "type" : "string"
          }
        }
      }
    },
    "scope" : {
      "description" : "Scope: ValidateEnum(enumClass = classOf[NetworkScope], message = Invalid enum string., nullAllowed = false) ",
      "type" : "string",
      "enum" : [ "GLOBAL", "LOCAL" ]
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
  "required" : [ "scope", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_lan_network.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

