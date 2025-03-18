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
// | Computed Resource Name=eventcorrelationpolicysets
// +-----------------------------------------------------------------
// | SeverityPriorityMapping HasID=false
// | EventCorrelationPolicySetQueryFilter HasID=true
// | ListQueryResponseEventCorrelationPolicySetQueryFilter HasID=true
// +-----------------------------------------------------------------

// Data source.
var (
	_ datasource.DataSource              = &eventcorrelationpolicysetsDataSource{}
	_ datasource.DataSourceWithConfigure = &eventcorrelationpolicysetsDataSource{}
)

// To enable this data source for TF Provider, go to `provider.go` and inject this into the function
// as below:
//
//	func (p *SdwanProvider) DataSources(_ context.Context) []func() datasource.DataSource {
//	  	return []func() datasource.DataSource{
//	     ... <other existing data sources>
//	     NewEventcorrelationpolicysetsDataSource,
//	     // -- append next datasource above -- //
//	     }
//	  }
func NewEventcorrelationpolicysetsDataSource() datasource.DataSource {
	return &eventcorrelationpolicysetsDataSource{}
}

type eventcorrelationpolicysetsDataSource struct {
	client *sdwan.Client
}

// Metadata returns the data source type name.
func (d *eventcorrelationpolicysetsDataSource) Metadata(_ context.Context, req datasource.MetadataRequest, resp *datasource.MetadataResponse) {
	resp.TypeName = "prismasdwan_eventcorrelationpolicysets"
}

// Schema defines the schema for this data source.
func (d *eventcorrelationpolicysetsDataSource) Schema(_ context.Context, _ datasource.SchemaRequest, resp *datasource.SchemaResponse) {
	resp.Schema = dsschema.Schema{
		Description: "Retrieves a config item.",

		Attributes: map[string]dsschema.Attribute{
			"tfid": dsschema.StringAttribute{
				Computed: true,
			},
			// rest all properties to be read from GET API Schema schema=ListQueryResponseEventCorrelationPolicySetQueryFilter
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
			// property: name=deleted_count, type=INTEGER macro=rss_schema
			"deleted_count": dsschema.Int64Attribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=deleted_count, type=INTEGER macro=rss_schema
			// property: name=deleted_ids, type=ARRAY_PRIMITIVE macro=rss_schema
			"deleted_ids": dsschema.ListAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				Sensitive:   false,
				ElementType: types.StringType,
			},
			// key name holder for attribute: name=deleted_ids, type=ARRAY_PRIMITIVE macro=rss_schema
			// property: name=id, type=STRING macro=rss_schema
			"id": dsschema.StringAttribute{
				Required:  false,
				Computed:  true,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=id, type=STRING macro=rss_schema
			// property: name=items, type=ARRAY_REFERENCE macro=rss_schema
			"items": dsschema.ListNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				NestedObject: dsschema.NestedAttributeObject{
					Attributes: map[string]dsschema.Attribute{
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
						// property: name=active_policyset, type=BOOLEAN macro=rss_schema
						"active_policyset": dsschema.BoolAttribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=active_policyset, type=BOOLEAN macro=rss_schema
						// property: name=clone_from, type=STRING macro=rss_schema
						"clone_from": dsschema.StringAttribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=clone_from, type=STRING macro=rss_schema
						// property: name=description, type=STRING macro=rss_schema
						"description": dsschema.StringAttribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=description, type=STRING macro=rss_schema
						// property: name=id, type=STRING macro=rss_schema
						"id": dsschema.StringAttribute{
							Required:  false,
							Computed:  true,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=id, type=STRING macro=rss_schema
						// property: name=name, type=STRING macro=rss_schema
						"name": dsschema.StringAttribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=name, type=STRING macro=rss_schema
						// property: name=policyrule_order, type=ARRAY_PRIMITIVE macro=rss_schema
						"policyrule_order": dsschema.ListAttribute{
							Required:    false,
							Computed:    false,
							Optional:    true,
							Sensitive:   false,
							ElementType: types.StringType,
						},
						// key name holder for attribute: name=policyrule_order, type=ARRAY_PRIMITIVE macro=rss_schema
						// property: name=severity_priority_mapping, type=ARRAY_REFERENCE macro=rss_schema
						"severity_priority_mapping": dsschema.ListNestedAttribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
							NestedObject: dsschema.NestedAttributeObject{
								Attributes: map[string]dsschema.Attribute{
									// property: name=priority, type=STRING macro=rss_schema
									"priority": dsschema.StringAttribute{
										Required:  false,
										Computed:  false,
										Optional:  true,
										Sensitive: false,
									},
									// key name holder for attribute: name=priority, type=STRING macro=rss_schema
									// property: name=severity, type=STRING macro=rss_schema
									"severity": dsschema.StringAttribute{
										Required:  false,
										Computed:  false,
										Optional:  true,
										Sensitive: false,
									},
									// key name holder for attribute: name=severity, type=STRING macro=rss_schema
								},
							},
						},
						// key name holder for attribute: name=severity, type=STRING macro=rss_schema
						// property: name=tags, type=SET_PRIMITIVE macro=rss_schema
						"tags": dsschema.SetAttribute{
							Required:    false,
							Computed:    false,
							Optional:    true,
							Sensitive:   false,
							ElementType: types.StringType,
						},
						// key name holder for attribute: name=tags, type=SET_PRIMITIVE macro=rss_schema
					},
				},
			},
			// key name holder for attribute: name=tags, type=SET_PRIMITIVE macro=rss_schema
			// property: name=next_query, type=OBJECT macro=rss_schema
			"next_query": dsschema.SingleNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=next_query, type=OBJECT macro=rss_schema
			// property: name=total_count, type=INTEGER macro=rss_schema
			"total_count": dsschema.Int64Attribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=total_count, type=INTEGER macro=rss_schema
		},
	}
}

