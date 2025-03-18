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
// | Computed Resource Name=elements_elementaccessconfigs
// +-----------------------------------------------------------------
// | ElementAccessConfigScreenV2N2 HasID=true
// +-----------------------------------------------------------------

// Resource.
var (
	_ resource.Resource                = &elementToolkitResource{}
	_ resource.ResourceWithConfigure   = &elementToolkitResource{}
	_ resource.ResourceWithImportState = &elementToolkitResource{}
)

// To enable this data source for TF Provider, go to `provider.go` and inject this into the function
// as below:
//
//	func (p *SdwanProvider) Resources(_ context.Context) []func() resource.Resource {
//	  	return []func() resource.Resource{
//	     ... <other existing resources>
//	     NewElementToolkitResource,
//	     // -- append next resource above -- //
//	     }
//	  }
func NewElementToolkitResource() resource.Resource {
	return &elementToolkitResource{}
}

type elementToolkitResource struct {
	client *sdwan.Client
}

// Metadata returns the data source type name.
func (r *elementToolkitResource) Metadata(_ context.Context, req resource.MetadataRequest, resp *resource.MetadataResponse) {
	resp.TypeName = "prismasdwan_element_toolkit"
}

// Schema defines the schema for this data source.
func (r *elementToolkitResource) Schema(_ context.Context, _ resource.SchemaRequest, resp *resource.SchemaResponse) {
	resp.Schema = rsschema.Schema{
		Description: "Retrieves a config item.",
		Attributes: map[string]rsschema.Attribute{
			"tfid": rsschema.StringAttribute{
				Computed: true,
				PlanModifiers: []planmodifier.String{
					stringplanmodifier.UseStateForUnknown(),
				},
			},
			// rest all properties to be read from GET API Schema schema=ElementAccessConfigScreenV2N2
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
			// property: name=account_disable_interval, type=INTEGER macro=rss_schema
			"account_disable_interval": rsschema.Int64Attribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=account_disable_interval, type=INTEGER macro=rss_schema
			// property: name=id, type=STRING macro=rss_schema
			"id": rsschema.StringAttribute{
				Required:  false,
				Computed:  true,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=id, type=STRING macro=rss_schema
			// property: name=inactive_interval, type=INTEGER macro=rss_schema
			"inactive_interval": rsschema.Int64Attribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=inactive_interval, type=INTEGER macro=rss_schema
			// property: name=otpkey_version, type=INTEGER macro=rss_schema
			"otpkey_version": rsschema.Int64Attribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: true,
			},
			// key name holder for attribute: name=otpkey_version, type=INTEGER macro=rss_schema
			"otpkey_version_internal_key_name": rsschema.Int64Attribute{
				Required:  false,
				Computed:  true,
				Optional:  true,
				Sensitive: false,
			},
			// property: name=retry_login_count, type=INTEGER macro=rss_schema
			"retry_login_count": rsschema.Int64Attribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=retry_login_count, type=INTEGER macro=rss_schema
			// property: name=ssh_enabled, type=BOOLEAN macro=rss_schema
			"ssh_enabled": rsschema.BoolAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=ssh_enabled, type=BOOLEAN macro=rss_schema
			// property: name=ssh_outbound_enabled, type=BOOLEAN macro=rss_schema
			"ssh_outbound_enabled": rsschema.BoolAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=ssh_outbound_enabled, type=BOOLEAN macro=rss_schema
		},
	}
}

// Configure prepares the struct.
func (r *elementToolkitResource) Configure(_ context.Context, req resource.ConfigureRequest, resp *resource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}
	r.client = req.ProviderData.(*sdwan.Client)
}

