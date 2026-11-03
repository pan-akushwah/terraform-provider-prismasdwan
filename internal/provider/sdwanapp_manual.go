package provider

// This file is written by hand. It is not generated: no schema named sdwanapp is mapped in the generator's
// provider.yml, so the generator never writes or overwrites sdwanapp_*.go. Keep it that way (do not add `sdwanapps` to
// allowed_ds_names).
//
// prismasdwan_sdwanapp is read-only: it looks one SD-WAN app up by its exact name (names are unique) and lists its
// releases. The app id and a version from the list are what prismasdwan_sdwanapps_config needs to install the app:
//
//	data "prismasdwan_sdwanapp" "email" {
//	  name = "Email Notifications For Alarm-Alerts"
//	}
//
//	resource "prismasdwan_sdwanapps_config" "email" {
//	  x_parameters = { app_id = data.prismasdwan_sdwanapp.email.id }
//	  version      = "1.5.0" # one of data.prismasdwan_sdwanapp.email.versions
//	  state        = "enabled"
//	}
//
// The API is GET /sdwan/v2.2/api/sdwanapps. Calls under .../appstatus are status calls outside the provider's scope.

import (
	"context"
	"encoding/json"
	"fmt"

	sdwan "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk"
	sdwan_client "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/services"

	"github.com/hashicorp/terraform-plugin-framework/datasource"
	dsschema "github.com/hashicorp/terraform-plugin-framework/datasource/schema"
	"github.com/hashicorp/terraform-plugin-framework/types"
	"github.com/hashicorp/terraform-plugin-log/tflog"
)

const sdwanappListPath = "/sdwan/v2.2/api/sdwanapps"

var (
	_ datasource.DataSource              = &sdwanappDataSource{}
	_ datasource.DataSourceWithConfigure = &sdwanappDataSource{}
)

// NewSdwanappDataSource is registered in provider.go.
func NewSdwanappDataSource() datasource.DataSource {
	return &sdwanappDataSource{}
}

type sdwanappDataSource struct {
	client *sdwan.Client
}

type dsModelSdwanappRelease struct {
	Version        types.String `tfsdk:"version"`
	Name           types.String `tfsdk:"name"`
	Description    types.String `tfsdk:"description"`
	State          types.String `tfsdk:"state"`
	ReleaseDate    types.Int64  `tfsdk:"release_date"`
	DefaultRelease types.Bool   `tfsdk:"default_release"`
	ParametersJSON types.String `tfsdk:"parameters_json"`
}

type dsModelSdwanapp struct {
	Name        types.String              `tfsdk:"name"`
	Id          types.String              `tfsdk:"id"`
	Description types.String              `tfsdk:"description"`
	Tags        types.List                `tfsdk:"tags"`
	Versions    types.List                `tfsdk:"versions"`
	Releases    []*dsModelSdwanappRelease `tfsdk:"releases"`
}

// the parts of an app the data source reads from the API
type apiSdwanapp struct {
	Id          string   `json:"id"`
	Name        string   `json:"name"`
	Description *string  `json:"description"`
	Tags        []string `json:"tags"`
	Releases    []struct {
		Version        string          `json:"version"`
		Name           *string         `json:"name"`
		Description    *string         `json:"description"`
		State          *string         `json:"state"`
		ReleaseDate    *int64          `json:"release_date"`
		DefaultRelease *bool           `json:"default_release"`
		Parameters     json.RawMessage `json:"parameters"`
	} `json:"releases"`
}

func (d *sdwanappDataSource) Metadata(_ context.Context, _ datasource.MetadataRequest, resp *datasource.MetadataResponse) {
	resp.TypeName = "prismasdwan_sdwanapp"
}

