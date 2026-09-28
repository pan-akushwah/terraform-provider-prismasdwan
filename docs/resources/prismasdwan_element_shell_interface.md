## Documentation for Prisma SDWAN Resource "element_shell_interface"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_shell_interface` |
| Get Api  | `/sdwan/v2.4/api/sites/{site_id}/elementshells/{element_shell_id}/interfaces/{interface_id}` (`InterfaceScreenV4N21`) |
| Post Api  | `/sdwan/v2.4/api/sites/{site_id}/elementshells/{element_shell_id}/interfaces` (`InterfaceScreenV4N21`) |
| Put Api  | `/sdwan/v2.4/api/sites/{site_id}/elementshells/{element_shell_id}/interfaces/{interface_id}` (`InterfaceScreenV4N21`) |
| Delete Api  | `/sdwan/v2.4/api/sites/{site_id}/elementshells/{element_shell_id}/interfaces/{interface_id}` |


### JSON Schema

```json
{
  "properties" : {
    "fec_mode" : {
      "description" : "Fec Mode",
      "type" : "string",
      "enum" : [ "auto", "rs_fec", "fc_fec", "none" ]
    },
    "loopback_config" : {
      "properties" : {
        "binding_interface_id" : {
          "description" : "Binding Interface Id",
          "type" : "string"
        }
      },
      "required" : [ "binding_interface_id" ]
    },
    "cellular_config" : {
      "properties" : {
        "ip_address_type" : {
          "description" : "Ip Address Type",
          "type" : "string",
          "enum" : [ "ipv4", "ipv6", "ipv4v6" ]
        },
        "apn_config" : {
          "properties" : {
            "password_encrypted" : {
              "description" : "Password Encrypted",
              "readOnly" : true,
              "type" : "string",
              "additionalProperties" : {
                "properties" : {
                  "x_flag_sensitive" : {
                    "type" : "boolean"
                  }
                }
              },
              "x-json-ignore" : true
            },
            "clear_password" : {
              "description" : "Clear Password",
              "type" : "boolean"
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
            "user_name" : {
              "description" : "User Name",
              "maxLength" : 100,
              "type" : "string"
            },
            "authentication" : {
              "description" : "Authentication",
              "type" : "string",
              "enum" : [ "none", "pap", "chap", "pap_or_chap" ]
            },
            "apn" : {
              "description" : "Apn",
              "maxLength" : 100,
              "type" : "string"
            }
          },
          "required" : [ "password_encrypted", "clear_password", "password", "user_name", "authentication", "apn" ]
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
      },
      "required" : [ "ip_address_type", "apn_config", "apnprofile_id", "auto_apn", "parent_sim_slot_number", "parent_module_id" ]
    },
    "sgi_apply_static_tag" : {
      "description" : "Sgi Apply Static Tag",
      "type" : "boolean"
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
      },
      "required" : [ "transmission_mode", "lacp_enabled" ]
    },
    "service_link_config" : {
      "properties" : {
        "passive_mode" : {
          "properties" : {
            "enable" : {
              "description" : "Enable",
              "type" : "boolean"
            }
          },
          "required" : [ "enable" ]
        },
        "ipsec_config" : {
          "properties" : {
            "authentication" : {
              "properties" : {
                "ppk_config" : {
                  "properties" : {
                    "ppk_secret_configured" : {
                      "description" : "Ppk Secret Configured",
                      "type" : "boolean",
                      "additionalProperties" : {
                        "properties" : {
                          "x_flag_sensitive" : {
                            "type" : "boolean"
                          }
                        }
                      }
                    },
                    "ppk_secret_hash" : {
                      "description" : "Ppk Secret Hash",
                      "readOnly" : true,
                      "type" : "string",
                      "additionalProperties" : {
                        "properties" : {
                          "x_flag_sensitive" : {
                            "type" : "boolean"
                          }
                        }
                      },
                      "x-json-ignore" : true
                    },
                    "ppk_secret_encrypted" : {
                      "description" : "Ppk Secret Encrypted",
                      "readOnly" : true,
                      "type" : "string",
                      "additionalProperties" : {
                        "properties" : {
                          "x_flag_sensitive" : {
                            "type" : "boolean"
                          }
                        }
                      },
                      "x-json-ignore" : true
                    },
                    "ppk_secret" : {
                      "description" : "Ppk Secret",
                      "type" : "string",
                      "additionalProperties" : {
                        "properties" : {
                          "x_flag_sensitive" : {
                            "type" : "boolean"
                          }
                        }
                      },
                      "x-json-alias" : "key"
                    },
                    "ppk_key_id" : {
                      "description" : "Ppk Key Id",
                      "type" : "string",
                      "x-json-alias" : "key_name"
                    },
                    "mode" : {
                      "description" : "Mode",
                      "type" : "string",
                      "enum" : [ "preferred", "mandatory" ],
                      "x-json-alias" : "negotiation_mode"
                    },
                    "enabled" : {
                      "description" : "Enabled",
                      "type" : "boolean"
                    },
                    "key_enabled" : {
                      "description" : "Key Enabled",
                      "type" : "boolean"
                    }
                  },
                  "required" : [ "enabled", "ppk_secret", "ppk_secret_configured", "ppk_key_id", "key_enabled", "ppk_secret_encrypted", "ppk_secret_hash", "mode" ]
                },
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
                      "description" : "Xauth Secret Encrypted",
                      "readOnly" : true,
                      "type" : "string",
                      "additionalProperties" : {
                        "properties" : {
                          "x_flag_sensitive" : {
                            "type" : "boolean"
                          }
                        }
                      },
                      "x-json-ignore" : true
                    },
                    "xauth_secret_hash" : {
                      "description" : "Xauth Secret Hash",
                      "readOnly" : true,
                      "type" : "string",
                      "additionalProperties" : {
                        "properties" : {
                          "x_flag_sensitive" : {
                            "type" : "boolean"
                          }
                        }
                      },
                      "x-json-ignore" : true
                    },
                    "xauth_secret" : {
                      "description" : "Xauth Secret",
                      "maxLength" : 128,
                      "minLength" : 4,
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
                      "description" : "Xauth Type",
                      "type" : "string",
                      "enum" : [ "none", "secret" ]
                    }
                  },
                  "required" : [ "xauth_secret_encrypted", "xauth_secret_hash", "xauth_secret", "xauth_id", "xauth_type" ]
                },
                "remote_id" : {
                  "description" : "Remote Id",
                  "maxLength" : 255,
                  "minLength" : 2,
                  "type" : "string"
                },
                "local_id_custom" : {
                  "description" : "Local Id Custom",
                  "maxLength" : 255,
                  "minLength" : 2,
                  "type" : "string"
                },
                "local_id" : {
                  "description" : "Local Id",
                  "type" : "string",
                  "enum" : [ "local_ip", "dn", "hostname", "custom", "none" ]
                },
                "passphrase_encrypted" : {
                  "description" : "Passphrase Encrypted",
                  "readOnly" : true,
                  "type" : "string",
                  "x-json-ignore" : true
                },
                "passphrase" : {
                  "description" : "Passphrase",
                  "type" : "string"
                },
                "private_key_encrypted" : {
                  "description" : "Private Key Encrypted",
                  "readOnly" : true,
                  "type" : "string",
                  "x-json-ignore" : true
                },
                "private_key" : {
                  "description" : "Private Key",
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
                  "description" : "Secret Encrypted",
                  "readOnly" : true,
                  "type" : "string",
                  "additionalProperties" : {
                    "properties" : {
                      "x_flag_sensitive" : {
                        "type" : "boolean"
                      }
                    }
                  },
                  "x-json-ignore" : true
                },
                "secret_hash" : {
                  "description" : "Secret Hash",
                  "readOnly" : true,
                  "type" : "string",
                  "additionalProperties" : {
                    "properties" : {
                      "x_flag_sensitive" : {
                        "type" : "boolean"
                      }
                    }
                  },
                  "x-json-ignore" : true
                },
                "secret" : {
                  "description" : "Secret",
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
                  "description" : "Type",
                  "type" : "string",
                  "enum" : [ "none", "psk", "x509" ]
                }
              },
              "required" : [ "ppk_config", "peer_id_check", "comment", "certificate_profile_id", "local_pa_certificate_id", "strict_validation_peer_extended_key_use", "permit_peer_id_mismatch", "ikev1_params", "remote_id", "local_id_custom", "local_id", "x509Objects", "passphrase_encrypted", "passphrase", "private_key_encrypted", "private_key", "certificate", "local_ca_certificate", "remote_ca_certificate", "pa_master_key_id", "secret_encrypted", "secret_hash", "secret", "type" ]
            },
            "ipsec_profile_id" : {
              "description" : "Ipsec Profile Id",
              "type" : "string"
            }
          },
          "required" : [ "authentication", "ipsec_profile_id" ]
        },
        "gre_config" : {
          "properties" : {
            "keepalive_fail_count" : {
              "description" : "Keepalive Fail Count",
              "format" : "int32",
              "maximum" : 10,
              "minimum" : 1,
              "type" : "integer"
            },
            "keepalive_interval" : {
              "description" : "Keepalive Interval",
              "format" : "int32",
              "maximum" : 30,
              "minimum" : 3,
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
          },
          "required" : [ "keepalive_fail_count", "keepalive_interval", "keepalive_enable", "csum" ]
        },
        "last_parent" : {
          "description" : "Last Parent",
          "readOnly" : true,
          "type" : "string",
          "x-json-ignore" : true
        },
        "parent" : {
          "description" : "Parent",
          "readOnly" : true,
          "type" : "string",
          "x-json-ignore" : true
        },
        "peer" : {
          "properties" : {
            "hostname" : {
              "description" : "Hostname",
              "maxLength" : 256,
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
          },
          "required" : [ "hostname", "ip_addresses" ]
        },
        "service_endpoint_id" : {
          "description" : "Service Endpoint Id",
          "type" : "string"
        },
        "type" : {
          "description" : "Type",
          "type" : "string",
          "enum" : [ "ipsec", "gre", "geneve" ]
        }
      },
      "required" : [ "passive_mode", "ipsec_config", "gre_config", "last_parent", "parent", "peer", "service_endpoint_id", "type" ]
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
      },
      "required" : [ "mstp_instance", "vlan_id", "voice_enabled" ]
    },
    "vrf_context_id" : {
      "description" : "Vrf Context Id",
      "maxLength" : 20,
      "pattern" : "^-?[0-9]{1,20}$",
      "type" : "string"
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
      },
      "required" : [ "fallback_retry_count", "reauthentication_timeout", "mode" ]
    },
    "peer_bypasspair_wan_port_type" : {
      "description" : "Peer Bypasspair Wan Port Type",
      "type" : "string",
      "enum" : [ "none", "cellular" ]
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
          },
          "required" : [ "enable_prefix_distribution", "address" ]
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
            },
            "required" : [ "destination", "via" ]
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
              "maxItems" : 3,
              "type" : "array",
              "uniqueItems" : true,
              "items" : {
                "description" : "Name Servers",
                "type" : "string"
              }
            }
          },
          "required" : [ "search", "name_servers" ]
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
          },
          "required" : [ "hostname", "client_id" ]
        },
        "type" : {
          "description" : "Type",
          "type" : "string"
        }
      },
      "required" : [ "static_config", "routes", "dns_v6_config", "dhcp_config", "type" ]
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
      },
      "required" : [ "ip_address_type", "reconnection_delay", "host_uniq", "service_name", "password", "username" ]
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
              "description" : "Broadcast Threshold",
              "maximum" : 1000000,
              "minimum" : 64,
              "type" : "integer"
            },
            "multicast_threshold" : {
              "description" : "Multicast Threshold",
              "maximum" : 1000000,
              "minimum" : 64,
              "type" : "integer"
            },
            "unicast_threshold" : {
              "description" : "Unicast Threshold",
              "maximum" : 1000000,
              "minimum" : 64,
              "type" : "integer"
            }
          },
          "required" : [ "broadcast_threshold", "multicast_threshold", "unicast_threshold" ]
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
          "description" : "Stp Port Cost",
          "format" : "int32",
          "maximum" : 65535,
          "minimum" : 1,
          "type" : "integer"
        },
        "stp_port_priority" : {
          "description" : "Stp Port Priority",
          "format" : "int32",
          "maximum" : 240,
          "minimum" : 0,
          "type" : "integer"
        },
        "stp_port_enabled" : {
          "description" : "Stp Port Enabled",
          "type" : "boolean"
        },
        "trunk_vlans" : {
          "description" : "Trunk Vlans",
          "maxItems" : 32,
          "type" : "array",
          "uniqueItems" : true,
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
          "description" : "Vlan Mode",
          "type" : "string",
          "enum" : [ "access", "trunk" ]
        }
      },
      "required" : [ "storm_control_config", "forward_fast_enabled", "root_guard_enabled", "bpdu_guard_enabled", "stp_port_cost", "stp_port_priority", "stp_port_enabled", "trunk_vlans", "access_vlan_id", "native_vlan_id", "voice_vlan_id", "vlan_mode" ]
    },
    "lldp_enabled" : {
      "description" : "Lldp Enabled",
      "type" : "boolean"
    },
    "power_usage_threshold" : {
      "description" : "Power Usage Threshold",
      "format" : "int32",
      "maximum" : 100,
      "minimum" : 50,
      "type" : "integer"
    },
    "poe_enabled" : {
      "description" : "Poe Enabled",
      "type" : "boolean"
    },
    "multicast_config" : {
      "properties" : {
        "igmp_static_joins" : {
          "description" : "Igmp Static Joins",
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
            },
            "required" : [ "igmp_static_grp_ipv4", "igmp_static_src_ipv4" ]
          }
        },
        "dr_priority" : {
          "description" : "Dr Priority",
          "format" : "int64",
          "type" : "integer"
        },
        "igmp_version" : {
          "description" : "Igmp Version",
          "type" : "string",
          "enum" : [ "IGMPV2", "IGMPV3" ]
        },
        "multicast_enabled" : {
          "description" : "Multicast Enabled",
          "type" : "boolean"
        }
      },
      "required" : [ "igmp_static_joins", "dr_priority", "igmp_version", "multicast_enabled" ]
    },
    "nat_port_v6" : {
      "description" : "Nat Port V6",
      "format" : "int32",
      "maximum" : 65535,
      "minimum" : 0,
      "type" : "integer"
    },
    "nat_address_v6" : {
      "description" : "Nat Address V6",
      "format" : "ipv6",
      "type" : "string"
    },
    "static_arp_configs" : {
      "description" : "Static Arp Configs",
      "maxItems" : 32,
      "type" : "array",
      "items" : {
        "properties" : {
          "mac_address" : {
            "description" : "Mac Address",
            "format" : "mac-address",
            "pattern" : "^([0-9A-Fa-f]{2}[:-]){5}[0-9A-Fa-f]{2}$",
            "type" : "string"
          },
          "ipv4_address" : {
            "description" : "Ipv4 Address",
            "format" : "ipv4",
            "type" : "string"
          }
        },
        "required" : [ "mac_address", "ipv4_address" ]
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
        },
        "required" : [ "ipv4_address", "scope" ]
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
      "type" : "boolean"
    },
    "nat_pools" : {
      "description" : "Nat Pools",
      "type" : "array",
      "items" : {
        "properties" : {
          "ipv4_ranges" : {
            "description" : "Ipv4 Ranges",
            "maxItems" : 4,
            "minItems" : 1,
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
          },
          "nat_pool_id" : {
            "description" : "Nat Pool Id",
            "maxLength" : 30,
            "pattern" : "^-?[0-9]{1,30}$",
            "type" : "string"
          }
        },
        "required" : [ "ipv4_ranges", "nat_pool_id" ]
      }
    },
    "devicemgmt_policysetstack_id" : {
      "description" : "Devicemgmt Policysetstack Id",
      "maxLength" : 30,
      "pattern" : "^-?[0-9]{1,30}$",
      "type" : "string"
    },
    "nat_zone_id" : {
      "description" : "Nat Zone Id",
      "maxLength" : 30,
      "pattern" : "^-?[0-9]{1,30}$",
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
    "scope" : {
      "description" : "Scope",
      "type" : "string",
      "enum" : [ "global", "local" ]
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
      },
      "required" : [ "lan_state_propagation", "use_relay", "wan", "lan" ]
    },
    "network_context_id" : {
      "description" : "Network Context Id",
      "type" : "string"
    },
    "parent" : {
      "description" : "Parent",
      "type" : "string"
    },
    "sub_interface" : {
      "properties" : {
        "native_vlan" : {
          "description" : "Native Vlan",
          "type" : "boolean"
        },
        "vlan_id" : {
          "description" : "Vlan Id",
          "format" : "int32",
          "type" : "integer"
        }
      },
      "required" : [ "native_vlan", "vlan_id" ]
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
      "description" : "Used For",
      "type" : "string",
      "enum" : [ "none", "public", "private", "lan", "private-l2", "private_wan", "switch-access", "control", "controller" ]
    },
    "nat_port" : {
      "description" : "Nat Port",
      "format" : "int32",
      "maximum" : 65535,
      "minimum" : 0,
      "type" : "integer"
    },
    "nat_address" : {
      "description" : "Nat Address",
      "format" : "ipv4",
      "type" : "string"
    },
    "admin_up" : {
      "description" : "Admin Up",
      "type" : "boolean"
    },
    "ethernet_port" : {
      "properties" : {
        "speed" : {
          "description" : "Speed",
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
        "full_duplex" : {
          "description" : "Full Duplex",
          "type" : "boolean",
          "additionalProperties" : {
            "properties" : {
              "x_flag_computed" : {
                "type" : "boolean"
              }
            }
          }
        }
      },
      "required" : [ "speed", "full_duplex" ]
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
    "ipv4_config" : {
      "properties" : {
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
            },
            "required" : [ "destination", "via" ]
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
              "maxItems" : 3,
              "type" : "array",
              "uniqueItems" : true,
              "items" : {
                "description" : "Name Servers",
                "type" : "string"
              }
            }
          },
          "required" : [ "search", "name_servers" ]
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
          },
          "required" : [ "hostname", "client_id" ]
        },
        "static_config" : {
          "properties" : {
            "address" : {
              "description" : "Address",
              "type" : "string"
            }
          },
          "required" : [ "address" ]
        },
        "type" : {
          "description" : "Type",
          "type" : "string"
        }
      },
      "required" : [ "routes", "dns_v4_config", "dhcp_config", "static_config", "type" ]
    },
    "mtu" : {
      "description" : "Mtu",
      "maximum" : 9216,
      "minimum" : 0,
      "type" : "integer"
    },
    "mac_address" : {
      "description" : "Mac Address",
      "pattern" : "([0-9a-f]{2}[:]){5}([0-9a-f]{2})",
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
      "description" : "Attached Lan Networks",
      "type" : "array",
      "items" : {
        "properties" : {
          "vlan_id" : {
            "description" : "Vlan Id",
            "format" : "int32",
            "maximum" : 4095,
            "minimum" : 0,
            "type" : "integer"
          },
          "lan_network_id" : {
            "description" : "Lan Network Id",
            "type" : "string"
          }
        },
        "required" : [ "vlan_id", "lan_network_id" ]
      }
    },
    "type" : {
      "description" : "Type",
      "type" : "string",
      "enum" : [ "service_link", "loopback", "bypasspair", "subinterface", "pppoe", "port", "virtual_interface", "cellular", "switch_port", "vlan", "port_channel", "ngfw_sdwan_interface" ]
    },
    "description" : {
      "description" : "Description",
      "maxLength" : 256,
      "type" : "string"
    },
    "name" : {
      "description" : "Name",
      "maxLength" : 128,
      "type" : "string",
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
  "required" : [ "fec_mode", "loopback_config", "cellular_config", "sgi_apply_static_tag", "port_channel_config", "service_link_config", "vlan_config", "vrf_context_id", "authentication_config", "peer_bypasspair_wan_port_type", "ipv6_config", "pppoe_config", "interface_profile_id", "switch_port_config", "lldp_enabled", "power_usage_threshold", "poe_enabled", "multicast_config", "nat_port_v6", "nat_address_v6", "static_arp_configs", "secondary_ip_configs", "ipfixfiltercontext_id", "ipfixcollectorcontext_id", "directed_broadcast", "nat_pools", "devicemgmt_policysetstack_id", "nat_zone_id", "tags", "scope", "bypass_pair", "network_context_id", "parent", "sub_interface", "bound_interfaces", "used_for", "nat_port", "nat_address", "admin_up", "ethernet_port", "dhcp_relay", "ipv4_config", "mtu", "mac_address", "site_wan_interface_ids", "attached_lan_networks", "type", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_shell_interface.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_shell_id=<some_element_shell_id>"
}
```

