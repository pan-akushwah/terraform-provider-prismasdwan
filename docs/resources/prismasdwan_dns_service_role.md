## Documentation for Prisma SDWAN Resource "dns_service_role"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `dns_service_role` |
| Get Api  | `/sdwan/v2.0/api/dnsserviceroles/{dnsservice_role_id}` (`DnsServiceRole`) |
| Post Api  | `/sdwan/v2.0/api/dnsserviceroles` (`DnsServiceRole`) |
| Put Api  | `/sdwan/v2.0/api/dnsserviceroles/{dnsservice_role_id}` (`DnsServiceRole`) |
| Delete Api  | `/sdwan/v2.0/api/dnsserviceroles/{dnsservice_role_id}` |


### JSON Schema

```json
{
  "properties" : {
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
  "required" : [ "tags", "description", "name", "region", "disabled_reason", "disabled", "inactive_reason", "inactive", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_dns_service_role.my_resource_name"
 id="<resource_id>"
}
```

