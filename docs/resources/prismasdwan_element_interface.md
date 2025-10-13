## Documentation for Prisma SDWAN Resource "element_interface"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_interface` |
| Get Api  | `/sdwan/v4.20/api/sites/{site_id}/elements/{element_id}/interfaces/{interface_id}` (`InterfaceScreenV4N20`) |
| Post Api  | `/sdwan/v4.20/api/sites/{site_id}/elements/{element_id}/interfaces` (`InterfaceScreenV4N20`) |
| Put Api  | `/sdwan/v4.20/api/sites/{site_id}/elements/{element_id}/interfaces/{interface_id}` (`InterfaceScreenV4N20`) |
| Delete Api  | `/sdwan/v4.20/api/sites/{site_id}/elements/{element_id}/interfaces/{interface_id}` |


### JSON Schema

```json
{
  "properties" : {
    "cellular_config" : {
      "properties" : {
        "apn_config" : {
          "properties" : {
            "password_encrypted" : {
              "description" : "Password Encrypted: JsonIgnore(value = true) ",
              "type" : "string",
              "additionalProperties" : {
                "properties" : {
                  "x_flag_sensitive" : {
                    "type" : "boolean"
                  }
                }
              }
            },
            "clear_password" : {
              "description" : "Clear Password: Transient ",
              "type" : "boolean"
            },
            "password" : {
              "description" : "Password: Transient ",
              "type" : "string",
              "additionalProperties" : {
                "properties" : {
                  "x_flag_sensitive" : {
                    "type" : "boolean"
                  }
                }
              }
            },
            "user_name" : {
              "description" : "User Name: Size(max = 100, error = CELLULAR_INTERFACE_CONFIG_APN_CONFIG_USERNAME_INVALID: Invalid cellular interface config. APN username is invalid. APN username allowed max length is 100., min = 0) ",
              "type" : "string"
            },
            "authentication" : {
              "description" : "Authentication: ValidateEnum(enumClass = classOf[APNAuthentication], message = INVALID_APN_AUTHENTICATION, nullAllowed = false) ",
              "type" : "string",
              "enum" : [ "none", "pap", "chap", "pap_or_chap" ]
            },
            "apn" : {
              "description" : "Apn: Size(max = 100, error = CELLULAR_INTERFACE_CONFIG_APN_CONFIG_PROFILE_NAME_INVALID: Invalid cellular interface config. APN name is invalid. APN name allowed max length is 100. Valid characters are alphanumeric, hyphen (-), and period (.). Must begin and end with an alphanumeric character., min = 0) ",
              "type" : "string"
            }
          },
          "required" : [ "authentication" ]
        },
        "apnprofile_id" : {
          "description" : "Apnprofile Id",
          "type" : "string"
        },
        "auto_apn" : {
          "description" : "Auto Apn",
          "type" : "boolean"
        },
        "parent_sim_slot_number" : {
          "description" : "Parent Sim Slot Number",
          "format" : "int32",
          "type" : "integer"
        },
        "parent_module_id" : {
          "description" : "Parent Module Id",
          "type" : "string"
        }
      }
    },
    "sgi_apply_static_tag" : {
      "description" : "Sgi Apply Static Tag",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "port_channel_config" : {
      "properties" : {
        "transmission_mode" : {
          "description" : "Transmission Mode",
          "type" : "string",
          "enum" : [ "Slow", "Fast" ]
        },
        "lacp_enabled" : {
          "description" : "Lacp Enabled",
          "type" : "boolean"
        }
      }
    },
    "service_link_config" : {
      "properties" : {
        "passive_mode" : {
          "properties" : {
            "enable" : {
              "description" : "Enable",
              "type" : "boolean"
            },
            "peer_ip_dynamic" : {
              "description" : "Peer Ip Dynamic",
              "type" : "boolean"
            }
          }
        },
        "ipsec_config" : {
          "properties" : {
            "authentication" : {
              "properties" : {
                "peer_id_check" : {
                  "description" : "Peer Id Check",
                  "type" : "string",
                  "enum" : [ "EXACT", "WILDCARD" ]
                },
                "comment" : {
                  "description" : "Comment",
                  "type" : "string"
                },
                "certificate_profile_id" : {
                  "description" : "Certificate Profile Id",
                  "type" : "string"
                },
                "local_pa_certificate_id" : {
                  "description" : "Local Pa Certificate Id",
                  "type" : "string"
                },
                "strict_validation_peer_extended_key_use" : {
                  "description" : "Strict Validation Peer Extended Key Use",
                  "type" : "boolean"
                },
                "permit_peer_id_mismatch" : {
                  "description" : "Permit Peer Id Mismatch",
                  "type" : "boolean"
                },
                "ikev1_params" : {
                  "properties" : {
                    "xauth_secret_encrypted" : {
                      "description" : "Xauth Secret Encrypted: JsonIgnore(value = true) ",
                      "type" : "string",
                      "additionalProperties" : {
                        "properties" : {
                          "x_flag_sensitive" : {
                            "type" : "boolean"
                          }
                        }
                      }
                    },
                    "xauth_secret_hash" : {
                      "description" : "Xauth Secret Hash: JsonIgnore(value = true) ",
                      "type" : "string",
                      "additionalProperties" : {
                        "properties" : {
                          "x_flag_sensitive" : {
                            "type" : "boolean"
                          }
                        }
                      }
                    },
                    "xauth_secret" : {
                      "description" : "Xauth Secret: Length(max = 128, error = IPSECCONFIG_INVALID_XAUTH_SECRET_LEN: Invalid extended authentication secret length.Should be between 4-128., min = 4) Transient ",
                      "type" : "string",
                      "additionalProperties" : {
                        "properties" : {
                          "x_flag_sensitive" : {
                            "type" : "boolean"
                          }
                        }
                      }
                    },
                    "xauth_id" : {
                      "description" : "Xauth Id",
                      "type" : "string"
                    },
                    "xauth_type" : {
                      "description" : "Xauth Type: ValidateEnum(enumClass = classOf[IKEXAuthType], error = IPSECCONFIG_INVALID_XAUTH_TYPE: Invalid extended authentication type specified.Valid type are secret or none., nullAllowed = false) ",
                      "type" : "string",
                      "enum" : [ "NONE", "SECRET" ]
                    }
                  },
                  "required" : [ "xauth_type" ]
                },
                "remote_id" : {
                  "description" : "Remote Id: Length(max = 255, error = IPSECCONFIG_INVALID_REMOTE_ID_LEN: Invalid remote id len.Should be between 2-255., min = 2) ",
                  "type" : "string"
                },
                "local_id_custom" : {
                  "description" : "Local Id Custom: Length(max = 255, error = IPSECCONFIG_INVALID_LOCAL_ID_LEN: Invalid local id len.Should be between 2-255., min = 2) ",
                  "type" : "string"
                },
                "local_id" : {
                  "description" : "Local Id: ValidateEnum(enumClass = classOf[IPSECLocalIdType], error = IPSECCONFIG_INVALID_LOCAL_ID_TYPE: Invalid local id type.Should be either hostname, dn, local_ip or custom, nullAllowed = false) ",
                  "type" : "string",
                  "enum" : [ "LOCAL_IP", "DN", "HOSTNAME", "CUSTOM", "NONE" ]
                },
                "passphrase_encrypted" : {
                  "description" : "Passphrase Encrypted: JsonIgnore(value = true) ",
                  "type" : "string"
                },
                "passphrase" : {
                  "description" : "Passphrase: Transient ",
                  "type" : "string"
                },
                "private_key_encrypted" : {
                  "description" : "Private Key Encrypted: JsonIgnore(value = true) ",
                  "type" : "string"
                },
                "private_key" : {
                  "description" : "Private Key: Transient ",
                  "type" : "string"
                },
                "certificate" : {
                  "description" : "Certificate",
                  "type" : "string"
                },
                "local_ca_certificate" : {
                  "description" : "Local Ca Certificate",
                  "type" : "string"
                },
                "remote_ca_certificate" : {
                  "description" : "Remote Ca Certificate",
                  "type" : "string"
                },
                "pa_master_key_id" : {
                  "description" : "Pa Master Key Id",
                  "type" : "string"
                },
                "secret_encrypted" : {
                  "description" : "Secret Encrypted: JsonIgnore(value = true) ",
                  "type" : "string",
                  "additionalProperties" : {
                    "properties" : {
                      "x_flag_sensitive" : {
                        "type" : "boolean"
                      }
                    }
                  }
                },
                "secret_hash" : {
                  "description" : "Secret Hash: JsonIgnore(value = true) ",
                  "type" : "string",
                  "additionalProperties" : {
                    "properties" : {
                      "x_flag_sensitive" : {
                        "type" : "boolean"
                      }
                    }
                  }
                },
                "secret" : {
                  "description" : "Secret: Transient ",
                  "type" : "string",
                  "additionalProperties" : {
                    "properties" : {
                      "x_flag_sensitive" : {
                        "type" : "boolean"
                      }
                    }
                  }
                },
                "type" : {
                  "description" : "Type: ValidateEnum(enumClass = classOf[IPSECAuthenticationType], error = IPSECCONFIG_INVALID_AUTHENTICATION_TYPE: Invalid authentication type specified.Valid type are x509, psk or none., nullAllowed = false) ",
                  "type" : "string",
                  "enum" : [ "NONE", "PSK", "X509" ]
                }
              },
              "required" : [ "local_id", "type" ]
            },
            "ipsec_profile_id" : {
              "description" : "Ipsec Profile Id: Required(error = IPSEC_PROFILE_ID_MISSING: IPSEC Profile must be specified for IPSEC VPNs) ",
              "type" : "string"
            }
          },
          "required" : [ "ipsec_profile_id" ]
        },
        "gre_config" : {
          "properties" : {
            "keepalive_fail_count" : {
              "description" : "Keepalive Fail Count: Range(max = 10L, error = INTERFACE_CONFIG_SERVICE_LINK_INVALID_GRE_KEEPALIVE_FAIL_COUNT: Keep alive fail count should be in range 1 to 10, min = 1L) ",
              "format" : "int32",
              "type" : "integer"
            },
            "keepalive_interval" : {
              "description" : "Keepalive Interval: Range(max = 30L, error = INTERFACE_CONFIG_SERVICE_LINK_INVALID_GRE_KEEPALIVE_INTERVAL: Keep alive interval should be in range 3 to 30, min = 3L) ",
              "format" : "int32",
              "type" : "integer"
            },
            "keepalive_enable" : {
              "description" : "Keepalive Enable",
              "type" : "boolean"
            },
            "csum" : {
              "description" : "Csum",
              "type" : "boolean"
            }
          }
        },
        "last_parent" : {
          "description" : "Last Parent: JsonIgnore(value = true) Transient ",
          "type" : "string"
        },
        "parent" : {
          "description" : "Parent: JsonIgnore(value = true) ",
          "type" : "string"
        },
        "peer" : {
          "properties" : {
            "hostname" : {
              "description" : "Hostname: Size(max = 256, INVALID_PEER_HOSTNAME, min = 0) ",
              "type" : "string"
            },
            "ip_addresses" : {
              "description" : "Ip Addresses",
              "type" : "array",
              "items" : {
                "description" : "Ip Addresses",
                "type" : "string"
              }
            }
          }
        },
        "service_endpoint_id" : {
          "description" : "Service Endpoint Id",
          "type" : "string"
        },
        "type" : {
          "description" : "Type: ValidateEnum(enumClass = classOf[ServiceLinkType], INVALID_SERVICE_LINK_TYPE, nullAllowed = false) ",
          "type" : "string",
          "enum" : [ "IPSEC", "GRE", "GENEVE" ]
        }
      },
      "required" : [ "type" ]
    },
    "vlan_config" : {
      "properties" : {
        "mstp_instance" : {
          "description" : "Mstp Instance",
          "format" : "int32",
          "type" : "integer"
        },
        "vlan_id" : {
          "description" : "Vlan Id",
          "format" : "int32",
          "type" : "integer"
        },
        "voice_enabled" : {
          "description" : "Voice Enabled",
          "type" : "boolean"
        }
      }
    },
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
    "authentication_config" : {
      "properties" : {
        "fallback_retry_count" : {
          "description" : "Fallback Retry Count",
          "type" : "integer"
        },
        "reauthentication_timeout" : {
          "description" : "Reauthentication Timeout",
          "type" : "integer"
        },
        "mode" : {
          "description" : "Mode",
          "type" : "string",
          "enum" : [ "none", "dot1x", "macauth", "dot1x-to-macauth-fallback" ]
        }
      }
    },
    "peer_bypasspair_wan_port_type" : {
      "description" : "Peer Bypasspair Wan Port Type: ValidateEnum(enumClass = classOf[PortExtensionType], message = Invalid enum string., nullAllowed = false) ",
      "type" : "string",
      "enum" : [ "none", "cellular" ],
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "ipv6_config" : {
      "properties" : {
        "static_config" : {
          "properties" : {
            "enable_prefix_distribution" : {
              "description" : "Enable Prefix Distribution",
              "type" : "boolean"
            },
            "address" : {
              "description" : "Address",
              "type" : "string"
            }
          }
        },
        "routes" : {
          "description" : "Routes",
          "type" : "array",
          "items" : {
            "properties" : {
              "destination" : {
                "description" : "Destination",
                "type" : "string"
              },
              "via" : {
                "description" : "Via",
                "type" : "string"
              }
            }
          }
        },
        "dns_v6_config" : {
          "properties" : {
            "search" : {
              "description" : "Search",
              "type" : "array",
              "items" : {
                "description" : "Search",
                "type" : "string"
              }
            },
            "name_servers" : {
              "description" : "Name Servers",
              "type" : "array",
              "items" : {
                "description" : "Name Servers",
                "type" : "string"
              }
            }
          }
        },
        "dhcp_config" : {
          "properties" : {
            "hostname" : {
              "description" : "Hostname",
              "type" : "string"
            },
            "client_id" : {
              "description" : "Client Id",
              "type" : "string"
            }
          }
        },
        "type" : {
          "description" : "Type",
          "type" : "string"
        }
      }
    },
    "pppoe_config" : {
      "properties" : {
        "ip_address_type" : {
          "description" : "Ip Address Type",
          "type" : "string"
        },
        "reconnection_delay" : {
          "description" : "Reconnection Delay",
          "format" : "int32",
          "type" : "integer"
        },
        "host_uniq" : {
          "description" : "Host Uniq",
          "type" : "string"
        },
        "service_name" : {
          "description" : "Service Name",
          "type" : "string"
        },
        "password" : {
          "description" : "Password",
          "type" : "string",
          "additionalProperties" : {
            "properties" : {
              "x_flag_sensitive" : {
                "type" : "boolean"
              }
            }
          }
        },
        "username" : {
          "description" : "Username",
          "type" : "string"
        }
      }
    },
    "interface_profile_id" : {
      "description" : "Interface Profile Id",
      "type" : "string"
    },
    "switch_port_config" : {
      "properties" : {
        "storm_control_config" : {
          "properties" : {
            "broadcast_threshold" : {
              "description" : "Broadcast Threshold: ValidateDecimal(allowZero = true, increment = 0, max = 0, error = INTERFACE_CONFIG_INVALID_STORM_CONTROL_BROADCAST_THRESHOLD: Invalid interface configuration. Switch port interface storm control broadcast threshold value is invalid. Valid value is 0, or range must be [64-1000000] kbps, [64kbps to < 1Mbps in increments of 64kbps], [1Mbps to 100Mbps in increments of 1Mbps], [100Mbps to 1000Mbps in increments of 10Mbps], min = 0) ",
              "type" : "integer"
            },
            "multicast_threshold" : {
              "description" : "Multicast Threshold: ValidateDecimal(allowZero = true, increment = 0, max = 0, error = INTERFACE_CONFIG_INVALID_STORM_CONTROL_MULTICAST_THRESHOLD: Invalid interface configuration. Switch port interface storm control multicast threshold value is invalid. Valid value is 0, or range must be [64-1000000] kbps, [64kbps to < 1Mbps in increments of 64kbps], [1Mbps to 100Mbps in increments of 1Mbps], [100Mbps to 1000Mbps in increments of 10Mbps], min = 0) ",
              "type" : "integer"
            },
            "unicast_threshold" : {
              "description" : "Unicast Threshold: ValidateDecimal(allowZero = true, increment = 0, max = 0, error = INTERFACE_CONFIG_INVALID_STORM_CONTROL_UNICAST_THRESHOLD: Invalid interface configuration. Switch port interface storm control unicast threshold value is invalid. Valid value is 0, or range must be [64-1000000] kbps, [64kbps to < 1Mbps in increments of 64kbps], [1Mbps to 100Mbps in increments of 1Mbps], [100Mbps to 1000Mbps in increments of 10Mbps], min = 0) ",
              "type" : "integer"
            }
          }
        },
        "forward_fast_enabled" : {
          "description" : "Forward Fast Enabled",
          "type" : "boolean"
        },
        "root_guard_enabled" : {
          "description" : "Root Guard Enabled",
          "type" : "boolean"
        },
        "bpdu_guard_enabled" : {
          "description" : "Bpdu Guard Enabled",
          "type" : "boolean"
        },
        "stp_port_cost" : {
          "description" : "Stp Port Cost: Range(max = 65535L, error = INTERFACE_CONFIG_SWITCH_PORT_INVALID_STP_COST: Invalid interface configuration. Switch port interface config is invalid. Invalid STP cost. Valid values are 1-65535., min = 1L) ",
          "format" : "int32",
          "type" : "integer"
        },
        "stp_port_priority" : {
          "description" : "Stp Port Priority: ValidateDecimal(allowZero = true, increment = 0, max = 0, error = INTERFACE_CONFIG_SWITCH_PORT_INVALID_STP_PRIORITY: Invalid interface configuration. Switch port interface config is invalid. Invalid stp priority. Valid values are 0-240 and must be a multiple of 16., min = 0) ",
          "format" : "int32",
          "type" : "integer"
        },
        "stp_port_enabled" : {
          "description" : "Stp Port Enabled",
          "type" : "boolean"
        },
        "trunk_vlans" : {
          "description" : "Trunk Vlans: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 32, error = INTERFACE_CONFIG_SWITCH_PORT_INVALID_TRUNK_VLANS: Invalid interface configuration. Switch port config is invalid.  VLAN mode is trunk. Max trunk VLANs allowed is 32 and no duplicates are allowed., noTrim = false, regex = , required = false) ",
          "type" : "array",
          "items" : {
            "description" : "Trunk Vlans",
            "type" : "string"
          }
        },
        "access_vlan_id" : {
          "description" : "Access Vlan Id",
          "type" : "integer"
        },
        "native_vlan_id" : {
          "description" : "Native Vlan Id",
          "type" : "integer"
        },
        "voice_vlan_id" : {
          "description" : "Voice Vlan Id",
          "type" : "integer"
        },
        "vlan_mode" : {
          "description" : "Vlan Mode: ValidateEnum(enumClass = classOf[VlanMode], error = INTERFACE_CONFIG_SWITCH_PORT_INVALID_VLAN_MODE: Invalid interface configuration. Switch port interface config is invalid. Invalid vlan mode. Valid values are access and trunk., nullAllowed = false) ",
          "type" : "string",
          "enum" : [ "access", "trunk" ]
        }
      },
      "required" : [ "vlan_mode" ]
    },
    "lldp_enabled" : {
      "description" : "Lldp Enabled",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "power_usage_threshold" : {
      "description" : "Power Usage Threshold: ValidateDecimal(allowZero = true, increment = 0, max = 0, error = INTERFACE_CONFIG_INVALID_POE_POWER_USAGE_THRESHOLD: Invalid Interface configuration. Invalid PoE alarm threshold value {}. Valid values are in the range 50-100., min = 0) ",
      "format" : "int32",
      "type" : "integer",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "poe_enabled" : {
      "description" : "Poe Enabled",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "multicast_config" : {
      "properties" : {
        "igmp_version" : {
          "description" : "Igmp Version",
          "type" : "string",
          "enum" : [ "IGMPV2", "IGMPV3" ]
        },
        "multicast_enabled" : {
          "description" : "Multicast Enabled",
          "type" : "boolean"
        },
        "dr_priority" : {
          "type" : "integer"
        },
        "igmp_static_joins" : {
          "type" : "array",
          "items" : {
            "properties" : {
              "igmp_static_grp_ipv4" : {
                "description" : "Igmp Static Grp Ipv4",
                "type" : "string"
              },
              "igmp_static_src_ipv4" : {
                "description" : "Igmp Static Src Ipv4",
                "type" : "string"
              }
            }
          }
        }
      }
    },
    "nat_port_v6" : {
      "description" : "Nat Port V6: Range(max = 65535L, error = INTERFACE_CONFIG_INVALID_PORT: LAN,WAN,Internet bypass ports cannot be part of logical interface groups., min = 0L) ",
      "format" : "int32",
      "type" : "integer",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "nat_address_v6" : {
      "description" : "Nat Address V6: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = INVALID_IPV6_NAT: IPv6 NAT address is invalid., type = IPV6) ",
      "type" : "string"
    },
    "static_arp_configs" : {
      "description" : "Static Arp Configs: Size(max = 32, error = INTERFACE_CONFIG_STATIC_ARP_EXCEEDS_LIMIT: Invalid interface configuration. Static ARP entries exceed the supported limit of 16, min = 0) ",
      "type" : "array",
      "items" : {
        "properties" : {
          "mac_address" : {
            "description" : "Mac Address: MACAddress(error = INTERFACE_CONFIG_INVALID_MAC: Invalid mac address syntax.) ",
            "type" : "string"
          },
          "ipv4_address" : {
            "description" : "Ipv4 Address: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, INVALID_IP, type = IP) ",
            "type" : "string"
          }
        }
      }
    },
    "secondary_ip_configs" : {
      "description" : "Secondary Ip Configs",
      "type" : "array",
      "items" : {
        "properties" : {
          "ipv4_address" : {
            "description" : "Ipv4 Address",
            "type" : "string"
          },
          "scope" : {
            "description" : "Scope",
            "type" : "string"
          }
        }
      }
    },
    "ipfixfiltercontext_id" : {
      "description" : "Ipfixfiltercontext Id",
      "type" : "string"
    },
    "ipfixcollectorcontext_id" : {
      "description" : "Ipfixcollectorcontext Id",
      "type" : "string"
    },
    "directed_broadcast" : {
      "description" : "Directed Broadcast",
      "type" : "boolean",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "nat_pools" : {
      "description" : "Nat Pools: Embedded(concreteClass = classOf[Object], value = .) Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "ipv4_ranges" : {
            "description" : "Ipv4 Ranges: Size(max = 4, error = INTERFACE_CONFIG_INVALID_NAT_POOL_IP_RANGE: Minimum 1 and maximum 4 nat pool IP ranges can be specified., min = 1) Valid Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
            "type" : "array",
            "items" : {
              "properties" : {
                "end" : {
                  "description" : "End: NotNull(error = END_IP_MISSING: End ip is not specified in range.) IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = END_IP_INVALID_IN_RANGE: Invalid end ip specified in range., type = IP) ",
                  "type" : "string"
                },
                "start" : {
                  "description" : "Start: NotNull(error = START_IP_MISSING: Start ip is not specified in range.) IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = START_IP_INVALID_IN_RANGE: Invalid start ip specified in range., type = IP) ",
                  "type" : "string"
                }
              },
              "required" : [ "end", "start" ]
            }
          },
          "nat_pool_id" : {
            "description" : "Nat Pool Id: Digits(fraction = 0, integer = 30, INVALID_NAT_POLICYPOOL_ID) Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
            "type" : "string"
          }
        }
      }
    },
    "devicemgmt_policysetstack_id" : {
      "description" : "Devicemgmt Policysetstack Id: Digits(fraction = 0, integer = 30, INVALID_DEVICEMGMT_POLICYSETSTACK_ID) Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
      "type" : "string"
    },
    "nat_zone_id" : {
      "description" : "Nat Zone Id: Digits(fraction = 0, integer = 30, INVALID_NAT_POLICY_ZONE) Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
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
    "scope" : {
      "description" : "Scope: ValidateEnum(enumClass = classOf[NetworkScope], message = Invalid enum string., nullAllowed = false) ",
      "type" : "string",
      "enum" : [ "GLOBAL", "LOCAL" ]
    },
    "bypass_pair" : {
      "properties" : {
        "lan_state_propagation" : {
          "description" : "Lan State Propagation",
          "type" : "boolean"
        },
        "use_relay" : {
          "description" : "Use Relay",
          "type" : "boolean"
        },
        "wan" : {
          "description" : "Wan",
          "type" : "string"
        },
        "lan" : {
          "description" : "Lan",
          "type" : "string"
        }
      }
    },
    "network_context_id" : {
      "description" : "Network Context Id",
      "type" : "string"
    },
    "parent" : {
      "description" : "Parent: Transient ",
      "type" : "string"
    },
    "sub_interface" : {
      "properties" : {
        "vlan_id" : {
          "description" : "Vlan Id",
          "format" : "int32",
          "type" : "integer"
        }
      }
    },
    "bound_interfaces" : {
      "description" : "Bound Interfaces",
      "type" : "array",
      "items" : {
        "description" : "Bound Interfaces",
        "type" : "string"
      }
    },
    "used_for" : {
      "description" : "Used For: ValidateEnum(enumClass = classOf[UsedFor], error = INTERFACE_CONFIG_INVALID_USEDFOR_VALUE: Invalid used for value specified.The allowed values are public,private_wan,lan,none, nullAllowed = false) ",
      "type" : "string"
    },
    "nat_port" : {
      "description" : "Nat Port: Range(max = 65535L, error = INTERFACE_CONFIG_INVALID_PORT: LAN,WAN,Internet bypass ports cannot be part of logical interface groups., min = 0L) ",
      "format" : "int32",
      "type" : "integer",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "nat_address" : {
      "description" : "Nat Address: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = INVALID_NAT_IP: NAT IP address is invalid., type = IP) ",
      "type" : "string"
    },
    "admin_up" : {
      "description" : "Admin Up",
      "type" : "boolean"
    },
    "ethernet_port" : {
      "properties" : {
        "full_duplex" : {
          "description" : "Full Duplex",
          "type" : "boolean"
        },
        "speed" : {
          "description" : "Speed",
          "format" : "int32",
          "type" : "integer"
        }
      }
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
    "ipv4_config" : {
      "properties" : {
        "routes" : {
          "description" : "Routes: Valid ",
          "type" : "array",
          "items" : {
            "properties" : {
              "destination" : {
                "description" : "Destination",
                "type" : "string"
              },
              "via" : {
                "description" : "Via",
                "type" : "string"
              }
            }
          }
        },
        "dns_v4_config" : {
          "properties" : {
            "search" : {
              "description" : "Search",
              "type" : "array",
              "items" : {
                "description" : "Search",
                "type" : "string"
              }
            },
            "name_servers" : {
              "description" : "Name Servers",
              "type" : "array",
              "items" : {
                "description" : "Name Servers",
                "type" : "string"
              }
            }
          }
        },
        "pppoe_config" : {
          "properties" : {
            "chap_passwd" : {
              "description" : "Chap Passwd",
              "type" : "string"
            },
            "chap_user" : {
              "description" : "Chap User",
              "type" : "string"
            },
            "set_route" : {
              "description" : "Set Route",
              "type" : "boolean"
            }
          }
        },
        "dhcp_config" : {
          "properties" : {
            "hostname" : {
              "description" : "Hostname",
              "type" : "string"
            },
            "client_id" : {
              "description" : "Client Id",
              "type" : "string"
            }
          }
        },
        "static_config" : {
          "properties" : {
            "address" : {
              "description" : "Address",
              "type" : "string"
            }
          }
        },
        "type" : {
          "description" : "Type: Size(max = 12, error = INTERFACE_CONFIG_INVALID_IP_TYPE: IP Type is not valid., min = 0) ",
          "type" : "string"
        }
      }
    },
    "mtu" : {
      "description" : "Mtu: Range(max = 9216L, error = INTERFACE_CONFIG_INVALID_MTU: MTU is not in the valid range., min = 0L) ",
      "type" : "integer",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "mac_address" : {
      "description" : "Mac Address: Pattern(error = INTERFACE_CONFIG_INVALID_MAC: Invalid mac address syntax., regexp = ([0-9a-f]{2}[:]){5}([0-9a-f]{2})) ",
      "type" : "string"
    },
    "site_wan_interface_ids" : {
      "description" : "Site Wan Interface Ids",
      "type" : "array",
      "items" : {
        "description" : "Site Wan Interface Ids",
        "type" : "string"
      }
    },
    "attached_lan_networks" : {
      "description" : "Attached Lan Networks: Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "vlan_id" : {
            "description" : "Vlan Id: Range(max = 4095L, error = INVALID_VLANID: VLAN ID should be between 0 and 4095., min = 0L) ",
            "format" : "int32",
            "type" : "integer"
          },
          "lan_network_id" : {
            "description" : "Lan Network Id",
            "type" : "string"
          }
        }
      }
    },
    "type" : {
      "description" : "Type: ValidateEnum(enumClass = classOf[InterfaceType], error = INVALID_PORT_TYPE: Port type is not valid., nullAllowed = false) ",
      "type" : "string"
    },
    "description" : {
      "description" : "Description: Size(max = 256, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
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
  "required" : [ "peer_bypasspair_wan_port_type", "scope", "used_for", "type" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_interface.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

