## Documentation for Prisma SDWAN Resource "service_endpoint"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `service_endpoint` |
| Get Api  | `/sdwan/v3.1/api/serviceendpoints/{service_endpoint_id}` (`ServiceEndpointV3N1`) |
| Post Api  | `/sdwan/v3.1/api/serviceendpoints` (`ServiceEndpointV3N1`) |
| Put Api  | `/sdwan/v3.1/api/serviceendpoints/{service_endpoint_id}` (`ServiceEndpointV3N1`) |
| Delete Api  | `/sdwan/v3.1/api/serviceendpoints/{service_endpoint_id}` |


### JSON Schema

```json
{
  "properties" : {
    "liveliness_probe" : {
      "properties" : {
        "use_tunnel_for_url_dns_resolution" : {
          "description" : "Use Tunnel For Url Dns Resolution",
          "type" : "boolean"
        },
        "http" : {
          "description" : "Http: Valid ",
          "type" : "array",
          "items" : {
            "properties" : {
              "http_status_codes" : {
                "description" : "Http Status Codes: ListNumber(duplicate = false, max = 600, error = INVALID_HTTP_STATUS_CODE: Invalid http status code. Should be between 100 to 600 and should not be duplicate., min = 100) Size(max = 8, error = HTTP_STATUS_CODES_EXCEEDS_LIMIT: Maximum 8 status codes can be specified, min = 0) ",
                "type" : "array",
                "items" : {
                  "description" : "Http Status Codes",
                  "type" : "integer"
                }
              },
              "failure_count" : {
                "description" : "Failure Count: Required(error = INVALID_HTTP_FAILURE_COUNT_INTERVAL: Invalid http probe failure count.Should be between 3 to 300 seconds.) Range(max = 300L, error = INVALID_HTTP_FAILURE_COUNT_INTERVAL: Invalid http probe failure count.Should be between 3 to 300 seconds., min = 3L) ",
                "type" : "integer"
              },
              "interval" : {
                "description" : "Interval: Required(error = INVALID_HTTP_PROBE_INTERVAL: Invalid http probe interval. Should be between 10 to 3600 seconds.) Range(max = 3600L, error = INVALID_HTTP_PROBE_INTERVAL: Invalid http probe interval. Should be between 10 to 3600 seconds., min = 10L) ",
                "type" : "integer"
              },
              "url" : {
                "description" : "Url: Required(error = INVALID_HTTP_PROBE_URL: Http probe url required) Size(max = 1024, error = INVALID_HTTP_PROBLE_URL_LEN: Invalid http probe url length.Should be up to 1024., min = 0) ",
                "type" : "string"
              }
            },
            "required" : [ "failure_count", "interval", "url" ]
          }
        },
        "icmp_ping" : {
          "description" : "Icmp Ping: Valid ",
          "type" : "array",
          "items" : {
            "properties" : {
              "failure_count" : {
                "description" : "Failure Count: Required(error = INVALID_ICMP_FAILURE_COUNT_INTERVAL: Invalid icmp probe failure count.Should be between 3 to 300 seconds.) Range(max = 300L, error = INVALID_ICMP_FAILURE_COUNT_INTERVAL: Invalid icmp probe failure count.Should be between 3 to 300 seconds., min = 3L) ",
                "type" : "integer"
              },
              "interval" : {
                "description" : "Interval: Required(error = INVALID_ICMP_PROBE_INTERVAL: Invalid icmp probe interval.Should be between 1 to 30 seconds.) Range(max = 30L, error = INVALID_ICMP_PROBE_INTERVAL: Invalid icmp probe interval.Should be between 1 to 30 seconds., min = 1L) ",
                "type" : "integer"
              },
              "ip_addresses" : {
                "description" : "Ip Addresses: Required(error = INVALID_ICMP_PROBE: Please provide icmp probe.) ListIPAddress(bcast = DENY, listMaxSize = 8, error = INVALID_ICMP_PROBE_ADDRESSES: Please provide valid icmp probe ipv4 addresses., required = false, type = IP) ",
                "type" : "array",
                "items" : {
                  "description" : "Ip Addresses",
                  "type" : "string"
                }
              }
            },
            "required" : [ "failure_count", "interval", "ip_addresses" ]
          }
        }
      }
    },
    "sase_properties" : {
      "properties" : {
        "lqm_enabled" : {
          "description" : "Lqm Enabled",
          "type" : "boolean"
        },
        "active" : {
          "description" : "Active",
          "type" : "boolean"
        }
      }
    },
    "is_sase" : {
      "description" : "Is Sase",
      "type" : "boolean"
    },
    "disable_tunnel_reoptimization" : {
      "description" : "Disable Tunnel Reoptimization",
      "type" : "boolean"
    },
    "location" : {
      "properties" : {
        "description" : {
          "description" : "Description",
          "type" : "string"
        },
        "latitude" : {
          "description" : "Latitude: Range(max = 90L, INVALID_LATITUDE_VALUE, min = -90L) ",
          "format" : "float",
          "type" : "number"
        },
        "longitude" : {
          "description" : "Longitude: Range(max = 180L, INVALID_LONGITUDE_VALUE, min = -180L) ",
          "format" : "float",
          "type" : "number"
        }
      }
    },
    "address" : {
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
    },
    "allow_enterprise_traffic" : {
      "description" : "Allow Enterprise Traffic",
      "type" : "boolean"
    },
    "service_link_peers" : {
      "properties" : {
        "hostnames" : {
          "description" : "Hostnames: ListString(allowDuplicate = true, allowEmpty = true, allowNull = true, length = 0, listMaxSize = 128, INVALID_SERVICELINK_PEERS_ADDRESSES, noTrim = false, regex = , required = false) ",
          "type" : "array",
          "items" : {
            "description" : "Hostnames",
            "type" : "string"
          }
        },
        "ip_addresses" : {
          "description" : "Ip Addresses: ListIPAddress(bcast = DENY, listMaxSize = 128, INVALID_SERVICELINK_PEERS_ADDRESSES, required = false, type = IP) ",
          "type" : "array",
          "items" : {
            "description" : "Ip Addresses",
            "type" : "string"
          }
        }
      }
    },
    "site_id" : {
      "description" : "Site Id",
      "type" : "string"
    },
    "admin_up" : {
      "description" : "Admin Up: Required(error = ADMIN_UP_REQD: Admin up required.) ",
      "type" : "boolean"
    },
    "type" : {
      "description" : "Type: ValidateEnum(enumClass = classOf[NetworkServiceType], message = Invalid enum string., nullAllowed = false) ",
      "type" : "string",
      "enum" : [ "CG_TRANSIT", "NON_CG_TRANSIT", "SASE" ]
    },
    "description" : {
      "description" : "Description: Size(max = 256, error = DESCRIPTION_SIZE_EXCEEDED: Description size exceeded., min = 0) Valid ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Required(error = SERVICEENDPOINT_NAME_REQD: service endpoint name required.) Size(max = 128, error = SERVICEENDPOINT_NAME_EXCEEDS_LIMIT: Service endpoint name exceeds limit., min = 0) Valid ",
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
  "required" : [ "admin_up", "type", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_service_endpoint.my_resource_name"
 id="<resource_id>"
}
```

