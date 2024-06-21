package n2

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/SyslogServerScreenV2N2

/*
Config object.

ShortName: xlJKoIe
Parent chains:
*

Args:

Param Description (string): Description: Size(max = 1024, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0)

Param EnableFlowLogging (bool): Enable Flow Logging

Param Enabled (bool): Enabled

Param Etag (int64): Entity tag for the resource

Param Id (string, read-only): Id

Param Name (string, required): Name: Required(error = NAME_REQD: Please provide resource name.) Size(max = 128, error = NAME_EXCEEDS_LIMIT: Name of the resource exceeds limit., min = 0)

Param Protocol (string): Protocol

Param RemoteCaCertificate (string): Remote Ca Certificate

Param ServerFqdn (string): Server Fqdn

Param ServerIp (string): Server Ip: IPAddress(allowEmpty = true, allowLinkLocal = false, allowNull = true, bcast = DENY, defaultRoute = false, dnsCheck = false, error = SYSLOGSERVER_CONFIG_INVALID_IP: Invalid IP address for syslog server, type = IP)

Param ServerPort (int64): Server Port: Range(max = 65535L, error = SYSLOGSERVER_CONFIG_INVALID_RANGE: Invalid port range.Should be between 1-65535., min = 1L)

Param SeverityLevel (string): Severity Level

Param SourceInterface (string): Source Interface

Param SyslogProfileId (string): Syslog Profile Id

Param Tags ([]string): Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 1024, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\s]+, required = false)
*/
type Config struct {
	Description         *string  `json:"description"`
	EnableFlowLogging   *bool    `json:"enable_flow_logging"`
	Enabled             *bool    `json:"enabled"`
	Etag                *int64   `json:"_etag"`
	Id                  *string  `json:"id"`
	Name                string   `json:"name"`
	Protocol            *string  `json:"protocol"`
	RemoteCaCertificate *string  `json:"remote_ca_certificate"`
	ServerFqdn          *string  `json:"server_fqdn"`
	ServerIp            *string  `json:"server_ip"`
	ServerPort          *int64   `json:"server_port"`
	SeverityLevel       *string  `json:"severity_level"`
	SourceInterface     *string  `json:"source_interface"`
	SyslogProfileId     *string  `json:"syslog_profile_id"`
	Tags                []string `json:"tags"`
}