// in some apis the status code is not consistent and hence we may have to act upon
// specific error codes instead
func (r *elementToolkitResource) GetHttpStatusCode(request *sdwan_client.SdwanClientRequestResponse) int {
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

func (r *elementToolkitResource) doGet(ctx context.Context, state *rsModelElementAccessConfigScreenV2N2, savestate *rsModelElementAccessConfigScreenV2N2, State *tfsdk.State, resp *resource.ReadResponse) bool {
	// Basic logging.
	tfid := savestate.Tfid.ValueString()
	tflog.Info(ctx, "performing resource read", map[string]any{
		"terraform_provider_function": "Read",
		"resource_name":               "prismasdwan_element_toolkit",
		"tfid":                        tfid,
	})

	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 1 {
		resp.Diagnostics.AddError("error in prismasdwan_element_toolkit ID format", "Expected 1 tokens")
		return false
	}

	// Prepare to read the config.
	svc := sdwan_client.NewClient(r.client)

	// Prepare input for the API endpoint.
	read_request := &sdwan_client.SdwanClientRequestResponse{}
	read_request.Method = "GET"
	read_request.Path = "/sdwan/v2.2/api/elements/{element_id}/elementaccessconfigs"

	// copy parameters from plan always
	params := MapStringValueOrNil(ctx, savestate.TfParameters)
	read_request.PathParameters = &params
	// add last parameter as ObjectID
	(*read_request.PathParameters)["element_id"] = &tokens[0]
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
			tflog.Info(ctx, "read request failed for prismasdwan_element_toolkit", map[string]any{
				"terraform_provider_function": "Read",
				"resource_name":               "prismasdwan_element_toolkit",
				"path":                        read_request.FinalPath,
				"request":                     read_request.ToString(),
			})
			resp.Diagnostics.AddError("error reading prismasdwan_element_toolkit from sdwan servers", (*read_request.ResponseErr).Error())
		}
		return false
	}

	// process http json path
	response_body_string := string(*read_request.ResponseBytes)
	// inject overrides
	response_body_string, _ = sjson.Delete(response_body_string, "_created_on_utc")
	response_body_string, _ = sjson.Set(response_body_string, "_schema", 0)

	// Store the answer to state. schema=ElementAccessConfigScreenV2N2
	state.Tfid = savestate.Tfid
	// copy parameters from savestate as they are
	if savestate.TfParameters.IsNull() {
		state.TfParameters = types.MapNull(types.StringType)
	} else {
		state.TfParameters = savestate.TfParameters
	}
	// start copying attributes
	var ans sdwan_schema.ElementAccessConfigScreenV2N2
	// copy from json response
	json_err := json.Unmarshal([]byte(response_body_string), &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to ElementAccessConfigScreenV2N2 in read", json_err.Error())
		return false
	}
	// lets copy all items into state
	// copy_to_state: state=state prefix=rsModel ans=ans properties=9
	// property: name=_etag, type=INTEGER macro=copy_to_state
	state.Etag = types.Int64PointerValue(ans.Etag)
	// property: name=_schema, type=INTEGER macro=copy_to_state
	state.Schema = types.Int64PointerValue(ans.Schema)
	// property: name=account_disable_interval, type=INTEGER macro=copy_to_state
	state.AccountDisableInterval = types.Int64PointerValue(ans.AccountDisableInterval)
	// property: name=id, type=STRING macro=copy_to_state
	state.Id = types.StringPointerValue(ans.Id)
	// property: name=inactive_interval, type=INTEGER macro=copy_to_state
	state.InactiveInterval = types.Int64PointerValue(ans.InactiveInterval)
	// property: name=otpkey_version, type=INTEGER macro=copy_to_state
	state.OtpkeyVersion = types.Int64PointerValue(ans.OtpkeyVersion)
	// property: name=retry_login_count, type=INTEGER macro=copy_to_state
	state.RetryLoginCount = types.Int64PointerValue(ans.RetryLoginCount)
	// property: name=ssh_enabled, type=BOOLEAN macro=copy_to_state
	state.SshEnabled = types.BoolPointerValue(ans.SshEnabled)
	// property: name=ssh_outbound_enabled, type=BOOLEAN macro=copy_to_state
	state.SshOutboundEnabled = types.BoolPointerValue(ans.SshOutboundEnabled)
	return true
}

