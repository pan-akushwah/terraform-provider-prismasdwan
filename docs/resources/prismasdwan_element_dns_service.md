## Documentation for Prisma SDWAN Resource "element_dns_service"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_dns_service` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/dnsservices/{dnsservice_role_id}` (`DnsService`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/dnsservices` (`DnsService`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/dnsservices/{dnsservice_role_id}` (`DnsService`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/dnsservices/{dnsservice_role_id}` |


### JSON Schema

```json
{
  "properties" : {
    "domains_to_addresses" : {
      "description" : "Domains To Addresses: Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "ipv6_address" : {
            "description" : "Ipv6 Address: IPv6(error = DOMAINTOADDRESS_IPV6_CONFIG_INVALID_IP: Invalid Domains to address ipv6_address, regexp = [/0-9a-zA-Z:.]*) ",
            "type" : "string"
          },
          "ipv4_address" : {
            "description" : "Ipv4 Address: IPv4(error = DOMAINTOADDRESS_IPV4_CONFIG_INVALID_IP: Invalid Domains to address ipv4_address, regexp = [/0-9.]*) ",
            "type" : "string"
          },
          "domain_names" : {
            "description" : "Domain Names: UniqueHostNames(allowNull = true, max = 2147483647, error = DTA_DOMAIN_CONFIG_INVALID_HOST: Invalid domains to address domain names, min = 0) ",
            "type" : "array",
            "items" : {
              "description" : "Domain Names",
              "type" : "string"
            }
          }
        }
      }
    },
    "domains_to_interfaces" : {
      "description" : "Domains To Interfaces: Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "interface_id" : {
            "description" : "Interface Id: NotEmpty(error = DTI_INTERFACE_ID_MANDATORY: Domains to interfaces interface id missing) ",
            "type" : "string"
          },
          "domain_names" : {
            "description" : "Domain Names: NotEmpty(error = DTI_DOMAIN_NAME_MANDATORY: Domains to interfaces domain name missing) UniqueHostNames(allowNull = true, max = 2147483647, error = INVALID_DTI_DOMAIN_NAMES_LIST_CONFIG: Invalid domains to interfaces domain name list, min = 0) ",
            "type" : "array",
            "items" : {
              "description" : "Domain Names",
              "type" : "string"
            }
          }
        },
        "required" : [ "interface_id", "domain_names" ]
      }
    },
    "dns_queries_metadata" : {
      "properties" : {
        "add_subnets" : {
          "description" : "Add Subnets: Valid Size(max = 2, error = DNS_SUBNET_MAXIMUM_LIMITED_EXCEEDED: Maximum 2 subnets are allowed in dns service configuration, min = 0) ",
          "type" : "array",
          "items" : {
            "properties" : {
              "ipv6_prefix_length" : {
                "description" : "Ipv6 Prefix Length: Required(message = DNSQUERYMETADATA_CONFIG_INVALID_IPV6_PREFIX_LENGTH_MISSING) Range(max = 128L, error = DNSQUERYMETADATA_CONFIG_INVALID_IPV6_PREFIX_LENGTH_RANGE: ipv6 prefix length is not in valid range '0-128', min = 0L) ",
                "format" : "int32",
                "type" : "integer"
              },
              "ipv6_address" : {
                "description" : "Ipv6 Address: IPv6(error = DNSQUERYMETADATA_CONFIG_INVALID_IPV6_ADDRESS: Invalid subnet ipv6 address, regexp = [/0-9a-zA-Z:.]*) ",
                "type" : "string"
              },
              "ipv4_prefix_length" : {
                "description" : "Ipv4 Prefix Length: Required(message = DNSQUERYMETADATA_CONFIG_INVALID_IP_PREFIX_LENGTH_MISSING) Range(max = 32L, error = DNSQUERYMETADATA_CONFIG_INVALID_IP_PREFIX_LENGTH_RANGE: ipv4 prefix length is not in valid range '0-32', min = 0L) ",
                "format" : "int32",
                "type" : "integer"
              },
              "ipv4_address" : {
                "description" : "Ipv4 Address: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = DNSQUERYMETADATA_CONFIG_INVALID_IP_ADDRESS: Invalid subnet ipv4 address, type = IP) ",
                "type" : "string"
              }
            },
            "required" : [ "ipv6_prefix_length", "ipv4_prefix_length" ]
          }
        },
        "add_customer_premises_equipment" : {
          "properties" : {
            "identifier_text" : {
              "description" : "Identifier Text",
              "type" : "string"
            },
            "type" : {
              "description" : "Type: ValidateEnum(enumClass = classOf[CustomerPremisesEquipmentType], error = INVALID_CUSTOMER_PREMISES_EQUIPMENT_TYPE: Invalid customer premises equipment type. Allowed values text|element_id|element_name, nullAllowed = false) ",
              "type" : "string",
              "enum" : [ "text", "element_id", "element_name" ]
            }
          },
          "required" : [ "type" ]
        }
      }
    },
    "cache_config" : {
      "properties" : {
        "cache_size" : {
          "description" : "Cache Size: Range(max = 9223372036854775807L, error = INVALID_CACHE_SIZE_RANGE: Invalid cache size, must be positive value, min = 0L) ",
          "format" : "int32",
          "type" : "integer"
        }
      }
    },
    "max_concurrent_dns_queries" : {
      "description" : "Max Concurrent Dns Queries: Range(max = 9223372036854775807L, error = INVALID_MAX_CONCURRENT_DNS_QUERIES_RANGE: Max concurrent dns queries is not in valid range '1 - 65535', min = 1L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "dnsservicerole_bindings" : {
      "description" : "Dnsservicerole Bindings: Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "interfaces" : {
            "description" : "Interfaces: Valid NotEmpty(message = DNSSERVICE_ROLE_BINDING_INTERFACES_MISSING) ",
            "type" : "array",
            "items" : {
              "properties" : {
                "interface_ip" : {
                  "description" : "Interface Ip",
                  "type" : "string"
                },
                "interface_id" : {
                  "description" : "Interface Id",
                  "type" : "string"
                }
              }
            }
          },
          "dnsservicerole_id" : {
            "description" : "Dnsservicerole Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
            "type" : "string"
          }
        },
        "required" : [ "interfaces" ]
      }
    },
    "dnsservice_profile_id" : {
      "description" : "Dnsservice Profile Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
      "type" : "string"
    },
    "enabled" : {
      "description" : "Enabled",
      "type" : "boolean"
    },
    "element_id" : {
      "description" : "Element Id",
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
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
  "required" : [ "name", "site_id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_dns_service.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

