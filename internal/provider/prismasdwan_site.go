package provider

import (
	"context"
	"fmt"
	"net/http"
	"os"
	"strings"
	"time"

	"github.com/paloaltonetworks/scm-go"

	"github.com/hashicorp/terraform-plugin-framework/datasource"
	dsschema "github.com/hashicorp/terraform-plugin-framework/datasource/schema"
	"github.com/hashicorp/terraform-plugin-framework/path"
	"github.com/hashicorp/terraform-plugin-framework/resource"
	rsschema "github.com/hashicorp/terraform-plugin-framework/resource/schema"
	"github.com/hashicorp/terraform-plugin-framework/resource/schema/booldefault"
	"github.com/hashicorp/terraform-plugin-framework/types"
	"github.com/hashicorp/terraform-plugin-log/tflog"
)

// Data source.
var (
	_ datasource.DataSource              = &sdwanSiteDataSource{}
	_ datasource.DataSourceWithConfigure = &sdwanSiteDataSource{}
)

// SdwanPullSiteRequest is the JSON sent to pull_site.
type SdwanPullSiteRequest struct {
	Site         string `json:"site_name"`
	ClientId     string `json:"client_id,omitempty"`
	ClientSecret string `json:"client_secret,omitempty"`
	Scope        string `json:"scope,omitempty"`
}

// SdwanPullSiteResponse is the JSON sent back from pull_site.
type SdwanPullSiteResponse struct {
	Errors []string `json:"errors"`

	Config string `json:"config"`
}

func NewSdwanSiteDataSource() datasource.DataSource {
	return &sdwanSiteDataSource{}
}

type sdwanSiteDataSource struct {
	client *scm.Client
}

type sdwanSiteDsModel struct {
	// Input.
	Site types.String `tfsdk:"site_name"`

	// Output.
	Config types.String `tfsdk:"config"`
}

func (d *sdwanSiteDataSource) Metadata(_ context.Context, req datasource.MetadataRequest, resp *datasource.MetadataResponse) {
	resp.TypeName = req.ProviderTypeName + "_site"
}

func (d *sdwanSiteDataSource) Schema(_ context.Context, _ datasource.SchemaRequest, resp *datasource.SchemaResponse) {
	resp.Schema = dsschema.Schema{
		Description: "Retrieves the JSON pull-site info for a given site.  This can then be updated and sebsequently fed into the prismasdwan_site resource.",

		Attributes: map[string]dsschema.Attribute{
			"site_name": dsschema.StringAttribute{
				Description: "The site whose config should be retrieved.",
				Required:    true,
			},
			"config": dsschema.StringAttribute{
				Description: "The site config.",
				Computed:    true,
			},
		},
	}
}

func (d *sdwanSiteDataSource) Configure(_ context.Context, req datasource.ConfigureRequest, resp *datasource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}

	d.client = req.ProviderData.(*scm.Client)
}

func (d *sdwanSiteDataSource) Read(ctx context.Context, req datasource.ReadRequest, resp *datasource.ReadResponse) {
	var state sdwanSiteDsModel
	resp.Diagnostics.Append(req.Config.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}

	tflog.Info(ctx, "performing data source read", map[string]any{
		"data_source": "prismasdwan_site",
		"function":    "Read",
		"site":        state.Site,
	})

	path := "/v1.0/api/sdwan/config/pull_site"
	input := SdwanPullSiteRequest{
		Site:         state.Site.ValueString(),
		ClientId:     d.client.ClientId,
		ClientSecret: d.client.ClientSecret,
		Scope:        d.client.Scope,
	}
	var ans SdwanPullSiteResponse

	ctx, cancel := context.WithTimeout(ctx, time.Duration(30*time.Minute))
	defer cancel()

	if _, err := d.client.Do(ctx, http.MethodPost, path, nil, input, &ans); err != nil {
		resp.Diagnostics.AddError("Error in API operation", err.Error())
		return
	}

	if len(ans.Errors) != 0 {
		for _, emsg := range ans.Errors {
			resp.Diagnostics.AddError("Error in API operation", emsg)
		}
		return
	}

	state.Config = types.StringValue(ans.Config)
	resp.Diagnostics.Append(resp.State.Set(ctx, &state)...)
}

