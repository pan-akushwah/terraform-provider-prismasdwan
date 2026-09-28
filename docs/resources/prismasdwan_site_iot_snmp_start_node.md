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
      "description" : "Scope",
      "maxItems" : 8,
      "minItems" : 1,
      "type" : "array",
      "items" : {
        "properties" : {
          "ipv4_prefix" : {
            "description" : "Ipv4 Prefix",
            "type" : "string"
          }
        },
        "required" : [ "ipv4_prefix" ]
      }
    },
    "ipv4_address" : {
      "description" : "Ipv4 Address",
      "format" : "ipv4",
      "minLength" : 1,
      "type" : "string"
    },
    "tags" : {
      "description" : "Tags",
      "maxItems" : 10,
      "type" : "array",
      "uniqueItems" : true,
      "items" : {
        "description" : "Tags",
        "maxLength" : 1024,
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
      "maxLength" : 1024,
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
  "required" : [ "scope", "ipv4_address", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_site_iot_snmp_start_node.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:deviceid_config_id=<some_deviceid_config_id>"
}
```

