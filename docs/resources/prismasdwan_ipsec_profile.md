## Documentation for Prisma SDWAN Resource "ipsec_profile"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `ipsec_profile` |
| Get Api  | `/sdwan/v2.3/api/ipsecprofiles/{profile_id}` (`IPSECProfileScreenV2N3`) |
| Post Api  | `/sdwan/v2.3/api/ipsecprofiles` (`IPSECProfileScreenV2N3`) |
| Put Api  | `/sdwan/v2.3/api/ipsecprofiles/{profile_id}` (`IPSECProfileScreenV2N3`) |
| Delete Api  | `/sdwan/v2.3/api/ipsecprofiles/{profile_id}` |


### JSON Schema

```json
{
  "properties" : {
    "used_for" : {
      "description" : "Used For",
      "type" : "string",
      "enum" : [ "fabric_vpn" ]
    },
    "dpd_timeout" : {
      "description" : "Dpd Timeout",
      "format" : "int32",
      "maximum" : 300,
      "minimum" : 2,
      "type" : "integer"
    },
    "dpd_delay" : {
      "description" : "Dpd Delay",
      "format" : "int32",
      "maximum" : 60,
      "minimum" : 1,
      "type" : "integer"
    },
    "dpd_enable" : {
      "description" : "Dpd Enable",
      "type" : "boolean"
    },
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
    "ike_group" : {
      "properties" : {
        "pqc_kem_config" : {
          "properties" : {
            "round_7_algorithms" : {
              "description" : "Round_7 Algorithms",
              "type" : "array",
              "items" : {
                "description" : "Round 7 Algorithms",
                "type" : "string"
              }
            },
            "round_6_algorithms" : {
              "description" : "Round_6 Algorithms",
              "type" : "array",
              "items" : {
                "description" : "Round 6 Algorithms",
                "type" : "string"
              }
            },
            "round_5_algorithms" : {
              "description" : "Round_5 Algorithms",
              "type" : "array",
              "items" : {
                "description" : "Round 5 Algorithms",
                "type" : "string"
              }
            },
            "round_4_algorithms" : {
              "description" : "Round_4 Algorithms",
              "type" : "array",
              "items" : {
                "description" : "Round 4 Algorithms",
                "type" : "string"
              }
            },
            "round_3_algorithms" : {
              "description" : "Round_3 Algorithms",
              "type" : "array",
              "items" : {
                "description" : "Round 3 Algorithms",
                "type" : "string"
              }
            },
            "round_2_algorithms" : {
              "description" : "Round_2 Algorithms",
              "type" : "array",
              "items" : {
                "description" : "Round 2 Algorithms",
                "type" : "string"
              }
            },
            "round_1_algorithms" : {
              "description" : "Round_1 Algorithms",
              "type" : "array",
              "items" : {
                "description" : "Round 1 Algorithms",
                "type" : "string"
              }
            },
            "enabled" : {
              "description" : "Enabled",
              "type" : "boolean"
            },
            "block_vulnerable_cipher" : {
              "description" : "Block Vulnerable Cipher",
              "type" : "boolean"
            }
          },
          "required" : [ "block_vulnerable_cipher", "round_4_algorithms", "enabled", "round_3_algorithms", "round_6_algorithms", "round_5_algorithms", "round_1_algorithms", "round_7_algorithms", "round_2_algorithms" ]
        },
        "port" : {
          "description" : "Port",
          "format" : "int32",
          "maximum" : 65535,
          "minimum" : 1,
          "type" : "integer"
        },
        "reauth" : {
          "description" : "Reauth",
          "type" : "boolean"
        },
        "authentication_multiple" : {
          "description" : "Authentication Multiple",
          "type" : "integer"
        },
        "aggressive" : {
          "description" : "Aggressive",
          "type" : "boolean"
        },
        "lifetime_units" : {
          "description" : "Lifetime Units",
          "type" : "string"
        },
        "lifetime" : {
          "description" : "Lifetime",
          "format" : "int32",
          "maximum" : 72,
          "minimum" : 1,
          "type" : "integer"
        },
        "proposals" : {
          "description" : "Proposals",
          "maxItems" : 1,
          "minItems" : 1,
          "type" : "array",
          "uniqueItems" : true,
          "items" : {
            "properties" : {
              "prf" : {
                "description" : "Prf",
                "type" : "string",
                "enum" : [ "md5", "sha1", "sha256", "sha384", "sha512", "sha256_96", "aesxcbc", "aes128gmac", "aes192gmac", "aes256gmac", "none" ]
              },
              "hash" : {
                "description" : "Hash",
                "type" : "string",
                "enum" : [ "sha256", "md5", "sha384", "aesxcbc", "aes128gmac", "none", "sha1", "aes192gmac", "sha512", "sha256_96", "aes256gmac" ]
              },
              "encryption" : {
                "description" : "Encryption",
                "type" : "string",
                "enum" : [ "aes256gcm16", "aes256", "aes128ccm128", "aes128ccm16", "twofish192", "aes128", "aes192", "aes192gcm64", "camellia256", "aes256gcm96", "aes192gcm128", "aes256ctr", "camellia192", "aes192gmac", "aes128gcm96", "blowfish256", "aes192ccm128", "3des", "aes256ccm64", "aes192ccm96", "aes192ccm64", "aes128ccm96", "twofish256", "camellia128", "blowfish128", "serpent256", "blowfish192", "aes128ctr", "twofish128", "aes192gcm96", "aes128ccm64", "aes128gmac", "serpent128", "aes256gcm64", "aes256ccm96", "aes192ctr", "aes128gcm128", "serpent192", "aes256gmac", "aes128gcm64", "aes256ccm128", "none", "aes128gcm16", "aes256gcm128" ]
              },
              "dh_groups" : {
                "description" : "Dh Groups",
                "type" : "string",
                "enum" : [ "modp768", "ecp384bp", "modp6144", "modp3072", "modp2048s224", "none", "ecp512bp", "ecp521", "ecp192", "ecp256", "ecp384", "ecp224", "modp1024s160", "modp4096", "modp1536", "ecp224bp", "modp1024", "curve25519", "modp8192", "modp2048", "ecp256bp", "modp2048s256" ]
              }
            },
            "required" : [ "prf", "hash", "encryption", "dh_groups" ]
          }
        },
        "key_exchange" : {
          "description" : "Key Exchange",
          "type" : "string",
          "enum" : [ "ikev1", "ikev2" ]
        }
      },
      "required" : [ "lifetime", "reauth", "pqc_kem_config", "port", "key_exchange", "lifetime_units", "aggressive", "proposals", "authentication_multiple" ]
    },
    "esp_group" : {
      "properties" : {
        "pqc_kem_config" : {
          "properties" : {
            "round_7_algorithms" : {
              "description" : "Round_7 Algorithms",
              "type" : "array",
              "items" : {
                "description" : "Round 7 Algorithms",
                "type" : "string"
              }
            },
            "round_6_algorithms" : {
              "description" : "Round_6 Algorithms",
              "type" : "array",
              "items" : {
                "description" : "Round 6 Algorithms",
                "type" : "string"
              }
            },
            "round_5_algorithms" : {
              "description" : "Round_5 Algorithms",
              "type" : "array",
              "items" : {
                "description" : "Round 5 Algorithms",
                "type" : "string"
              }
            },
            "round_4_algorithms" : {
              "description" : "Round_4 Algorithms",
              "type" : "array",
              "items" : {
                "description" : "Round 4 Algorithms",
                "type" : "string"
              }
            },
            "round_3_algorithms" : {
              "description" : "Round_3 Algorithms",
              "type" : "array",
              "items" : {
                "description" : "Round 3 Algorithms",
                "type" : "string"
              }
            },
            "round_2_algorithms" : {
              "description" : "Round_2 Algorithms",
              "type" : "array",
              "items" : {
                "description" : "Round 2 Algorithms",
                "type" : "string"
              }
            },
            "round_1_algorithms" : {
              "description" : "Round_1 Algorithms",
              "type" : "array",
              "items" : {
                "description" : "Round 1 Algorithms",
                "type" : "string"
              }
            },
            "enabled" : {
              "description" : "Enabled",
              "type" : "boolean"
            },
            "block_vulnerable_cipher" : {
              "description" : "Block Vulnerable Cipher",
              "type" : "boolean"
            }
          },
          "required" : [ "block_vulnerable_cipher", "round_4_algorithms", "enabled", "round_3_algorithms", "round_6_algorithms", "round_5_algorithms", "round_1_algorithms", "round_7_algorithms", "round_2_algorithms" ]
        },
        "lifesize" : {
          "properties" : {
            "units" : {
              "description" : "Units",
              "type" : "string"
            },
            "value" : {
              "description" : "Value",
              "format" : "int32",
              "type" : "integer"
            }
          },
          "required" : [ "units", "value" ]
        },
        "force_encapsulation" : {
          "description" : "Force Encapsulation",
          "type" : "boolean"
        },
        "responder_sase_proposals" : {
          "properties" : {
            "hash" : {
              "description" : "Hash",
              "type" : "array",
              "items" : {
                "description" : "Hash",
                "type" : "string",
                "enum" : [ "MD5", "SHA1", "SHA256", "SHA384", "SHA512", "SHA256_96", "AESXCBC", "AES128GMAC", "AES192GMAC", "AES256GMAC", "NONE" ]
              }
            },
            "encryption" : {
              "description" : "Encryption",
              "type" : "array",
              "items" : {
                "description" : "Encryption",
                "type" : "string",
                "enum" : [ "NONE", "AES128", "AES192", "AES256", "AES128CTR", "AES192CTR", "AES256CTR", "AES128CCM16", "AES128CCM64", "AES192CCM64", "AES256CCM64", "AES128CCM96", "AES192CCM96", "AES256CCM96", "AES128CCM128", "AES192CCM128", "AES256CCM128", "AES128GCM16", "AES128GCM64", "AES192GCM64", "AES256GCM16", "AES256GCM64", "AES128GCM96", "AES192GCM96", "AES256GCM96", "AES128GCM128", "AES192GCM128", "AES256GCM128", "AES128GMAC", "AES192GMAC", "AES256GMAC", "TRIPLEDES", "BLOWFISH128", "BLOWFISH192", "BLOWFISH256", "CAMELLIA128", "CAMELLIA192", "CAMELLIA256", "SERPENT128", "SERPENT192", "SERPENT256", "TWOFISH128", "TWOFISH192", "TWOFISH256" ]
              }
            },
            "dh_group" : {
              "description" : "Dh Group",
              "type" : "array",
              "items" : {
                "description" : "Dh Group",
                "type" : "string",
                "enum" : [ "NONE", "MODP768", "MODP1024", "MODP1536", "MODP2048", "MODP3072", "MODP4096", "MODP6144", "MODP8192", "MODP1024S160", "MODP2048S224", "MODP2048S256", "ECP192", "ECP224", "ECP256", "ECP384", "ECP521", "ECP224BP", "ECP256BP", "ECP384BP", "ECP512BP", "CURVE25519" ]
              }
            }
          },
          "required" : [ "hash", "encryption", "dh_group" ]
        },
        "proposals" : {
          "description" : "Proposals",
          "maxItems" : 1,
          "minItems" : 1,
          "type" : "array",
          "uniqueItems" : true,
          "items" : {
            "properties" : {
              "prf" : {
                "description" : "Prf",
                "type" : "string",
                "enum" : [ "md5", "sha1", "sha256", "sha384", "sha512", "sha256_96", "aesxcbc", "aes128gmac", "aes192gmac", "aes256gmac", "none" ]
              },
              "hash" : {
                "description" : "Hash",
                "type" : "string",
                "enum" : [ "sha256", "md5", "sha384", "aesxcbc", "aes128gmac", "none", "sha1", "aes192gmac", "sha512", "sha256_96", "aes256gmac" ]
              },
              "encryption" : {
                "description" : "Encryption",
                "type" : "string",
                "enum" : [ "aes256gcm16", "aes256", "aes128ccm128", "aes128ccm16", "twofish192", "aes128", "aes192", "aes192gcm64", "camellia256", "aes256gcm96", "aes192gcm128", "aes256ctr", "camellia192", "aes192gmac", "aes128gcm96", "blowfish256", "aes192ccm128", "3des", "aes256ccm64", "aes192ccm96", "aes192ccm64", "aes128ccm96", "twofish256", "camellia128", "blowfish128", "serpent256", "blowfish192", "aes128ctr", "twofish128", "aes192gcm96", "aes128ccm64", "aes128gmac", "serpent128", "aes256gcm64", "aes256ccm96", "aes192ctr", "aes128gcm128", "serpent192", "aes256gmac", "aes128gcm64", "aes256ccm128", "none", "aes128gcm16", "aes256gcm128" ]
              },
              "dh_groups" : {
                "description" : "Dh Groups",
                "type" : "string",
                "enum" : [ "modp768", "ecp384bp", "modp6144", "modp3072", "modp2048s224", "none", "ecp512bp", "ecp521", "ecp192", "ecp256", "ecp384", "ecp224", "modp1024s160", "modp4096", "modp1536", "ecp224bp", "modp1024", "curve25519", "modp8192", "modp2048", "ecp256bp", "modp2048s256" ]
              }
            },
            "required" : [ "prf", "hash", "encryption", "dh_groups" ]
          }
        },
        "mode" : {
          "description" : "Mode",
          "type" : "string",
          "enum" : [ "tunnel", "transport" ]
        },
        "lifetime_units" : {
          "description" : "Lifetime Units",
          "type" : "string"
        },
        "lifetime" : {
          "description" : "Lifetime",
          "format" : "int32",
          "maximum" : 72,
          "minimum" : 1,
          "type" : "integer"
        }
      },
      "required" : [ "lifetime", "pqc_kem_config", "force_encapsulation", "proposals", "mode", "lifesize", "responder_sase_proposals", "lifetime_units" ]
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
  "required" : [ "used_for", "dpd_timeout", "dpd_delay", "dpd_enable", "authentication", "ike_group", "esp_group", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_ipsec_profile.my_resource_name"
 id="<resource_id>"
}
```

