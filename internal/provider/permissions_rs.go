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
// | Computed Resource Name=permissions
// +-----------------------------------------------------------------
// | CustomPermission HasID=true
// +-----------------------------------------------------------------

// Resource.
var (
	_ resource.Resource                = &permissionsResource{}
	_ resource.ResourceWithConfigure   = &permissionsResource{}
	_ resource.ResourceWithImportState = &permissionsResource{}
)

// To enable this data source for TF Provider, go to `provider.go` and inject this into the function
// as below:
//
//	func (p *SdwanProvider) Resources(_ context.Context) []func() resource.Resource {
//	  	return []func() resource.Resource{
//	     ... <other existing resources>
//	     NewPermissionsResource,
//	     // -- append next resource above -- //
//	     }
//	  }
func NewPermissionsResource() resource.Resource {
	return &permissionsResource{}
}

type permissionsResource struct {
	client *sdwan.Client
}

// Metadata returns the data source type name.
func (r *permissionsResource) Metadata(_ context.Context, req resource.MetadataRequest, resp *resource.MetadataResponse) {
	resp.TypeName = "prismasdwan_permissions"
}

// Schema defines the schema for this data source.
func (r *permissionsResource) Schema(_ context.Context, _ resource.SchemaRequest, resp *resource.SchemaResponse) {
	resp.Schema = rsschema.Schema{
		Description: "Retrieves a config item.",
		Attributes: map[string]rsschema.Attribute{
			"tfid": rsschema.StringAttribute{
				Computed: true,
				PlanModifiers: []planmodifier.String{
					stringplanmodifier.UseStateForUnknown(),
				},
			},
			// rest all properties to be read from GET API Schema schema=CustomPermission
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
			// property: name=allowed_after_ms, type=INTEGER macro=rss_schema
			"allowed_after_ms": rsschema.Int64Attribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=allowed_after_ms, type=INTEGER macro=rss_schema
			// property: name=allowed_before_ms, type=INTEGER macro=rss_schema
			"allowed_before_ms": rsschema.Int64Attribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=allowed_before_ms, type=INTEGER macro=rss_schema
			// property: name=disabled, type=BOOLEAN macro=rss_schema
			"disabled": rsschema.BoolAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=disabled, type=BOOLEAN macro=rss_schema
			// property: name=disabled_reason, type=STRING macro=rss_schema
			"disabled_reason": rsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=disabled_reason, type=STRING macro=rss_schema
			// property: name=disallow_permission, type=BOOLEAN macro=rss_schema
			"disallow_permission": rsschema.BoolAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=disallow_permission, type=BOOLEAN macro=rss_schema
			// property: name=id, type=STRING macro=rss_schema
			"id": rsschema.StringAttribute{
				Required:  false,
				Computed:  true,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=id, type=STRING macro=rss_schema
			// property: name=inactive, type=BOOLEAN macro=rss_schema
			"inactive": rsschema.BoolAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=inactive, type=BOOLEAN macro=rss_schema
			// property: name=inactive_reason, type=STRING macro=rss_schema
			"inactive_reason": rsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=inactive_reason, type=STRING macro=rss_schema
			// property: name=region, type=STRING macro=rss_schema
			"region": rsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=region, type=STRING macro=rss_schema
			// property: name=value, type=STRING macro=rss_schema
			"value": rsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=value, type=STRING macro=rss_schema
		},
	}
}

// Configure prepares the struct.
func (r *permissionsResource) Configure(_ context.Context, req resource.ConfigureRequest, resp *resource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}
	r.client = req.ProviderData.(*sdwan.Client)
}

