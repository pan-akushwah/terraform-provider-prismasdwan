package provider

import (
	"context"
	"fmt"

	sdk "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk"
	sdkapi "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/api"

	"github.com/hashicorp/terraform-plugin-framework/datasource"
	"github.com/hashicorp/terraform-plugin-framework/provider"
	"github.com/hashicorp/terraform-plugin-framework/provider/schema"
	"github.com/hashicorp/terraform-plugin-framework/resource"
	"github.com/hashicorp/terraform-plugin-framework/types"
	"github.com/hashicorp/terraform-plugin-log/tflog"
)

// Ensure the provider implementation interface is sound.
var (
	_ provider.Provider = &SdwanProvider{}
)

// SdProvider is the provider implementation.
type SdwanProvider struct {
	version string
}

// SdwanProviderModel maps provider schema data to a Go type.
type SdwanProviderModel struct {
	AuthUrl      types.String `tfsdk:"auth_url"`
	Protocol     types.String `tfsdk:"protocol"`
	Host         types.String `tfsdk:"host"`
	Port         types.Int64  `tfsdk:"port"`
	Headers      types.Map    `tfsdk:"headers"`
	ClientId     types.String `tfsdk:"client_id"`
	ClientSecret types.String `tfsdk:"client_secret"`
	Scope        types.String `tfsdk:"scope"`
	Logging      types.String `tfsdk:"logging"`
	AuthFile     types.String `tfsdk:"auth_file"`
}

// Metadata returns the provider type name.
func (p *SdwanProvider) Metadata(_ context.Context, _ provider.MetadataRequest, resp *provider.MetadataResponse) {
	resp.TypeName = "sdwan"
	resp.Version = p.version
}

// Schema defines the provider-level schema for configuration data.
func (p *SdwanProvider) Schema(_ context.Context, _ provider.SchemaRequest, resp *provider.SchemaResponse) {
	resp.Schema = schema.Schema{
		Description: "Terraform provider to interact with Palo Alto Networks Strata Cloud Manager API.",
		Attributes: map[string]schema.Attribute{
			"auth_url": schema.StringAttribute{
				Description: ProviderParamDescription(
					"The URL to send auth credentials to which will return a JWT.",
					"https://auth.apps.paloaltonetworks.com/auth/v1/oauth2/access_token",
					"SCM_AUTH_URL",
					"auth_url",
				),
				Optional: true,
			},
			"protocol": schema.StringAttribute{
				Description: ProviderParamDescription(
					"The protocol to use for SCM. This should be 'http' or 'https'.",
					"https",
					"SCM_PROTOCOL",
					"protocol",
				),
				Optional: true,
			},
			"host": schema.StringAttribute{
				Description: ProviderParamDescription(
					"The hostname of Strata Cloud Manager API.",
					"api.sase.paloaltonetworks.com",
					"SCM_HOST",
					"host",
				),
				Optional: true,
			},
			"port": schema.Int64Attribute{
				Description: ProviderParamDescription(
					"The port number to use for API commands, if non-standard for the given protocol.",
					"",
					"SCM_PORT",
					"port",
				),
				Optional: true,
			},
			"headers": schema.MapAttribute{
				Description: ProviderParamDescription(
					"Custom HTTP headers to be sent with all API commands.",
					"",
					"SCM_HEADERS",
					"headers",
				),
				Optional:    true,
				ElementType: types.StringType,
			},
			"client_id": schema.StringAttribute{
				Description: ProviderParamDescription(
					"The client ID for the connection.",
					"",
					"SCM_CLIENT_ID",
					"client_id",
				),
				Optional: true,
			},
			"client_secret": schema.StringAttribute{
				Description: ProviderParamDescription(
					"The client secret for the connection.",
					"",
					"SCM_CLIENT_SECRET",
					"client_secret",
				),
				Optional:  true,
				Sensitive: true,
			},
			"scope": schema.StringAttribute{
				Description: ProviderParamDescription(
					"The client scope.",
					"",
					"SCM_SCOPE",
					"scope",
				),
				Optional: true,
			},
			"logging": schema.StringAttribute{
				Description: ProviderParamDescription(
					"The logging level of the provider and the underlying communication.",
					sdkapi.LogQuiet,
					"SCM_LOGGING",
					"logging",
				),
				Optional: true,
			},
			"auth_file": schema.StringAttribute{
				Description: ProviderParamDescription(
					"The file path to the JSON file with auth creds for SCM.",
					"",
					"",
					"",
				),
				Optional: true,
			},
		},
	}
}