func (r *elementToolkitResource) doPut(ctx context.Context, plan *rsModelElementAccessConfigScreenV2N2, state *rsModelElementAccessConfigScreenV2N2, State *tfsdk.State, resp *resource.UpdateResponse) bool {
	state_tfid := state.Tfid.ValueString()
	plan_tfid := plan.Tfid.ValueString()
	// Basic logging.
	tflog.Info(ctx, "performing resource update", map[string]any{
		"terraform_provider_function": "Update",
		"resource_name":               "prismasdwan_element_toolkit",
		"state_tfid":                  state_tfid,
		"plan_tfid":                   plan_tfid,
	})

	// both TFID must be SAME!!!
	if state_tfid != plan_tfid {
		resp.Diagnostics.AddError("error updating prismasdwan_element_toolkit", "state and plan TFID do not match")
		return false
	}

	// split tokens
	tokens := strings.Split(state_tfid, IdSeparator)
	if len(tokens) != 2 {
		resp.Diagnostics.AddError("error in prismasdwan_element_toolkit ID format", "Expected 2 tokens")
		return false
	}

	// Prepare input for the API endpoint.
	put_request := &sdwan_client.SdwanClientRequestResponse{}
	put_request.Method = "PUT"
	put_request.Path = "/sdwan/v2.2/api/elements/{element_id}/elementaccessconfigs/{element_access_id}"

	// copy parameters from plan always
	params := MapStringValueOrNil(ctx, state.TfParameters)
	put_request.PathParameters = &params
	// add last parameter as ObjectID
	(*put_request.PathParameters)["element_access_id"] = &tokens[0]
	// add other parameters by splitting on `=`
	for _, token := range tokens[1:] {
		param := strings.Split(token, "=")
		(*put_request.PathParameters)[param[0]] = &param[1]
	}

	// Client that will perform the request.
	svc := sdwan_client.NewClient(r.client)

	// prepare request from state
	var body = &sdwan_schema.ElementAccessConfigScreenV2N2{}

	// now we create the JSON request from the state/plan created by TF
	// below copy code generated from macro copy_from_plan_or_state
	// copy_from_plan_or_state: body=body prefix=rsModel state=state plan=plan properties=9
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
	// property: name=account_disable_interval, type=INTEGER macro=copy_from_plan_or_state
	if state != nil {
		body.AccountDisableInterval = ValueInt64PointerFromPlanOrState(plan.AccountDisableInterval, state.AccountDisableInterval)
	} else {
		body.AccountDisableInterval = Int64ValueOrNil(plan.AccountDisableInterval)
	}
	// property: name=id, type=STRING macro=copy_from_plan_or_state
	if state != nil {
		body.Id = ValueStringPointerFromPlanOrState(plan.Id, state.Id)
	} else {
		body.Id = StringValueOrNil(plan.Id)
	}
	// property: name=inactive_interval, type=INTEGER macro=copy_from_plan_or_state
	if state != nil {
		body.InactiveInterval = ValueInt64PointerFromPlanOrState(plan.InactiveInterval, state.InactiveInterval)
	} else {
		body.InactiveInterval = Int64ValueOrNil(plan.InactiveInterval)
	}
	// property: name=otpkey_version, type=INTEGER macro=copy_from_plan_or_state
	if state != nil {
		body.OtpkeyVersion = ValueInt64PointerFromPlanOrState(plan.OtpkeyVersion, state.OtpkeyVersion)
	} else {
		body.OtpkeyVersion = Int64ValueOrNil(plan.OtpkeyVersion)
	}
	// property: name=retry_login_count, type=INTEGER macro=copy_from_plan_or_state
	if state != nil {
		body.RetryLoginCount = ValueInt64PointerFromPlanOrState(plan.RetryLoginCount, state.RetryLoginCount)
	} else {
		body.RetryLoginCount = Int64ValueOrNil(plan.RetryLoginCount)
	}
	// property: name=ssh_enabled, type=BOOLEAN macro=copy_from_plan_or_state
	if state != nil {
		body.SshEnabled = ValueBoolPointerFromPlanOrState(plan.SshEnabled, state.SshEnabled)
	} else {
		body.SshEnabled = BoolValueOrNil(plan.SshEnabled)
	}
	// property: name=ssh_outbound_enabled, type=BOOLEAN macro=copy_from_plan_or_state
	if state != nil {
		body.SshOutboundEnabled = ValueBoolPointerFromPlanOrState(plan.SshOutboundEnabled, state.SshOutboundEnabled)
	} else {
		body.SshOutboundEnabled = BoolValueOrNil(plan.SshOutboundEnabled)
	}

	// convert body to map
	json_body, err := json.Marshal(body)
	if err != nil {
		resp.Diagnostics.AddError("error marshaling struct ElementAccessConfigScreenV2N2 to JSON:", err.Error())
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
			tflog.Info(ctx, "update request failed for prismasdwan_element_toolkit", map[string]any{
				"terraform_provider_function": "Update",
				"resource_name":               "prismasdwan_element_toolkit",
				"path":                        put_request.FinalPath,
			})
			tflog.Debug(ctx, "update request failed for prismasdwan_element_toolkit", map[string]any{
				"terraform_provider_function": "Update",
				"resource_name":               "prismasdwan_element_toolkit",
				"path":                        put_request.FinalPath,
				"request":                     put_request.ToString(),
			})
			resp.Diagnostics.AddError("error updating prismasdwan_element_toolkit", (*put_request.ResponseErr).Error())
		}
		return false
	}

	// process http json path
	response_body_string := string(*put_request.ResponseBytes)
	// inject overrides
	response_body_string, _ = sjson.Delete(response_body_string, "_created_on_utc")
	response_body_string, _ = sjson.Set(response_body_string, "_schema", 0)

	// start copying attributes
	var ans sdwan_schema.ElementAccessConfigScreenV2N2
	// copy from json response
	json_err := json.Unmarshal([]byte(response_body_string), &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to ElementAccessConfigScreenV2N2 in update", json_err.Error())
		return false
	}

	// Store the answer to state. schema=ElementAccessConfigScreenV2N2
	// copy_to_state: state=state prefix=rsModel ans=ans properties=9
	// property: name=_etag, type=INTEGER macro=copy_to_state
	state.Etag = types.Int64PointerValue(ans.Etag)
	// property: name=_schema, type=INTEGER macro=copy_to_state
	state.Schema = types.Int64PointerValue(ans.Schema)
	// property: name=account_disable_interval, type=INTEGER macro=copy_to_state
	state.AccountDisableInterval = types.Int64PointerValue(ans.AccountDisableInterval)
	// property: name=id, type=STRING macro=copy_to_state
	state.Id = types.StringPointerValue(ans.Id)
	// property: name=inactive_interval, type=INTEGER macro=copy_to_state
	state.InactiveInterval = types.Int64PointerValue(ans.InactiveInterval)
	// property: name=otpkey_version, type=INTEGER macro=copy_to_state
	state.OtpkeyVersion = types.Int64PointerValue(ans.OtpkeyVersion)
	// property: name=retry_login_count, type=INTEGER macro=copy_to_state
	state.RetryLoginCount = types.Int64PointerValue(ans.RetryLoginCount)
	// property: name=ssh_enabled, type=BOOLEAN macro=copy_to_state
	state.SshEnabled = types.BoolPointerValue(ans.SshEnabled)
	// property: name=ssh_outbound_enabled, type=BOOLEAN macro=copy_to_state
	state.SshOutboundEnabled = types.BoolPointerValue(ans.SshOutboundEnabled)
	return true
}

