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

	"github.com/hashicorp/terraform-plugin-framework/path"
	"github.com/hashicorp/terraform-plugin-framework/resource"
	rsschema "github.com/hashicorp/terraform-plugin-framework/resource/schema"
	"github.com/hashicorp/terraform-plugin-framework/resource/schema/planmodifier"
	"github.com/hashicorp/terraform-plugin-framework/resource/schema/stringplanmodifier"
	"github.com/hashicorp/terraform-plugin-framework/tfsdk"
	"github.com/hashicorp/terraform-plugin-framework/types"
	"github.com/hashicorp/terraform-plugin-log/tflog"
	"github.com/tidwall/sjson"
)

// +-----------------------------------------------------------------
// | Schema Map Summary (size=goLangStructMap=1)
// | Computed Resource Name=sites_prioritypolicylocalprefixes
// +-----------------------------------------------------------------
// | SitePriorityPrefixAssociationV2N1 HasID=true
// +-----------------------------------------------------------------

// Resource.
var (
	_ resource.Resource                = &sitesPrioritypolicylocalprefixesResource{}
	_ resource.ResourceWithConfigure   = &sitesPrioritypolicylocalprefixesResource{}
	_ resource.ResourceWithImportState = &sitesPrioritypolicylocalprefixesResource{}
)

// To enable this data source for TF Provider, go to `provider.go` and inject this into the function
// as below:
//
//	func (p *SdwanProvider) Resources(_ context.Context) []func() resource.Resource {
//	  	return []func() resource.Resource{
//	     ... <other existing resources>
//	     NewSitesPrioritypolicylocalprefixesResource,
//	     // -- append next resource above -- //
//	     }
//	  }
func NewSitesPrioritypolicylocalprefixesResource() resource.Resource {
	return &sitesPrioritypolicylocalprefixesResource{}
}

type sitesPrioritypolicylocalprefixesResource struct {
	client *sdwan.Client
}

// Metadata returns the data source type name.
func (r *sitesPrioritypolicylocalprefixesResource) Metadata(_ context.Context, req resource.MetadataRequest, resp *resource.MetadataResponse) {
	resp.TypeName = "prismasdwan_sites_prioritypolicylocalprefixes"
}

// Schema defines the schema for this data source.
func (r *sitesPrioritypolicylocalprefixesResource) Schema(_ context.Context, _ resource.SchemaRequest, resp *resource.SchemaResponse) {
	resp.Schema = rsschema.Schema{
		Description: "Retrieves a config item.",
		Attributes: map[string]rsschema.Attribute{
			"tfid": rsschema.StringAttribute{
				Computed: true,
				PlanModifiers: []planmodifier.String{
					stringplanmodifier.UseStateForUnknown(),
				},
			},
			// rest all properties to be read from GET API Schema schema=SitePriorityPrefixAssociationV2N1
			// generic x_parameters is added to accomodate path parameters
			"x_parameters": rsschema.MapAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				ElementType: types.StringType,
			},
			// property: name=_etag, type=INTEGER macro=rss_schema
			"x_etag": rsschema.Int64Attribute{
				Required:  false,
				Computed:  true,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=_etag, type=INTEGER macro=rss_schema
			// property: name=_schema, type=INTEGER macro=rss_schema
			"x_schema": rsschema.Int64Attribute{
				Required:  false,
				Computed:  true,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=_schema, type=INTEGER macro=rss_schema
			// property: name=id, type=STRING macro=rss_schema
			"id": rsschema.StringAttribute{
				Required:  false,
				Computed:  true,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=id, type=STRING macro=rss_schema
			// property: name=ipv4_prefixes, type=ARRAY_PRIMITIVE macro=rss_schema
			"ipv4_prefixes": rsschema.ListAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				Sensitive:   false,
				ElementType: types.StringType,
			},
			// key name holder for attribute: name=ipv4_prefixes, type=ARRAY_PRIMITIVE macro=rss_schema
			// property: name=ipv6_prefixes, type=ARRAY_PRIMITIVE macro=rss_schema
			"ipv6_prefixes": rsschema.ListAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				Sensitive:   false,
				ElementType: types.StringType,
			},
			// key name holder for attribute: name=ipv6_prefixes, type=ARRAY_PRIMITIVE macro=rss_schema
			// property: name=prefix_id, type=STRING macro=rss_schema
			"prefix_id": rsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=prefix_id, type=STRING macro=rss_schema
			// property: name=tags, type=SET_PRIMITIVE macro=rss_schema
			"tags": rsschema.SetAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				Sensitive:   false,
				ElementType: types.StringType,
			},
			// key name holder for attribute: name=tags, type=SET_PRIMITIVE macro=rss_schema
		},
	}
}

