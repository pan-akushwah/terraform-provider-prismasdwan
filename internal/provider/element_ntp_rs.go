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
// | Schema Map Summary (size=goLangStructMap=2)
// | Computed Resource Name=elements_ntp
// +-----------------------------------------------------------------
// | NTPServer HasID=false
// | ElementNTPV2N1 HasID=true
// +-----------------------------------------------------------------

// Resource.
var (
	_ resource.Resource                = &elementNtpResource{}
	_ resource.ResourceWithConfigure   = &elementNtpResource{}
	_ resource.ResourceWithImportState = &elementNtpResource{}
)

// To enable this data source for TF Provider, go to `provider.go` and inject this into the function
// as below:
//
//	func (p *SdwanProvider) Resources(_ context.Context) []func() resource.Resource {
//	  	return []func() resource.Resource{
//	     ... <other existing resources>
//	     NewElementNtpResource,
//	     // -- append next resource above -- //
//	     }
//	  }
func NewElementNtpResource() resource.Resource {
	return &elementNtpResource{}
}

type elementNtpResource struct {
	client *sdwan.Client
}

// Metadata returns the data source type name.
func (r *elementNtpResource) Metadata(_ context.Context, req resource.MetadataRequest, resp *resource.MetadataResponse) {
	resp.TypeName = "prismasdwan_element_ntp"
}

