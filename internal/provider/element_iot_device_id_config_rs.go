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
// | Computed Resource Name=sites_elements_deviceidconfigs
// +-----------------------------------------------------------------
// | DeviceIdElementConfigScreen HasID=true
// +-----------------------------------------------------------------

// Resource.
var (
	_ resource.Resource                = &elementIotDeviceIdConfigResource{}
	_ resource.ResourceWithConfigure   = &elementIotDeviceIdConfigResource{}
	_ resource.ResourceWithImportState = &elementIotDeviceIdConfigResource{}
)

// To enable this data source for TF Provider, go to `provider.go` and inject this into the function
// as below:
//
//	func (p *SdwanProvider) Resources(_ context.Context) []func() resource.Resource {
//	  	return []func() resource.Resource{
//	     ... <other existing resources>
//	     NewElementIotDeviceIdConfigResource,
//	     // -- append next resource above -- //
//	     }
//	  }
func NewElementIotDeviceIdConfigResource() resource.Resource {
	return &elementIotDeviceIdConfigResource{}
}

type elementIotDeviceIdConfigResource struct {
	client *sdwan.Client
}

// Metadata returns the data source type name.
func (r *elementIotDeviceIdConfigResource) Metadata(_ context.Context, req resource.MetadataRequest, resp *resource.MetadataResponse) {
	resp.TypeName = "prismasdwan_element_iot_device_id_config"
}

