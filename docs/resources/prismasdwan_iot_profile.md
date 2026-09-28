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
      "description" : "Num Associated Sites",
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
          "description" : "Snmp Privacy Password",
          "maxLength" : 256,
          "minLength" : 5,
          "pattern" : "^\\S+$",
          "type" : "string"
        },
        "snmp_privacy_protocol" : {
          "description" : "Snmp Privacy Protocol",
          "type" : "string",
          "enum" : [ "none", "aes", "des" ]
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
          "description" : "Snmp Auth Password",
          "maxLength" : 256,
          "minLength" : 5,
          "pattern" : "^\\S+$",
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
          "description" : "Snmp Auth Protocol",
          "type" : "string",
          "enum" : [ "none", "md5", "sha" ]
        },
        "snmp_security_level" : {
          "description" : "Snmp Security Level",
          "type" : "string",
          "enum" : [ "noauth", "auth", "private" ]
        },
        "snmp_username" : {
          "description" : "Snmp Username",
          "maxLength" : 256,
          "minLength" : 4,
          "pattern" : "^\\S+$",
          "type" : "string"
        }
      },
      "required" : [ "snmp_privacy_password_encrypted", "snmp_privacy_password", "snmp_privacy_protocol", "snmp_auth_password_encrypted", "snmp_auth_password", "snmp_auth_protocol", "snmp_security_level", "snmp_username" ]
    },
    "v2_config" : {
      "properties" : {
        "snmp_community_string" : {
          "description" : "Snmp Community String",
          "maxLength" : 32,
          "pattern" : "^\\S+$",
          "type" : "string"
        }
      },
      "required" : [ "snmp_community_string" ]
    },
    "snmp_version" : {
      "description" : "Snmp Version",
      "type" : "string",
      "enum" : [ "v2", "v3" ]
    },
    "snmp_discovery_device_refresh_frequency" : {
      "description" : "Snmp Discovery Device Refresh Frequency",
      "minimum" : 30,
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
    "region" : {
      "description" : "Region",
      "type" : "string"
    },
    "disabled_reason" : {
      "description" : "Disabled Reason",
      "maxLength" : 5000,
      "type" : "string"
    },
    "disabled" : {
      "description" : "Disabled",
      "type" : "boolean"
    },
    "inactive_reason" : {
      "description" : "Inactive Reason",
      "maxLength" : 5000,
      "type" : "string"
    },
    "inactive" : {
      "description" : "Inactive",
      "type" : "boolean"
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
  "required" : [ "num_associated_sites", "v3_config", "v2_config", "snmp_version", "snmp_discovery_device_refresh_frequency", "snmp_discovery_network_refresh_frequency", "snmp_discovery_use_local_neighbours", "snmp_discovery_enabled", "tags", "description", "name", "region", "disabled_reason", "disabled", "inactive_reason", "inactive", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_iot_profile.my_resource_name"
 id="<resource_id>"
}
```