// in some apis the status code is not consistent and hence we may have to act upon
// specific error codes instead
func (r *permissionsResource) GetHttpStatusCode(request *sdwan_client.SdwanClientRequestResponse) int {
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

func (r *permissionsResource) doGet(ctx context.Context, state *rsModelCustomPermission, savestate *rsModelCustomPermission, State *tfsdk.State, resp *resource.ReadResponse) bool {
	// Basic logging.
	tfid := savestate.Tfid.ValueString()
	tflog.Info(ctx, "performing resource read", map[string]any{
		"terraform_provider_function": "Read",
		"resource_name":               "prismasdwan_permissions",
		"tfid":                        tfid,
	})

	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 1 {
		resp.Diagnostics.AddError("error in prismasdwan_permissions ID format", "Expected 1 tokens")
		return false
	}

	// Prepare to read the config.
	svc := sdwan_client.NewClient(r.client)

	// Prepare input for the API endpoint.
	read_request := &sdwan_client.SdwanClientRequestResponse{}
	read_request.Method = "GET"
	read_request.Path = "/sdwan/v2.0/api/permissions/{permission_id}"

	// copy parameters from plan always
	params := MapStringValueOrNil(ctx, savestate.TfParameters)
	read_request.PathParameters = &params
	// add last parameter as ObjectID
	(*read_request.PathParameters)["permission_id"] = &tokens[0]
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
			tflog.Info(ctx, "read request failed for prismasdwan_permissions", map[string]any{
				"terraform_provider_function": "Read",
				"resource_name":               "prismasdwan_permissions",
				"path":                        read_request.FinalPath,
				"request":                     read_request.ToString(),
			})
			resp.Diagnostics.AddError("error reading prismasdwan_permissions from sdwan servers", (*read_request.ResponseErr).Error())
		}
		return false
	}

	// process http json path
	response_body_string := string(*read_request.ResponseBytes)
	// inject overrides
	response_body_string, _ = sjson.Delete(response_body_string, "_created_on_utc")
	response_body_string, _ = sjson.Set(response_body_string, "_schema", 0)

	// Store the answer to state. schema=CustomPermission
	state.Tfid = savestate.Tfid
	// copy parameters from savestate as they are
	if savestate.TfParameters.IsNull() {
		state.TfParameters = types.MapNull(types.StringType)
	} else {
		state.TfParameters = savestate.TfParameters
	}
	// start copying attributes
	var ans sdwan_schema.CustomPermission
	// copy from json response
	json_err := json.Unmarshal([]byte(response_body_string), &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to CustomPermission in read", json_err.Error())
		return false
	}
	// lets copy all items into state
	// copy_to_state: state=state prefix=rsModel ans=ans properties=12
	// property: name=_etag, type=INTEGER macro=copy_to_state
	state.Etag = types.Int64PointerValue(ans.Etag)
	// property: name=_schema, type=INTEGER macro=copy_to_state
	state.Schema = types.Int64PointerValue(ans.Schema)
	// property: name=allowed_after_ms, type=INTEGER macro=copy_to_state
	state.AllowedAfterMs = types.Int64PointerValue(ans.AllowedAfterMs)
	// property: name=allowed_before_ms, type=INTEGER macro=copy_to_state
	state.AllowedBeforeMs = types.Int64PointerValue(ans.AllowedBeforeMs)
	// property: name=disabled, type=BOOLEAN macro=copy_to_state
	state.Disabled = types.BoolPointerValue(ans.Disabled)
	// property: name=disabled_reason, type=STRING macro=copy_to_state
	state.DisabledReason = types.StringPointerValue(ans.DisabledReason)
	// property: name=disallow_permission, type=BOOLEAN macro=copy_to_state
	state.DisallowPermission = types.BoolPointerValue(ans.DisallowPermission)
	// property: name=id, type=STRING macro=copy_to_state
	state.Id = types.StringPointerValue(ans.Id)
	// property: name=inactive, type=BOOLEAN macro=copy_to_state
	state.Inactive = types.BoolPointerValue(ans.Inactive)
	// property: name=inactive_reason, type=STRING macro=copy_to_state
	state.InactiveReason = types.StringPointerValue(ans.InactiveReason)
	// property: name=region, type=STRING macro=copy_to_state
	state.Region = types.StringPointerValue(ans.Region)
	// property: name=value, type=STRING macro=copy_to_state
	state.Value = types.StringPointerValue(ans.Value)
	return true
}

