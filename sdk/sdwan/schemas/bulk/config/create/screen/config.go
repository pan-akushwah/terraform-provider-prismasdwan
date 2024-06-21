package screen

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/BulkConfigCreateScreen

/*
Config object.

ShortName: hhIWLbI
Parent chains:
*

Args:

Param Data (string): Data

Param Etag (int64): Entity tag for the resource

Param Id (string): Id

Param SiteId (string): Site Id: Digits(fraction = 0, integer = 50, SITEID_INVALID)

Param SiteType (string, required): Site Type: Required(error = SITE_ROLE_MISSING: Site role missing.) ValidateEnum(enumClass = classOf[ElementClusterRole], error = INVALID_SITE_TYPE: Invalid site type, nullAllowed = false)

Param TemplateDescription (string): Template Description: Size(max = 256, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0)

Param TemplateName (string, required): Template Name: Required(error = TEMPLATE_NAME_REQUIRED: Template name missing) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0)

Param VariableMap (any): the VariableMap param. Default: `false`.
*/
type Config struct {
	Data                *string `json:"data"`
	Etag                *int64  `json:"_etag"`
	Id                  *string `json:"id"`
	SiteId              *string `json:"site_id"`
	SiteType            string  `json:"site_type"`
	TemplateDescription *string `json:"template_description"`
	TemplateName        string  `json:"template_name"`
	VariableMap         any     `json:"variable_map"`
}
