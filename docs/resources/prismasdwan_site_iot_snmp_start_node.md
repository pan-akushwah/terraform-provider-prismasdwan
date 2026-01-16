## Documentation for Prisma SDWAN Resource "site_iot_snmp_start_node"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `site_iot_snmp_start_node` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/deviceidconfigs/{deviceid_config_id}/snmpdiscoverystartnodes/{deviceid_start_node_id}` (`DeviceIdStartNodeScreen`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/deviceidconfigs/{deviceid_config_id}/snmpdiscoverystartnodes` (`DeviceIdStartNodeScreen`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/deviceidconfigs/{deviceid_config_id}/snmpdiscoverystartnodes/{deviceid_start_node_id}` (`DeviceIdStartNodeScreen`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/deviceidconfigs/{deviceid_config_id}/snmpdiscoverystartnodes/{deviceid_start_node_id}` |


### JSON Schema

```json
{
  "properties" : {
    "scope" : {
      "description" : "Scope: Size(max = 8, error = DEVICEID_START_NODE_SCOPE_MAX_LIMIT: Exceeds the maximum number of scope prefix per start node entry (8), min = 1) ",
      "type" : "array",
      "items" : {
        "properties" : {
          "ipv4_prefix" : {
            "description" : "Ipv4 Prefix",
            "type" : "string"
          }
        }
      }
    },
    "ipv4_address" : {
      "description" : "Ipv4 Address: NotNull(message = {STARTNODE_IPv4_MISSING}) IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, INVALID_IP_ADDRESS_001, type = IP) NotEmpty(STARTNODE_IPV4_CONFIG_INVALID_IP) IPv4(STARTNODE_IPV4_CONFIG_INVALID_IP, regexp = [/0-9.]*) ",
      "type" : "string"
    },
    "tags" : {
      "description" : "Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 1024, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\\\s]+, required = false) ",
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
      "description" : "Description: Size(max = 1024, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: Required(error = NAME_REQD: Please provide resource name.) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0) ",
      "type" : "string"
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
  "required" : [ "ipv4_address", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_iot_snmp_start_node.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:deviceid_config_id=<some_deviceid_config_id>"
}
```