// Schema defines the schema for this data source.
func (r *elementNtpResource) Schema(_ context.Context, _ resource.SchemaRequest, resp *resource.SchemaResponse) {
	resp.Schema = rsschema.Schema{
		Description: "Retrieves a config item.",
		Attributes: map[string]rsschema.Attribute{
			"tfid": rsschema.StringAttribute{
				Computed: true,
				PlanModifiers: []planmodifier.String{
					stringplanmodifier.UseStateForUnknown(),
				},
			},
			// rest all properties to be read from GET API Schema schema=ElementNTPV2N1
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
			// property: name=description, type=STRING macro=rss_schema
			"description": rsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=description, type=STRING macro=rss_schema
			// property: name=id, type=STRING macro=rss_schema
			"id": rsschema.StringAttribute{
				Required:  false,
				Computed:  true,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=id, type=STRING macro=rss_schema
			// property: name=name, type=STRING macro=rss_schema
			"name": rsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=name, type=STRING macro=rss_schema
			// property: name=ntp_servers, type=ARRAY_REFERENCE macro=rss_schema
			"ntp_servers": rsschema.ListNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				NestedObject: rsschema.NestedAttributeObject{
					Attributes: map[string]rsschema.Attribute{
						// property: name=host, type=STRING macro=rss_schema
						"host": rsschema.StringAttribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=host, type=STRING macro=rss_schema
						// property: name=max_poll, type=INTEGER macro=rss_schema
						"max_poll": rsschema.Int64Attribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=max_poll, type=INTEGER macro=rss_schema
						// property: name=min_poll, type=INTEGER macro=rss_schema
						"min_poll": rsschema.Int64Attribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=min_poll, type=INTEGER macro=rss_schema
						// property: name=version, type=INTEGER macro=rss_schema
						"version": rsschema.Int64Attribute{
							Required:  false,
							Computed:  false,
							Optional:  true,
							Sensitive: false,
						},
						// key name holder for attribute: name=version, type=INTEGER macro=rss_schema
					},
				},
			},
			// key name holder for attribute: name=version, type=INTEGER macro=rss_schema
			// property: name=source_interface_ids, type=ARRAY_PRIMITIVE macro=rss_schema
			"source_interface_ids": rsschema.ListAttribute{
				Required:    false,
				Computed:    false,
				Optional:    true,
				Sensitive:   false,
				ElementType: types.StringType,
			},
			// key name holder for attribute: name=source_interface_ids, type=ARRAY_PRIMITIVE macro=rss_schema
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
func (r *elementNtpResource) Configure(_ context.Context, req resource.ConfigureRequest, resp *resource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}
	r.client = req.ProviderData.(*sdwan.Client)
}

// in some apis the status code is not consistent and hence we may have to act upon
// specific error codes instead
func (r *elementNtpResource) GetHttpStatusCode(request *sdwan_client.SdwanClientRequestResponse) int {
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

func (r *elementNtpResource) doGet(ctx context.Context, state *rsModelElementNTPV2N1, savestate *rsModelElementNTPV2N1, State *tfsdk.State, resp *resource.ReadResponse) bool {
	// Basic logging.
	tfid := savestate.Tfid.ValueString()
	tflog.Info(ctx, "performing resource read", map[string]any{
		"terraform_provider_function": "Read",
		"resource_name":               "prismasdwan_element_ntp",
		"tfid":                        tfid,
	})

	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 2 {
		resp.Diagnostics.AddError("error in prismasdwan_element_ntp ID format", "Expected 2 tokens")
		return false
	}

	// Prepare to read the config.
	svc := sdwan_client.NewClient(r.client)

	// Prepare input for the API endpoint.
	read_request := &sdwan_client.SdwanClientRequestResponse{}
	read_request.ResourceType = "prismasdwan_element_ntp"
	read_request.Method = "GET"
	read_request.Path = "/sdwan/v2.1/api/elements/{element_id}/ntp/{ntp_id}"

	// copy parameters from plan always
	params := MapStringValueOrNil(ctx, savestate.TfParameters)
	read_request.PathParameters = &params
	// add last parameter as ObjectID
	(*read_request.PathParameters)["ntp_id"] = &tokens[0]
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
			tflog.Info(ctx, "read request failed for prismasdwan_element_ntp", map[string]any{
				"terraform_provider_function": "Read",
				"resource_name":               "prismasdwan_element_ntp",
				"path":                        read_request.FinalPath,
				"request":                     read_request.ToString(),
			})
			resp.Diagnostics.AddError("error reading prismasdwan_element_ntp from sdwan servers", (*read_request.ResponseErr).Error())
		}
		return false
	}

	// process http json path
	response_body_string := string(*read_request.ResponseBytes)
	// inject overrides
	response_body_string, _ = sjson.Delete(response_body_string, "_created_on_utc")
	response_body_string, _ = sjson.Set(response_body_string, "_schema", 0)

	// Store the answer to state. schema=ElementNTPV2N1
	state.Tfid = savestate.Tfid
	// copy parameters from savestate as they are
	if savestate.TfParameters.IsNull() {
		state.TfParameters = types.MapNull(types.StringType)
	} else {
		state.TfParameters = savestate.TfParameters
	}
	// start copying attributes
	var ans sdwan_schema.ElementNTPV2N1
	// copy from json response
	json_err := json.Unmarshal([]byte(response_body_string), &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to ElementNTPV2N1 in read", json_err.Error())
		return false
	}
	// lets copy all items into state
	// copy_to_state: state=state prefix=rsModel ans=ans properties=8
	// property: name=_etag, type=INTEGER macro=copy_to_state
	state.Etag = types.Int64PointerValue(ans.Etag)
	// property: name=_schema, type=INTEGER macro=copy_to_state
	state.Schema = types.Int64PointerValue(ans.Schema)
	// property: name=description, type=STRING macro=copy_to_state
	state.Description = types.StringPointerValue(ans.Description)
	// property: name=id, type=STRING macro=copy_to_state
	state.Id = types.StringPointerValue(ans.Id)
	// property: name=name, type=STRING macro=copy_to_state
	state.Name = types.StringPointerValue(ans.Name)
	// property: name=ntp_servers, type=ARRAY_REFERENCE macro=copy_to_state
	if ans.NtpServers == nil {
		state.NtpServers = nil
	} else if len(ans.NtpServers) == 0 {
		state.NtpServers = []rsModelNTPServer{}
	} else {
		state.NtpServers = make([]rsModelNTPServer, 0, len(ans.NtpServers))
		for varLoopNtpServersIndex, varLoopNtpServers := range ans.NtpServers {
			// add a new item
			state.NtpServers = append(state.NtpServers, rsModelNTPServer{})
			// copy_to_state: state=state.NtpServers[varLoopNtpServersIndex] prefix=rsModel ans=varLoopNtpServers properties=4
			// property: name=host, type=STRING macro=copy_to_state
			state.NtpServers[varLoopNtpServersIndex].Host = types.StringPointerValue(varLoopNtpServers.Host)
			// property: name=max_poll, type=INTEGER macro=copy_to_state
			state.NtpServers[varLoopNtpServersIndex].MaxPoll = types.Int64PointerValue(varLoopNtpServers.MaxPoll)
			// property: name=min_poll, type=INTEGER macro=copy_to_state
			state.NtpServers[varLoopNtpServersIndex].MinPoll = types.Int64PointerValue(varLoopNtpServers.MinPoll)
			// property: name=version, type=INTEGER macro=copy_to_state
			state.NtpServers[varLoopNtpServersIndex].Version = types.Int64PointerValue(varLoopNtpServers.Version)
		}
	}
	// property: name=source_interface_ids, type=ARRAY_PRIMITIVE macro=copy_to_state
	varSourceInterfaceIds, errSourceInterfaceIds := types.ListValueFrom(ctx, types.StringType, ans.SourceInterfaceIds)
	state.SourceInterfaceIds = varSourceInterfaceIds
	resp.Diagnostics.Append(errSourceInterfaceIds.Errors()...)
	// property: name=tags, type=SET_PRIMITIVE macro=copy_to_state
	varTags, errTags := types.SetValueFrom(ctx, types.StringType, ans.Tags)
	state.Tags = varTags
	resp.Diagnostics.Append(errTags.Errors()...)
	return true
}

func (r *elementNtpResource) doPut(ctx context.Context, plan *rsModelElementNTPV2N1, state *rsModelElementNTPV2N1, State *tfsdk.State, resp *resource.UpdateResponse) bool {
	state_tfid := state.Tfid.ValueString()
	plan_tfid := plan.Tfid.ValueString()
	// Basic logging.
	tflog.Info(ctx, "performing resource update", map[string]any{
		"terraform_provider_function": "Update",
		"resource_name":               "prismasdwan_element_ntp",
		"state_tfid":                  state_tfid,
		"plan_tfid":                   plan_tfid,
	})

	// both TFID must be SAME!!!
	if state_tfid != plan_tfid {
		resp.Diagnostics.AddError("error updating prismasdwan_element_ntp", "state and plan TFID do not match")
		return false
	}

	// split tokens
	tokens := strings.Split(state_tfid, IdSeparator)
	if len(tokens) != 2 {
		resp.Diagnostics.AddError("error in prismasdwan_element_ntp ID format", "Expected 2 tokens")
		return false
	}

	// Prepare input for the API endpoint.
	put_request := &sdwan_client.SdwanClientRequestResponse{}
	put_request.ResourceType = "prismasdwan_element_ntp"
	put_request.Method = "PUT"
	put_request.Path = "/sdwan/v2.1/api/elements/{element_id}/ntp/{ntp_id}"

	// copy parameters from plan always
	params := MapStringValueOrNil(ctx, state.TfParameters)
	put_request.PathParameters = &params
	// add last parameter as ObjectID
	(*put_request.PathParameters)["ntp_id"] = &tokens[0]
	// add other parameters by splitting on `=`
	for _, token := range tokens[1:] {
		param := strings.Split(token, "=")
		(*put_request.PathParameters)[param[0]] = &param[1]
	}

	// Client that will perform the request.
	svc := sdwan_client.NewClient(r.client)

	// prepare request from state
	var body = &sdwan_schema.ElementNTPV2N1{}

	// now we create the JSON request from the state/plan created by TF
	// below copy code generated from macro copy_from_plan_or_state
	// copy_from_plan_or_state: body=body prefix=rsModel state=state plan=plan properties=8
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
	// property: name=description, type=STRING macro=copy_from_plan_or_state
	if state != nil {
		body.Description = ValueStringPointerFromPlanOrState(plan.Description, state.Description)
	} else {
		body.Description = StringValueOrNil(plan.Description)
	}
	// property: name=id, type=STRING macro=copy_from_plan_or_state
	if state != nil {
		body.Id = ValueStringPointerFromPlanOrState(plan.Id, state.Id)
	} else {
		body.Id = StringValueOrNil(plan.Id)
	}
	// property: name=name, type=STRING macro=copy_from_plan_or_state
	if state != nil {
		body.Name = ValueStringPointerFromPlanOrState(plan.Name, state.Name)
	} else {
		body.Name = StringValueOrNil(plan.Name)
	}
	// property: name=ntp_servers, type=ARRAY_REFERENCE macro=copy_from_plan_or_state
	if plan.NtpServers == nil && (state == nil || state.NtpServers == nil) {
		body.NtpServers = nil
	} else if len(plan.NtpServers) == 0 && (state == nil || len(state.NtpServers) == 0) {
		body.NtpServers = []sdwan_schema.NTPServer{}
	} else if len(plan.NtpServers) != 0 || (state != nil && len(state.NtpServers) != 0) {
		NtpServersToUse := plan.NtpServers
		if len(plan.NtpServers) == 0 {
			NtpServersToUse = state.NtpServers
		}
		body.NtpServers = make([]sdwan_schema.NTPServer, 0, len(NtpServersToUse))
		for varLoopNtpServersIndex, varLoopNtpServers := range NtpServersToUse {
			// add a new item
			body.NtpServers = append(body.NtpServers, sdwan_schema.NTPServer{})
			// since we have chosen to stick with either the plan or state, we need to simply copy child properties
			// copy_from_plan: body=body.NtpServers[varLoopNtpServersIndex] prefix=rsModel plan=varLoopNtpServers properties=4
			// property: name=host, type=STRING macro=copy_from_plan
			body.NtpServers[varLoopNtpServersIndex].Host = StringValueOrNil(varLoopNtpServers.Host)
			// property: name=max_poll, type=INTEGER macro=copy_from_plan
			body.NtpServers[varLoopNtpServersIndex].MaxPoll = Int64ValueOrNil(varLoopNtpServers.MaxPoll)
			// property: name=min_poll, type=INTEGER macro=copy_from_plan
			body.NtpServers[varLoopNtpServersIndex].MinPoll = Int64ValueOrNil(varLoopNtpServers.MinPoll)
			// property: name=version, type=INTEGER macro=copy_from_plan
			body.NtpServers[varLoopNtpServersIndex].Version = Int64ValueOrNil(varLoopNtpServers.Version)
		}
	}
	// property: name=source_interface_ids, type=ARRAY_PRIMITIVE macro=copy_from_plan_or_state
	body.SourceInterfaceIds = ListStringValueOrNil(ctx, plan.SourceInterfaceIds)
	// property: name=tags, type=SET_PRIMITIVE macro=copy_from_plan_or_state
	body.Tags = SetStringValueOrNil(ctx, plan.Tags)

	// convert body to map
	json_body, err := json.Marshal(body)
	if err != nil {
		resp.Diagnostics.AddError("error marshaling struct ElementNTPV2N1 to JSON:", err.Error())
		return false
	}

	// process http json path
	request_body_string := string(json_body)
	// inject overrides
	request_body_string, _ = sjson.Set(request_body_string, "_schema", 1)
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
			tflog.Info(ctx, "update request failed for prismasdwan_element_ntp", map[string]any{
				"terraform_provider_function": "Update",
				"resource_name":               "prismasdwan_element_ntp",
				"path":                        put_request.FinalPath,
			})
			tflog.Debug(ctx, "update request failed for prismasdwan_element_ntp", map[string]any{
				"terraform_provider_function": "Update",
				"resource_name":               "prismasdwan_element_ntp",
				"path":                        put_request.FinalPath,
				"request":                     put_request.ToString(),
			})
			resp.Diagnostics.AddError("error updating prismasdwan_element_ntp", (*put_request.ResponseErr).Error())
		}
		return false
	}

	// process http json path
	response_body_string := string(*put_request.ResponseBytes)
	// inject overrides
	response_body_string, _ = sjson.Delete(response_body_string, "_created_on_utc")
	response_body_string, _ = sjson.Set(response_body_string, "_schema", 0)

	// start copying attributes
	var ans sdwan_schema.ElementNTPV2N1
	// copy from json response
	json_err := json.Unmarshal([]byte(response_body_string), &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to ElementNTPV2N1 in update", json_err.Error())
		return false
	}

	// Store the answer to state. schema=ElementNTPV2N1
	// copy_to_state: state=state prefix=rsModel ans=ans properties=8
	// property: name=_etag, type=INTEGER macro=copy_to_state
	state.Etag = types.Int64PointerValue(ans.Etag)
	// property: name=_schema, type=INTEGER macro=copy_to_state
	state.Schema = types.Int64PointerValue(ans.Schema)
	// property: name=description, type=STRING macro=copy_to_state
	state.Description = types.StringPointerValue(ans.Description)
	// property: name=id, type=STRING macro=copy_to_state
	state.Id = types.StringPointerValue(ans.Id)
	// property: name=name, type=STRING macro=copy_to_state
	state.Name = types.StringPointerValue(ans.Name)
	// property: name=ntp_servers, type=ARRAY_REFERENCE macro=copy_to_state
	if ans.NtpServers == nil {
		state.NtpServers = nil
	} else if len(ans.NtpServers) == 0 {
		state.NtpServers = []rsModelNTPServer{}
	} else {
		state.NtpServers = make([]rsModelNTPServer, 0, len(ans.NtpServers))
		for varLoopNtpServersIndex, varLoopNtpServers := range ans.NtpServers {
			// add a new item
			state.NtpServers = append(state.NtpServers, rsModelNTPServer{})
			// copy_to_state: state=state.NtpServers[varLoopNtpServersIndex] prefix=rsModel ans=varLoopNtpServers properties=4
			// property: name=host, type=STRING macro=copy_to_state
			state.NtpServers[varLoopNtpServersIndex].Host = types.StringPointerValue(varLoopNtpServers.Host)
			// property: name=max_poll, type=INTEGER macro=copy_to_state
			state.NtpServers[varLoopNtpServersIndex].MaxPoll = types.Int64PointerValue(varLoopNtpServers.MaxPoll)
			// property: name=min_poll, type=INTEGER macro=copy_to_state
			state.NtpServers[varLoopNtpServersIndex].MinPoll = types.Int64PointerValue(varLoopNtpServers.MinPoll)
			// property: name=version, type=INTEGER macro=copy_to_state
			state.NtpServers[varLoopNtpServersIndex].Version = types.Int64PointerValue(varLoopNtpServers.Version)
		}
	}
	// property: name=source_interface_ids, type=ARRAY_PRIMITIVE macro=copy_to_state
	varSourceInterfaceIds, errSourceInterfaceIds := types.ListValueFrom(ctx, types.StringType, ans.SourceInterfaceIds)
	state.SourceInterfaceIds = varSourceInterfaceIds
	resp.Diagnostics.Append(errSourceInterfaceIds.Errors()...)
	// property: name=tags, type=SET_PRIMITIVE macro=copy_to_state
	varTags, errTags := types.SetValueFrom(ctx, types.StringType, ans.Tags)
	state.Tags = varTags
	resp.Diagnostics.Append(errTags.Errors()...)
	return true
}