// Configure prepares the struct.
func (r *sitesPrioritypolicylocalprefixesResource) Configure(_ context.Context, req resource.ConfigureRequest, resp *resource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}
	r.client = req.ProviderData.(*sdwan.Client)
}

// in some apis the status code is not consistent and hence we may have to act upon
// specific error codes instead
func (r *sitesPrioritypolicylocalprefixesResource) GetHttpStatusCode(request *sdwan_client.SdwanClientRequestResponse) int {
	if request.ResponseErrorCode == nil {
		return request.ResponseStatusCode
	}
	switch *request.ResponseErrorCode {
	case "OBJECT_NOT_FOUND":
		return 404
	default:
		return request.ResponseStatusCode
	}
}

func (r *sitesPrioritypolicylocalprefixesResource) doPost(ctx context.Context, plan *rsModelSitePriorityPrefixAssociationV2N1, state *rsModelSitePriorityPrefixAssociationV2N1, resp *resource.CreateResponse) bool {
	tflog.Info(ctx, "executing http post for prismasdwan_sites_prioritypolicylocalprefixes")
	// Basic logging.
	tflog.Info(ctx, "performing resource create", map[string]any{
		"resource_name":               "prismasdwan_sites_prioritypolicylocalprefixes",
		"terraform_provider_function": "Create",
	})

	// Prepare input for the API endpoint.
	create_request := &sdwan_client.SdwanClientRequestResponse{}
	create_request.Method = "POST"
	create_request.Path = "/sdwan/v2.1/api/sites/{site_id}/prioritypolicylocalprefixes"

	// copy parameters from plan always
	params := MapStringValueOrNil(ctx, plan.TfParameters)
	create_request.PathParameters = &params

	// Client that will perform the request.
	svc := sdwan_client.NewClient(r.client)

	// prepare request from state
	var body = &sdwan_schema.SitePriorityPrefixAssociationV2N1{}

	// copy from plan to body
	// copy_from_plan: body=body prefix=rsModel plan=plan properties=7
	// property: name=_etag, type=INTEGER macro=copy_from_plan
	body.Etag = Int64ValueOrNil(plan.Etag)
	// property: name=_schema, type=INTEGER macro=copy_from_plan
	body.Schema = Int64ValueOrNil(plan.Schema)
	// property: name=id, type=STRING macro=copy_from_plan
	body.Id = StringValueOrNil(plan.Id)
	// property: name=ipv4_prefixes, type=ARRAY_PRIMITIVE macro=copy_from_plan
	body.Ipv4Prefixes = ListStringValueOrNil(ctx, plan.Ipv4Prefixes)
	// property: name=ipv6_prefixes, type=ARRAY_PRIMITIVE macro=copy_from_plan
	body.Ipv6Prefixes = ListStringValueOrNil(ctx, plan.Ipv6Prefixes)
	// property: name=prefix_id, type=STRING macro=copy_from_plan
	body.PrefixId = StringValueOrNil(plan.PrefixId)
	// property: name=tags, type=SET_PRIMITIVE macro=copy_from_plan
	body.Tags = SetStringValueOrNil(ctx, plan.Tags)

	// convert body to map
	json_body, err := json.Marshal(body)
	if err != nil {
		resp.Diagnostics.AddError("error marshaling struct SitePriorityPrefixAssociationV2N1 to JSON:", err.Error())
		return false
	}

	// process http json path
	request_body_string := string(json_body)
	// inject overrides
	request_body_string, _ = sjson.Delete(request_body_string, "id")
	request_body_string, _ = sjson.Delete(request_body_string, "_etag")
	request_body_string, _ = sjson.Set(request_body_string, "_schema", 0)
	// copy pointer
	create_request.RequestBody = &request_body_string

	// Perform the operation.
	svc.ExecuteSdwanRequest(ctx, create_request)
	if create_request.ResponseErr != nil {
		tflog.Info(ctx, "create request failed for prismasdwan_sites_prioritypolicylocalprefixes", map[string]any{
			"terraform_provider_function": "Create",
			"resource_name":               "prismasdwan_sites_prioritypolicylocalprefixes",
			"path":                        create_request.FinalPath,
		})
		tflog.Debug(ctx, "create request failed for prismasdwan_sites_prioritypolicylocalprefixes", map[string]any{
			"terraform_provider_function": "Create",
			"resource_name":               "prismasdwan_sites_prioritypolicylocalprefixes",
			"path":                        create_request.FinalPath,
			"request":                     create_request.ToString(),
		})
		resp.Diagnostics.AddError("error creating prismasdwan_sites_prioritypolicylocalprefixes", (*create_request.ResponseErr).Error())
		return false
	}

	// process http json path
	response_body_string := string(*create_request.ResponseBytes)
	// inject overrides
	response_body_string, _ = sjson.Delete(response_body_string, "_created_on_utc")
	response_body_string, _ = sjson.Set(response_body_string, "_schema", 0)

	// start copying attributes
	var ans sdwan_schema.SitePriorityPrefixAssociationV2N1
	// copy from json response
	json_err := json.Unmarshal([]byte(response_body_string), &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to SitePriorityPrefixAssociationV2N1 in create", json_err.Error())
		return false
	}

	// Create the Terraform ID.
	var idBuilder strings.Builder
	if ans.Id == nil {
		resp.Diagnostics.AddError("Undefined param required for ID", "Id")
		return false
	}
	// ID Format: Id:Param1=Value1:Param2=Value2:...:ParamN=ValueN
	if ans.Id != nil {
		idBuilder.WriteString(*ans.Id)
		for p, v := range *create_request.PathParameters {
			idBuilder.WriteString(IdSeparator)
			idBuilder.WriteString(p)
			idBuilder.WriteString("=")
			idBuilder.WriteString(*v)
		}
	}
	// set the tf id for the resource created
	state.Tfid = types.StringValue(idBuilder.String())
	state.TfParameters = plan.TfParameters
	tflog.Info(ctx, "created prismasdwan_sites_prioritypolicylocalprefixes with ID", map[string]any{"tfid": state.Tfid.ValueString()})

	// Store the answer to state. schema=SitePriorityPrefixAssociationV2N1
	// copy_to_state: state=state prefix=rsModel ans=ans properties=7
	// property: name=_etag, type=INTEGER macro=copy_to_state
	state.Etag = types.Int64PointerValue(ans.Etag)
	// property: name=_schema, type=INTEGER macro=copy_to_state
	state.Schema = types.Int64PointerValue(ans.Schema)
	// property: name=id, type=STRING macro=copy_to_state
	state.Id = types.StringPointerValue(ans.Id)
	// property: name=ipv4_prefixes, type=ARRAY_PRIMITIVE macro=copy_to_state
	varIpv4Prefixes, errIpv4Prefixes := types.ListValueFrom(ctx, types.StringType, ans.Ipv4Prefixes)
	state.Ipv4Prefixes = varIpv4Prefixes
	resp.Diagnostics.Append(errIpv4Prefixes.Errors()...)
	// property: name=ipv6_prefixes, type=ARRAY_PRIMITIVE macro=copy_to_state
	varIpv6Prefixes, errIpv6Prefixes := types.ListValueFrom(ctx, types.StringType, ans.Ipv6Prefixes)
	state.Ipv6Prefixes = varIpv6Prefixes
	resp.Diagnostics.Append(errIpv6Prefixes.Errors()...)
	// property: name=prefix_id, type=STRING macro=copy_to_state
	state.PrefixId = types.StringPointerValue(ans.PrefixId)
	// property: name=tags, type=SET_PRIMITIVE macro=copy_to_state
	varTags, errTags := types.SetValueFrom(ctx, types.StringType, ans.Tags)
	state.Tags = varTags
	resp.Diagnostics.Append(errTags.Errors()...)
	return true
}

