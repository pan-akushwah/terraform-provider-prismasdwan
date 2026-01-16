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
      "description" : "Peer Sites: Valid ListObject(allowDuplicate = true, allowEmpty = false, allowNull = false, listMaxSize = 0, message = MULTICAST_INVALID_PEER_SITE, required = false) ",
      "type" : "array",
      "items" : {
        "properties" : {
          "peer_site_id" : {
            "description" : "Peer Site Id",
            "type" : "string"
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
  "required" : [ "peer_sites", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_multicast_peer_group_profile.my_resource_name"
 id="<resource_id>"
}
```