// Performs the Create(POST) Operation on the Resource
// TfID is pulled from plan to use in the creation request
// Path Parameters are encoded into TfID itself
func (r *elementNtpResource) Create(ctx context.Context, req resource.CreateRequest, resp *resource.CreateResponse) {
	tflog.Info(ctx, "executing resource create for prismasdwan_element_ntp")
	var plan rsModelElementNTPV2N1
	resp.Diagnostics.Append(req.Plan.Get(ctx, &plan)...)
	if resp.Diagnostics.HasError() {
		return
	}

	// this resource does not have a POST call defined, assuming that the PUT call is present and GET call is present
	// path=/sdwan/v2.1/api/elements/{element_id}/ntp/{ntp_id}

	// state in api servers
	var save rsModelElementNTPV2N1

	// create a new tfid
	var idBuilder strings.Builder
	params := MapStringValueOrNil(ctx, plan.TfParameters)
	// ensure all parameters are written
	element_id, ok := params["element_id"]
	if !ok {
		resp.Diagnostics.AddError("could not find element_id in x_parameters", "missing parameter")
		return
	}
	idBuilder.WriteString("element_id")
	idBuilder.WriteString("=")
	idBuilder.WriteString(*element_id)
	idBuilder.WriteString(IdSeparator)
	ntp_id, ok := params["ntp_id"]
	if !ok {
		resp.Diagnostics.AddError("could not find ntp_id in x_parameters", "missing parameter")
		return
	}
	idBuilder.WriteString("ntp_id")
	idBuilder.WriteString("=")
	idBuilder.WriteString(*ntp_id)
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
func (r *elementNtpResource) Read(ctx context.Context, req resource.ReadRequest, resp *resource.ReadResponse) {

	tflog.Info(ctx, "executing resource read for prismasdwan_element_ntp")
	var savestate, state rsModelElementNTPV2N1
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
func (r *elementNtpResource) Update(ctx context.Context, req resource.UpdateRequest, resp *resource.UpdateResponse) {

	tflog.Info(ctx, "executing resource update for prismasdwan_element_ntp")
	var plan, state rsModelElementNTPV2N1
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
func (r *elementNtpResource) Delete(ctx context.Context, req resource.DeleteRequest, resp *resource.DeleteResponse) {

	tflog.Info(ctx, "executing resource delete for prismasdwan_element_ntp")
	// some resources are auto deleted
	resp.State.RemoveResource(ctx)
}

func (r *elementNtpResource) ImportState(ctx context.Context, req resource.ImportStateRequest, resp *resource.ImportStateResponse) {
	resource.ImportStatePassthroughID(ctx, path.Root("tfid"), req, resp)
}