func (r *sitesPrioritypolicylocalprefixesResource) doGet(ctx context.Context, state *rsModelSitePriorityPrefixAssociationV2N1, savestate *rsModelSitePriorityPrefixAssociationV2N1, State *tfsdk.State, resp *resource.ReadResponse) bool {
	// Basic logging.
	tfid := savestate.Tfid.ValueString()
	tflog.Info(ctx, "performing resource read", map[string]any{
		"terraform_provider_function": "Read",
		"resource_name":               "prismasdwan_sites_prioritypolicylocalprefixes",
		"tfid":                        tfid,
	})

	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 2 {
		resp.Diagnostics.AddError("error in prismasdwan_sites_prioritypolicylocalprefixes ID format", "Expected 2 tokens")
		return false
	}

	// Prepare to read the config.
	svc := sdwan_client.NewClient(r.client)

	// Prepare input for the API endpoint.
	read_request := &sdwan_client.SdwanClientRequestResponse{}
	read_request.Method = "GET"
	read_request.Path = "/sdwan/v2.1/api/sites/{site_id}/prioritypolicylocalprefixes/{prefix_id}"

	// copy parameters from plan always
	params := MapStringValueOrNil(ctx, savestate.TfParameters)
	read_request.PathParameters = &params
	// add last parameter as ObjectID
	(*read_request.PathParameters)["prefix_id"] = &tokens[0]
	// add other parameters by splitting on `=`
	for _, token := range tokens[1:] {
		param := strings.Split(token, "=")
		(*read_request.PathParameters)[param[0]] = &param[1]
	}

	// Perform the operation.
	svc.ExecuteSdwanRequest(ctx, read_request)
	if read_request.ResponseErr != nil {
		if IsObjectNotFound(*read_request.ResponseErr) {
			State.RemoveResource(ctx)
		} else if r.GetHttpStatusCode(read_request) == 404 {
			State.RemoveResource(ctx)
		} else {
			tflog.Info(ctx, "read request failed for prismasdwan_sites_prioritypolicylocalprefixes", map[string]any{
				"terraform_provider_function": "Read",
				"resource_name":               "prismasdwan_sites_prioritypolicylocalprefixes",
				"path":                        read_request.FinalPath,
				"request":                     read_request.ToString(),
			})
			resp.Diagnostics.AddError("error reading prismasdwan_sites_prioritypolicylocalprefixes from sdwan servers", (*read_request.ResponseErr).Error())
		}
		return false
	}

	// process http json path
	response_body_string := string(*read_request.ResponseBytes)
	// inject overrides
	response_body_string, _ = sjson.Delete(response_body_string, "_created_on_utc")
	response_body_string, _ = sjson.Set(response_body_string, "_schema", 0)

	// Store the answer to state. schema=SitePriorityPrefixAssociationV2N1
	state.Tfid = savestate.Tfid
	// copy parameters from savestate as they are
	if savestate.TfParameters.IsNull() {
		state.TfParameters = types.MapNull(types.StringType)
	} else {
		state.TfParameters = savestate.TfParameters
	}
	// start copying attributes
	var ans sdwan_schema.SitePriorityPrefixAssociationV2N1
	// copy from json response
	json_err := json.Unmarshal([]byte(response_body_string), &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to SitePriorityPrefixAssociationV2N1 in read", json_err.Error())
		return false
	}
	// lets copy all items into state
	// copy_to_state: state=state prefix=rsModel ans=ans properties=7
	// property: name=_etag, type=INTEGER macro=copy_to_state
	state.Etag = types.Int64PointerValue(ans.Etag)
	// property: name=_schema, type=INTEGER macro=copy_to_state
	state.Schema = types.Int64PointerValue(ans.Schema)
	// property: name=id, type=STRING macro=copy_to_state
	state.Id = types.StringPointerValue(ans.Id)
	// property: name=ipv4_prefixes, type=ARRAY_PRIMITIVE macro=copy_to_state
	varIpv4Prefixes, errIpv4Prefixes := types.ListValueFrom(ctx, types.StringType, ans.Ipv4Prefixes)
	state.Ipv4Prefixes = varIpv4Prefixes
	resp.Diagnostics.Append(errIpv4Prefixes.Errors()...)
	// property: name=ipv6_prefixes, type=ARRAY_PRIMITIVE macro=copy_to_state
	varIpv6Prefixes, errIpv6Prefixes := types.ListValueFrom(ctx, types.StringType, ans.Ipv6Prefixes)
	state.Ipv6Prefixes = varIpv6Prefixes
	resp.Diagnostics.Append(errIpv6Prefixes.Errors()...)
	// property: name=prefix_id, type=STRING macro=copy_to_state
	state.PrefixId = types.StringPointerValue(ans.PrefixId)
	// property: name=tags, type=SET_PRIMITIVE macro=copy_to_state
	varTags, errTags := types.SetValueFrom(ctx, types.StringType, ans.Tags)
	state.Tags = varTags
	resp.Diagnostics.Append(errTags.Errors()...)
	return true
}

