package provider

// Note:  This file is automatically generated.  Manually made changes
// will be overwritten when the provider is generated.

import (
	"context"
	"encoding/json"
	"strings"

	sdwan "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk"
	sdwan_schema "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas"
	sdwan_client "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/services"

	"github.com/hashicorp/terraform-plugin-framework/datasource"
	dsschema "github.com/hashicorp/terraform-plugin-framework/datasource/schema"
	"github.com/hashicorp/terraform-plugin-framework/types"
	"github.com/hashicorp/terraform-plugin-log/tflog"
)

// +-----------------------------------------------------------------
// | Schema Map Summary (size=goLangStructMap=3)
// | Computed Resource Name=sites_hubclusters_hubclustermembers
// +-----------------------------------------------------------------
// | ThresholdConfig HasID=false
// | LoadFactor HasID=false
// | HubClusterMemberScreen HasID=true
// +-----------------------------------------------------------------

// Data source.
var (
	_ datasource.DataSource              = &siteHubClusterMemberDataSource{}
	_ datasource.DataSourceWithConfigure = &siteHubClusterMemberDataSource{}
)

// To enable this data source for TF Provider, go to `provider.go` and inject this into the function
// as below:
//
//	func (p *SdwanProvider) DataSources(_ context.Context) []func() datasource.DataSource {
//	  	return []func() datasource.DataSource{
//	     ... <other existing data sources>
//	     NewSiteHubClusterMemberDataSource,
//	     // -- append next datasource above -- //
//	     }
//	  }
func NewSiteHubClusterMemberDataSource() datasource.DataSource {
	return &siteHubClusterMemberDataSource{}
}

type siteHubClusterMemberDataSource struct {
	client *sdwan.Client
}

// Metadata returns the data source type name.
func (d *siteHubClusterMemberDataSource) Metadata(_ context.Context, req datasource.MetadataRequest, resp *datasource.MetadataResponse) {
	resp.TypeName = "prismasdwan_site_hub_cluster_member"
}

// Schema defines the schema for this data source.
func (d *siteHubClusterMemberDataSource) Schema(_ context.Context, _ datasource.SchemaRequest, resp *datasource.SchemaResponse) {
	resp.Schema = dsschema.Schema{
		Description: "Retrieves a config item.",

		Attributes: map[string]dsschema.Attribute{
			"tfid": dsschema.StringAttribute{
				Computed: true,
			},
			// rest all properties to be read from GET API Schema schema=HubClusterMemberScreen
			// generic x_parameters is added to accomodate path parameters
			"x_parameters": dsschema.MapAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				ElementType: types.StringType,
			},
			// property: name=_etag, type=INTEGER macro=rss_schema
			"x_etag": dsschema.Int64Attribute{
				Required:  false,
				Computed:  true,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=_etag, type=INTEGER macro=rss_schema
			// property: name=_schema, type=INTEGER macro=rss_schema
			"x_schema": dsschema.Int64Attribute{
				Required:  false,
				Computed:  true,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=_schema, type=INTEGER macro=rss_schema
			// property: name=headend1_site_ids, type=ARRAY_PRIMITIVE macro=rss_schema
			"headend1_site_ids": dsschema.ListAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				Sensitive:   false,
				ElementType: types.StringType,
			},
			// key name holder for attribute: name=headend1_site_ids, type=ARRAY_PRIMITIVE macro=rss_schema
			// property: name=headend2_site_ids, type=ARRAY_PRIMITIVE macro=rss_schema
			"headend2_site_ids": dsschema.ListAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				Sensitive:   false,
				ElementType: types.StringType,
			},
			// key name holder for attribute: name=headend2_site_ids, type=ARRAY_PRIMITIVE macro=rss_schema
			// property: name=hub_element_id, type=STRING macro=rss_schema
			"hub_element_id": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=hub_element_id, type=STRING macro=rss_schema
			// property: name=id, type=STRING macro=rss_schema
			"id": dsschema.StringAttribute{
				Required:  false,
				Computed:  true,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=id, type=STRING macro=rss_schema
			// property: name=load_factors, type=ARRAY_REFERENCE macro=rss_schema
			"load_factors": dsschema.ListNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				NestedObject: dsschema.NestedAttributeObject{
					Attributes: map[string]dsschema.Attribute{
						// property: name=alarm_threshold, type=INTEGER macro=rss_schema
						"alarm_threshold": dsschema.Int64Attribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=alarm_threshold, type=INTEGER macro=rss_schema
						// property: name=allocated, type=INTEGER macro=rss_schema
						"allocated": dsschema.Int64Attribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=allocated, type=INTEGER macro=rss_schema
						// property: name=subscription_factor, type=NUMBER macro=rss_schema
						"subscription_factor": dsschema.Float64Attribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=subscription_factor, type=NUMBER macro=rss_schema
						// property: name=threshold, type=REFERENCE macro=rss_schema
						"threshold": dsschema.SingleNestedAttribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
							Attributes: map[string]dsschema.Attribute{
								// property: name=critical_alarm, type=INTEGER macro=rss_schema
								"critical_alarm": dsschema.Int64Attribute{
									Required:  false,
									Computed:  false,
									Optional:  true,
									Sensitive: false,
								},
								// key name holder for attribute: name=critical_alarm, type=INTEGER macro=rss_schema
								// property: name=major_alarm, type=INTEGER macro=rss_schema
								"major_alarm": dsschema.Int64Attribute{
									Required:  false,
									Computed:  false,
									Optional:  true,
									Sensitive: false,
								},
								// key name holder for attribute: name=major_alarm, type=INTEGER macro=rss_schema
								// property: name=subscription_factor, type=NUMBER macro=rss_schema
								"subscription_factor": dsschema.Float64Attribute{
									Required:  false,
									Computed:  false,
									Optional:  true,
									Sensitive: false,
								},
								// key name holder for attribute: name=subscription_factor, type=NUMBER macro=rss_schema
							},
						},
						// key name holder for attribute: name=subscription_factor, type=NUMBER macro=rss_schema
						// property: name=type, type=STRING macro=rss_schema
						"type": dsschema.StringAttribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=type, type=STRING macro=rss_schema
					},
				},
			},
			// key name holder for attribute: name=type, type=STRING macro=rss_schema
		},
	}
}

