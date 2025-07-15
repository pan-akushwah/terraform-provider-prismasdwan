## Documentation for Prisma SDWAN Resource "dns_service_profile"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `dns_service_profile` |
| Get Api  | `/sdwan/v2.1/api/dnsserviceprofiles/{dnsservice_role_id}` (`DnsServiceProfileV2N1`) |
| Post Api  | `/sdwan/v2.1/api/dnsserviceprofiles` (`DnsServiceProfileV2N1`) |
| Put Api  | `/sdwan/v2.1/api/dnsserviceprofiles/{dnsservice_role_id}` (`DnsServiceProfileV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/dnsserviceprofiles/{dnsservice_role_id}` |


### JSON Schema

```json
{
  "properties" : {
    "dns_forward_config" : {
      "properties" : {
        "dns_servers" : {
          "description" : "Dns Servers: ListString(allowDuplicate = true, allowEmpty = false, allowNull = false, length = 0, listMaxSize = 0, INVALID_STRING, noTrim = false, regex = , required = false) ",
          "type" : "array",
          "items" : {
            "properties" : {
              "address_family" : {
                "description" : "Address Family",
                "type" : "string",
                "enum" : [ "ipv4", "ipv6", "ipv4v6" ]
              },
              "source_port" : {
                "description" : "Source Port: Range(max = 65535L, error = INVALID_DNSSERVER_SOURCE_PORT_RANGE_CONFIG: Dns Server source port is not in the valid range '1 - 65535', min = 1L) ",
                "type" : "integer"
              },
              "forward_dnsservicerole_id" : {
                "description" : "Forward Dnsservicerole Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) Size(max = 20, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
                "type" : "string"
              },
              "dnsserver_port" : {
                "description" : "Dnsserver Port: Range(max = 65535L, error = INVALID_DNSSERVER_PORT_RANGE_CONFIG: Dns Server port is not in the valid range '1 - 65535', min = 1L) ",
                "type" : "integer"
              },
              "dnsserver_ip" : {
                "description" : "Dnsserver Ip: NotEmpty(error = DNSSERVER_IP_CONFIG_MISSING: Dns Server ip is missing) ",
                "type" : "string"
              },
              "domain_names" : {
                "description" : "Domain Names: UniqueHostNames(allowNull = true, max = 2147483647, message = DNSSERVER_DOMAIN_NAMES_CONFIG_INVALID_HOST, min = 0) ",
                "type" : "array",
                "items" : {
                  "description" : "Domain Names",
                  "type" : "string"
                }
              },
              "ip_prefix" : {
                "description" : "Ip Prefix",
                "type" : "string"
              }
            },
            "required" : [ "dnsserver_ip" ]
          }
        },
        "send_to_all_dns_servers" : {
          "description" : "Send To All Dns Servers",
          "type" : "boolean"
        },
        "max_source_port" : {
          "description" : "Max Source Port: Range(max = 65535L, error = DNSSERVICE_CONFIG_INVALID_MAXSOURCEPORT_VALUE: Invalid max source port, min = 1L) ",
          "type" : "integer"
        },
        "min_source_port" : {
          "description" : "Min Source Port: Range(max = 65535L, error = DNSSERVICE_CONFIG_INVALID_MINSOURCEPORT_VALUE: Invalid min source port, min = 1L) ",
          "format" : "int32",
          "type" : "integer"
        }
      },
      "required" : [ "dns_servers" ]
    },
    "authoritative_config" : {
      "properties" : {
        "mx_host_records" : {
          "description" : "Mx Host Records: Valid ",
          "type" : "array",
          "items" : {
            "properties" : {
              "preference" : {
                "description" : "Preference: Range(max = 65535L, error = INVALID_PREF_RANGE: Mx host record preference is not in valid range '0 - 65535', min = 0L) ",
                "format" : "int32",
                "type" : "integer"
              },
              "hostname" : {
                "description" : "Hostname: NotEmpty(error = MX_HOST_NAME_MISSING: MxHostRecord hostname missing) ",
                "type" : "string"
              },
              "mx_name" : {
                "description" : "Mx Name: NotEmpty(error = MX_NAME_MISSING: MxHostRecord mx_name missing) Size(max = 128, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
                "type" : "string"
              }
            },
            "required" : [ "hostname", "mx_name" ]
          }
        },
        "txt_records" : {
          "description" : "Txt Records: Valid ",
          "type" : "array",
          "items" : {
            "properties" : {
              "texts" : {
                "description" : "Texts: ListString(allowDuplicate = true, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, message = TXTRECORD_TEXT_INVALID_LENGTH, noTrim = false, regex = [A-Za-z]+[a-zA-Z0-9_$ ]{1,255}, required = false) ",
                "type" : "array",
                "items" : {
                  "description" : "Texts",
                  "type" : "string"
                }
              },
              "domain_name" : {
                "description" : "Domain Name: NotEmpty(error = TXTRECORD_DOMAIN_NAME_MISSING: TxtRecords domain name missing) Size(max = 128, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
                "type" : "string"
              }
            },
            "required" : [ "domain_name" ]
          }
        },
        "ptr_records" : {
          "description" : "Ptr Records: Valid ",
          "type" : "array",
          "items" : {
            "properties" : {
              "target" : {
                "description" : "Target: Size(max = 256, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
                "type" : "string"
              },
              "name" : {
                "description" : "Name: NotEmpty(error = PTRRECORD_NAME_MISSING: PtrRecords name missing) Size(max = 128, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
                "type" : "string"
              }
            },
            "required" : [ "name" ]
          }
        },
        "cname_records" : {
          "description" : "Cname Records: Valid ",
          "type" : "array",
          "items" : {
            "properties" : {
              "ttl" : {
                "description" : "Ttl: Range(max = 9223372036854775807L, error = INVALID_TTL_RANGE: Invalid ttl, must be positive value, min = 0L) ",
                "type" : "integer"
              },
              "target" : {
                "description" : "Target: NotEmpty(error = CNAMERECORD_TARGET_MISSING: Invalid CnameRecords target) Size(max = 128, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
                "type" : "string"
              },
              "name" : {
                "description" : "Name: NotEmpty(error = CNAMERECORD_NAME_MISSING: CnameRecords name list is missing) ListString(allowDuplicate = true, allowEmpty = false, allowNull = false, length = 0, listMaxSize = 0, error = CNAMERECORD_INVALID_NAME: Invalid CnameRecords name, noTrim = false, regex = , required = false) ",
                "type" : "array",
                "items" : {
                  "description" : "Name",
                  "type" : "string"
                }
              }
            },
            "required" : [ "target", "name" ]
          }
        },
        "dns_resource_records" : {
          "description" : "Dns Resource Records: Valid ",
          "type" : "array",
          "items" : {
            "properties" : {
              "hex_data" : {
                "description" : "Hex Data: Pattern(message = INVALID_DNSRESOURCERECORD_HEX_DATA, regexp = [0-9a-fA-F :]+) Size(max = 128, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
                "type" : "string"
              },
              "rr_number" : {
                "description" : "Rr Number: NotNull(error = DNSRESOURCERECORD_RRNUMBER_MISSING: DnsResourceRecords rr_number is missing) ",
                "type" : "integer"
              },
              "name" : {
                "description" : "Name: NotEmpty(error = DNSRESOURCERECORD_NAME_MISSING: DnsResourceRecords name is missing) Size(max = 128, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
                "type" : "string"
              }
            },
            "required" : [ "rr_number", "name" ]
          }
        },
        "caa_records" : {
          "description" : "Caa Records: Valid ",
          "type" : "array",
          "items" : {
            "properties" : {
              "value" : {
                "description" : "Value: NotEmpty(error = CAARECORD_VALUE_MISSING: CAARecords value is missing) Size(max = 256, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
                "type" : "string"
              },
              "tag" : {
                "description" : "Tag: NotEmpty(error = CAARECORD_TAG_MISSING: CAARecords tag is missing) Pattern(message = INVALID_CAARECORD_TAG, regexp = ^[a-zA-Z0-9]+$) Size(max = 128, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
                "type" : "string"
              },
              "flags" : {
                "description" : "Flags: NotEmpty(error = CAARECORD_FLAG_MISSING: CAARecords flag is missing) Pattern(message = INVALID_CAARECORD_FLAGS, regexp = [A-Z0-9]{1}) ",
                "type" : "string"
              },
              "name" : {
                "description" : "Name: NotEmpty(error = CAARECORD_NAME_MISSING: CAARecords name is missing) Size(max = 128, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
                "type" : "string"
              }
            },
            "required" : [ "value", "tag", "flags", "name" ]
          }
        },
        "naptr_records" : {
          "description" : "Naptr Records: Valid ",
          "type" : "array",
          "items" : {
            "properties" : {
              "replacement" : {
                "description" : "Replacement: Pattern(error = INVALID_REPLACEMENT_VALUE: Invalid replacement value, must be only alphabets value, regexp = ^[ a-zA-Z]*$) Size(max = 256, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
                "type" : "string"
              },
              "regexp" : {
                "description" : "Regexp: Size(max = 256, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
                "type" : "string"
              },
              "service" : {
                "description" : "Service: Size(max = 256, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) Pattern(error = INVALID_SERVICE_VALUE: Invalid service, must be only alphabets value, regexp = ^[ a-zA-Z]*$) ",
                "type" : "string"
              },
              "flags" : {
                "description" : "Flags: NotEmpty(error = NAPTRRECORD_FLAGS_MISSING: NaptrRecords flags is missing) Pattern(message = INVALID_NAPTRRECORD_FLAGS, regexp = [A-Z0-9]{1}) ",
                "type" : "string"
              },
              "preference" : {
                "description" : "Preference: Range(max = 65535L, error = INVALID_NAPTRRECORD_PREFERENCE_RANGE_CONFIG: NaptrRecords preference is not in valid range '0 - 65535', min = 0L) NotNull(error = NAPTRRECORD_PREFERENCE_MISSING: NaptrRecords preference is missing) ",
                "type" : "integer"
              },
              "order" : {
                "description" : "Order: Range(max = 65535L, error = INVALID_NAPTRRECORD_ORDER_RANGE_CONFIG: NaptrRecords order is not in valid range '0 - 65535', min = 0L) NotNull(error = NAPTRRECORD_ORDER_MISSING: NaptrRecords order is missing) ",
                "type" : "integer"
              },
              "name" : {
                "description" : "Name: NotEmpty(error = NAPTRRECORD_NAME_MISSING: NaptrRecords name is missing) Size(max = 128, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
                "type" : "string"
              }
            },
            "required" : [ "flags", "preference", "order", "name" ]
          }
        },
        "srv_hosts" : {
          "description" : "Srv Hosts: Valid ",
          "type" : "array",
          "items" : {
            "properties" : {
              "weight" : {
                "description" : "Weight: Range(max = 65535L, error = INVALID_WEIGHT_RANGE: SRV host weight is not in valid range '0 - 65535', min = 0L) ",
                "type" : "integer"
              },
              "priority" : {
                "description" : "Priority: Range(max = 65535L, error = INVALID_SRVHOST_PRIORITY_RANGE_CONFIG: SRV host priority is not in valid range '0 - 65535', min = 0L) ",
                "type" : "integer"
              },
              "port" : {
                "description" : "Port: Range(max = 65535L, error = INVALID_SRVHOST_PORT_RANGE_CONFIG: SRV host port is not in valid range '0 - 65535', min = 0L) ",
                "type" : "integer"
              },
              "target" : {
                "description" : "Target: Range(max = 65535L, error = INVALID_TARGET_RANGE: SRV host target is not in valid range '0 - 65535', min = 0L) ",
                "type" : "integer"
              },
              "domain_name" : {
                "description" : "Domain Name",
                "type" : "string"
              },
              "protocol" : {
                "description" : "Protocol: Pattern(error = INVALID_PROTOCOL_VALUE: Invalid protocol, must be only alphabets value, regexp = ^[ a-zA-Z]*$) NotEmpty(error = SRVHOST_PROTOCOL_MISSING: SRV host protocol missing) Size(max = 256, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
                "type" : "string"
              },
              "service" : {
                "description" : "Service: Pattern(error = INVALID_SERVICE_VALUE: Invalid service, must be only alphabets value, regexp = ^[ a-zA-Z]*$) NotEmpty(error = SRVHOST_SERVICE_MISSING: SRV host service missing) Size(max = 256, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
                "type" : "string"
              }
            },
            "required" : [ "protocol", "service" ]
          }
        },
        "synth_domains" : {
          "description" : "Synth Domains: Valid ",
          "type" : "array",
          "items" : {
            "properties" : {
              "prefix" : {
                "description" : "Prefix: Pattern(error = INVALID_PREFIX_VALUE: Invalid prefix, must be only alphabets value, regexp = ^[a-zA-Z]*$) ",
                "type" : "string"
              },
              "ipaddress_prefix" : {
                "description" : "Ipaddress Prefix: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = INVALID_SYNTHDOMAIN_IP_ADDRESS_PREFIX_CONFIG: Invalid synth-domain ipaddress prefix, type = IPCIDR_32) ",
                "type" : "string"
              },
              "end_ipaddress" : {
                "description" : "End Ipaddress: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = INVALID_SYNTHDOMAIN_END_IP_ADDRESS_CONFIG: Invalid synth-domain end ip, type = IP) ",
                "type" : "string"
              },
              "start_ipaddress" : {
                "description" : "Start Ipaddress: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = INVALID_SYNTHDOMAIN_START_IP_ADDRESS_CONFIG: Invalid synth-domain start ip, type = IP) ",
                "type" : "string"
              },
              "domain" : {
                "description" : "Domain: NotEmpty(error = SYNTHDOMAIN_DOMAIN_NAMES_CONFIG_MISSING_HOST: Missing synth-domain domain config) ",
                "type" : "string"
              }
            },
            "required" : [ "domain" ]
          }
        },
        "host_records" : {
          "description" : "Host Records: Valid ",
          "type" : "array",
          "items" : {
            "properties" : {
              "ttl" : {
                "description" : "Ttl: Range(max = 9223372036854775807L, error = INVALID_TTL_RANGE: Invalid ttl, must be positive value, min = 0L) ",
                "type" : "integer"
              },
              "ipv6_address" : {
                "description" : "Ipv6 Address: IPv6(error = INVALID_HOSTRECORD_IPV6_CONFIG: Invalid host record ipv6 address, regexp = [/0-9a-zA-Z:.]*) ",
                "type" : "string"
              },
              "ipv4_address" : {
                "description" : "Ipv4 Address: IPv4(error = INVALID_HOSTRECORD_IPV4_CONFIG: Invalid host record ipv4 address, regexp = [/0-9.]*) ",
                "type" : "string"
              },
              "domain_names" : {
                "description" : "Domain Names: UniqueHostNames(allowNull = false, max = 2147483647, error = INVALID_HOSTRECORD_DOMAIN_NAMES_LIST_CONFIG: Invalid host record domain names list config, min = 0) ",
                "type" : "array",
                "items" : {
                  "description" : "Domain Names",
                  "type" : "string"
                }
              }
            },
            "required" : [ "domain_names" ]
          }
        },
        "ttl" : {
          "description" : "Ttl: Range(max = 9223372036854775807L, error = INVALID_TTL_RANGE: Invalid ttl, must be positive value, min = 0L) ",
          "type" : "integer"
        },
        "peers" : {
          "description" : "Peers: ListIPAddress(bcast = DENY, listMaxSize = 0, message = INVALID_PEER_ADDRESS, required = false, type = IP) ",
          "type" : "array",
          "items" : {
            "description" : "Peers",
            "type" : "string"
          }
        },
        "secondary_servers" : {
          "description" : "Secondary Servers: UniqueHostNames(allowNull = true, max = 2147483647, error = INVALID_SECONDARY_SERVER: Invalid secondary servers config, min = 0) ",
          "type" : "array",
          "items" : {
            "description" : "Secondary Servers",
            "type" : "string"
          }
        },
        "soa" : {
          "description" : "Soa: Valid ",
          "type" : "array",
          "items" : {
            "properties" : {
              "expiry" : {
                "description" : "Expiry: Range(max = 9223372036854775807L, error = INVALID_EXPIRY_RANGE: Invalid expiry, must be positive value, min = 0L) ",
                "type" : "integer"
              },
              "retry" : {
                "description" : "Retry: Range(max = 9223372036854775807L, error = INVALID_RETRY_RANGE: Invalid retry, must be positive value, min = 0L) ",
                "type" : "integer"
              },
              "refresh" : {
                "description" : "Refresh: Range(max = 9223372036854775807L, error = INVALID_REFRESH_RANGE: Invalid refresh, must be positive value, min = 0L) ",
                "type" : "integer"
              },
              "host_master" : {
                "description" : "Host Master",
                "type" : "string"
              },
              "serial_number" : {
                "description" : "Serial Number: NotNull(error = AUTHCONFIG_SOA_SERIAL_NUMBER_CONFIG_MISSING: Authconfig SOA serial number missing) Range(max = 9223372036854775807L, error = INVALID_SERIAL_NUM_RANGE: Invalid serial number, must be positive value, min = 0L) ",
                "type" : "integer"
              }
            },
            "required" : [ "serial_number" ]
          }
        },
        "zones" : {
          "description" : "Zones: Valid ",
          "type" : "array",
          "items" : {
            "properties" : {
              "exclude_prefix" : {
                "description" : "Exclude Prefix: ListIPAddress(bcast = DENY, listMaxSize = 0, error = AUTHCONFIG_ZONE_INVALID_EXCLUDE_PREFIX: Invalid authconfig zone exclude prefix, required = false, type = IPCIDR_32) ",
                "type" : "array",
                "items" : {
                  "description" : "Exclude Prefix",
                  "type" : "string"
                }
              },
              "include_prefix" : {
                "description" : "Include Prefix: ListIPAddress(bcast = DENY, listMaxSize = 0, error = AUTHCONFIG_ZONE_INVALID_INCLUDE_PREFIX: Invalid authconfig zone include prefix, required = false, type = IPCIDR_32) ",
                "type" : "array",
                "items" : {
                  "description" : "Include Prefix",
                  "type" : "string"
                }
              },
              "domain_name" : {
                "description" : "Domain Name: NotEmpty(error = AUTHCONFIG_ZONE_DOMAIN_NAME_CONFIG_MISSING: Authconfig zone domain name missing) ",
                "type" : "string"
              }
            },
            "required" : [ "domain_name" ]
          }
        },
        "servers" : {
          "description" : "Servers: Valid ",
          "type" : "array",
          "items" : {
            "properties" : {
              "dnsservicerole_id" : {
                "description" : "Dnsservicerole Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) Size(max = 20, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
                "type" : "string"
              },
              "domain_name" : {
                "description" : "Domain Name: NotEmpty(error = AUTHCONFIG_SERVER_DOMAIN_NAME_CONFIG_MISSING: Authconfig server domain names missing) ",
                "type" : "string"
              }
            },
            "required" : [ "domain_name" ]
          }
        }
      }
    },
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
    "dnssec_config" : {
      "properties" : {
        "trust_anchors" : {
          "description" : "Trust Anchors: Valid ",
          "type" : "array",
          "items" : {
            "properties" : {
              "key_digest" : {
                "properties" : {
                  "digest" : {
                    "description" : "Digest: Pattern(error = INVALID_TRUSTANCHOR_KEY_DIGEST_CONFIG: Invalid key digest, expected hexadecimal string, regexp = [0-9a-fA-F]+) Size(max = 256, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
                    "type" : "string"
                  },
                  "digest_type" : {
                    "description" : "Digest Type: Range(max = 255L, error = INVALID_TRUSTANCHOR_KEY_DIGEST_TYPE_RANGE_CONFIG: Key digest digest type is not in valid range '0 - 255', min = 0L) ",
                    "type" : "integer"
                  },
                  "algorithm" : {
                    "description" : "Algorithm: Range(max = 255L, error = INVALID_TRUSTANCHOR_KEY_DIGEST_ALGO_RANGE_CONFIG: Key digest algorithm is not in valid range '0 - 255', min = 0L) ",
                    "type" : "integer"
                  },
                  "key_tag" : {
                    "description" : "Key Tag: Range(max = 65535L, error = INVALID_TRUSTANCHOR_KEY_TAG_RANGE_CONFIG: key digest key tag is not in valid range '0 - 65535', min = 0L) ",
                    "type" : "integer"
                  }
                }
              },
              "domain" : {
                "description" : "Domain",
                "type" : "string"
              },
              "class" : {
                "description" : "Anchor Class: Pattern(error = INVALID_CLASS_VALUE: Invalid class, must be only alphabets value, regexp = ^[ a-zA-Z]*$) Size(max = 128, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
                "type" : "string"
              }
            }
          }
        },
        "dns_check_unsigned" : {
          "description" : "Dns Check Unsigned",
          "type" : "boolean"
        },
        "disable_dnssec_timecheck" : {
          "description" : "Disable Dnssec Timecheck",
          "type" : "boolean"
        },
        "enabled" : {
          "description" : "Enabled",
          "type" : "boolean"
        }
      }
    },
    "enable_dnssec_proxy" : {
      "description" : "Enable Dnssec Proxy",
      "type" : "boolean"
    },
    "dns_rebind_config" : {
      "properties" : {
        "rebind_domains" : {
          "description" : "Rebind Domains: UniqueHostNames(allowNull = true, max = 2147483647, error = INVALID_DNSREBIND_REBIND_DOMAINS_LIST_CONFIG: Invalid dnsrebind rebind domains list, min = 0) ",
          "type" : "array",
          "items" : {
            "description" : "Rebind Domains",
            "type" : "string"
          }
        },
        "enable_localhost_rebind" : {
          "description" : "Enable Localhost Rebind",
          "type" : "boolean"
        },
        "stop_dns_rebind_privateip" : {
          "description" : "Stop Dns Rebind Privateip",
          "type" : "boolean"
        }
      }
    },
    "cache_config" : {
      "properties" : {
        "cache_size" : {
          "description" : "Cache Size: Range(max = 9223372036854775807L, error = INVALID_CACHE_SIZE_RANGE: Invalid cache size, must be positive value, min = 0L) ",
          "format" : "int32",
          "type" : "integer"
        },
        "negative_cache_ttl" : {
          "description" : "Negative Cache Ttl: Range(max = 9223372036854775807L, error = INVALID_NEG_CACHE_TTL_RANGE: Invalid negative cache ttl, must be positive value, min = 0L) ",
          "type" : "integer"
        },
        "max_cache_ttl" : {
          "description" : "Max Cache Ttl: Range(max = 9223372036854775807L, error = INVALID_MAX_CACHE_TTL_RANGE: Invalid max cache ttl, must be positive value, min = 0L) ",
          "type" : "integer"
        },
        "min_cache_ttl" : {
          "description" : "Min Cache Ttl: Range(max = 9223372036854775807L, error = INVALID_MIN_CACHE_TTL_RANGE: Invalid min cache ttl, must be positive value, min = 0L) ",
          "format" : "int32",
          "type" : "integer"
        },
        "disable_negative_caching" : {
          "description" : "Disable Negative Caching",
          "type" : "boolean"
        }
      }
    },
    "dns_response_overrides" : {
      "properties" : {
        "aliases" : {
          "description" : "Aliases: Valid ",
          "type" : "array",
          "items" : {
            "properties" : {
              "mask" : {
                "description" : "Mask: Range(max = 32L, error = ALIAS_CONFIG_INVALID_MASK: Invalid alias mask, allowed range is (0-32), min = 0L) ",
                "format" : "int32",
                "type" : "integer"
              },
              "replace_ip" : {
                "description" : "Replace Ip: NotEmpty(error = ALIAS_CONFIG_REPLACE_IP_ADDRESS_MISSING: Alias replace ip address missing) IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = ALIAS_CONFIG_INVALID_REPLACE_IP: Invalid alias replace ip address, type = IP) ",
                "type" : "string"
              },
              "original_end_ip" : {
                "description" : "Original End Ip: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = ALIAS_CONFIG_INVALID_ORIGINAL_END_IP: Invalid alias original end ip, type = IP) ",
                "type" : "string"
              },
              "original_start_ip" : {
                "description" : "Original Start Ip: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = ALIAS_CONFIG_INVALID_ORIGINAL_START_IP: Invalid alias original start ip, type = IP) ",
                "type" : "string"
              },
              "original_ip" : {
                "description" : "Original Ip: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = ALIAS_CONFIG_INVALID_ORIGINAL_IP: Invalid alias original ip, type = IP) ",
                "type" : "string"
              }
            },
            "required" : [ "replace_ip" ]
          }
        },
        "ignore_ip_addresses" : {
          "description" : "Ignore Ip Addresses: ListIPAddress(bcast = DENY, listMaxSize = 0, error = INVALID_IGNORE_IP_ADDRESS: Invalid ignore ip addresses, required = false, type = IP) ",
          "type" : "array",
          "items" : {
            "description" : "Ignore Ip Addresses",
            "type" : "string"
          }
        },
        "bogus_nx_domains" : {
          "description" : "Bogus Nx Domains: ListIPAddress(bcast = DENY, listMaxSize = 0, error = INVALID_BOGUS_NX_DOMAINS: Invalid bogus nx domains, required = false, type = IP) ",
          "type" : "array",
          "items" : {
            "description" : "Bogus Nx Domains",
            "type" : "string"
          }
        },
        "disable_private_ip_lookups" : {
          "description" : "Disable Private Ip Lookups",
          "type" : "boolean"
        },
        "local_ttl" : {
          "description" : "Local Ttl: Range(max = 9223372036854775807L, error = INVALID_LOCAL_TTL_RANGE: Invalid local ttl, must be positive value, min = 0L) ",
          "type" : "integer"
        },
        "max_ttl" : {
          "description" : "Max Ttl: Range(max = 9223372036854775807L, error = INVALID_MAX_TTL_RANGE: Invalid max ttl, must be positive value, min = 0L) ",
          "type" : "integer"
        }
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
              "description" : "Identifier Text: Pattern(error = INVALID_IDENTIFIER_VALUE: Invalid identifier, must be only alphabets value, regexp = ^[ a-zA-Z]*$) Size(max = 128, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
              "type" : "string"
            },
            "type" : {
              "description" : "Type: ValidateEnum(enumClass = classOf[CustomerPremisesEquipmentType], error = INVALID_CUSTOMER_PREMISES_EQUIPMENT_TYPE: Invalid customer premises equipment type. Allowed values text|element_id|element_name, nullAllowed = false) ",
              "type" : "string",
              "enum" : [ "text", "element_id", "element_name" ]
            }
          },
          "required" : [ "type" ]
        },
        "add_client_mac" : {
          "properties" : {
            "mac_encoding_format" : {
              "description" : "Mac Encoding Format: ValidateEnum(enumClass = classOf[MacEncodingFormat], INVALID_MAC_ENCODING_FORMAT, nullAllowed = false) ",
              "type" : "string",
              "enum" : [ "base64", "hexadecimal" ]
            }
          },
          "required" : [ "mac_encoding_format" ]
        }
      }
    },
    "edns_packet_max" : {
      "description" : "Edns Packet Max: Range(max = 9223372036854775807L, error = INVALID_EDNS_PACKET_MAX_RANGE: Invalid edns packet max, must be positive value, min = 0L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "enable_dns_loop_detection" : {
      "description" : "Enable Dns Loop Detection",
      "type" : "boolean"
    },
    "enable_strict_domain_name" : {
      "description" : "Enable Strict Domain Name",
      "type" : "boolean"
    },
    "listen_port" : {
      "description" : "Listen Port: Range(max = 65535L, error = INVALID_DNSSERVER_LISTEN_PORT_RANGE_CONFIG: Dns Server listen port is not in the valid range '1 - 65535', min = 1L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "listen_dnsservicerole_id" : {
      "description" : "Listen Dnsservicerole Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) Size(max = 20, error = VALUE_EXCEEDS_LIMIT: value length exceeds maximum limit, min = 0) ",
      "type" : "string"
    },
    "tags" : {
      "description" : "Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 128, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\\\s]+, required = false) ",
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
      "description" : "Description: Size(max = 256, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Required(error = NAME_REQD: Please provide resource name.) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
      "type" : "string"
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
  "required" : [ "dns_forward_config", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_dns_service_profile.my_resource_name"
 id="<resource_id>"
}
```