func (r *sitesPrioritypolicylocalprefixesResource) doPut(ctx context.Context, plan *rsModelSitePriorityPrefixAssociationV2N1, state *rsModelSitePriorityPrefixAssociationV2N1, State *tfsdk.State, resp *resource.UpdateResponse) bool {
	state_tfid := state.Tfid.ValueString()
	plan_tfid := plan.Tfid.ValueString()
	// Basic logging.
	tflog.Info(ctx, "performing resource update", map[string]any{
		"terraform_provider_function": "Update",
		"resource_name":               "prismasdwan_sites_prioritypolicylocalprefixes",
		"state_tfid":                  state_tfid,
		"plan_tfid":                   plan_tfid,
	})

	// both TFID must be SAME!!!
	if state_tfid != plan_tfid {
		resp.Diagnostics.AddError("error updating prismasdwan_sites_prioritypolicylocalprefixes", "state and plan TFID do not match")
		return false
	}

	// split tokens
	tokens := strings.Split(state_tfid, IdSeparator)
	if len(tokens) != 2 {
		resp.Diagnostics.AddError("error in prismasdwan_sites_prioritypolicylocalprefixes ID format", "Expected 2 tokens")
		return false
	}

	// Prepare input for the API endpoint.
	put_request := &sdwan_client.SdwanClientRequestResponse{}
	put_request.Method = "PUT"
	put_request.Path = "/sdwan/v2.1/api/sites/{site_id}/prioritypolicylocalprefixes/{prefix_id}"

	// copy parameters from plan always
	params := MapStringValueOrNil(ctx, state.TfParameters)
	put_request.PathParameters = &params
	// add last parameter as ObjectID
	(*put_request.PathParameters)["prefix_id"] = &tokens[0]
	// add other parameters by splitting on `=`
	for _, token := range tokens[1:] {
		param := strings.Split(token, "=")
		(*put_request.PathParameters)[param[0]] = &param[1]
	}

	// Client that will perform the request.
	svc := sdwan_client.NewClient(r.client)

	// prepare request from state
	var body = &sdwan_schema.SitePriorityPrefixAssociationV2N1{}

	// now we create the JSON request from the state/plan created by TF
	// below copy code generated from macro copy_from_plan_or_state
	// copy_from_plan_or_state: body=body prefix=rsModel state=state plan=plan properties=7
	// property: name=_etag, type=INTEGER macro=copy_from_plan_or_state
	if state != nil {
		body.Etag = ValueInt64PointerFromPlanOrState(plan.Etag, state.Etag)
	} else {
		body.Etag = Int64ValueOrNil(plan.Etag)
	}
	// property: name=_schema, type=INTEGER macro=copy_from_plan_or_state
	if state != nil {
		body.Schema = ValueInt64PointerFromPlanOrState(plan.Schema, state.Schema)
	} else {
		body.Schema = Int64ValueOrNil(plan.Schema)
	}
	// property: name=id, type=STRING macro=copy_from_plan_or_state
	if state != nil {
		body.Id = ValueStringPointerFromPlanOrState(plan.Id, state.Id)
	} else {
		body.Id = StringValueOrNil(plan.Id)
	}
	// property: name=ipv4_prefixes, type=ARRAY_PRIMITIVE macro=copy_from_plan_or_state
	body.Ipv4Prefixes = ListStringValueOrNil(ctx, plan.Ipv4Prefixes)
	// property: name=ipv6_prefixes, type=ARRAY_PRIMITIVE macro=copy_from_plan_or_state
	body.Ipv6Prefixes = ListStringValueOrNil(ctx, plan.Ipv6Prefixes)
	// property: name=prefix_id, type=STRING macro=copy_from_plan_or_state
	if state != nil {
		body.PrefixId = ValueStringPointerFromPlanOrState(plan.PrefixId, state.PrefixId)
	} else {
		body.PrefixId = StringValueOrNil(plan.PrefixId)
	}
	// property: name=tags, type=SET_PRIMITIVE macro=copy_from_plan_or_state
	body.Tags = SetStringValueOrNil(ctx, plan.Tags)

	// convert body to map
	json_body, err := json.Marshal(body)
	if err != nil {
		resp.Diagnostics.AddError("error marshaling struct SitePriorityPrefixAssociationV2N1 to JSON:", err.Error())
		return false
	}

	// process http json path
	request_body_string := string(json_body)
	// copy pointer
	put_request.RequestBody = &request_body_string

	// Perform the operation.
	svc.ExecuteSdwanRequest(ctx, put_request)
	if put_request.ResponseErr != nil {
		if IsObjectNotFound(*put_request.ResponseErr) {
			State.RemoveResource(ctx)
		} else if r.GetHttpStatusCode(put_request) == 404 {
			State.RemoveResource(ctx)
		} else {
			tflog.Info(ctx, "update request failed for prismasdwan_sites_prioritypolicylocalprefixes", map[string]any{
				"terraform_provider_function": "Update",
				"resource_name":               "prismasdwan_sites_prioritypolicylocalprefixes",
				"path":                        put_request.FinalPath,
			})
			tflog.Debug(ctx, "update request failed for prismasdwan_sites_prioritypolicylocalprefixes", map[string]any{
				"terraform_provider_function": "Update",
				"resource_name":               "prismasdwan_sites_prioritypolicylocalprefixes",
				"path":                        put_request.FinalPath,
				"request":                     put_request.ToString(),
			})
			resp.Diagnostics.AddError("error updating prismasdwan_sites_prioritypolicylocalprefixes", (*put_request.ResponseErr).Error())
		}
		return false
	}

	// process http json path
	response_body_string := string(*put_request.ResponseBytes)
	// inject overrides
	response_body_string, _ = sjson.Delete(response_body_string, "_created_on_utc")
	response_body_string, _ = sjson.Set(response_body_string, "_schema", 0)

	// start copying attributes
	var ans sdwan_schema.SitePriorityPrefixAssociationV2N1
	// copy from json response
	json_err := json.Unmarshal([]byte(response_body_string), &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to SitePriorityPrefixAssociationV2N1 in update", json_err.Error())
		return false
	}

	// Store the answer to state. schema=SitePriorityPrefixAssociationV2N1
	// copy_to_state: state=state prefix=rsModel ans=ans properties=7
	// property: name=_etag, type=INTEGER macro=copy_to_state
	state.Etag = types.Int64PointerValue(ans.Etag)
	// property: name=_schema, type=INTEGER macro=copy_to_state
	state.Schema = types.Int64PointerValue(ans.Schema)
	// property: name=id, type=STRING macro=copy_to_state
	state.Id = types.StringPointerValue(ans.Id)
	// property: name=ipv4_prefixes, type=ARRAY_PRIMITIVE macro=copy_to_state
	varIpv4Prefixes, errIpv4Prefixes := types.ListValueFrom(ctx, types.StringType, ans.Ipv4Prefixes)
	state.Ipv4Prefixes = varIpv4Prefixes
	resp.Diagnostics.Append(errIpv4Prefixes.Errors()...)
	// property: name=ipv6_prefixes, type=ARRAY_PRIMITIVE macro=copy_to_state
	varIpv6Prefixes, errIpv6Prefixes := types.ListValueFrom(ctx, types.StringType, ans.Ipv6Prefixes)
	state.Ipv6Prefixes = varIpv6Prefixes
	resp.Diagnostics.Append(errIpv6Prefixes.Errors()...)
	// property: name=prefix_id, type=STRING macro=copy_to_state
	state.PrefixId = types.StringPointerValue(ans.PrefixId)
	// property: name=tags, type=SET_PRIMITIVE macro=copy_to_state
	varTags, errTags := types.SetValueFrom(ctx, types.StringType, ans.Tags)
	state.Tags = varTags
	resp.Diagnostics.Append(errTags.Errors()...)
	return true
}

