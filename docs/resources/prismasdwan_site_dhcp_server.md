## Documentation for Prisma SDWAN Resource "site_dhcp_server"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_dhcp_server` |
| Get Api  | `/sdwan/v2.3/api/sites/{site_id}/dhcpservers/{dhcp_server_id}` (`DHCPServerScreenV2N3`) |
| Post Api  | `/sdwan/v2.3/api/sites/{site_id}/dhcpservers` (`DHCPServerScreenV2N3`) |
| Put Api  | `/sdwan/v2.3/api/sites/{site_id}/dhcpservers/{dhcp_server_id}` (`DHCPServerScreenV2N3`) |
| Delete Api  | `/sdwan/v2.3/api/sites/{site_id}/dhcpservers/{dhcp_server_id}` |


### JSON Schema

```json
{
  "properties" : {
    "vrf_context_id" : {
      "description" : "Vrf Context Id",
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "static_mappings" : {
      "description" : "Static Mappings: Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "client_duid" : {
            "description" : "Client Duid: Pattern(error = DHCPSERVER_CONFIG_INVALID_STATIC_MAPPING_DUID: Invalid Client duid provided for static mapping., regexp = ([0-9a-fA-F]{1,2}:)*[0-9a-fA-F]{1,2}|([0-9a-fA-F]{1,2}:)*(:([0-9a-fA-F]{1,2}:)*)([0-9a-fA-F]{1,2})*) ",
            "type" : "string"
          },
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
    "address_family" : {
      "description" : "Address Family: ValidateEnum(enumClass = classOf[IPAddressFamily], DHCP_CONFIG_ADDRESS_FAMILY_INVALID, nullAllowed = false) ",
      "type" : "string",
      "enum" : [ "IPV4", "IPV6" ]
    },
    "custom_options" : {
      "description" : "Custom Options: Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "vendor_class_identifier" : {
            "description" : "Vendor Class Identifier",
            "type" : "string"
          },
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
  "required" : [ "address_family", "ip_ranges", "subnet" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_dhcp_server.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>"
}
```