func (r *permissionsResource) doPut(ctx context.Context, plan *rsModelCustomPermission, state *rsModelCustomPermission, State *tfsdk.State, resp *resource.UpdateResponse) bool {
	state_tfid := state.Tfid.ValueString()
	plan_tfid := plan.Tfid.ValueString()
	// Basic logging.
	tflog.Info(ctx, "performing resource update", map[string]any{
		"terraform_provider_function": "Update",
		"resource_name":               "prismasdwan_permissions",
		"state_tfid":                  state_tfid,
		"plan_tfid":                   plan_tfid,
	})

	// both TFID must be SAME!!!
	if state_tfid != plan_tfid {
		resp.Diagnostics.AddError("error updating prismasdwan_permissions", "state and plan TFID do not match")
		return false
	}

	// split tokens
	tokens := strings.Split(state_tfid, IdSeparator)
	if len(tokens) != 1 {
		resp.Diagnostics.AddError("error in prismasdwan_permissions ID format", "Expected 1 tokens")
		return false
	}

	// Prepare input for the API endpoint.
	put_request := &sdwan_client.SdwanClientRequestResponse{}
	put_request.Method = "PUT"
	put_request.Path = "/sdwan/v2.0/api/permissions/{permission_id}"

	// copy parameters from plan always
	params := MapStringValueOrNil(ctx, state.TfParameters)
	put_request.PathParameters = &params
	// add last parameter as ObjectID
	(*put_request.PathParameters)["permission_id"] = &tokens[0]
	// add other parameters by splitting on `=`
	for _, token := range tokens[1:] {
		param := strings.Split(token, "=")
		(*put_request.PathParameters)[param[0]] = &param[1]
	}

	// Client that will perform the request.
	svc := sdwan_client.NewClient(r.client)

	// prepare request from state
	var body = &sdwan_schema.CustomPermission{}

	// now we create the JSON request from the state/plan created by TF
	// below copy code generated from macro copy_from_plan_or_state
	// copy_from_plan_or_state: body=body prefix=rsModel state=state plan=plan properties=12
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
	// property: name=allowed_after_ms, type=INTEGER macro=copy_from_plan_or_state
	if state != nil {
		body.AllowedAfterMs = ValueInt64PointerFromPlanOrState(plan.AllowedAfterMs, state.AllowedAfterMs)
	} else {
		body.AllowedAfterMs = Int64ValueOrNil(plan.AllowedAfterMs)
	}
	// property: name=allowed_before_ms, type=INTEGER macro=copy_from_plan_or_state
	if state != nil {
		body.AllowedBeforeMs = ValueInt64PointerFromPlanOrState(plan.AllowedBeforeMs, state.AllowedBeforeMs)
	} else {
		body.AllowedBeforeMs = Int64ValueOrNil(plan.AllowedBeforeMs)
	}
	// property: name=disabled, type=BOOLEAN macro=copy_from_plan_or_state
	if state != nil {
		body.Disabled = ValueBoolPointerFromPlanOrState(plan.Disabled, state.Disabled)
	} else {
		body.Disabled = BoolValueOrNil(plan.Disabled)
	}
	// property: name=disabled_reason, type=STRING macro=copy_from_plan_or_state
	if state != nil {
		body.DisabledReason = ValueStringPointerFromPlanOrState(plan.DisabledReason, state.DisabledReason)
	} else {
		body.DisabledReason = StringValueOrNil(plan.DisabledReason)
	}
	// property: name=disallow_permission, type=BOOLEAN macro=copy_from_plan_or_state
	if state != nil {
		body.DisallowPermission = ValueBoolPointerFromPlanOrState(plan.DisallowPermission, state.DisallowPermission)
	} else {
		body.DisallowPermission = BoolValueOrNil(plan.DisallowPermission)
	}
	// property: name=id, type=STRING macro=copy_from_plan_or_state
	if state != nil {
		body.Id = ValueStringPointerFromPlanOrState(plan.Id, state.Id)
	} else {
		body.Id = StringValueOrNil(plan.Id)
	}
	// property: name=inactive, type=BOOLEAN macro=copy_from_plan_or_state
	if state != nil {
		body.Inactive = ValueBoolPointerFromPlanOrState(plan.Inactive, state.Inactive)
	} else {
		body.Inactive = BoolValueOrNil(plan.Inactive)
	}
	// property: name=inactive_reason, type=STRING macro=copy_from_plan_or_state
	if state != nil {
		body.InactiveReason = ValueStringPointerFromPlanOrState(plan.InactiveReason, state.InactiveReason)
	} else {
		body.InactiveReason = StringValueOrNil(plan.InactiveReason)
	}
	// property: name=region, type=STRING macro=copy_from_plan_or_state
	if state != nil {
		body.Region = ValueStringPointerFromPlanOrState(plan.Region, state.Region)
	} else {
		body.Region = StringValueOrNil(plan.Region)
	}
	// property: name=value, type=STRING macro=copy_from_plan_or_state
	if state != nil {
		body.Value = ValueStringPointerFromPlanOrState(plan.Value, state.Value)
	} else {
		body.Value = StringValueOrNil(plan.Value)
	}

	// convert body to map
	json_body, err := json.Marshal(body)
	if err != nil {
		resp.Diagnostics.AddError("error marshaling struct CustomPermission to JSON:", err.Error())
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
			tflog.Info(ctx, "update request failed for prismasdwan_permissions", map[string]any{
				"terraform_provider_function": "Update",
				"resource_name":               "prismasdwan_permissions",
				"path":                        put_request.FinalPath,
			})
			tflog.Debug(ctx, "update request failed for prismasdwan_permissions", map[string]any{
				"terraform_provider_function": "Update",
				"resource_name":               "prismasdwan_permissions",
				"path":                        put_request.FinalPath,
				"request":                     put_request.ToString(),
			})
			resp.Diagnostics.AddError("error updating prismasdwan_permissions", (*put_request.ResponseErr).Error())
		}
		return false
	}

	// process http json path
	response_body_string := string(*put_request.ResponseBytes)
	// inject overrides
	response_body_string, _ = sjson.Delete(response_body_string, "_created_on_utc")
	response_body_string, _ = sjson.Set(response_body_string, "_schema", 0)

	// start copying attributes
	var ans sdwan_schema.CustomPermission
	// copy from json response
	json_err := json.Unmarshal([]byte(response_body_string), &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to CustomPermission in update", json_err.Error())
		return false
	}

	// Store the answer to state. schema=CustomPermission
	// copy_to_state: state=state prefix=rsModel ans=ans properties=12
	// property: name=_etag, type=INTEGER macro=copy_to_state
	state.Etag = types.Int64PointerValue(ans.Etag)
	// property: name=_schema, type=INTEGER macro=copy_to_state
	state.Schema = types.Int64PointerValue(ans.Schema)
	// property: name=allowed_after_ms, type=INTEGER macro=copy_to_state
	state.AllowedAfterMs = types.Int64PointerValue(ans.AllowedAfterMs)
	// property: name=allowed_before_ms, type=INTEGER macro=copy_to_state
	state.AllowedBeforeMs = types.Int64PointerValue(ans.AllowedBeforeMs)
	// property: name=disabled, type=BOOLEAN macro=copy_to_state
	state.Disabled = types.BoolPointerValue(ans.Disabled)
	// property: name=disabled_reason, type=STRING macro=copy_to_state
	state.DisabledReason = types.StringPointerValue(ans.DisabledReason)
	// property: name=disallow_permission, type=BOOLEAN macro=copy_to_state
	state.DisallowPermission = types.BoolPointerValue(ans.DisallowPermission)
	// property: name=id, type=STRING macro=copy_to_state
	state.Id = types.StringPointerValue(ans.Id)
	// property: name=inactive, type=BOOLEAN macro=copy_to_state
	state.Inactive = types.BoolPointerValue(ans.Inactive)
	// property: name=inactive_reason, type=STRING macro=copy_to_state
	state.InactiveReason = types.StringPointerValue(ans.InactiveReason)
	// property: name=region, type=STRING macro=copy_to_state
	state.Region = types.StringPointerValue(ans.Region)
	// property: name=value, type=STRING macro=copy_to_state
	state.Value = types.StringPointerValue(ans.Value)
	return true
}