func (r *sitesPrioritypolicylocalprefixesResource) doDelete(ctx context.Context, state *rsModelSitePriorityPrefixAssociationV2N1, resp *resource.DeleteResponse) bool {
	// read object id
	tfid := state.Tfid.ValueString()
	// Basic logging.
	tflog.Info(ctx, "performing resource delete", map[string]any{
		"terraform_provider_function": "Delete",
		"resource_name":               "prismasdwan_sites_prioritypolicylocalprefixes",
		"locMap":                      map[string]int{"prefix_id": 0},
	})

	// tokens must match
	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 2 {
		resp.Diagnostics.AddError("error in prismasdwan_sites_prioritypolicylocalprefixes ID format", "Expected 2 tokens")
		return false
	}

	// Prepare input for the API endpoint.
	delete_request := &sdwan_client.SdwanClientRequestResponse{}
	delete_request.Method = "DELETE"
	delete_request.Path = "/sdwan/v2.1/api/sites/{site_id}/prioritypolicylocalprefixes/{prefix_id}"

	// copy parameters from plan always
	params := MapStringValueOrNil(ctx, state.TfParameters)
	delete_request.PathParameters = &params
	// add last parameter as ObjectID
	(*delete_request.PathParameters)["prefix_id"] = &tokens[0]
	// add other parameters by splitting on `=`
	for _, token := range tokens[1:] {
		param := strings.Split(token, "=")
		(*delete_request.PathParameters)[param[0]] = &param[1]
	}

	// Client that will perform the request.
	svc := sdwan_client.NewClient(r.client)

	// Perform the operation.
	svc.ExecuteSdwanRequest(ctx, delete_request)
	if delete_request.ResponseErr != nil {
		if !IsObjectNotFound(*delete_request.ResponseErr) {
			resp.Diagnostics.AddError("error deleting prismasdwan_sites_prioritypolicylocalprefixes", (*delete_request.ResponseErr).Error())
			return false
		}
	}
	return true
}

