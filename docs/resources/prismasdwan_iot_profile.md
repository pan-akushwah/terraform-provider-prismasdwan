## Documentation for Prisma SDWAN Resource "iot_profile"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `iot_profile` |
| Get Api  | `/sdwan/v2.0/api/deviceidprofiles/{profile_id}` (`DeviceIdProfile`) |
| Post Api  | `/sdwan/v2.0/api/deviceidprofiles` (`DeviceIdProfile`) |
| Put Api  | `/sdwan/v2.0/api/deviceidprofiles/{profile_id}` (`DeviceIdProfile`) |
| Delete Api  | `/sdwan/v2.0/api/deviceidprofiles/{profile_id}` |


### JSON Schema

```json
{
  "properties" : {
    "num_associated_sites" : {
      "description" : "Num Associated Sites: Transient ",
      "format" : "int64",
      "type" : "integer",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
    },
    "v3_config" : {
      "properties" : {
        "snmp_privacy_password_encrypted" : {
          "description" : "Snmp Privacy Password Encrypted",
          "type" : "string"
        },
        "snmp_privacy_password" : {
          "description" : "Snmp Privacy Password: Transient Pattern(error = SNMPCONFIG_UNSUPPORTED_ENC_PHRASE: White spaces not allowed in enc phrase, regexp = ^\\\\S+$) Size(max = 256, error = SNMPCONFIG_INVALID_ENC_PHRASE_LEN: Enc phrase length should be between 8 and 256, min = 5) ",
          "type" : "string"
        },
        "snmp_privacy_protocol" : {
          "description" : "Snmp Privacy Protocol: ValidateEnum(enumClass = classOf[SNMPEncType], error = DEVICEID_SNMP_PRIVACY_PROTOCOL_UNSUPPORTED: Unsupported SNMP privacy protocol specified, nullAllowed = false) ",
          "type" : "string",
          "enum" : [ "NONE", "AES", "DES" ]
        },
        "snmp_auth_password_encrypted" : {
          "description" : "Snmp Auth Password Encrypted",
          "type" : "string",
          "additionalProperties" : {
            "properties" : {
              "x_flag_sensitive" : {
                "type" : "boolean"
              }
            }
          }
        },
        "snmp_auth_password" : {
          "description" : "Snmp Auth Password: Transient Pattern(error = SNMPCONFIG_UNSUPPORTED_AUTH_PHRASE: White spaces not allowed in auth phrase, regexp = ^\\\\S+$) Size(max = 256, error = SNMPCONFIG_INVALID_AUTH_PHRASE_LEN: Auth phrase length should be between 8 and 256, min = 5) ",
          "type" : "string",
          "additionalProperties" : {
            "properties" : {
              "x_flag_sensitive" : {
                "type" : "boolean"
              }
            }
          }
        },
        "snmp_auth_protocol" : {
          "description" : "Snmp Auth Protocol: ValidateEnum(enumClass = classOf[SNMPAuthType], error = DEVICEID_SNMP_AUTH_PROTOCOL_UNSUPPORTED: Unsupported SNMP auth protocol specified, nullAllowed = false) ",
          "type" : "string",
          "enum" : [ "NONE", "MD5", "SHA" ]
        },
        "snmp_security_level" : {
          "description" : "Snmp Security Level: ValidateEnum(enumClass = classOf[SNMPSecurityLevel], error = DEVICEID_SNMP_SECURITY_LEVEL_UNSUPPORTED: Unsupported SNMP security level specified, nullAllowed = false) ",
          "type" : "string",
          "enum" : [ "NOAUTH", "AUTH", "PRIVATE" ]
        },
        "snmp_username" : {
          "description" : "Snmp Username: NotNull(error = SNMPCONFIG_USER_NAME_MISSING: User name cannot be null) Pattern(error = SNMPCONFIG_UNSUPPORTED_USER_NAME: White spaces not allowed in user name, regexp = ^\\\\S+$) Size(max = 256, error = SNMPCONFIG_INVALID_USER_NAME_LEN: User name length should be between 4 and 256, min = 4) ",
          "type" : "string"
        }
      },
      "required" : [ "snmp_privacy_protocol", "snmp_auth_protocol", "snmp_security_level", "snmp_username" ]
    },
    "v2_config" : {
      "properties" : {
        "snmp_community_string" : {
          "description" : "Snmp Community String: Pattern(error = SNMPCONFIG_UNSUPPORTED_COMMUNITY_NAME: White spaces not allowed in community name, regexp = ^\\\\S+$) Size(max = 32, error = SNMPCONFIG_COMMUNITY_LEN_EXCEEDS_LIMIT: Community length exceeds maximum limit, min = 0) ",
          "type" : "string"
        }
      }
    },
    "snmp_version" : {
      "description" : "Snmp Version: ValidateEnum(enumClass = classOf[SNMPVersion], error = DEVICEID_INVALID_SNMP_VERSION: Invalid snmp version, nullAllowed = false) ",
      "type" : "string",
      "enum" : [ "V2", "V3" ]
    },
    "snmp_discovery_device_refresh_frequency" : {
      "description" : "Snmp Discovery Device Refresh Frequency: Min(error = DEVICEID_DISCOVERY_TIMER_UNSUPPORTED: Unsupported values for device discovery, supported values -  30 minutes or more, value = 30L) ",
      "type" : "integer"
    },
    "snmp_discovery_network_refresh_frequency" : {
      "description" : "Snmp Discovery Network Refresh Frequency",
      "type" : "integer"
    },
    "snmp_discovery_use_local_neighbours" : {
      "description" : "Snmp Discovery Use Local Neighbours",
      "type" : "boolean"
    },
    "snmp_discovery_enabled" : {
      "description" : "Snmp Discovery Enabled",
      "type" : "boolean"
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
    "region" : {
      "description" : "Region: Transient ",
      "type" : "string"
    },
    "disabled_reason" : {
      "description" : "Disabled Reason: Size(max = 5000, DISABLED_REASON_INVALID_0001, min = 0) ",
      "type" : "string"
    },
    "disabled" : {
      "description" : "Disabled",
      "type" : "boolean"
    },
    "inactive_reason" : {
      "description" : "Inactive Reason: Size(max = 5000, INACTIVE_REASON_INVALID_0001, min = 0) ",
      "type" : "string"
    },
    "inactive" : {
      "description" : "Inactive",
      "type" : "boolean"
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
  "required" : [ "snmp_version", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_iot_profile.my_resource_name"
 id="<resource_id>"
}
```

