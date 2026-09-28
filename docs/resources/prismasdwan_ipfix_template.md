## Documentation for Prisma SDWAN Resource "ipfix_template"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `ipfix_template` |
| Get Api  | `/sdwan/v2.0/api/ipfixtemplates/{template_id}` (`IPFixTemplate`) |
| Post Api  | `/sdwan/v2.0/api/ipfixtemplates` (`IPFixTemplate`) |
| Put Api  | `/sdwan/v2.0/api/ipfixtemplates/{template_id}` (`IPFixTemplate`) |
| Delete Api  | `/sdwan/v2.0/api/ipfixtemplates/{template_id}` |


### JSON Schema

```json
{
  "properties" : {
    "option_export_timeout" : {
      "description" : "Option Export Timeout",
      "format" : "int32",
      "type" : "integer"
    },
    "template_export_timeout" : {
      "description" : "Template Export Timeout",
      "format" : "int32",
      "type" : "integer"
    },
    "options" : {
      "description" : "Options",
      "type" : "array",
      "items" : {
        "description" : "Options",
        "type" : "string",
        "enum" : [ "APP_DEF_ID_TABLE", "LINK_QUALITY_METRICS", "WAN_PATH_ID_TABLE", "TYPE_INFO_FOR_IPFIX_IE", "DEVICE_IDENTIFICATION" ]
      }
    },
    "generate_biflow" : {
      "description" : "Generate Biflow",
      "type" : "boolean"
    },
    "flow_fields" : {
      "description" : "Flow Fields",
      "type" : "array",
      "items" : {
        "description" : "Flow Fields",
        "type" : "string",
        "enum" : [ "INTERFACES", "TIME_STAMPS", "DST_IPV4_ADDRESS", "DST_PORT", "SRC_IPV4_ADDRESS", "SRC_PORT", "PROTOCOL", "DSCP_MAP", "DSCP_LAST", "QOS_QUEUE", "WAN_PATH", "APP_DEF_ID", "RTP_TRANSPORT_TYPE", "TRANSPORT_TCP_WINDOWSIZE", "CONNECTION_UNIFLOW_BYTES", "CONNECTION_UNIFLOW_PACKETS", "CONNECTION_BIFLOW_BYTES", "CONNECTION_BIFLOW_PACKETS", "CONNECTION_RTT", "CONNECTION_NTT", "CONNECTION_SRT", "APPLICATION_HOST", "CONNECTION_INIT", "CONNECTION_XACT", "CONNECTION_UDPTRT", "MEDIA_CODEC", "MEDIA_JITTER", "MEDIA_LOSS", "MEDIA_MOS", "TROUBLESHOOT_TCP", "TROUBLESHOOT_DECISION_MAP", "VRF_NAME" ]
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
  "required" : [ "option_export_timeout", "template_export_timeout", "options", "generate_biflow", "flow_fields", "tags", "description", "name", "id" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_ipfix_template.my_resource_name"
 id="<resource_id>"
}
```