// Schema defines the schema for this data source.
func (r *elementIotDeviceIdConfigResource) Schema(_ context.Context, _ resource.SchemaRequest, resp *resource.SchemaResponse) {
	resp.Schema = rsschema.Schema{
		Description: "Retrieves a config item.",
		Attributes: map[string]rsschema.Attribute{
			"tfid": rsschema.StringAttribute{
				Computed: true,
				PlanModifiers: []planmodifier.String{
					stringplanmodifier.UseStateForUnknown(),
				},
			},
			// rest all properties to be read from GET API Schema schema=DeviceIdElementConfigScreen
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
			// property: name=snmp_discovery_source_interface_id, type=STRING macro=rss_schema
			"snmp_discovery_source_interface_id": rsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=snmp_discovery_source_interface_id, type=STRING macro=rss_schema
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
func (r *elementIotDeviceIdConfigResource) Configure(_ context.Context, req resource.ConfigureRequest, resp *resource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}
	r.client = req.ProviderData.(*sdwan.Client)
}

// in some apis the status code is not consistent and hence we may have to act upon
// specific error codes instead
func (r *elementIotDeviceIdConfigResource) GetHttpStatusCode(request *sdwan_client.SdwanClientRequestResponse) int {
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

func (r *elementIotDeviceIdConfigResource) doPost(ctx context.Context, plan *rsModelDeviceIdElementConfigScreen, state *rsModelDeviceIdElementConfigScreen, resp *resource.CreateResponse) bool {
	tflog.Info(ctx, "executing http post for prismasdwan_element_iot_device_id_config")
	// Basic logging.
	tflog.Info(ctx, "performing resource create", map[string]any{
		"resource_name":               "prismasdwan_element_iot_device_id_config",
		"terraform_provider_function": "Create",
	})

	// Prepare input for the API endpoint.
	create_request := &sdwan_client.SdwanClientRequestResponse{}
	create_request.Method = "POST"
	create_request.Path = "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/deviceidconfigs"

	// copy parameters from plan always
	params := MapStringValueOrNil(ctx, plan.TfParameters)
	create_request.PathParameters = &params

	// Client that will perform the request.
	svc := sdwan_client.NewClient(r.client)

	// prepare request from state
	var body = &sdwan_schema.DeviceIdElementConfigScreen{}

	// copy from plan to body
	// copy_from_plan: body=body prefix=rsModel plan=plan properties=7
	// property: name=_etag, type=INTEGER macro=copy_from_plan
	body.Etag = Int64ValueOrNil(plan.Etag)
	// property: name=_schema, type=INTEGER macro=copy_from_plan
	body.Schema = Int64ValueOrNil(plan.Schema)
	// property: name=description, type=STRING macro=copy_from_plan
	body.Description = StringValueOrNil(plan.Description)
	// property: name=id, type=STRING macro=copy_from_plan
	body.Id = StringValueOrNil(plan.Id)
	// property: name=name, type=STRING macro=copy_from_plan
	body.Name = StringValueOrNil(plan.Name)
	// property: name=snmp_discovery_source_interface_id, type=STRING macro=copy_from_plan
	body.SnmpDiscoverySourceInterfaceId = StringValueOrNil(plan.SnmpDiscoverySourceInterfaceId)
	// property: name=tags, type=SET_PRIMITIVE macro=copy_from_plan
	body.Tags = SetStringValueOrNil(ctx, plan.Tags)

	// convert body to map
	json_body, err := json.Marshal(body)
	if err != nil {
		resp.Diagnostics.AddError("error marshaling struct DeviceIdElementConfigScreen to JSON:", err.Error())
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
		tflog.Info(ctx, "create request failed for prismasdwan_element_iot_device_id_config", map[string]any{
			"terraform_provider_function": "Create",
			"resource_name":               "prismasdwan_element_iot_device_id_config",
			"path":                        create_request.FinalPath,
		})
		tflog.Debug(ctx, "create request failed for prismasdwan_element_iot_device_id_config", map[string]any{
			"terraform_provider_function": "Create",
			"resource_name":               "prismasdwan_element_iot_device_id_config",
			"path":                        create_request.FinalPath,
			"request":                     create_request.ToString(),
		})
		resp.Diagnostics.AddError("error creating prismasdwan_element_iot_device_id_config", (*create_request.ResponseErr).Error())
		return false
	}

	// process http json path
	response_body_string := string(*create_request.ResponseBytes)
	// inject overrides
	response_body_string, _ = sjson.Delete(response_body_string, "_created_on_utc")
	response_body_string, _ = sjson.Set(response_body_string, "_schema", 0)

	// start copying attributes
	var ans sdwan_schema.DeviceIdElementConfigScreen
	// copy from json response
	json_err := json.Unmarshal([]byte(response_body_string), &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to DeviceIdElementConfigScreen in create", json_err.Error())
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
	tflog.Info(ctx, "created prismasdwan_element_iot_device_id_config with ID", map[string]any{"tfid": state.Tfid.ValueString()})

	// Store the answer to state. schema=DeviceIdElementConfigScreen
	// copy_to_state: state=state prefix=rsModel ans=ans properties=7
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
	// property: name=snmp_discovery_source_interface_id, type=STRING macro=copy_to_state
	state.SnmpDiscoverySourceInterfaceId = types.StringPointerValue(ans.SnmpDiscoverySourceInterfaceId)
	// property: name=tags, type=SET_PRIMITIVE macro=copy_to_state
	varTags, errTags := types.SetValueFrom(ctx, types.StringType, ans.Tags)
	state.Tags = varTags
	resp.Diagnostics.Append(errTags.Errors()...)
	return true
}

func (r *elementIotDeviceIdConfigResource) doGet(ctx context.Context, state *rsModelDeviceIdElementConfigScreen, savestate *rsModelDeviceIdElementConfigScreen, State *tfsdk.State, resp *resource.ReadResponse) bool {
	// Basic logging.
	tfid := savestate.Tfid.ValueString()
	tflog.Info(ctx, "performing resource read", map[string]any{
		"terraform_provider_function": "Read",
		"resource_name":               "prismasdwan_element_iot_device_id_config",
		"tfid":                        tfid,
	})

	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 3 {
		resp.Diagnostics.AddError("error in prismasdwan_element_iot_device_id_config ID format", "Expected 3 tokens")
		return false
	}

	// Prepare to read the config.
	svc := sdwan_client.NewClient(r.client)

	// Prepare input for the API endpoint.
	read_request := &sdwan_client.SdwanClientRequestResponse{}
	read_request.Method = "GET"
	read_request.Path = "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/deviceidconfigs/{config_id}"

	// copy parameters from plan always
	params := MapStringValueOrNil(ctx, savestate.TfParameters)
	read_request.PathParameters = &params
	// add last parameter as ObjectID
	(*read_request.PathParameters)["config_id"] = &tokens[0]
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
			tflog.Info(ctx, "read request failed for prismasdwan_element_iot_device_id_config", map[string]any{
				"terraform_provider_function": "Read",
				"resource_name":               "prismasdwan_element_iot_device_id_config",
				"path":                        read_request.FinalPath,
				"request":                     read_request.ToString(),
			})
			resp.Diagnostics.AddError("error reading prismasdwan_element_iot_device_id_config from sdwan servers", (*read_request.ResponseErr).Error())
		}
		return false
	}

	// process http json path
	response_body_string := string(*read_request.ResponseBytes)
	// inject overrides
	response_body_string, _ = sjson.Delete(response_body_string, "_created_on_utc")
	response_body_string, _ = sjson.Set(response_body_string, "_schema", 0)

	// Store the answer to state. schema=DeviceIdElementConfigScreen
	state.Tfid = savestate.Tfid
	// copy parameters from savestate as they are
	if savestate.TfParameters.IsNull() {
		state.TfParameters = types.MapNull(types.StringType)
	} else {
		state.TfParameters = savestate.TfParameters
	}
	// start copying attributes
	var ans sdwan_schema.DeviceIdElementConfigScreen
	// copy from json response
	json_err := json.Unmarshal([]byte(response_body_string), &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to DeviceIdElementConfigScreen in read", json_err.Error())
		return false
	}
	// lets copy all items into state
	// copy_to_state: state=state prefix=rsModel ans=ans properties=7
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
	// property: name=snmp_discovery_source_interface_id, type=STRING macro=copy_to_state
	state.SnmpDiscoverySourceInterfaceId = types.StringPointerValue(ans.SnmpDiscoverySourceInterfaceId)
	// property: name=tags, type=SET_PRIMITIVE macro=copy_to_state
	varTags, errTags := types.SetValueFrom(ctx, types.StringType, ans.Tags)
	state.Tags = varTags
	resp.Diagnostics.Append(errTags.Errors()...)
	return true
}

func (r *elementIotDeviceIdConfigResource) doPut(ctx context.Context, plan *rsModelDeviceIdElementConfigScreen, state *rsModelDeviceIdElementConfigScreen, State *tfsdk.State, resp *resource.UpdateResponse) bool {
	state_tfid := state.Tfid.ValueString()
	plan_tfid := plan.Tfid.ValueString()
	// Basic logging.
	tflog.Info(ctx, "performing resource update", map[string]any{
		"terraform_provider_function": "Update",
		"resource_name":               "prismasdwan_element_iot_device_id_config",
		"state_tfid":                  state_tfid,
		"plan_tfid":                   plan_tfid,
	})

	// both TFID must be SAME!!!
	if state_tfid != plan_tfid {
		resp.Diagnostics.AddError("error updating prismasdwan_element_iot_device_id_config", "state and plan TFID do not match")
		return false
	}

	// split tokens
	tokens := strings.Split(state_tfid, IdSeparator)
	if len(tokens) != 3 {
		resp.Diagnostics.AddError("error in prismasdwan_element_iot_device_id_config ID format", "Expected 3 tokens")
		return false
	}

	// Prepare input for the API endpoint.
	put_request := &sdwan_client.SdwanClientRequestResponse{}
	put_request.Method = "PUT"
	put_request.Path = "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/deviceidconfigs/{deviceid_config_id}"

	// copy parameters from plan always
	params := MapStringValueOrNil(ctx, state.TfParameters)
	put_request.PathParameters = &params
	// add last parameter as ObjectID
	(*put_request.PathParameters)["deviceid_config_id"] = &tokens[0]
	// add other parameters by splitting on `=`
	for _, token := range tokens[1:] {
		param := strings.Split(token, "=")
		(*put_request.PathParameters)[param[0]] = &param[1]
	}

	// Client that will perform the request.
	svc := sdwan_client.NewClient(r.client)

	// prepare request from state
	var body = &sdwan_schema.DeviceIdElementConfigScreen{}

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
	// property: name=snmp_discovery_source_interface_id, type=STRING macro=copy_from_plan_or_state
	if state != nil {
		body.SnmpDiscoverySourceInterfaceId = ValueStringPointerFromPlanOrState(plan.SnmpDiscoverySourceInterfaceId, state.SnmpDiscoverySourceInterfaceId)
	} else {
		body.SnmpDiscoverySourceInterfaceId = StringValueOrNil(plan.SnmpDiscoverySourceInterfaceId)
	}
	// property: name=tags, type=SET_PRIMITIVE macro=copy_from_plan_or_state
	body.Tags = SetStringValueOrNil(ctx, plan.Tags)

	// convert body to map
	json_body, err := json.Marshal(body)
	if err != nil {
		resp.Diagnostics.AddError("error marshaling struct DeviceIdElementConfigScreen to JSON:", err.Error())
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
			tflog.Info(ctx, "update request failed for prismasdwan_element_iot_device_id_config", map[string]any{
				"terraform_provider_function": "Update",
				"resource_name":               "prismasdwan_element_iot_device_id_config",
				"path":                        put_request.FinalPath,
			})
			tflog.Debug(ctx, "update request failed for prismasdwan_element_iot_device_id_config", map[string]any{
				"terraform_provider_function": "Update",
				"resource_name":               "prismasdwan_element_iot_device_id_config",
				"path":                        put_request.FinalPath,
				"request":                     put_request.ToString(),
			})
			resp.Diagnostics.AddError("error updating prismasdwan_element_iot_device_id_config", (*put_request.ResponseErr).Error())
		}
		return false
	}

	// process http json path
	response_body_string := string(*put_request.ResponseBytes)
	// inject overrides
	response_body_string, _ = sjson.Delete(response_body_string, "_created_on_utc")
	response_body_string, _ = sjson.Set(response_body_string, "_schema", 0)

	// start copying attributes
	var ans sdwan_schema.DeviceIdElementConfigScreen
	// copy from json response
	json_err := json.Unmarshal([]byte(response_body_string), &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to DeviceIdElementConfigScreen in update", json_err.Error())
		return false
	}

	// Store the answer to state. schema=DeviceIdElementConfigScreen
	// copy_to_state: state=state prefix=rsModel ans=ans properties=7
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
	// property: name=snmp_discovery_source_interface_id, type=STRING macro=copy_to_state
	state.SnmpDiscoverySourceInterfaceId = types.StringPointerValue(ans.SnmpDiscoverySourceInterfaceId)
	// property: name=tags, type=SET_PRIMITIVE macro=copy_to_state
	varTags, errTags := types.SetValueFrom(ctx, types.StringType, ans.Tags)
	state.Tags = varTags
	resp.Diagnostics.Append(errTags.Errors()...)
	return true
}

func (r *elementIotDeviceIdConfigResource) doDelete(ctx context.Context, state *rsModelDeviceIdElementConfigScreen, resp *resource.DeleteResponse) bool {
	// read object id
	tfid := state.Tfid.ValueString()
	// Basic logging.
	tflog.Info(ctx, "performing resource delete", map[string]any{
		"terraform_provider_function": "Delete",
		"resource_name":               "prismasdwan_element_iot_device_id_config",
		"locMap":                      map[string]int{"prefix_id": 0},
	})

	// tokens must match
	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 3 {
		resp.Diagnostics.AddError("error in prismasdwan_element_iot_device_id_config ID format", "Expected 3 tokens")
		return false
	}

	// Prepare input for the API endpoint.
	delete_request := &sdwan_client.SdwanClientRequestResponse{}
	delete_request.Method = "DELETE"
	delete_request.Path = "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/deviceidconfigs/{deviceid_config_id}"

	// copy parameters from plan always
	params := MapStringValueOrNil(ctx, state.TfParameters)
	delete_request.PathParameters = &params
	// add last parameter as ObjectID
	(*delete_request.PathParameters)["deviceid_config_id"] = &tokens[0]
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
			resp.Diagnostics.AddError("error deleting prismasdwan_element_iot_device_id_config", (*delete_request.ResponseErr).Error())
			return false
		}
	}
	return true
}