// Resource.
var (
	_ resource.Resource                = &sdwanSiteResource{}
	_ resource.ResourceWithConfigure   = &sdwanSiteResource{}
	_ resource.ResourceWithImportState = &sdwanSiteResource{}
)

// SdwanDoSiteRequest is the JSON that Terraform sends for do_site and the config status URI.
type SdwanDoSiteRequest struct {
	ClientId     string `json:"client_id,omitempty"`
	ClientSecret string `json:"client_secret,omitempty"`
	Scope        string `json:"scope,omitempty"`
	Config       string `json:"config,omitempty"`
}

// SdwanDoSiteResponse is the JSON sent back from both do_site and the config status URI.
type SdwanDoSiteResponse struct {
	Errors []string `json:"errors"`

	Uuid       string `json:"uuid"`
	IsDeployed bool   `json:"is_deployed"`
}

func NewSdwanSiteResource() resource.Resource {
	return &sdwanSiteResource{}
}

type sdwanSiteResource struct {
	client *scm.Client
}

type sdwanSiteModel struct {
	Tfid types.String `tfsdk:"tfid"`

	Config     types.String `tfsdk:"config"`
	Timeout    types.String `tfsdk:"timeout"`
	IsDeployed types.Bool   `tfsdk:"is_deployed"`
}

func (r *sdwanSiteResource) Metadata(_ context.Context, req resource.MetadataRequest, resp *resource.MetadataResponse) {
	resp.TypeName = req.ProviderTypeName + "_site"
}

func (r *sdwanSiteResource) Schema(_ context.Context, _ resource.SchemaRequest, resp *resource.SchemaResponse) {
	resp.Schema = rsschema.Schema{
		Description: "Manages a Prisma SD-WAN site.",

		Attributes: map[string]rsschema.Attribute{
			// Input.
			"timeout": TimeoutSchema("30m"),
			"config": rsschema.StringAttribute{
				Description: "The filesystem path of the site's JSON config.",
				Required:    true,
			},
			"is_deployed": rsschema.BoolAttribute{
				Description: "This will be set to false if the site config deployed does not match the given config file.",
				Optional:    true,
				Computed:    true,
				Default:     booldefault.StaticBool(true),
			},

			// Output.
			"tfid": rsschema.StringAttribute{
				Description: "The Terraform ID for this resource.",
				Computed:    true,
			},
		},
	}
}

// getConfigData reads the config data either from a file or raw JSON
func getConfigData(configFilePathOrData string) ([]byte, error) {
	// Check if the input is a file path
	if strings.HasPrefix(configFilePathOrData, "/") {
		data, err := os.ReadFile(configFilePathOrData)
		if err != nil {
			return nil, fmt.Errorf("unable to read config file: %w", err)
		}
		return data, nil
	}
	// Assume the input is raw JSON data
	return []byte(configFilePathOrData), nil
}

func (r *sdwanSiteResource) Configure(_ context.Context, req resource.ConfigureRequest, resp *resource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}

	r.client = req.ProviderData.(*scm.Client)
}

