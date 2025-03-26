## Documentation for Prisma SDWAN Resource "element_extension"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `element_extension` |
| Get Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/extensions/{extension_id}` (`ExtensionScreen`) |
| Post Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/extensions` (`ExtensionScreen`) |
| Put Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/extensions/{extension_id}` (`ExtensionScreen`) |
| Delete Api  | `/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/extensions/{extension_id}` |


### JSON Schema

```json
{
  "properties" : {
    "conf" : {
      "type" : "object"
    },
    "disabled" : {
      "description" : "Disabled",
      "type" : "boolean"
    },
    "entity_id" : {
      "description" : "Entity Id: Pattern(error = INVALID_ENTITY_ID: Invalid entity id. Only numbers are allowed., regexp = [0-9]+$) ",
      "type" : "string"
    },
    "namespace" : {
      "description" : "Namespace: NotEmpty(EXTENSION_NAMESPACE_REQD) Pattern(error = INVALID_EXTENSION_NAMESPACE: Invalid Namespace. Allowed characters are a-z0-9/ and it should start with alphabet., regexp = ^[a-z][a-z0-9/]*[a-z0-9]+$) ",
      "type" : "string"
    },
    "name" : {
      "description" : "Name: NotEmpty(EXTENSION_NAME_REQD) Size(max = 128, error = INVALID_EXTENSION_NAME: Invalid Extension name., min = 0) ",
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
  "required" : [ "conf", "namespace", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_element_extension.my_resource_name"
 id="<resource_id>:site_id=<some_site_id>:element_id=<some_element_id>"
}
```