// Performs the Create(POST) Operation on the Resource
// TfID is pulled from plan to use in the creation request
// Path Parameters are encoded into TfID itself
func (r *elementIotDeviceIdConfigResource) Create(ctx context.Context, req resource.CreateRequest, resp *resource.CreateResponse) {
	tflog.Info(ctx, "executing resource create for prismasdwan_element_iot_device_id_config")
	var plan rsModelDeviceIdElementConfigScreen
	resp.Diagnostics.Append(req.Plan.Get(ctx, &plan)...)
	if resp.Diagnostics.HasError() {
		return
	}

	// make post call
	var state rsModelDeviceIdElementConfigScreen
	if r.doPost(ctx, &plan, &state, resp) {
		resp.Diagnostics.Append(resp.State.Set(ctx, &state)...)
	}
}

// Performs the Read(GET) Operation on the Resource
// TfID is pulled from state to use in the read request
// Path Parameters are extracted TfID itself
func (r *elementIotDeviceIdConfigResource) Read(ctx context.Context, req resource.ReadRequest, resp *resource.ReadResponse) {

	tflog.Info(ctx, "executing resource read for prismasdwan_element_iot_device_id_config")
	var savestate, state rsModelDeviceIdElementConfigScreen
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
func (r *elementIotDeviceIdConfigResource) Update(ctx context.Context, req resource.UpdateRequest, resp *resource.UpdateResponse) {

	tflog.Info(ctx, "executing resource update for prismasdwan_element_iot_device_id_config")
	var plan, state rsModelDeviceIdElementConfigScreen
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
func (r *elementIotDeviceIdConfigResource) Delete(ctx context.Context, req resource.DeleteRequest, resp *resource.DeleteResponse) {

	tflog.Info(ctx, "executing resource delete for prismasdwan_element_iot_device_id_config")
	var state rsModelDeviceIdElementConfigScreen
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

func (r *elementIotDeviceIdConfigResource) ImportState(ctx context.Context, req resource.ImportStateRequest, resp *resource.ImportStateResponse) {
	resource.ImportStatePassthroughID(ctx, path.Root("tfid"), req, resp)
}