func (r *sdwanSiteResource) Create(ctx context.Context, req resource.CreateRequest, resp *resource.CreateResponse) {
	var state sdwanSiteModel
	resp.Diagnostics.Append(req.Plan.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}

	tflog.Info(ctx, "performing resource create", map[string]any{
		"resource_name":               "prismasdwan_site",
		"terraform_provider_function": "Create",
		"config":                      state.Config.ValueString(),
	})

	json, err := getConfigData(state.Config.ValueString())
	if err != nil {
		resp.Diagnostics.AddError("Error reading site JSON file/data", err.Error())
		return
	}

	path := "/v1.0/api/sdwan/config/do_site"
	input := SdwanDoSiteRequest{
		ClientId:     r.client.ClientId,
		ClientSecret: r.client.ClientSecret,
		Scope:        r.client.Scope,
		Config:       string(json),
	}
	var ans SdwanDoSiteResponse

	ctx, cancel := context.WithTimeout(ctx, TimeoutFrom(state.Timeout))
	defer cancel()

	if _, err := r.client.Do(ctx, http.MethodPost, path, nil, input, &ans); err != nil {
		resp.Diagnostics.AddError("Error in API operation", err.Error())
	}

	for _, emsg := range ans.Errors {
		resp.Diagnostics.AddError("Error in API operation", emsg)
	}

	if resp.Diagnostics.HasError() {
		return
	}

	state.Tfid = types.StringValue(fmt.Sprintf("%s:%s", ans.Uuid, state.Config.ValueString()))
	state.IsDeployed = types.BoolValue(ans.IsDeployed)

	resp.Diagnostics.Append(resp.State.Set(ctx, &state)...)
}

func (r *sdwanSiteResource) Read(ctx context.Context, req resource.ReadRequest, resp *resource.ReadResponse) {
	var savestate, state sdwanSiteModel
	resp.Diagnostics.Append(req.State.Get(ctx, &savestate)...)
	if resp.Diagnostics.HasError() {
		return
	}

	tfid := savestate.Tfid.ValueString()
	tokens := strings.SplitN(tfid, ":", 2)
	if len(tokens) != 2 {
		resp.Diagnostics.AddError("Invalid tfid", "Expected 2 tokens")
		return
	}
	uuid, config := tokens[0], tokens[1]

	tflog.Info(ctx, "performing resource read", map[string]any{
		"terraform_provider_function": "Read",
		"resource_name":               "prismasdwan_site",
		"uuid":                        uuid,
		"config":                      config,
	})

	json, err := getConfigData(config)
	if err != nil {
		resp.Diagnostics.AddError("Error reading site JSON file/data", err.Error())
		return
	}

	path := fmt.Sprintf("/v1.0/api/sdwan/config/do_site/%s", uuid)
	input := SdwanDoSiteRequest{
		ClientId:     r.client.ClientId,
		ClientSecret: r.client.ClientSecret,
		Scope:        r.client.Scope,
		Config:       string(json),
	}
	var ans SdwanDoSiteResponse

	ctx, cancel := context.WithTimeout(ctx, TimeoutFrom(savestate.Timeout))
	defer cancel()

	if _, err := r.client.Do(ctx, http.MethodPost, path, nil, input, &ans); err != nil {
		resp.Diagnostics.AddError("Error in API operation", err.Error())
	}

	for _, emsg := range ans.Errors {
		if emsg == SiteNotFoundError {
			resp.State.RemoveResource(ctx)
			return
		}
		resp.Diagnostics.AddError("Error in API operation", emsg)
	}

	if resp.Diagnostics.HasError() {
		return
	}

	state.Tfid = savestate.Tfid
	state.Timeout = savestate.Timeout
	state.Config = types.StringValue(config)
	state.IsDeployed = types.BoolValue(ans.IsDeployed)

	resp.Diagnostics.Append(resp.State.Set(ctx, &state)...)
}

