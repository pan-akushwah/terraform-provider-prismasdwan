## Documentation for Prisma SDWAN Resource "multicast_peer_group_profile"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `multicast_peer_group_profile` |
| Get Api  | `/sdwan/v2.1/api/multicastpeergroups/{peer_group_id}` (`MulticastPeerGroupScreenV2N1`) |
| Post Api  | `/sdwan/v2.1/api/multicastpeergroups` (`MulticastPeerGroupScreenV2N1`) |
| Put Api  | `/sdwan/v2.1/api/multicastpeergroups/{peer_group_id}` (`MulticastPeerGroupScreenV2N1`) |
| Delete Api  | `/sdwan/v2.1/api/multicastpeergroups/{peer_group_id}` |


### JSON Schema

```json
{
  "properties" : {
    "is_source_site_receiver" : {
      "description" : "Is Source Site Receiver",
      "type" : "boolean"
    },
    "peer_sites" : {
      "description" : "Peer Sites",
      "minItems" : 1,
      "type" : "array",
      "items" : {
        "properties" : {
          "peer_site_id" : {
            "description" : "Peer Site Id",
            "type" : "string"
          }
        },
        "required" : [ "peer_site_id" ]
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
  "required" : [ "is_source_site_receiver", "peer_sites", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_multicast_peer_group_profile.my_resource_name"
 id="<resource_id>"
}
```