// Performs the Create(POST) Operation on the Resource
// TfID is pulled from plan to use in the creation request
// Path Parameters are encoded into TfID itself
func (r *elementToolkitResource) Create(ctx context.Context, req resource.CreateRequest, resp *resource.CreateResponse) {
	tflog.Info(ctx, "executing resource create for prismasdwan_element_toolkit")
	var plan rsModelElementAccessConfigScreenV2N2
	resp.Diagnostics.Append(req.Plan.Get(ctx, &plan)...)
	if resp.Diagnostics.HasError() {
		return
	}

	// this resource does not have a POST call defined, assuming that the PUT call is present and GET call is present
	// path=/sdwan/v2.2/api/elements/{element_id}/elementaccessconfigs/{element_access_id}

	// state in api servers
	var save rsModelElementAccessConfigScreenV2N2

	// create a new tfid
	var idBuilder strings.Builder
	params := MapStringValueOrNil(ctx, plan.TfParameters)
	// ensure all parameters are written
	element_id, ok := params["element_id"]
	if !ok {
		resp.Diagnostics.AddError("could not find element_id in x_parameters", "missing parameter")
		return
	}
	idBuilder.WriteString(IdSeparator)
	idBuilder.WriteString("element_id")
	idBuilder.WriteString("=")
	idBuilder.WriteString(*element_id)
	element_access_id, ok := params["element_access_id"]
	if !ok {
		resp.Diagnostics.AddError("could not find element_access_id in x_parameters", "missing parameter")
		return
	}
	idBuilder.WriteString(IdSeparator)
	idBuilder.WriteString("element_access_id")
	idBuilder.WriteString("=")
	idBuilder.WriteString(*element_access_id)
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
func (r *elementToolkitResource) Read(ctx context.Context, req resource.ReadRequest, resp *resource.ReadResponse) {

	tflog.Info(ctx, "executing resource read for prismasdwan_element_toolkit")
	var savestate, state rsModelElementAccessConfigScreenV2N2
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
func (r *elementToolkitResource) Update(ctx context.Context, req resource.UpdateRequest, resp *resource.UpdateResponse) {

	tflog.Info(ctx, "executing resource update for prismasdwan_element_toolkit")
	var plan, state rsModelElementAccessConfigScreenV2N2
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
func (r *elementToolkitResource) Delete(ctx context.Context, req resource.DeleteRequest, resp *resource.DeleteResponse) {

	tflog.Info(ctx, "executing resource delete for prismasdwan_element_toolkit")
	// some resources are auto deleted
	resp.State.RemoveResource(ctx)
}

func (r *elementToolkitResource) ImportState(ctx context.Context, req resource.ImportStateRequest, resp *resource.ImportStateResponse) {
	resource.ImportStatePassthroughID(ctx, path.Root("tfid"), req, resp)
}
