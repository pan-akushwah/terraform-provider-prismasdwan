package provider

import (
	"context"
	"fmt"

	sdk "github.com/paloaltonetworks/scm-go"
	sdkapi "github.com/paloaltonetworks/scm-go/api"

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

// SdwanProvider is the provider implementation.
type SdwanProvider struct {
	version string
}

// SdwanProviderModel maps provider schema data to a Go type.
type SdwanProviderModel struct {
	Host         types.String `tfsdk:"host"`
	Port         types.Int64  `tfsdk:"port"`
	Protocol     types.String `tfsdk:"protocol"`
	ClientId     types.String `tfsdk:"client_id"`
	ClientSecret types.String `tfsdk:"client_secret"`
	Scope        types.String `tfsdk:"scope"`
	Logging      types.String `tfsdk:"logging"`
	AuthFile     types.String `tfsdk:"auth_file"`
	AuthUrl      types.String `tfsdk:"auth_url"`
}

// Metadata returns the provider type name.
func (p *SdwanProvider) Metadata(_ context.Context, _ provider.MetadataRequest, resp *provider.MetadataResponse) {
	resp.TypeName = "prismasdwan"
	resp.Version = p.version
}

// Schema defines the provider-level schema for configuration data.
func (p *SdwanProvider) Schema(_ context.Context, _ provider.SchemaRequest, resp *provider.SchemaResponse) {
	resp.Schema = schema.Schema{
		Description: "Terraform provider to interact with Palo Alto Networks Strata Cloud Manager API.",
		Attributes: map[string]schema.Attribute{
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
					"The port number for API operations, if non-standard for the given protocol.",
					"",
					"SCM_PORT",
					"port",
				),
				Optional: true,
			},
			"protocol": schema.StringAttribute{
				Description: ProviderParamDescription(
					"The protocol (https or http).",
					"https",
					"SCM_PROTOCOL",
					"protocol",
				),
				Optional: true,
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
			"auth_url": schema.StringAttribute{
				Description: ProviderParamDescription(
					"The URL to send auth credentials to which will return a JWT.",
					"https://auth.apps.paloaltonetworks.com/auth/v1/oauth2/access_token",
					"SCM_AUTH_URL",
					"auth_url",
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
	con := &sdk.Client{
		Host:             config.Host.ValueString(),
		Port:             int(config.Port.ValueInt64()),
		Protocol:         config.Protocol.ValueString(),
		ClientId:         config.ClientId.ValueString(),
		ClientSecret:     config.ClientSecret.ValueString(),
		Scope:            config.Scope.ValueString(),
		AuthFile:         config.AuthFile.ValueString(),
		Logging:          config.Logging.ValueString(),
		Logger:           tflog.Debug,
		CheckEnvironment: true,
		AuthUrl:          config.AuthUrl.ValueString(),
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
		NewSdwanSiteDataSource,
	}
}

// Resources defines the data sources for this provider.
func (p *SdwanProvider) Resources(_ context.Context) []func() resource.Resource {
	return []func() resource.Resource{
		NewSdwanSiteResource,
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