// Configure prepares the struct.
func (d *eventcorrelationpolicysetsDataSource) Configure(_ context.Context, req datasource.ConfigureRequest, resp *datasource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}
	d.client = req.ProviderData.(*sdwan.Client)
}

// Read performs Read for the struct.
func (d *eventcorrelationpolicysetsDataSource) Read(ctx context.Context, req datasource.ReadRequest, resp *datasource.ReadResponse) {
	var state dsModelListQueryResponseEventCorrelationPolicySetQueryFilter
	resp.Diagnostics.Append(req.Config.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}
	// pointers
	diagnostics := &resp.Diagnostics

	// Basic logging.
	tflog.Info(ctx, "performing datasource read", map[string]any{
		"terraform_provider_function": "Read",
		"resource_name":               "prismasdwan_eventcorrelationpolicysets",
	})

	tfid := state.Tfid.ValueString()
	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 1 {
		resp.Diagnostics.AddError("error in prismasdwan_eventcorrelationpolicysets ID format", "Expected 1 tokens")
		return
	}

	// Prepare to read the config.
	svc := sdwan_client.NewClient(d.client)

	// Prepare input for the API endpoint.
	read_request := &sdwan_client.SdwanClientRequestResponse{}
	read_request.Method = "GET"
	read_request.Path = "/sdwan/v2.0/api/eventcorrelationpolicysets/{policy_set_id}"

	// handle parameters
	params := make(map[string]*string)
	read_request.PathParameters = &params
	params["policy_set_id"] = &tokens[0]

	// Perform the operation.
	svc.ExecuteSdwanRequest(ctx, read_request)
	if read_request.ResponseErr != nil {
		if IsObjectNotFound(*read_request.ResponseErr) {
			resp.State.RemoveResource(ctx)
		} else {
			resp.Diagnostics.AddError("error reading prismasdwan_eventcorrelationpolicysets", (*read_request.ResponseErr).Error())
		}
		return
	}

	// Create the Terraform ID.
	var idBuilder strings.Builder
	idBuilder.WriteString("x")

	// Store the answer to state.
	state.Tfid = types.StringValue(idBuilder.String())
	// start copying attributes
	var ans sdwan_schema.ListQueryResponseEventCorrelationPolicySetQueryFilter
	// copy from json response
	json_err := json.Unmarshal(*read_request.ResponseBytes, &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to ListQueryResponseEventCorrelationPolicySetQueryFilter", json_err.Error())
		return
	}

	// lets copy all items into state schema=ListQueryResponseEventCorrelationPolicySetQueryFilter
	// copy_to_state: state=state prefix=dsModel ans=ans properties=8
	// property: name=_etag, type=INTEGER macro=copy_to_state
	state.Etag = types.Int64PointerValue(ans.Etag)
	// property: name=_schema, type=INTEGER macro=copy_to_state
	state.Schema = types.Int64PointerValue(ans.Schema)
	// property: name=deleted_count, type=INTEGER macro=copy_to_state
	state.DeletedCount = types.Int64PointerValue(ans.DeletedCount)
	// property: name=deleted_ids, type=ARRAY_PRIMITIVE macro=copy_to_state
	varDeletedIds, errDeletedIds := types.ListValueFrom(ctx, types.StringType, ans.DeletedIds)
	state.DeletedIds = varDeletedIds
	resp.Diagnostics.Append(errDeletedIds.Errors()...)
	// property: name=id, type=STRING macro=copy_to_state
	state.Id = types.StringPointerValue(ans.Id)
	// property: name=items, type=ARRAY_REFERENCE macro=copy_to_state
	if ans.Items == nil {
		state.Items = nil
	} else if len(ans.Items) == 0 {
		state.Items = []dsModelEventCorrelationPolicySetQueryFilter{}
	} else {
		state.Items = make([]dsModelEventCorrelationPolicySetQueryFilter, 0, len(ans.Items))
		for varLoopItemsIndex, varLoopItems := range ans.Items {
			// add a new item
			state.Items = append(state.Items, dsModelEventCorrelationPolicySetQueryFilter{})
			// copy_to_state: state=state.Items[varLoopItemsIndex] prefix=dsModel ans=varLoopItems properties=10
			// property: name=_etag, type=INTEGER macro=copy_to_state
			state.Items[varLoopItemsIndex].Etag = types.Int64PointerValue(varLoopItems.Etag)
			// property: name=_schema, type=INTEGER macro=copy_to_state
			state.Items[varLoopItemsIndex].Schema = types.Int64PointerValue(varLoopItems.Schema)
			// property: name=active_policyset, type=BOOLEAN macro=copy_to_state
			state.Items[varLoopItemsIndex].ActivePolicyset = types.BoolPointerValue(varLoopItems.ActivePolicyset)
			// property: name=clone_from, type=STRING macro=copy_to_state
			state.Items[varLoopItemsIndex].CloneFrom = types.StringPointerValue(varLoopItems.CloneFrom)
			// property: name=description, type=STRING macro=copy_to_state
			state.Items[varLoopItemsIndex].Description = types.StringPointerValue(varLoopItems.Description)
			// property: name=id, type=STRING macro=copy_to_state
			state.Items[varLoopItemsIndex].Id = types.StringPointerValue(varLoopItems.Id)
			// property: name=name, type=STRING macro=copy_to_state
			state.Items[varLoopItemsIndex].Name = types.StringPointerValue(varLoopItems.Name)
			// property: name=policyrule_order, type=ARRAY_PRIMITIVE macro=copy_to_state
			varPolicyruleOrder, errPolicyruleOrder := types.ListValueFrom(ctx, types.StringType, varLoopItems.PolicyruleOrder)
			state.Items[varLoopItemsIndex].PolicyruleOrder = varPolicyruleOrder
			resp.Diagnostics.Append(errPolicyruleOrder.Errors()...)
			// property: name=severity_priority_mapping, type=ARRAY_REFERENCE macro=copy_to_state
			if varLoopItems.SeverityPriorityMapping == nil {
				state.Items[varLoopItemsIndex].SeverityPriorityMapping = nil
			} else if len(varLoopItems.SeverityPriorityMapping) == 0 {
				state.Items[varLoopItemsIndex].SeverityPriorityMapping = []dsModelSeverityPriorityMapping{}
			} else {
				state.Items[varLoopItemsIndex].SeverityPriorityMapping = make([]dsModelSeverityPriorityMapping, 0, len(varLoopItems.SeverityPriorityMapping))
				for varLoopSeverityPriorityMappingIndex, varLoopSeverityPriorityMapping := range varLoopItems.SeverityPriorityMapping {
					// add a new item
					state.Items[varLoopItemsIndex].SeverityPriorityMapping = append(state.Items[varLoopItemsIndex].SeverityPriorityMapping, dsModelSeverityPriorityMapping{})
					// copy_to_state: state=state.Items[varLoopItemsIndex].SeverityPriorityMapping[varLoopSeverityPriorityMappingIndex] prefix=dsModel ans=varLoopSeverityPriorityMapping properties=2
					// property: name=priority, type=STRING macro=copy_to_state
					state.Items[varLoopItemsIndex].SeverityPriorityMapping[varLoopSeverityPriorityMappingIndex].Priority = types.StringPointerValue(varLoopSeverityPriorityMapping.Priority)
					// property: name=severity, type=STRING macro=copy_to_state
					state.Items[varLoopItemsIndex].SeverityPriorityMapping[varLoopSeverityPriorityMappingIndex].Severity = types.StringPointerValue(varLoopSeverityPriorityMapping.Severity)
				}
			}
			// property: name=tags, type=SET_PRIMITIVE macro=copy_to_state
			varTags, errTags := types.SetValueFrom(ctx, types.StringType, varLoopItems.Tags)
			state.Items[varLoopItemsIndex].Tags = varTags
			resp.Diagnostics.Append(errTags.Errors()...)
		}
	}
	// property: name=next_query, type=OBJECT macro=copy_to_state
	// property: name=total_count, type=INTEGER macro=copy_to_state
	state.TotalCount = types.Int64PointerValue(ans.TotalCount)

	// Done.
	diagnostics.Append(resp.State.Set(ctx, &state)...)
}