func (r *permissionsResource) doDelete(ctx context.Context, state *rsModelCustomPermission, resp *resource.DeleteResponse) bool {
	// read object id
	tfid := state.Tfid.ValueString()
	// Basic logging.
	tflog.Info(ctx, "performing resource delete", map[string]any{
		"terraform_provider_function": "Delete",
		"resource_name":               "prismasdwan_permissions",
		"locMap":                      map[string]int{"prefix_id": 0},
	})

	// tokens must match
	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 1 {
		resp.Diagnostics.AddError("error in prismasdwan_permissions ID format", "Expected 1 tokens")
		return false
	}

	// Prepare input for the API endpoint.
	delete_request := &sdwan_client.SdwanClientRequestResponse{}
	delete_request.Method = "DELETE"
	delete_request.Path = "/sdwan/v2.0/api/permissions/{permission_id}"

	// copy parameters from plan always
	params := MapStringValueOrNil(ctx, state.TfParameters)
	delete_request.PathParameters = &params
	// add last parameter as ObjectID
	(*delete_request.PathParameters)["permission_id"] = &tokens[0]
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
			resp.Diagnostics.AddError("error deleting prismasdwan_permissions", (*delete_request.ResponseErr).Error())
			return false
		}
	}
	return true
}

// Performs the Create(POST) Operation on the Resource
// TfID is pulled from plan to use in the creation request
// Path Parameters are encoded into TfID itself
func (r *permissionsResource) Create(ctx context.Context, req resource.CreateRequest, resp *resource.CreateResponse) {
	tflog.Info(ctx, "executing resource create for prismasdwan_permissions")
	var plan rsModelCustomPermission
	resp.Diagnostics.Append(req.Plan.Get(ctx, &plan)...)
	if resp.Diagnostics.HasError() {
		return
	}

	// this resource does not have a POST call defined, assuming that the PUT call is present and GET call is present
	// path=/sdwan/v2.0/api/permissions/{permission_id}

	// state in api servers
	var save rsModelCustomPermission

	// create a new tfid
	var idBuilder strings.Builder
	params := MapStringValueOrNil(ctx, plan.TfParameters)
	// ensure all parameters are written
	permission_id, ok := params["permission_id"]
	if !ok {
		resp.Diagnostics.AddError("could not find permission_id in x_parameters", "missing parameter")
		return
	}
	idBuilder.WriteString(IdSeparator)
	idBuilder.WriteString("permission_id")
	idBuilder.WriteString("=")
	idBuilder.WriteString(*permission_id)
	// both TFID MUST MATCH!
	plan.Tfid = types.StringValue(idBuilder.String())
	save.Tfid = types.StringValue(idBuilder.String())
	// make a get call instead
	gResp := resource.ReadResponse{
		Private:     resp.Private,
		Diagnostics: resp.Diagnostics,
	}
	if r.doGet(ctx, &save, &plan, &resp.State, &gResp) {
		// make a put to override
		uResp := resource.UpdateResponse{
			Private:     resp.Private,
			Diagnostics: resp.Diagnostics,
		}
		if r.doPut(ctx, &plan, &save, &resp.State, &uResp) {
			// push into state
			resp.Diagnostics.Append(resp.State.Set(ctx, &save)...)
		}
	}
}

// Performs the Read(GET) Operation on the Resource
// TfID is pulled from state to use in the read request
// Path Parameters are extracted TfID itself
func (r *permissionsResource) Read(ctx context.Context, req resource.ReadRequest, resp *resource.ReadResponse) {

	tflog.Info(ctx, "executing resource read for prismasdwan_permissions")
	var savestate, state rsModelCustomPermission
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
func (r *permissionsResource) Update(ctx context.Context, req resource.UpdateRequest, resp *resource.UpdateResponse) {

	tflog.Info(ctx, "executing resource update for prismasdwan_permissions")
	var plan, state rsModelCustomPermission
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
func (r *permissionsResource) Delete(ctx context.Context, req resource.DeleteRequest, resp *resource.DeleteResponse) {

	tflog.Info(ctx, "executing resource delete for prismasdwan_permissions")
	var state rsModelCustomPermission
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

func (r *permissionsResource) ImportState(ctx context.Context, req resource.ImportStateRequest, resp *resource.ImportStateResponse) {
	resource.ImportStatePassthroughID(ctx, path.Root("tfid"), req, resp)
}