// Configure prepares the provider.
func (p *SdwanProvider) Configure(ctx context.Context, req provider.ConfigureRequest, resp *provider.ConfigureResponse) {
	tflog.Info(ctx, "Configuring the provider client")

	var config SdwanProviderModel
	resp.Diagnostics.Append(req.Config.Get(ctx, &config)...)
	if resp.Diagnostics.HasError() {
		return
	}

	// Configure the client.
	ht := make(map[string]types.String, len(config.Headers.Elements()))
	resp.Diagnostics.Append(config.Headers.ElementsAs(ctx, &ht, false).Errors()...)
	if resp.Diagnostics.HasError() {
		return
	}

	headers := make(map[string]string, len(ht))
	for hkey, hval := range ht {
		headers[hkey] = hval.ValueString()
	}

	con := &sdk.Client{
		AuthUrl:          config.AuthUrl.ValueString(),
		Protocol:         config.Protocol.ValueString(),
		Host:             config.Host.ValueString(),
		Port:             int(config.Port.ValueInt64()),
		Headers:          headers,
		ClientId:         config.ClientId.ValueString(),
		ClientSecret:     config.ClientSecret.ValueString(),
		Scope:            config.Scope.ValueString(),
		AuthFile:         config.AuthFile.ValueString(),
		Logging:          config.Logging.ValueString(),
		Logger:           tflog.Debug,
		CheckEnvironment: true,
		Agent:            fmt.Sprintf("Terraform/%s Provider/prismasdwan Version/%s", req.TerraformVersion, p.version),
	}

	if err := con.Setup(); err != nil {
		resp.Diagnostics.AddError("Provider parameter value error", err.Error())
		return
	}

	con.HttpClient.Transport = sdkapi.NewTransport(con.HttpClient.Transport, con)

	if err := con.RefreshJwt(ctx); err != nil {
		resp.Diagnostics.AddError("Authentication error", err.Error())
		return
	}

	resp.DataSourceData = con
	resp.ResourceData = con

	// Done.
	tflog.Info(ctx, "Configured client", map[string]any{"success": true})
}

// DataSources defines the data sources for this provider.
func (p *SdwanProvider) DataSources(_ context.Context) []func() datasource.DataSource {
	return []func() datasource.DataSource{
		// -- append next datasource above -- //

	}
}

