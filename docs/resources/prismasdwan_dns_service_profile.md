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
          "description" : "Dns Servers",
          "minItems" : 1,
          "type" : "array",
          "items" : {
            "properties" : {
              "address_family" : {
                "description" : "Address Family",
                "type" : "string",
                "enum" : [ "ipv4", "ipv6", "ipv4v6" ]
              },
              "source_port" : {
                "description" : "Source Port",
                "maximum" : 65535,
                "minimum" : 1,
                "type" : "integer"
              },
              "forward_dnsservicerole_id" : {
                "description" : "Forward Dnsservicerole Id",
                "maxLength" : 20,
                "type" : "string"
              },
              "dnsserver_port" : {
                "description" : "Dnsserver Port",
                "maximum" : 65535,
                "minimum" : 1,
                "type" : "integer"
              },
              "dnsserver_ip" : {
                "description" : "Dnsserver Ip",
                "minLength" : 1,
                "type" : "string"
              },
              "domain_names" : {
                "description" : "Domain Names",
                "type" : "array",
                "uniqueItems" : true,
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
            "required" : [ "address_family", "source_port", "forward_dnsservicerole_id", "dnsserver_port", "dnsserver_ip", "domain_names", "ip_prefix" ]
          }
        },
        "send_to_all_dns_servers" : {
          "description" : "Send To All Dns Servers",
          "type" : "boolean"
        },
        "max_source_port" : {
          "description" : "Max Source Port",
          "maximum" : 65535,
          "minimum" : 1,
          "type" : "integer"
        },
        "min_source_port" : {
          "description" : "Min Source Port",
          "format" : "int32",
          "maximum" : 65535,
          "minimum" : 1,
          "type" : "integer"
        }
      },
      "required" : [ "dns_servers", "send_to_all_dns_servers", "max_source_port", "min_source_port" ]
    },
    "authoritative_config" : {
      "properties" : {
        "mx_host_records" : {
          "description" : "Mx Host Records",
          "type" : "array",
          "items" : {
            "properties" : {
              "preference" : {
                "description" : "Preference",
                "format" : "int32",
                "maximum" : 65535,
                "minimum" : 0,
                "type" : "integer"
              },
              "hostname" : {
                "description" : "Hostname",
                "minLength" : 1,
                "type" : "string"
              },
              "mx_name" : {
                "description" : "Mx Name",
                "maxLength" : 128,
                "minLength" : 1,
                "type" : "string"
              }
            },
            "required" : [ "preference", "hostname", "mx_name" ]
          }
        },
        "txt_records" : {
          "description" : "Txt Records",
          "type" : "array",
          "items" : {
            "properties" : {
              "texts" : {
                "description" : "Texts",
                "type" : "array",
                "items" : {
                  "description" : "Texts",
                  "pattern" : "[A-Za-z]+[a-zA-Z0-9_$ ]{1,255}",
                  "type" : "string"
                }
              },
              "domain_name" : {
                "description" : "Domain Name",
                "maxLength" : 128,
                "minLength" : 1,
                "type" : "string"
              }
            },
            "required" : [ "texts", "domain_name" ]
          }
        },
        "ptr_records" : {
          "description" : "Ptr Records",
          "type" : "array",
          "items" : {
            "properties" : {
              "target" : {
                "description" : "Target",
                "maxLength" : 256,
                "type" : "string"
              },
              "name" : {
                "description" : "Name",
                "maxLength" : 128,
                "minLength" : 1,
                "type" : "string"
              }
            },
            "required" : [ "target", "name" ]
          }
        },
        "cname_records" : {
          "description" : "Cname Records",
          "type" : "array",
          "items" : {
            "properties" : {
              "ttl" : {
                "description" : "Ttl",
                "minimum" : 0,
                "type" : "integer"
              },
              "target" : {
                "description" : "Target",
                "maxLength" : 128,
                "minLength" : 1,
                "type" : "string"
              },
              "name" : {
                "description" : "Name",
                "minItems" : 1,
                "type" : "array",
                "items" : {
                  "description" : "Name",
                  "type" : "string"
                }
              }
            },
            "required" : [ "ttl", "target", "name" ]
          }
        },
        "dns_resource_records" : {
          "description" : "Dns Resource Records",
          "type" : "array",
          "items" : {
            "properties" : {
              "hex_data" : {
                "description" : "Hex Data",
                "maxLength" : 128,
                "pattern" : "[0-9a-fA-F :]+",
                "type" : "string"
              },
              "rr_number" : {
                "description" : "Rr Number",
                "type" : "integer"
              },
              "name" : {
                "description" : "Name",
                "maxLength" : 128,
                "minLength" : 1,
                "type" : "string"
              }
            },
            "required" : [ "hex_data", "rr_number", "name" ]
          }
        },
        "caa_records" : {
          "description" : "Caa Records",
          "type" : "array",
          "items" : {
            "properties" : {
              "value" : {
                "description" : "Value",
                "maxLength" : 256,
                "minLength" : 1,
                "type" : "string"
              },
              "tag" : {
                "description" : "Tag",
                "maxLength" : 128,
                "minLength" : 1,
                "pattern" : "^[a-zA-Z0-9]+$",
                "type" : "string"
              },
              "flags" : {
                "description" : "Flags",
                "minLength" : 1,
                "pattern" : "[A-Z0-9]{1}",
                "type" : "string"
              },
              "name" : {
                "description" : "Name",
                "maxLength" : 128,
                "minLength" : 1,
                "type" : "string"
              }
            },
            "required" : [ "value", "tag", "flags", "name" ]
          }
        },
        "naptr_records" : {
          "description" : "Naptr Records",
          "type" : "array",
          "items" : {
            "properties" : {
              "replacement" : {
                "description" : "Replacement",
                "maxLength" : 256,
                "pattern" : "^[ a-zA-Z]*$",
                "type" : "string"
              },
              "regexp" : {
                "description" : "Regexp",
                "maxLength" : 256,
                "type" : "string"
              },
              "service" : {
                "description" : "Service",
                "maxLength" : 256,
                "pattern" : "^[ a-zA-Z]*$",
                "type" : "string"
              },
              "flags" : {
                "description" : "Flags",
                "minLength" : 1,
                "pattern" : "[A-Z0-9]{1}",
                "type" : "string"
              },
              "preference" : {
                "description" : "Preference",
                "maximum" : 65535,
                "minimum" : 0,
                "type" : "integer"
              },
              "order" : {
                "description" : "Order",
                "maximum" : 65535,
                "minimum" : 0,
                "type" : "integer"
              },
              "name" : {
                "description" : "Name",
                "maxLength" : 128,
                "minLength" : 1,
                "type" : "string"
              }
            },
            "required" : [ "replacement", "regexp", "service", "flags", "preference", "order", "name" ]
          }
        },
        "srv_hosts" : {
          "description" : "Srv Hosts",
          "type" : "array",
          "items" : {
            "properties" : {
              "weight" : {
                "description" : "Weight",
                "maximum" : 65535,
                "minimum" : 0,
                "type" : "integer"
              },
              "priority" : {
                "description" : "Priority",
                "maximum" : 65535,
                "minimum" : 0,
                "type" : "integer"
              },
              "port" : {
                "description" : "Port",
                "maximum" : 65535,
                "minimum" : 0,
                "type" : "integer"
              },
              "target" : {
                "description" : "Target",
                "maximum" : 65535,
                "minimum" : 0,
                "type" : "integer"
              },
              "domain_name" : {
                "description" : "Domain Name",
                "type" : "string"
              },
              "protocol" : {
                "description" : "Protocol",
                "maxLength" : 256,
                "minLength" : 1,
                "pattern" : "^[ a-zA-Z]*$",
                "type" : "string"
              },
              "service" : {
                "description" : "Service",
                "maxLength" : 256,
                "minLength" : 1,
                "pattern" : "^[ a-zA-Z]*$",
                "type" : "string"
              }
            },
            "required" : [ "weight", "priority", "port", "target", "domain_name", "protocol", "service" ]
          }
        },
        "synth_domains" : {
          "description" : "Synth Domains",
          "type" : "array",
          "items" : {
            "properties" : {
              "prefix" : {
                "description" : "Prefix",
                "pattern" : "^[a-zA-Z]*$",
                "type" : "string"
              },
              "ipaddress_prefix" : {
                "description" : "Ipaddress Prefix",
                "format" : "ipv4",
                "type" : "string"
              },
              "end_ipaddress" : {
                "description" : "End Ipaddress",
                "format" : "ipv4",
                "type" : "string"
              },
              "start_ipaddress" : {
                "description" : "Start Ipaddress",
                "format" : "ipv4",
                "type" : "string"
              },
              "domain" : {
                "description" : "Domain",
                "minLength" : 1,
                "type" : "string"
              }
            },
            "required" : [ "prefix", "ipaddress_prefix", "end_ipaddress", "start_ipaddress", "domain" ]
          }
        },
        "host_records" : {
          "description" : "Host Records",
          "type" : "array",
          "items" : {
            "properties" : {
              "ttl" : {
                "description" : "Ttl",
                "minimum" : 0,
                "type" : "integer"
              },
              "ipv6_address" : {
                "description" : "Ipv6 Address",
                "format" : "ipv6",
                "type" : "string"
              },
              "ipv4_address" : {
                "description" : "Ipv4 Address",
                "format" : "ipv4",
                "type" : "string"
              },
              "domain_names" : {
                "description" : "Domain Names",
                "type" : "array",
                "uniqueItems" : true,
                "items" : {
                  "description" : "Domain Names",
                  "type" : "string"
                }
              }
            },
            "required" : [ "ttl", "ipv6_address", "ipv4_address", "domain_names" ]
          }
        },
        "ttl" : {
          "description" : "Ttl",
          "minimum" : 0,
          "type" : "integer"
        },
        "peers" : {
          "description" : "Peers",
          "type" : "array",
          "items" : {
            "description" : "Peers",
            "format" : "ipv4",
            "type" : "string"
          }
        },
        "secondary_servers" : {
          "description" : "Secondary Servers",
          "type" : "array",
          "uniqueItems" : true,
          "items" : {
            "description" : "Secondary Servers",
            "type" : "string"
          }
        },
        "soa" : {
          "description" : "Soa",
          "type" : "array",
          "items" : {
            "properties" : {
              "expiry" : {
                "description" : "Expiry",
                "minimum" : 0,
                "type" : "integer"
              },
              "retry" : {
                "description" : "Retry",
                "minimum" : 0,
                "type" : "integer"
              },
              "refresh" : {
                "description" : "Refresh",
                "minimum" : 0,
                "type" : "integer"
              },
              "host_master" : {
                "description" : "Host Master",
                "type" : "string"
              },
              "serial_number" : {
                "description" : "Serial Number",
                "minimum" : 0,
                "type" : "integer"
              }
            },
            "required" : [ "expiry", "retry", "refresh", "host_master", "serial_number" ]
          }
        },
        "zones" : {
          "description" : "Zones",
          "type" : "array",
          "items" : {
            "properties" : {
              "exclude_prefix" : {
                "description" : "Exclude Prefix",
                "type" : "array",
                "items" : {
                  "description" : "Exclude Prefix",
                  "format" : "ipv4",
                  "type" : "string"
                }
              },
              "include_prefix" : {
                "description" : "Include Prefix",
                "type" : "array",
                "items" : {
                  "description" : "Include Prefix",
                  "format" : "ipv4",
                  "type" : "string"
                }
              },
              "domain_name" : {
                "description" : "Domain Name",
                "minLength" : 1,
                "type" : "string"
              }
            },
            "required" : [ "exclude_prefix", "include_prefix", "domain_name" ]
          }
        },
        "servers" : {
          "description" : "Servers",
          "type" : "array",
          "items" : {
            "properties" : {
              "dnsservicerole_id" : {
                "description" : "Dnsservicerole Id",
                "maxLength" : 20,
                "type" : "string"
              },
              "domain_name" : {
                "description" : "Domain Name",
                "minLength" : 1,
                "type" : "string"
              }
            },
            "required" : [ "dnsservicerole_id", "domain_name" ]
          }
        }
      },
      "required" : [ "mx_host_records", "txt_records", "ptr_records", "cname_records", "dns_resource_records", "caa_records", "naptr_records", "srv_hosts", "synth_domains", "host_records", "ttl", "peers", "secondary_servers", "soa", "zones", "servers" ]
    },
    "domains_to_addresses" : {
      "description" : "Domains To Addresses",
      "type" : "array",
      "items" : {
        "properties" : {
          "ipv6_address" : {
            "description" : "Ipv6 Address",
            "format" : "ipv6",
            "type" : "string"
          },
          "ipv4_address" : {
            "description" : "Ipv4 Address",
            "format" : "ipv4",
            "type" : "string"
          },
          "domain_names" : {
            "description" : "Domain Names",
            "type" : "array",
            "uniqueItems" : true,
            "items" : {
              "description" : "Domain Names",
              "type" : "string"
            }
          }
        },
        "required" : [ "ipv6_address", "ipv4_address", "domain_names" ]
      }
    },
    "dnssec_config" : {
      "properties" : {
        "trust_anchors" : {
          "description" : "Trust Anchors",
          "type" : "array",
          "items" : {
            "properties" : {
              "key_digest" : {
                "properties" : {
                  "digest" : {
                    "description" : "Digest",
                    "maxLength" : 256,
                    "pattern" : "[0-9a-fA-F]+",
                    "type" : "string"
                  },
                  "digest_type" : {
                    "description" : "Digest Type",
                    "maximum" : 255,
                    "minimum" : 0,
                    "type" : "integer"
                  },
                  "algorithm" : {
                    "description" : "Algorithm",
                    "maximum" : 255,
                    "minimum" : 0,
                    "type" : "integer"
                  },
                  "key_tag" : {
                    "description" : "Key Tag",
                    "maximum" : 65535,
                    "minimum" : 0,
                    "type" : "integer"
                  }
                },
                "required" : [ "digest", "digest_type", "algorithm", "key_tag" ]
              },
              "domain" : {
                "description" : "Domain",
                "type" : "string"
              },
              "class" : {
                "description" : "Anchor Class",
                "maxLength" : 128,
                "pattern" : "^[ a-zA-Z]*$",
                "type" : "string"
              }
            },
            "required" : [ "key_digest", "domain", "class" ]
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
      },
      "required" : [ "trust_anchors", "dns_check_unsigned", "disable_dnssec_timecheck", "enabled" ]
    },
    "enable_dnssec_proxy" : {
      "description" : "Enable Dnssec Proxy",
      "type" : "boolean"
    },
    "dns_rebind_config" : {
      "properties" : {
        "rebind_domains" : {
          "description" : "Rebind Domains",
          "type" : "array",
          "uniqueItems" : true,
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
      },
      "required" : [ "rebind_domains", "enable_localhost_rebind", "stop_dns_rebind_privateip" ]
    },
    "cache_config" : {
      "properties" : {
        "cache_size" : {
          "description" : "Cache Size",
          "format" : "int32",
          "minimum" : 0,
          "type" : "integer"
        },
        "negative_cache_ttl" : {
          "description" : "Negative Cache Ttl",
          "minimum" : 0,
          "type" : "integer"
        },
        "max_cache_ttl" : {
          "description" : "Max Cache Ttl",
          "minimum" : 0,
          "type" : "integer"
        },
        "min_cache_ttl" : {
          "description" : "Min Cache Ttl",
          "format" : "int32",
          "minimum" : 0,
          "type" : "integer"
        },
        "disable_negative_caching" : {
          "description" : "Disable Negative Caching",
          "type" : "boolean"
        }
      },
      "required" : [ "cache_size", "negative_cache_ttl", "max_cache_ttl", "min_cache_ttl", "disable_negative_caching" ]
    },
    "dns_response_overrides" : {
      "properties" : {
        "aliases" : {
          "description" : "Aliases",
          "type" : "array",
          "items" : {
            "properties" : {
              "mask" : {
                "description" : "Mask",
                "format" : "int32",
                "maximum" : 32,
                "minimum" : 0,
                "type" : "integer"
              },
              "replace_ip" : {
                "description" : "Replace Ip",
                "format" : "ipv4",
                "minLength" : 1,
                "type" : "string"
              },
              "original_end_ip" : {
                "description" : "Original End Ip",
                "format" : "ipv4",
                "type" : "string"
              },
              "original_start_ip" : {
                "description" : "Original Start Ip",
                "format" : "ipv4",
                "type" : "string"
              },
              "original_ip" : {
                "description" : "Original Ip",
                "format" : "ipv4",
                "type" : "string"
              }
            },
            "required" : [ "mask", "replace_ip", "original_end_ip", "original_start_ip", "original_ip" ]
          }
        },
        "ignore_ip_addresses" : {
          "description" : "Ignore Ip Addresses",
          "type" : "array",
          "items" : {
            "description" : "Ignore Ip Addresses",
            "format" : "ipv4",
            "type" : "string"
          }
        },
        "bogus_nx_domains" : {
          "description" : "Bogus Nx Domains",
          "type" : "array",
          "items" : {
            "description" : "Bogus Nx Domains",
            "format" : "ipv4",
            "type" : "string"
          }
        },
        "disable_private_ip_lookups" : {
          "description" : "Disable Private Ip Lookups",
          "type" : "boolean"
        },
        "local_ttl" : {
          "description" : "Local Ttl",
          "minimum" : 0,
          "type" : "integer"
        },
        "max_ttl" : {
          "description" : "Max Ttl",
          "minimum" : 0,
          "type" : "integer"
        }
      },
      "required" : [ "aliases", "ignore_ip_addresses", "bogus_nx_domains", "disable_private_ip_lookups", "local_ttl", "max_ttl" ]
    },
    "dns_queries_metadata" : {
      "properties" : {
        "add_subnets" : {
          "description" : "Add Subnets",
          "maxItems" : 2,
          "type" : "array",
          "items" : {
            "properties" : {
              "ipv6_prefix_length" : {
                "description" : "Ipv6 Prefix Length",
                "format" : "int32",
                "maximum" : 128,
                "minimum" : 0,
                "type" : "integer"
              },
              "ipv6_address" : {
                "description" : "Ipv6 Address",
                "format" : "ipv6",
                "type" : "string"
              },
              "ipv4_prefix_length" : {
                "description" : "Ipv4 Prefix Length",
                "format" : "int32",
                "maximum" : 32,
                "minimum" : 0,
                "type" : "integer"
              },
              "ipv4_address" : {
                "description" : "Ipv4 Address",
                "format" : "ipv4",
                "type" : "string"
              }
            },
            "required" : [ "ipv6_prefix_length", "ipv6_address", "ipv4_prefix_length", "ipv4_address" ]
          }
        },
        "add_customer_premises_equipment" : {
          "properties" : {
            "identifier_text" : {
              "description" : "Identifier Text",
              "maxLength" : 128,
              "pattern" : "^[ a-zA-Z]*$",
              "type" : "string"
            },
            "type" : {
              "description" : "Type",
              "type" : "string",
              "enum" : [ "text", "element_id", "element_name" ]
            }
          },
          "required" : [ "identifier_text", "type" ]
        },
        "add_client_mac" : {
          "properties" : {
            "mac_encoding_format" : {
              "description" : "Mac Encoding Format",
              "type" : "string",
              "enum" : [ "base64", "hexadecimal" ]
            }
          },
          "required" : [ "mac_encoding_format" ]
        }
      },
      "required" : [ "add_subnets", "add_customer_premises_equipment", "add_client_mac" ]
    },
    "edns_packet_max" : {
      "description" : "Edns Packet Max",
      "format" : "int32",
      "minimum" : 0,
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
      "description" : "Listen Port",
      "format" : "int32",
      "maximum" : 65535,
      "minimum" : 1,
      "type" : "integer"
    },
    "listen_dnsservicerole_id" : {
      "description" : "Listen Dnsservicerole Id",
      "maxLength" : 20,
      "type" : "string"
    },
    "tags" : {
      "description" : "Tags",
      "maxItems" : 10,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Tags",
        "maxLength" : 128,
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
  "required" : [ "dns_forward_config", "authoritative_config", "domains_to_addresses", "dnssec_config", "enable_dnssec_proxy", "dns_rebind_config", "cache_config", "dns_response_overrides", "dns_queries_metadata", "edns_packet_max", "enable_dns_loop_detection", "enable_strict_domain_name", "listen_port", "listen_dnsservicerole_id", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_dns_service_profile.my_resource_name"
 id="<resource_id>"
}
```

