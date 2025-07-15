## Documentation for Prisma SDWAN Resource "ipsec_profile"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `ipsec_profile` |
| Get Api  | `/sdwan/v2.2/api/ipsecprofiles/{profile_id}` (`IPSECProfileScreenV2N2`) |
| Post Api  | `/sdwan/v2.2/api/ipsecprofiles` (`IPSECProfileScreenV2N2`) |
| Put Api  | `/sdwan/v2.2/api/ipsecprofiles/{profile_id}` (`IPSECProfileScreenV2N2`) |
| Delete Api  | `/sdwan/v2.2/api/ipsecprofiles/{profile_id}` |


### JSON Schema

```json
{
  "properties" : {
    "used_for" : {
      "description" : "Used For: JsonInclude(content = ALWAYS, contentFilter = classOf[Void], value = NON_NULL, valueFilter = classOf[Void]) ",
      "type" : "string",
      "enum" : [ "fabric_vpn" ]
    },
    "dpd_timeout" : {
      "description" : "Dpd Timeout: Range(max = 300L, error = IPSECCONFIG_INVALID_DPD_TIMEOUT: Invalid dpd timeout specified.Should be between 2-300 seconds., min = 2L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "dpd_delay" : {
      "description" : "Dpd Delay: Range(max = 60L, error = IPSECCONFIG_INVALID_DPD_DELAY: Invalid dpd delay.Should be between 1-60 seconds., min = 1L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "dpd_enable" : {
      "description" : "Dpd Enable",
      "type" : "boolean"
    },
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
    "ike_group" : {
      "properties" : {
        "port" : {
          "description" : "Port: Range(max = 65535L, error = IPSECCONFIG_INVALID_IKE_PORT_RANGE: Invalid ike port range.Should be between 1-65535., min = 1L) ",
          "format" : "int32",
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
          "description" : "Lifetime: Range(max = 72L, error = IPSECCONFIG_INVALID_IKE_LIFETIME: Invalid ike lifetime.Should be between 1-72 hours., min = 1L) ",
          "format" : "int32",
          "type" : "integer"
        },
        "proposals" : {
          "description" : "Proposals: Valid ListObject(allowDuplicate = false, allowEmpty = false, allowNull = false, listMaxSize = 1, IPSECCONFIG_INVALID_PROPOSALS_LIST_LEN, required = false) ",
          "type" : "array",
          "items" : {
            "properties" : {
              "prf" : {
                "description" : "Prf: ValidateEnum(enumClass = classOf[IPSECHash], error = IPSECCONFIG_INVALID_HASH: Invalid hashing algorithm specified., nullAllowed = true) ",
                "type" : "string",
                "enum" : [ "MD5", "SHA1", "SHA256", "SHA384", "SHA512", "SHA256_96", "AESXCBC", "AES128GMAC", "AES192GMAC", "AES256GMAC", "NONE" ]
              },
              "hash" : {
                "description" : "Hash: ValidateEnum(enumClass = classOf[IPSECHash], error = IPSECCONFIG_INVALID_HASH: Invalid hashing algorithm specified., nullAllowed = false) ",
                "type" : "string",
                "enum" : [ "NONE", "AES192GMAC", "SHA1", "AES256GMAC", "SHA512", "AESXCBC", "MD5", "SHA256_96", "AES128GMAC", "SHA384", "SHA256" ]
              },
              "encryption" : {
                "description" : "Encryption: ValidateEnum(enumClass = classOf[IPSECEncryption], error = IPSECCONFIG_INVALID_ENCRYPTION: Invalid encryption algorithm specified., nullAllowed = false) ",
                "type" : "string",
                "enum" : [ "AES256CCM64", "NONE", "AES192GMAC", "TWOFISH192", "AES256GCM16", "AES192CTR", "AES256CTR", "BLOWFISH256", "AES128CCM128", "AES256CCM128", "AES256GCM128", "AES192GCM128", "AES256CCM96", "AES192CCM64", "CAMELLIA192", "AES128GCM64", "AES256", "AES128GCM96", "TWOFISH256", "AES192GCM64", "AES256GMAC", "SERPENT192", "AES128CCM64", "BLOWFISH192", "AES192CCM128", "TRIPLEDES", "AES192", "AES256GCM64", "SERPENT128", "AES256GCM96", "CAMELLIA128", "AES128GCM128", "AES128CCM16", "AES128", "AES128CTR", "AES192CCM96", "AES192GCM96", "CAMELLIA256", "AES128GMAC", "AES128CCM96", "SERPENT256", "BLOWFISH128", "AES128GCM16", "TWOFISH128" ]
              },
              "dh_groups" : {
                "description" : "Dh Groups: ValidateEnum(enumClass = classOf[DHGroups], error = IPSECCONFIG_INVALID_DHGROUPS: Invalid DH Group specified., nullAllowed = false) ",
                "type" : "string",
                "enum" : [ "ECP224BP", "ECP256", "NONE", "MODP8192", "MODP1024S160", "MODP3072", "ECP384", "MODP1024", "MODP4096", "MODP2048", "ECP224", "ECP192", "ECP521", "ECP256BP", "ECP384BP", "MODP2048S224", "ECP512BP", "MODP768", "CURVE25519", "MODP2048S256", "MODP6144", "MODP1536" ]
              }
            },
            "required" : [ "hash", "encryption", "dh_groups" ]
          }
        },
        "key_exchange" : {
          "description" : "Key Exchange: ValidateEnum(enumClass = classOf[IKEKeyExchange], error = IPSECCONFIG_INVALID_IKEKEY_EXCHANGE: Invalid ike key algorith.Should be either ikev1 or ikev2., nullAllowed = false) ",
          "type" : "string",
          "enum" : [ "IKEV1", "IKEV2" ]
        }
      },
      "required" : [ "key_exchange", "proposals" ]
    },
    "esp_group" : {
      "properties" : {
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
          }
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
          }
        },
        "proposals" : {
          "description" : "Proposals: Valid ListObject(allowDuplicate = false, allowEmpty = false, allowNull = false, listMaxSize = 1, IPSECCONFIG_INVALID_PROPOSALS_LIST_LEN, required = false) ",
          "type" : "array",
          "items" : {
            "properties" : {
              "prf" : {
                "description" : "Prf: ValidateEnum(enumClass = classOf[IPSECHash], error = IPSECCONFIG_INVALID_HASH: Invalid hashing algorithm specified., nullAllowed = true) ",
                "type" : "string",
                "enum" : [ "MD5", "SHA1", "SHA256", "SHA384", "SHA512", "SHA256_96", "AESXCBC", "AES128GMAC", "AES192GMAC", "AES256GMAC", "NONE" ]
              },
              "hash" : {
                "description" : "Hash: ValidateEnum(enumClass = classOf[IPSECHash], error = IPSECCONFIG_INVALID_HASH: Invalid hashing algorithm specified., nullAllowed = false) ",
                "type" : "string",
                "enum" : [ "NONE", "AES192GMAC", "SHA1", "AES256GMAC", "SHA512", "AESXCBC", "MD5", "SHA256_96", "AES128GMAC", "SHA384", "SHA256" ]
              },
              "encryption" : {
                "description" : "Encryption: ValidateEnum(enumClass = classOf[IPSECEncryption], error = IPSECCONFIG_INVALID_ENCRYPTION: Invalid encryption algorithm specified., nullAllowed = false) ",
                "type" : "string",
                "enum" : [ "AES256CCM64", "NONE", "AES192GMAC", "TWOFISH192", "AES256GCM16", "AES192CTR", "AES256CTR", "BLOWFISH256", "AES128CCM128", "AES256CCM128", "AES256GCM128", "AES192GCM128", "AES256CCM96", "AES192CCM64", "CAMELLIA192", "AES128GCM64", "AES256", "AES128GCM96", "TWOFISH256", "AES192GCM64", "AES256GMAC", "SERPENT192", "AES128CCM64", "BLOWFISH192", "AES192CCM128", "TRIPLEDES", "AES192", "AES256GCM64", "SERPENT128", "AES256GCM96", "CAMELLIA128", "AES128GCM128", "AES128CCM16", "AES128", "AES128CTR", "AES192CCM96", "AES192GCM96", "CAMELLIA256", "AES128GMAC", "AES128CCM96", "SERPENT256", "BLOWFISH128", "AES128GCM16", "TWOFISH128" ]
              },
              "dh_groups" : {
                "description" : "Dh Groups: ValidateEnum(enumClass = classOf[DHGroups], error = IPSECCONFIG_INVALID_DHGROUPS: Invalid DH Group specified., nullAllowed = false) ",
                "type" : "string",
                "enum" : [ "ECP224BP", "ECP256", "NONE", "MODP8192", "MODP1024S160", "MODP3072", "ECP384", "MODP1024", "MODP4096", "MODP2048", "ECP224", "ECP192", "ECP521", "ECP256BP", "ECP384BP", "MODP2048S224", "ECP512BP", "MODP768", "CURVE25519", "MODP2048S256", "MODP6144", "MODP1536" ]
              }
            },
            "required" : [ "hash", "encryption", "dh_groups" ]
          }
        },
        "mode" : {
          "description" : "Mode: ValidateEnum(enumClass = classOf[ESPTunnelMode], error = IPSECCONFIG_INVALID_ESPTUNNEL_MODE: Invalid esp tunnel mode.Allowed value is tunnel., nullAllowed = false) ",
          "type" : "string",
          "enum" : [ "TUNNEL", "TRANSPORT" ]
        },
        "lifetime_units" : {
          "description" : "Lifetime Units",
          "type" : "string"
        },
        "lifetime" : {
          "description" : "Lifetime: Range(max = 72L, error = IPSECCONFIG_INVALID_IKE_LIFETIME: Invalid ike lifetime.Should be between 1-72 hours., min = 1L) ",
          "format" : "int32",
          "type" : "integer"
        }
      },
      "required" : [ "mode", "proposals" ]
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
  "required" : [ "authentication", "ike_group", "esp_group", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_ipsec_profile.my_resource_name"
 id="<resource_id>"
}
```