// Resources defines the data sources for this provider.
func (p *SdwanProvider) Resources(_ context.Context) []func() resource.Resource {
	return []func() resource.Resource{
		// Resource Locator
		NewResourceLocatorResource,
		// -- add content of provider.sources.txt below --
		NewAnynetlinksResource,
		NewApnProfileResource,
		NewAppdefsOverridesResource,
		NewAppdefsResource,
		NewDnsServiceProfileResource,
		NewDnsServiceRoleResource,
		NewDomainResource,
		NewElementApplicationProbeResource,
		NewElementBgpConfigResource,
		NewElementBgpPeerResource,
		NewElementCellularModuleResource,
		NewElementCellularModuleSimSecurityResource,
		NewElementDnsServiceResource,
		NewElementExtensionResource,
		NewElementInterfaceResource,
		NewElementIotDeviceIdConfigResource,
		NewElementIpfixResource,
		NewElementMstpInstanceResource,
		NewElementMulticastGlobalConfigResource,
		NewElementMulticastRpResource,
		NewElementNtpResource,
		NewElementOspfConfigResource,
		NewElementOspfGlobalConfigResource,
		NewElementRadiusResource,
		NewElementResource,
		NewElementRoutingAspathaccesslistResource,
		NewElementRoutingIpcommunitylistResource,
		NewElementRoutingPrefixlistResource,
		NewElementRoutingRoutemapResource,
		NewElementSecurityZoneResource,
		NewElementShellInterfaceResource,
		NewElementShellResource,
		NewElementSnmpAgentResource,
		NewElementStaticRouteResource,
		NewElementSyslogServerResource,
		NewElementTacacsPlusServerResource,
		NewElementToolkitResource,
		NewElementUserAccessResource,
		NewElementUserResource,
		NewElementVsnmpTrapResource,
		NewElementsResource,
		NewEventCorrelationPolicyRuleResource,
		NewEventCorrelationPolicySetResource,
		NewExternalCaConfigResource,
		NewGlobalPrefixFilterResource,
		NewIdpsResource,
		NewIotProfileResource,
		NewIpfixCollectorContextResource,
		NewIpfixFilterContextResource,
		NewIpfixGlobalPrefixResource,
		NewIpfixLocalPrefixResource,
		NewIpfixProfileResource,
		NewIpfixTemplateResource,
		NewIpsecProfileResource,
		NewLocalPrefixFilterResource,
		NewMachinesSoftwareResource,
		NewMulticastPeerGroupProfileResource,
		NewNatGlobalPrefixResource,
		NewNatLocalPrefixResource,
		NewNatPolicyPoolResource,
		NewNatPolicyRuleResource,
		NewNatPolicySetResource,
		NewNatPolicySetStackResource,
		NewNatZoneResource,
		NewNetworkContextResource,
		NewNtpTemplateResource,
		NewOperatorsResource,
		NewPathGlobalPrefixResource,
		NewPathGroupResource,
		NewPathLocalPrefixResource,
		NewPathPolicyRuleResource,
		NewPathPolicySetResource,
		NewPathPolicyStackResource,
		NewPerformancePolicyRuleResource,
		NewPerformancePolicySetResource,
		NewPerformancePolicyStackResource,
		NewPerformanceProfileResource,
		NewPermissionsResource,
		NewProbeProfileResource,
		NewProbeconfigsResource,
		NewQosPolicyGlobalPrefixResource,
		NewQosPolicyLocalPrefixResource,
		NewQosPolicyRuleResource,
		NewQosPolicySetResource,
		NewQosPolicyStackResource,
		NewRolesResource,
		NewSdwanappsConfigResource,
		NewSecurityPolicyGlobalPrefixResource,
		NewSecurityPolicyLocalPrefixResource,
		NewSecurityPolicyRuleResource,
		NewSecurityPolicySetResource,
		NewSecurityPolicyStackResource,
		NewSecurityZoneResource,
		NewSecuritypolicysetsResource,
		NewSecuritypolicysetsSecuritypolicyrulesResource,
		NewServiceEndpointResource,
		NewServiceGroupResource,
		NewSiteCiphersResource,
		NewSiteDhcpServerResource,
		NewSiteExtensionResource,
		NewSiteHubClusterMemberResource,
		NewSiteHubClusterResource,
		NewSiteHubDistributionFabricResource,
		NewSiteHubPrefixFilterAssociationResource,
		NewSiteHubPrefixFilterProfileResource,
		NewSiteHubPrefixFilterResource,
		NewSiteIotDeviceIdConfigResource,
		NewSiteIotSnmpStartNodeResource,
		NewSiteIpfixLocalPrefixResource,
		NewSiteLanNetworkResource,
		NewSiteNatLocalPrefixResource,
		NewSitePathPolicyLocalPrefixResource,
		NewSitePrismaAccessConfigResource,
		NewSitePrismaSaseConnectionResource,
		NewSiteQosPolicyLocalPrefixResource,
		NewSiteResource,
		NewSiteSecurityPolicyLocalPrefixResource,
		NewSiteSecurityZoneResource,
		NewSiteSpokeClusterResource,
		NewSiteWanInterfaceResource,
		NewSiteWanMulticastConfigurationResource,
		NewSitesDemsiteconfigsResource,
		NewSyslogProfileResource,
		NewTacacsPlusProfileResource,
		NewUserIdAgentResource,
		NewUserResource,
		NewVffLicenseTokenResource,
		NewVrfContextProfileResource,
		NewVrfContextResource,
		NewWanInterfaceLabelResource,
		NewWanNetworkResource,
		NewWanOverlayResource,
		NewWsExtensionsResource,
		// -- append next resource above -- //

	}
}

// New is a helper function to get the provider implementation.
func New(version string) func() provider.Provider {
	return func() provider.Provider {
		return &SdwanProvider{
			version: version,
		}
	}
}
