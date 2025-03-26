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
      "description" : "Update Order: Transient ",
      "type" : "boolean"
    },
    "policy_rules" : {
      "description" : "Policy Rules: Transient ",
      "type" : "array",
      "items" : {
        "properties" : {
          "destination_zone" : {
            "properties" : {
              "default_for_public_interfaces" : {
                "description" : "Default For Public Interfaces",
                "type" : "boolean",
                "additionalProperties" : {
                  "properties" : {
                    "x_flag_computed" : {
                      "type" : "boolean"
                    }
                  }
                }
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
            "required" : [ "name" ]
          },
          "source_zone" : {
            "properties" : {
              "default_for_public_interfaces" : {
                "description" : "Default For Public Interfaces",
                "type" : "boolean",
                "additionalProperties" : {
                  "properties" : {
                    "x_flag_computed" : {
                      "type" : "boolean"
                    }
                  }
                }
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
            "required" : [ "name" ]
          },
          "natpolicypools" : {
            "description" : "Natpolicypools: Transient ",
            "type" : "array",
            "items" : {
              "properties" : {
                "description" : {
                  "description" : "Description: Size(max = 256, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0) ",
                  "type" : "string"
                },
                "name" : {
                  "description" : "Name: Required(error = NAME_REQD: Please provide resource name.) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
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
          "destination_prefixes" : {
            "properties" : {
              "ipv6_prefixes" : {
                "description" : "Ipv6 Prefixes",
                "type" : "array",
                "items" : {
                  "description" : "Ipv6 Prefixes",
                  "type" : "string"
                }
              },
              "ipv4_prefixes" : {
                "description" : "Ipv4 Prefixes",
                "type" : "array",
                "items" : {
                  "description" : "Ipv4 Prefixes",
                  "type" : "string"
                }
              },
              "tags" : {
                "description" : "Tags",
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
                "description" : "Description",
                "type" : "string"
              },
              "name" : {
                "description" : "Name",
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
          },
          "source_prefixes" : {
            "properties" : {
              "ipv6_prefixes" : {
                "description" : "Ipv6 Prefixes",
                "type" : "array",
                "items" : {
                  "description" : "Ipv6 Prefixes",
                  "type" : "string"
                }
              },
              "ipv4_prefixes" : {
                "description" : "Ipv4 Prefixes",
                "type" : "array",
                "items" : {
                  "description" : "Ipv4 Prefixes",
                  "type" : "string"
                }
              },
              "tags" : {
                "description" : "Tags",
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
                "description" : "Description",
                "type" : "string"
              },
              "name" : {
                "description" : "Name",
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
          },
          "enabled" : {
            "description" : "Enabled",
            "type" : "boolean"
          },
          "actions" : {
            "description" : "Actions: NotNull(error = NAT_RULE_ACTIONS_MISSING: Action is not specified for NAT policy rule.) Size(max = 4, error = NAT_RULE_INVALID_ACTION_LIMIT: Minimum 1 and maximum 4 actions can be specified in a NAT policy rule., min = 1) Valid ",
            "type" : "array",
            "items" : {
              "properties" : {
                "protocols" : {
                  "description" : "Protocols: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 4, error = NAT_RULE_ACTION_INVALID_ALG_DISABLE_PROTOCOL: Invalid or duplicate protocol specified for alg-disable. Supports max. 4 protocols from 'sip', 'ftp','pptp' and 'tftp'., noTrim = false, regex = sip|ftp|tftp|pptp, required = false) ",
                  "type" : "array",
                  "items" : {
                    "description" : "Protocols",
                    "type" : "string"
                  }
                },
                "port" : {
                  "description" : "Port: Range(max = 65535L, error = NAT_RULE_ACTION_INVALID_PORT_NUMBER: NAT action port must be in range 1 - 65535., min = 1L) ",
                  "type" : "integer"
                },
                "nat_pool_id" : {
                  "description" : "Nat Pool Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
                  "type" : "string"
                },
                "type" : {
                  "description" : "Type: ValidateEnum(enumClass = classOf[NATActionType], error = NAT_RULE_INVALID_ACTION_TYPE: Invalid NAT action is specified., nullAllowed = false) NotNull(error = NAT_RULE_ACTION_TYPE_MISSING: NAT action is not specified.) ",
                  "type" : "string",
                  "enum" : [ "NO_NAT", "SOURCE_NAT_DYNAMIC", "SOURCE_NAT_STATIC", "DESTINATION_NAT_DYNAMIC", "DESTINATION_NAT_STATIC", "ALG_DISABLE" ]
                }
              },
              "required" : [ "type" ]
            }
          },
          "protocol" : {
            "description" : "Protocol: Range(max = 255L, error = NAT_RULE_INVALID_PROTOCOL: NAT protocol must be in range 1-255, min = 1L) Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) ",
            "type" : "integer"
          },
          "destination_ports" : {
            "description" : "Destination Ports: Size(max = 16, error = NAT_RULE_DESTINATION_PORTS_EXCEEDS_LIMIT: Maximum 16 port ranges can be specified in destination ports., min = 0) Valid ",
            "type" : "array",
            "items" : {
              "properties" : {
                "from" : {
                  "description" : "From: Range(max = 65535L, error = INVALID_FROM_PORT_NUMBER: Invalid 'FROM' port number in port range. Must be in range 1 - 65535, min = 1L) ",
                  "type" : "integer"
                },
                "to" : {
                  "description" : "To: Range(max = 65535L, error = INVALID_TO_PORT_NUMBER: Invalid 'TO' port number in port range. Must be in range 1 - 65535, min = 1L) ",
                  "type" : "integer"
                }
              }
            }
          },
          "source_ports" : {
            "description" : "Source Ports: Size(max = 16, error = NAT_RULE_SOURCE_PORTS_EXCEEDS_LIMIT: Maximum 16 port ranges can be specified in source ports., min = 0) Valid ",
            "type" : "array",
            "items" : {
              "properties" : {
                "from" : {
                  "description" : "From: Range(max = 65535L, error = INVALID_FROM_PORT_NUMBER: Invalid 'FROM' port number in port range. Must be in range 1 - 65535, min = 1L) ",
                  "type" : "integer"
                },
                "to" : {
                  "description" : "To: Range(max = 65535L, error = INVALID_TO_PORT_NUMBER: Invalid 'TO' port number in port range. Must be in range 1 - 65535, min = 1L) ",
                  "type" : "integer"
                }
              }
            }
          },
          "destination_zone_id" : {
            "description" : "Destination Zone Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) Digits(fraction = 0, integer = 30, error = NAT_RULE_INVALID_DESTINATION_ZONE_ID: Destination zone id is not in valid format.) ",
            "type" : "string"
          },
          "source_zone_id" : {
            "description" : "Source Zone Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) Digits(fraction = 0, integer = 30, error = NAT_RULE_INVALID_SOURCE_ZONE_ID: Source zone id is not in valid format.) ",
            "type" : "string"
          },
          "destination_prefixes_id" : {
            "description" : "Destination Prefixes Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) Digits(fraction = 0, integer = 30, error = NAT_RULE_INVALID_DESTINATION_PREFIXES_ID: Destination prefixes id is not in valid format.) ",
            "type" : "string"
          },
          "source_prefixes_id" : {
            "description" : "Source Prefixes Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) Digits(fraction = 0, integer = 30, error = NAT_RULE_INVALID_SOURCE_PREFIXES_ID: Source prefixes id is not in valid format.) ",
            "type" : "string"
          },
          "policyset_id" : {
            "description" : "Policyset Id: Indexed(background = false, dropDups = false, expireAfterSeconds = -1, name = , options = IndexOptions(background = false, collation = Collation(alternate = NON_IGNORABLE, backwards = false, caseFirst = OFF, caseLevel = false, locale = , maxVariable = PUNCT, normalization = false, numericOrdering = false, strength = TERTIARY), disableValidation = false, dropDups = false, expireAfterSeconds = -1, language = , languageOverride = , name = , partialFilter = , sparse = false, unique = false), sparse = false, unique = false, value = ASC) Digits(fraction = 0, integer = 30, INVALID_POLICYSET_ID) ",
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
        "required" : [ "actions", "name" ]
      }
    },
    "destination_zone_policyrule_order" : {
      "description" : "Destination Zone Policyrule Order: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = NAT_SET_DUPLICATE_DESTINATION_ZONE_RULES: Duplicate destination zone rule specified in policy set., noTrim = false, regex = , required = false) ",
      "type" : "array",
      "items" : {
        "description" : "Destination Zone Policyrule Order",
        "type" : "string"
      }
    },
    "source_zone_policyrule_order" : {
      "description" : "Source Zone Policyrule Order: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 0, error = NAT_SET_DUPLICATE_SOURCE_ZONE_RULES: Duplicate source zone rule specified in policy set., noTrim = false, regex = , required = false) ",
      "type" : "array",
      "items" : {
        "description" : "Source Zone Policyrule Order",
        "type" : "string"
      }
    },
    "policy_req_version" : {
      "description" : "Policy Req Version: JsonIgnore(value = true) ",
      "type" : "string"
    },
    "send_to_element" : {
      "description" : "Send To Element: Transient ",
      "type" : "boolean"
    },
    "clone_from" : {
      "description" : "Clone From: Digits(fraction = 0, integer = 20, INVALID_CLONE_FROM) ",
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
  "required" : [ "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_nat_policy_set.my_resource_name"
 id="<resource_id>"
}
```