func (d *sdwanappDataSource) Schema(_ context.Context, _ datasource.SchemaRequest, resp *datasource.SchemaResponse) {
	resp.Schema = dsschema.Schema{
		Description: "Looks up one Prisma SD-WAN app by its exact name and lists its releases. Read-only: use the id and one " +
			"of the versions with prismasdwan_sdwanapps_config to install the app.",
		Attributes: map[string]dsschema.Attribute{
			"name": dsschema.StringAttribute{
				Required:    true,
				Description: "Exact name of the app, for example \"Email Notifications For Alarm-Alerts\". Names are unique.",
			},
			"id": dsschema.StringAttribute{
				Computed:    true,
				Description: "Id of the app, the app_id of prismasdwan_sdwanapps_config.",
			},
			"description": dsschema.StringAttribute{
				Computed:    true,
				Description: "Description of the app.",
			},
			"tags": dsschema.ListAttribute{
				Computed:    true,
				ElementType: types.StringType,
				Description: "Tags of the app.",
			},
			"versions": dsschema.ListAttribute{
				Computed:    true,
				ElementType: types.StringType,
				Description: "Versions of all releases, in the order the API returns them. An app is installed with one version.",
			},
			"releases": dsschema.ListNestedAttribute{
				Computed:    true,
				Description: "Releases of the app.",
				NestedObject: dsschema.NestedAttributeObject{
					Attributes: map[string]dsschema.Attribute{
						"version": dsschema.StringAttribute{
							Computed:    true,
							Description: "Version of the release, for example 1.5.0.",
						},
						"name": dsschema.StringAttribute{
							Computed:    true,
							Description: "Name of the release.",
						},
						"description": dsschema.StringAttribute{
							Computed:    true,
							Description: "Description of the release.",
						},
						"state": dsschema.StringAttribute{
							Computed:    true,
							Description: "State of the release: ga, beta, alpha or deprecated.",
						},
						"release_date": dsschema.Int64Attribute{
							Computed:    true,
							Description: "Release date, seconds since the epoch.",
						},
						"default_release": dsschema.BoolAttribute{
							Computed:    true,
							Description: "Whether this is the default release.",
						},
						"parameters_json": dsschema.StringAttribute{
							Computed: true,
							Description: "JSON list that describes the user_config of this release (key, type, required, " +
								"default_value, list_values, ...). Decode it with jsondecode().",
						},
					},
				},
			},
		},
	}
}

func (d *sdwanappDataSource) Configure(_ context.Context, req datasource.ConfigureRequest, _ *datasource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}
	d.client = req.ProviderData.(*sdwan.Client)
}

func (d *sdwanappDataSource) Read(ctx context.Context, req datasource.ReadRequest, resp *datasource.ReadResponse) {
	var state dsModelSdwanapp
	resp.Diagnostics.Append(req.Config.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}
	name := state.Name.ValueString()
	tflog.Info(ctx, "performing datasource read", map[string]any{"resource_name": "prismasdwan_sdwanapp", "name": name})

	// the only call: GET the list of apps
	svc := sdwan_client.NewClient(d.client)
	request := &sdwan_client.SdwanClientRequestResponse{Method: "GET", Path: sdwanappListPath}
	params := map[string]*string{}
	request.PathParameters = &params
	svc.ExecuteSdwanRequest(ctx, request)
	if request.ResponseErr != nil {
		resp.Diagnostics.AddError("error reading prismasdwan_sdwanapp",
			fmt.Sprintf("%s (GET %s)", (*request.ResponseErr).Error(), *request.FinalPath))
		return
	}
	var list struct {
		Items []apiSdwanapp `json:"items"`
	}
	if err := json.Unmarshal(*request.ResponseBytes, &list); err != nil {
		resp.Diagnostics.AddError("error reading prismasdwan_sdwanapp: cannot decode the list of apps", err.Error())
		return
	}

	var found []apiSdwanapp
	for _, app := range list.Items {
		if app.Name == name {
			found = append(found, app)
		}
	}
	switch len(found) {
	case 0:
		var names []string
		for _, app := range list.Items {
			names = append(names, app.Name)
		}
		resp.Diagnostics.AddError("sdwan app not found",
			fmt.Sprintf("no app is named %q (the name must match exactly). Apps of this tenant: %q", name, names))
		return
	case 1:
	default:
		resp.Diagnostics.AddError("sdwan app is not unique", fmt.Sprintf("%d apps are named %q", len(found), name))
		return
	}
	app := found[0]

	state.Id = types.StringValue(app.Id)
	state.Description = types.StringPointerValue(app.Description)
	tags, diags := types.ListValueFrom(ctx, types.StringType, nonNilStrings(app.Tags))
	resp.Diagnostics.Append(diags...)
	state.Tags = tags
	versions := make([]string, 0, len(app.Releases))
	state.Releases = make([]*dsModelSdwanappRelease, 0, len(app.Releases))
	for _, r := range app.Releases {
		versions = append(versions, r.Version)
		release := &dsModelSdwanappRelease{
			Version:        types.StringValue(r.Version),
			Name:           types.StringPointerValue(r.Name),
			Description:    types.StringPointerValue(r.Description),
			State:          types.StringPointerValue(r.State),
			ReleaseDate:    types.Int64PointerValue(r.ReleaseDate),
			DefaultRelease: types.BoolPointerValue(r.DefaultRelease),
			ParametersJSON: types.StringNull(),
		}
		if len(r.Parameters) > 0 && string(r.Parameters) != "null" {
			release.ParametersJSON = types.StringValue(string(r.Parameters))
		}
		state.Releases = append(state.Releases, release)
	}
	versionList, diags := types.ListValueFrom(ctx, types.StringType, versions)
	resp.Diagnostics.Append(diags...)
	state.Versions = versionList
	if resp.Diagnostics.HasError() {
		return
	}
	resp.Diagnostics.Append(resp.State.Set(ctx, &state)...)
}

func nonNilStrings(s []string) []string {
	if s == nil {
		return []string{}
	}
	return s
}