// Configure prepares the struct.
func (d *siteHubClusterMemberDataSource) Configure(_ context.Context, req datasource.ConfigureRequest, resp *datasource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}
	d.client = req.ProviderData.(*sdwan.Client)
}

// Read performs Read for the struct.
func (d *siteHubClusterMemberDataSource) Read(ctx context.Context, req datasource.ReadRequest, resp *datasource.ReadResponse) {
	var state dsModelHubClusterMemberScreen
	resp.Diagnostics.Append(req.Config.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}
	// pointers
	diagnostics := &resp.Diagnostics

	// Basic logging.
	tflog.Info(ctx, "performing datasource read", map[string]any{
		"terraform_provider_function": "Read",
		"resource_name":               "prismasdwan_site_hub_cluster_member",
	})

	tfid := state.Tfid.ValueString()
	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 3 {
		resp.Diagnostics.AddError("error in prismasdwan_site_hub_cluster_member ID format", "Expected 3 tokens")
		return
	}

	// Prepare to read the config.
	svc := sdwan_client.NewClient(d.client)

	// Prepare input for the API endpoint.
	read_request := &sdwan_client.SdwanClientRequestResponse{}
	read_request.Method = "GET"
	read_request.Path = "/sdwan/v3.0/api/sites/{site_id}/hubclusters/{hub_cluster_id}/hubclustermembers/{hub_cluster_member_id}"

	// handle parameters
	params := make(map[string]*string)
	read_request.PathParameters = &params
	params["site_id"] = &tokens[0]
	params["hub_cluster_id"] = &tokens[1]
	params["hub_cluster_member_id"] = &tokens[2]

	// Perform the operation.
	svc.ExecuteSdwanRequest(ctx, read_request)
	if read_request.ResponseErr != nil {
		if IsObjectNotFound(*read_request.ResponseErr) {
			resp.State.RemoveResource(ctx)
		} else {
			resp.Diagnostics.AddError("error reading prismasdwan_site_hub_cluster_member", (*read_request.ResponseErr).Error())
		}
		return
	}

	// Create the Terraform ID.
	var idBuilder strings.Builder
	idBuilder.WriteString("x")

	// Store the answer to state.
	state.Tfid = types.StringValue(idBuilder.String())
	// start copying attributes
	var ans sdwan_schema.HubClusterMemberScreen
	// copy from json response
	json_err := json.Unmarshal(*read_request.ResponseBytes, &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to HubClusterMemberScreen", json_err.Error())
		return
	}

	// lets copy all items into state schema=HubClusterMemberScreen
	// copy_to_state: state=state prefix=dsModel ans=ans properties=7
	// property: name=_etag, type=INTEGER macro=copy_to_state
	state.Etag = types.Int64PointerValue(ans.Etag)
	// property: name=_schema, type=INTEGER macro=copy_to_state
	state.Schema = types.Int64PointerValue(ans.Schema)
	// property: name=headend1_site_ids, type=ARRAY_PRIMITIVE macro=copy_to_state
	varHeadend1SiteIds, errHeadend1SiteIds := types.ListValueFrom(ctx, types.StringType, ans.Headend1SiteIds)
	state.Headend1SiteIds = varHeadend1SiteIds
	resp.Diagnostics.Append(errHeadend1SiteIds.Errors()...)
	// property: name=headend2_site_ids, type=ARRAY_PRIMITIVE macro=copy_to_state
	varHeadend2SiteIds, errHeadend2SiteIds := types.ListValueFrom(ctx, types.StringType, ans.Headend2SiteIds)
	state.Headend2SiteIds = varHeadend2SiteIds
	resp.Diagnostics.Append(errHeadend2SiteIds.Errors()...)
	// property: name=hub_element_id, type=STRING macro=copy_to_state
	state.HubElementId = types.StringPointerValue(ans.HubElementId)
	// property: name=id, type=STRING macro=copy_to_state
	state.Id = types.StringPointerValue(ans.Id)
	// property: name=load_factors, type=ARRAY_REFERENCE macro=copy_to_state
	if ans.LoadFactors == nil {
		state.LoadFactors = nil
	} else if len(ans.LoadFactors) == 0 {
		state.LoadFactors = []dsModelLoadFactor{}
	} else {
		state.LoadFactors = make([]dsModelLoadFactor, 0, len(ans.LoadFactors))
		for varLoopLoadFactorsIndex, varLoopLoadFactors := range ans.LoadFactors {
			// add a new item
			state.LoadFactors = append(state.LoadFactors, dsModelLoadFactor{})
			// copy_to_state: state=state.LoadFactors[varLoopLoadFactorsIndex] prefix=dsModel ans=varLoopLoadFactors properties=5
			// property: name=alarm_threshold, type=INTEGER macro=copy_to_state
			state.LoadFactors[varLoopLoadFactorsIndex].AlarmThreshold = types.Int64PointerValue(varLoopLoadFactors.AlarmThreshold)
			// property: name=allocated, type=INTEGER macro=copy_to_state
			state.LoadFactors[varLoopLoadFactorsIndex].Allocated = types.Int64PointerValue(varLoopLoadFactors.Allocated)
			// property: name=subscription_factor, type=NUMBER macro=copy_to_state
			state.LoadFactors[varLoopLoadFactorsIndex].SubscriptionFactor = types.Float64PointerValue(varLoopLoadFactors.SubscriptionFactor)
			// property: name=threshold, type=REFERENCE macro=copy_to_state
			if varLoopLoadFactors.Threshold == nil {
				state.LoadFactors[varLoopLoadFactorsIndex].Threshold = nil
			} else {
				state.LoadFactors[varLoopLoadFactorsIndex].Threshold = &dsModelThresholdConfig{}
				// copy_to_state: state=state.LoadFactors[varLoopLoadFactorsIndex].Threshold prefix=dsModel ans=varLoopLoadFactors.Threshold properties=3
				// property: name=critical_alarm, type=INTEGER macro=copy_to_state
				state.LoadFactors[varLoopLoadFactorsIndex].Threshold.CriticalAlarm = types.Int64PointerValue(varLoopLoadFactors.Threshold.CriticalAlarm)
				// property: name=major_alarm, type=INTEGER macro=copy_to_state
				state.LoadFactors[varLoopLoadFactorsIndex].Threshold.MajorAlarm = types.Int64PointerValue(varLoopLoadFactors.Threshold.MajorAlarm)
				// property: name=subscription_factor, type=NUMBER macro=copy_to_state
				state.LoadFactors[varLoopLoadFactorsIndex].Threshold.SubscriptionFactor = types.Float64PointerValue(varLoopLoadFactors.Threshold.SubscriptionFactor)
			}
			// property: name=type, type=STRING macro=copy_to_state
			state.LoadFactors[varLoopLoadFactorsIndex].Type = types.StringPointerValue(varLoopLoadFactors.Type)
		}
	}

	// Done.
	diagnostics.Append(resp.State.Set(ctx, &state)...)
}