// Performs the Create(POST) Operation on the Resource
// TfID is pulled from plan to use in the creation request
// Path Parameters are encoded into TfID itself
func (r *sitesPrioritypolicylocalprefixesResource) Create(ctx context.Context, req resource.CreateRequest, resp *resource.CreateResponse) {
	tflog.Info(ctx, "executing resource create for prismasdwan_sites_prioritypolicylocalprefixes")
	var plan rsModelSitePriorityPrefixAssociationV2N1
	resp.Diagnostics.Append(req.Plan.Get(ctx, &plan)...)
	if resp.Diagnostics.HasError() {
		return
	}

	// make post call
	var state rsModelSitePriorityPrefixAssociationV2N1
	if r.doPost(ctx, &plan, &state, resp) {
		resp.Diagnostics.Append(resp.State.Set(ctx, &state)...)
	}
}

// Performs the Read(GET) Operation on the Resource
// TfID is pulled from state to use in the read request
// Path Parameters are extracted TfID itself
func (r *sitesPrioritypolicylocalprefixesResource) Read(ctx context.Context, req resource.ReadRequest, resp *resource.ReadResponse) {

	tflog.Info(ctx, "executing resource read for prismasdwan_sites_prioritypolicylocalprefixes")
	var savestate, state rsModelSitePriorityPrefixAssociationV2N1
	resp.Diagnostics.Append(req.State.Get(ctx, &savestate)...)
	if resp.Diagnostics.HasError() {
		return
	}

	// make a get call
	if r.doGet(ctx, &state, &savestate, &resp.State, resp) {
		resp.Diagnostics.Append(resp.State.Set(ctx, &state)...)
	}
}