func (r *sdwanSiteResource) Update(ctx context.Context, req resource.UpdateRequest, resp *resource.UpdateResponse) {
	var plan, state sdwanSiteModel
	resp.Diagnostics.Append(req.State.Get(ctx, &state)...)
	resp.Diagnostics.Append(req.Plan.Get(ctx, &plan)...)
	if resp.Diagnostics.HasError() {
		return
	}

	tfid := state.Tfid.ValueString()
	tokens := strings.SplitN(tfid, ":", 2)
	if len(tokens) != 2 {
		resp.Diagnostics.AddError("Invalid tfid", "Expected 2 tokens")
		return
	}
	uuid := tokens[0]

	tflog.Info(ctx, "performing resource update", map[string]any{
		"terraform_provider_function": "Update",
		"resource_name":               "prismasdwan_site",
		"uuid":                        uuid,
		"config":                    plan.Config.ValueString(),
	})

	json, err := getConfigData(plan.Config.ValueString())
	if err != nil {
		resp.Diagnostics.AddError("Error reading site JSON file/data", err.Error())
		return
	}

	path := fmt.Sprintf("/v1.0/api/sdwan/config/do_site/%s", uuid)
	input := SdwanDoSiteRequest{
		ClientId:     r.client.ClientId,
		ClientSecret: r.client.ClientSecret,
		Scope:        r.client.Scope,
		Config:       string(json),
	}
	var ans SdwanDoSiteResponse

	ctx, cancel := context.WithTimeout(ctx, TimeoutFrom(plan.Timeout))
	defer cancel()

	if _, err := r.client.Do(ctx, http.MethodPut, path, nil, input, &ans); err != nil {
		resp.Diagnostics.AddError("Error in API operation", err.Error())
	}

	for _, emsg := range ans.Errors {
		resp.Diagnostics.AddError("Error in API operation", emsg)
	}

	if resp.Diagnostics.HasError() {
		return
	}

	if ans.Uuid == "" {
		state.Tfid = types.StringValue(fmt.Sprintf("%s:%s", uuid, plan.Config.ValueString()))
	} else {
		state.Tfid = types.StringValue(fmt.Sprintf("%s:%s", ans.Uuid, plan.Config.ValueString()))
	}
	state.Timeout = plan.Timeout
	state.Config = plan.Config
	state.IsDeployed = types.BoolValue(ans.IsDeployed)

	resp.Diagnostics.Append(resp.State.Set(ctx, &state)...)
}

func (r *sdwanSiteResource) Delete(ctx context.Context, req resource.DeleteRequest, resp *resource.DeleteResponse) {
	var state sdwanSiteModel
	resp.Diagnostics.Append(req.State.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}

	tfid := state.Tfid.ValueString()
	tokens := strings.SplitN(tfid, ":", 2)
	if len(tokens) != 2 {
		resp.Diagnostics.AddError("Invalid tfid", "Expected 2 tokens")
		return
	}
	uuid := tokens[0]

	tflog.Info(ctx, "performing resource delete", map[string]any{
		"terraform_provider_function": "Delete",
		"resource_name":               "prismasdwan_site",
		"uuid":                        uuid,
	})

	json, err := getConfigData(state.Config.ValueString())
	if err != nil {
		resp.Diagnostics.AddError("Error reading site JSON file/data", err.Error())
		return
	}

	path := fmt.Sprintf("/v1.0/api/sdwan/config/do_site/%s", uuid)
	input := SdwanDoSiteRequest{
		ClientId:     r.client.ClientId,
		ClientSecret: r.client.ClientSecret,
		Scope:        r.client.Scope,
		Config:       string(json),
	}
	var ans SdwanDoSiteResponse

	ctx, cancel := context.WithTimeout(ctx, TimeoutFrom(state.Timeout))
	defer cancel()

	if _, err := r.client.Do(ctx, http.MethodDelete, path, nil, input, &ans); err != nil {
		resp.Diagnostics.AddError("Error in API operation", err.Error())
	}

	for _, emsg := range ans.Errors {
		if emsg == SiteNotFoundError {
			continue
		}
		resp.Diagnostics.AddError("Error in API operation", emsg)
	}
}

func (r *sdwanSiteResource) ImportState(ctx context.Context, req resource.ImportStateRequest, resp *resource.ImportStateResponse) {
	resource.ImportStatePassthroughID(ctx, path.Root("tfid"), req, resp)
}
