## Documentation for Prisma SDWAN Resource "roles"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `roles` |
| Get Api  | `/sdwan/v2.1/api/roles/{role_id}` (`CustomRoleV2N1`) |
| Post Api  | `/sdwan/v2.1/api/roles` (`CustomRoleV2N1`) |
| Put Api  | `/sdwan/v2.1/api/roles/{role_id}` (`CustomRoleV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/roles/{role_id}` |


### JSON Schema

```json
{
  "properties" : {
    "region" : {
      "description" : "Region: Transient ",
      "type" : "string"
    },
    "inactive_reason" : {
      "description" : "Inactive Reason: Size(max = 5000, INACTIVE_REASON_INVALID_0001, min = 0) ",
      "type" : "string"
    },
    "disabled_reason" : {
      "description" : "Disabled Reason: Size(max = 5000, DISABLED_REASON_INVALID_0001, min = 0) ",
      "type" : "string"
    },
    "inactive" : {
      "description" : "Inactive",
      "type" : "boolean"
    },
    "disabled" : {
      "description" : "Disabled",
      "type" : "boolean"
    },
    "is_system_owned" : {
      "description" : "Is System Owned",
      "type" : "boolean"
    },
    "custom_permissions" : {
      "description" : "Custom Permissions: Reference(concreteClass = classOf[Vector], idOnly = false, ignoreMissing = false, lazy = false, value = .) Size(max = 100, error = AUTH_ROLE_INVALID_CUSTOM_PERMISSIONS_SIZE: Custom permissions set is limited to 100, min = 0) ",
      "type" : "array",
      "items" : {
        "properties" : {
          "disallow_permission" : {
            "description" : "Disallow Permission",
            "type" : "boolean"
          },
          "allowed_before_ms" : {
            "description" : "Allowed Before Ms",
            "format" : "int64",
            "type" : "integer"
          },
          "allowed_after_ms" : {
            "description" : "Allowed After Ms",
            "format" : "int64",
            "type" : "integer"
          },
          "value" : {
            "description" : "Value: Pattern(error = INVALID_PERMISSION_VALUE: Permission value contains invalid characters. Check data {}, regexp = ^[/0-9a-zA-+_\\\\[\\\\]-]{1,500}$) NotEmpty ",
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
        "required" : [ "value" ]
      }
    },
    "disallow_permissions" : {
      "description" : "Disallow Permissions: Embedded(concreteClass = classOf[Object], value = .) Valid Size(max = 100, error = AUTH_ROLE_INVALID_DISALLOW_PERMISSION_LIST_SIZE: Disallowed ermissions set is limited to 100, min = 0) ",
      "type" : "array",
      "items" : {
        "properties" : {
          "value" : {
            "description" : "Value: Size(max = 500, PERMISSION_INVALID_0001, min = 0) ",
            "type" : "string"
          }
        }
      }
    },
    "permissions" : {
      "description" : "Permissions: Embedded(concreteClass = classOf[Object], value = .) Valid Size(max = 100, error = AUTH_ROLE_INVALID_PERMISSION_LIST_SIZE: Permissions set is limited to 100, min = 0) ",
      "type" : "array",
      "items" : {
        "properties" : {
          "value" : {
            "description" : "Value: Size(max = 500, PERMISSION_INVALID_0001, min = 0) ",
            "type" : "string"
          }
        }
      }
    },
    "description" : {
      "description" : "Description: Size(max = 1000, error = AUTH_ROLE_INVALID_ROLE_DESCRIPTION: Description size is limited to {} length, min = 1) ",
      "type" : "string"
    },
    "roles" : {
      "description" : "Roles: Embedded(concreteClass = classOf[Object], value = .) Valid Size(max = 7, error = AUTH_ROLE_INVALID_ROLE_LIST_SIZE: Roles set size is limited to {} length, min = 0) ",
      "type" : "array",
      "items" : {
        "properties" : {
          "name" : {
            "description" : "Name: Pattern(AUTH_ROLE_INVALID, regexp = (guest|system|element|support_iam_admin|support_admin|support_viewonly|support_mfg|support_super|support_root|devops|secops|tenant_iam_admin|tenant_network_admin|tenant_security_admin|tenant_viewonly|tenant_super|tenant_root|esp_iam_admin|esp_machine_admin|esp_admin|esp_user|esp_super|esp_root)) NotBlank ",
            "type" : "string"
          }
        },
        "required" : [ "name" ]
      }
    },
    "name" : {
      "description" : "Name: Size(max = 256, error = AUTH_ROLE_INVALID_ROLE_NAME: Auth role name comprises of lowercase and underscore characters only, min = 1) NotEmpty ",
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
  "required" : [ "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_roles.my_resource_name"
 id="<resource_id>"
}
```

