## Documentation for Prisma SDWAN Resource "nat_policy_set"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `nat_policy_set` |
| Get Api  | `/sdwan/v2.0/api/natpolicysets/{nat_policy_set_id}` (`NATPolicySet`) |
| Post Api  | `/sdwan/v2.0/api/natpolicysets` (`NATPolicySet`) |
| Put Api  | `/sdwan/v2.0/api/natpolicysets/{nat_policy_set_id}` (`NATPolicySet`) |
| Delete Api  | `/sdwan/v2.0/api/natpolicysets/{nat_policy_set_id}` |


### JSON Schema

```json
{
  "properties" : {
    "update_order" : {
      "description" : "Update Order",
      "type" : "boolean"
    },
    "policy_rules" : {
      "description" : "Policy Rules",
      "type" : "array",
      "items" : {
        "properties" : {
          "enabled" : {
            "description" : "Enabled",
            "type" : "boolean"
          },
          "destination_zone_id" : {
            "description" : "Destination Zone Id",
            "maxLength" : 30,
            "pattern" : "^-?[0-9]{1,30}$",
            "type" : "string"
          },
          "source_zone_id" : {
            "description" : "Source Zone Id",
            "maxLength" : 30,
            "pattern" : "^-?[0-9]{1,30}$",
            "type" : "string"
          },
          "destination_prefixes_id" : {
            "description" : "Destination Prefixes Id",
            "maxLength" : 30,
            "pattern" : "^-?[0-9]{1,30}$",
            "type" : "string"
          },
          "source_prefixes_id" : {
            "description" : "Source Prefixes Id",
            "maxLength" : 30,
            "pattern" : "^-?[0-9]{1,30}$",
            "type" : "string"
          },
          "actions" : {
            "description" : "Actions",
            "maxItems" : 4,
            "minItems" : 1,
            "type" : "array",
            "items" : {
              "properties" : {
                "protocols" : {
                  "description" : "Protocols",
                  "maxItems" : 4,
                  "type" : "array",
                  "uniqueItems" : true,
                  "items" : {
                    "description" : "Protocols",
                    "pattern" : "sip|ftp|tftp|pptp",
                    "type" : "string"
                  }
                },
                "port" : {
                  "description" : "Port",
                  "maximum" : 65535,
                  "minimum" : 1,
                  "type" : "integer"
                },
                "nat_pool_id" : {
                  "description" : "Nat Pool Id",
                  "type" : "string"
                },
                "type" : {
                  "description" : "Type",
                  "type" : "string",
                  "enum" : [ "no_nat", "source_nat_dynamic", "source_nat_static", "destination_nat_dynamic", "destination_nat_static", "alg_disable" ]
                }
              },
              "required" : [ "protocols", "port", "nat_pool_id", "type" ]
            }
          },
          "protocol" : {
            "description" : "Protocol",
            "maximum" : 255,
            "minimum" : 1,
            "type" : "integer"
          },
          "destination_ports" : {
            "description" : "Destination Ports",
            "maxItems" : 16,
            "type" : "array",
            "items" : {
              "properties" : {
                "from" : {
                  "description" : "From",
                  "maximum" : 65535,
                  "minimum" : 1,
                  "type" : "integer"
                },
                "to" : {
                  "description" : "To",
                  "maximum" : 65535,
                  "minimum" : 1,
                  "type" : "integer"
                }
              },
              "required" : [ "from", "to" ]
            }
          },
          "source_ports" : {
            "description" : "Source Ports",
            "maxItems" : 16,
            "type" : "array",
            "items" : {
              "properties" : {
                "from" : {
                  "description" : "From",
                  "maximum" : 65535,
                  "minimum" : 1,
                  "type" : "integer"
                },
                "to" : {
                  "description" : "To",
                  "maximum" : 65535,
                  "minimum" : 1,
                  "type" : "integer"
                }
              },
              "required" : [ "from", "to" ]
            }
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
        "required" : [ "enabled", "destination_zone_id", "source_zone_id", "destination_prefixes_id", "source_prefixes_id", "actions", "protocol", "destination_ports", "source_ports", "tags", "description", "name", "id" ]
      }
    },
    "destination_zone_policyrule_order" : {
      "description" : "Destination Zone Policyrule Order",
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Destination Zone Policyrule Order",
        "type" : "string"
      }
    },
    "source_zone_policyrule_order" : {
      "description" : "Source Zone Policyrule Order",
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Source Zone Policyrule Order",
        "type" : "string"
      }
    },
    "policy_req_version" : {
      "description" : "Policy Req Version",
      "readOnly" : true,
      "type" : "string",
      "x-json-ignore" : true
    },
    "send_to_element" : {
      "description" : "Send To Element",
      "type" : "boolean"
    },
    "clone_from" : {
      "description" : "Clone From",
      "maxLength" : 20,
      "pattern" : "^-?[0-9]{1,20}$",
      "type" : "string",
      "additionalProperties" : {
        "properties" : {
          "x_flag_computed" : {
            "type" : "boolean"
          }
        }
      }
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
  "required" : [ "update_order", "policy_rules", "destination_zone_policyrule_order", "source_zone_policyrule_order", "policy_req_version", "send_to_element", "clone_from", "tags", "description", "name", "region", "disabled_reason", "disabled", "inactive_reason", "inactive", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_nat_policy_set.my_resource_name"
 id="<resource_id>"
}
```

