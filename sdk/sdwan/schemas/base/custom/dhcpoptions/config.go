package dhcpoptions

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/BaseCustomDHCPOptions

/*
Config object.

ShortName: lrzxLXR
Parent chains:
*

Args:

Param OptionDefinition (string, required): Option Definition: NotEmpty(groups = [classOf[Definition]], error = DHCPSERVER_CONFIG_CUSTOM_OPTIONS_DEF_UNSUPPORTED: Custom option definition is not supported) Size(groups = [classOf[Definition]], max = 1024, error = DHCPSERVER_CONFIG_OPTION_DEF_EXCEEDS_LIMIT: Custom option definition length exceeeds maximum limit, min = 0)

Param OptionValue (string, required): Option Value: NotEmpty(groups = [classOf[Value]], error = DHCPSERVER_CONFIG_CUSTOM_OPTIONS_VAL_UNSUPPORTED: Custom option value is not supported) Size(groups = [classOf[Value]], max = 8192, error = DHCPSERVER_CONFIG_OPTION_VAL_EXCEEDS_LIMIT: Custom option value length exceeds maximum limit, min = 0)
*/
type Config struct {
	OptionDefinition string `json:"option_definition"`
	OptionValue      string `json:"option_value"`
}