// Performs the Update(PUT) Operation on the Resource
// TfID is pulled from state to use in the read request
// Path Parameters are extracted TfID itself
// TfID must match in state and plan, else error is thrown
func (r *sitesPrioritypolicylocalprefixesResource) Update(ctx context.Context, req resource.UpdateRequest, resp *resource.UpdateResponse) {

	tflog.Info(ctx, "executing resource update for prismasdwan_sites_prioritypolicylocalprefixes")
	var plan, state rsModelSitePriorityPrefixAssociationV2N1
	// copy state from TF
	resp.Diagnostics.Append(req.State.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}
	// copy plan from TF
	resp.Diagnostics.Append(req.Plan.Get(ctx, &plan)...)
	if resp.Diagnostics.HasError() {
		return
	}

	// make a put call
	if r.doPut(ctx, &plan, &state, &resp.State, resp) {
		resp.Diagnostics.Append(resp.State.Set(ctx, &state)...)
	}
}

// Performs the Delete Operation on the Resource
// TfID is pulled from state to use in the deletion request
// Path Parameters are extracted from the TfID itself
func (r *sitesPrioritypolicylocalprefixesResource) Delete(ctx context.Context, req resource.DeleteRequest, resp *resource.DeleteResponse) {

	tflog.Info(ctx, "executing resource delete for prismasdwan_sites_prioritypolicylocalprefixes")
	var state rsModelSitePriorityPrefixAssociationV2N1
	// copy state from TF
	resp.Diagnostics.Append(req.State.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}

	// make a delete call
	if r.doDelete(ctx, &state, resp) {
		resp.State.RemoveResource(ctx)
	}
}

func (r *sitesPrioritypolicylocalprefixesResource) ImportState(ctx context.Context, req resource.ImportStateRequest, resp *resource.ImportStateResponse) {
	resource.ImportStatePassthroughID(ctx, path.Root("tfid"), req, resp)
}
