## Documentation for Prisma SDWAN Resource "operators"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `operators` |
| Get Api  | `/sdwan/v2.2/api/operators/{operator_id}` (`OperatorV2N2`) |
| Post Api  | `/sdwan/v2.2/api/operators` (`OperatorV2N2`) |
| Put Api  | `/sdwan/v2.2/api/operators/{operator_id}` (`OperatorV2N2`) |
| Delete Api  | `/sdwan/v2.2/api/operators/{operator_id}` |


### JSON Schema

```json
{
  "properties" : {
    "migration_state" : {
      "type" : "string",
      "enum" : [ "INITIATED", "PROVISIONED", "ACTIVATED" ]
    },
    "email_iam" : {
      "description" : "Email Iam: Email(error = OPERATOR_EMAIL_IAM_INVALID: Invalid email {validatedValue}. Please use a valid email address, regexp = .*) Size(max = 1000, error = OPERATOR_EMAIL_IAM_INVALID: Invalid email {validatedValue}. Please use a valid email address, min = 1) ",
      "type" : "string"
    },
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
    "disabled" : {
      "description" : "Disabled",
      "type" : "boolean"
    },
    "inactive" : {
      "description" : "Inactive",
      "type" : "boolean"
    },
    "is_system_owned" : {
      "description" : "Is System Owned",
      "type" : "boolean"
    },
    "enable_session_ip_lock" : {
      "description" : "Enable Session Ip Lock",
      "type" : "boolean"
    },
    "from_esp_tenant_id" : {
      "description" : "From Esp Tenant Id: Pattern(error = TENANT_INVALID_ID: Provide a valid tenant id, regexp = ^[a-z0-9]{1,50}$) Transient ",
      "type" : "string"
    },
    "from_esp_name" : {
      "description" : "From Esp Name: Length(max = 512, error = TENANT_INVALID_NAME: Please provide a valid name with a length less than 512 characters, min = 0) Transient ",
      "type" : "string"
    },
    "from_esp" : {
      "description" : "From Esp: Transient ",
      "type" : "boolean"
    },
    "is_locked" : {
      "description" : "Is Locked: Transient ",
      "type" : "boolean"
    },
    "settings" : {
      "description" : "Settings: Size(max = 100000, error = OPERATOR_INVALID_SETTINGS_SIZE: Invalid data size for settings. Maximum of 100KB data size is allowed, min = 0) ",
      "type" : "string"
    },
    "ipv4_list" : {
      "description" : "Ipv4 List: Embedded(concreteClass = classOf[Vector], value = .) Size(max = 100, error = OPERATOR_IPV4_INVALID: Invalid ipv4 list, min = 0) Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "ipv4" : {
            "description" : "Ipv4: IPv4(INVALID_IPV4_0001, regexp = [/0-9.]*) ",
            "type" : "string"
          }
        }
      }
    },
    "phone_numbers" : {
      "description" : "Phone Numbers: Embedded(concreteClass = classOf[Vector], value = .) Size(max = 20, error = OPERATOR_INVALID_PHONE_LIST_SIZE: Invalid phone list size. Maximum of twenty phones can be specified, min = 0) Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "types" : {
            "description" : "Types",
            "type" : "array",
            "items" : {
              "properties" : {
                "value" : {
                  "description" : "Value",
                  "type" : "string"
                }
              }
            }
          },
          "local_extension" : {
            "description" : "Local Extension",
            "format" : "int32",
            "type" : "integer"
          },
          "number" : {
            "description" : "Number",
            "format" : "int64",
            "type" : "integer"
          },
          "country_code" : {
            "description" : "Country Code",
            "format" : "int32",
            "type" : "integer"
          }
        }
      }
    },
    "addresses" : {
      "description" : "Addresses: Embedded(concreteClass = classOf[Object], value = .) Size(max = 20, error = OPERATOR_INVALID_ADDRESS_LIST_SIZE: Provide a valid address list. A maximum of twenty addresses can be specified, min = 0) Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "country" : {
            "description" : "Country: Length(max = 100, , min = 0) ",
            "type" : "string"
          },
          "post_code" : {
            "description" : "Post Code: Length(max = 100, , min = 0) ",
            "type" : "string"
          },
          "state" : {
            "description" : "State: Length(max = 100, , min = 0) ",
            "type" : "string"
          },
          "city" : {
            "description" : "City: Length(max = 100, , min = 0) ",
            "type" : "string"
          },
          "street2" : {
            "description" : "Street2: Length(max = 100, , min = 0) ",
            "type" : "string"
          },
          "street" : {
            "description" : "Street: Length(max = 100, , min = 0) ",
            "type" : "string"
          }
        }
      }
    },
    "linked_accounts" : {
      "description" : "Linked Accounts: Reference(concreteClass = classOf[Vector], idOnly = false, ignoreMissing = false, lazy = false, value = .) Size(max = 20, error = OPERATOR_INVALID_LINKED_ACCOUNTS_SIZE: Invalid linked account information. Maximum of 20 and at least 1 linked account(s) should be specified, min = 1) NotEmpty ",
      "type" : "array",
      "items" : {
        "properties" : {
          "inactive_reason" : {
            "description" : "Inactive Reason",
            "type" : "string"
          },
          "region" : {
            "description" : "Region",
            "type" : "string"
          },
          "disabled_reason" : {
            "description" : "Disabled Reason",
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
          "failed_login_attempts" : {
            "description" : "Failed Login Attempts",
            "format" : "int32",
            "type" : "integer"
          },
          "provider_value_updated_on" : {
            "description" : "Provider Value Updated On",
            "format" : "int64",
            "type" : "integer"
          },
          "provider_key" : {
            "description" : "Provider Key: Pattern(error = LINKED_ACCOUNT_PROVIDER_KEY: Linked account provider key is invalid, regexp = (password)) ",
            "type" : "string"
          },
          "provider_value" : {
            "description" : "Provider Value",
            "type" : "string"
          },
          "id" : {
            "description" : "Id: Transient ",
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
        }
      }
    },
    "custom_roles" : {
      "description" : "Custom Roles: Reference(concreteClass = classOf[Vector], idOnly = false, ignoreMissing = false, lazy = false, value = .) Size(max = 100, error = OPERATOR_INVALID_CUSTOM_ROLES_LIST_SIZE: Custom roles set is limited to {} length, min = 0) ",
      "type" : "array",
      "items" : {
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
    },
    "roles" : {
      "description" : "Roles: Embedded(concreteClass = classOf[Vector], value = .) Valid Size(max = 7, error = OPERATOR_INVALID_ROLE_LIST_SIZE: Role list size is invalid. Maximum of seven and at least one role must be specified, min = 0) ",
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
    "disable_idp_login" : {
      "description" : "Disable Idp Login",
      "type" : "boolean"
    },
    "email_validated" : {
      "description" : "Email Validated",
      "type" : "boolean"
    },
    "last_login" : {
      "format" : "date",
      "type" : "string"
    },
    "last_name" : {
      "description" : "Last Name: Size(max = 100, error = OPERATOR_LNAME_INVALID: Invalid last name {validatedValue}. Please use a last name which is 100 characters or less in length, min = 0) ",
      "type" : "string"
    },
    "first_name" : {
      "description" : "First Name: Size(max = 100, error = OPERATOR_FNAME_INVALID: Invalid first name {validatedValue}. Please use a first name which is 100 characters or less in length, min = 0) NotEmpty ",
      "type" : "string"
    },
    "secondary_emails" : {
      "description" : "Secondary Emails: Embedded(concreteClass = classOf[Vector], value = .) Size(max = 20, error = OPERATOR_EMAIL_LIST_INVALID: Invalid email list size {validatedValue}. Please use a valid email list, min = 0) Valid ",
      "type" : "array",
      "items" : {
        "properties" : {
          "email" : {
            "description" : "Email: Email(EMAIL_INVALID_0001, regexp = .*) Size(max = 1000, EMAIL_INVALID_0002, min = 1) ",
            "type" : "string"
          }
        }
      }
    },
    "email" : {
      "description" : "Email: Email(error = OPERATOR_EMAIL_INVALID: Invalid email {validatedValue}. Please use a valid email address, regexp = .*) Size(max = 1000, error = OPERATOR_EMAIL_INVALID: Invalid email {validatedValue}. Please use a valid email address, min = 1) NotEmpty Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = true), sparse = false, unique = false, value = ASC) ",
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
  "required" : [ "linked_accounts", "first_name", "email" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_operators.my_resource_name"
 id="<resource_id>"
}
```

