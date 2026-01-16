## Documentation for Prisma SDWAN Resource "ipfix_template"

### Overview

| Resource Details | |
| ------------- | ------------- |
| Resource Name | `ipfix_template` |
| Get Api  | `/sdwan/v2.0/api/ipfixtemplates/{template_id}` (`IPFixTemplateScreen`) |
| Post Api  | `/sdwan/v2.0/api/ipfixtemplates` (`IPFixTemplateScreen`) |
| Put Api  | `/sdwan/v2.0/api/ipfixtemplates/{template_id}` (`IPFixTemplateScreen`) |
| Delete Api  | `/sdwan/v2.0/api/ipfixtemplates/{template_id}` |


### JSON Schema

```json
{
  "properties" : {
    "option_export_timeout" : {
      "description" : "Option Export Timeout: Range(max = 86400L, error = IPFIX_TEMPLATE_INVALID_OPTION_EXPORT_TIMEOUT: Option export timeout should be in range 10-86400, min = 10L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "template_export_timeout" : {
      "description" : "Template Export Timeout: Range(max = 86400L, error = IPFIX_TEMPLATE_INVALID_TEMPLATE_EXPORT_TIMEOUT: Template export timeout should be in range 10-86400, min = 10L) ",
      "format" : "int32",
      "type" : "integer"
    },
    "options" : {
      "description" : "Options: ListEnum(enumClass = classOf[IPFixOption], length = 0, listMaxSize = 8, error = IPFIX_TEMPLATE_INVALID_OPTIONS: Invalid ipfix template options, nullAllowed = false) ",
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
      "description" : "Flow Fields: NotNull(error = IPFIX_TEMPLATE_FLOW_FIELDS_REQD: Please provide Flow fields) ListEnum(enumClass = classOf[IPFixFlowField], length = 0, listMaxSize = 128, error = IPFIX_TEMPLATE_INVALID_FLOW_FIELDS: Invalid flow fields, nullAllowed = false) ",
      "type" : "array",
      "items" : {
        "description" : "Flow Fields",
        "type" : "string",
        "enum" : [ "INTERFACES", "TIME_STAMPS", "DST_IPV4_ADDRESS", "DST_PORT", "SRC_IPV4_ADDRESS", "SRC_PORT", "PROTOCOL", "DSCP_MAP", "DSCP_LAST", "QOS_QUEUE", "WAN_PATH", "APP_DEF_ID", "RTP_TRANSPORT_TYPE", "TRANSPORT_TCP_WINDOWSIZE", "CONNECTION_UNIFLOW_BYTES", "CONNECTION_UNIFLOW_PACKETS", "CONNECTION_BIFLOW_BYTES", "CONNECTION_BIFLOW_PACKETS", "CONNECTION_RTT", "CONNECTION_NTT", "CONNECTION_SRT", "APPLICATION_HOST", "CONNECTION_INIT", "CONNECTION_XACT", "CONNECTION_UDPTRT", "MEDIA_CODEC", "MEDIA_JITTER", "MEDIA_LOSS", "MEDIA_MOS", "TROUBLESHOOT_TCP", "TROUBLESHOOT_DECISION_MAP" ]
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
  "required" : [ "options", "flow_fields", "name" ]
}
```

### Terraform Import
```json
import {
 to="prismasdwan_ipfix_template.my_resource_name"
 id="<resource_id>"
}
```

