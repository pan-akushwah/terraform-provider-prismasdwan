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
// | Schema Map Summary (size=goLangStructMap=8)
// | Computed Resource Name=perfmgmtthresholdprofiles
// +-----------------------------------------------------------------
// | FlowMetricThresholds HasID=false
// | CircuitUtilizationMetricThresholds HasID=false
// | SystemHealthMetricsThresholds HasID=false
// | SyntheticProbeThreshold HasID=false
// | SyntheticProbeThresholds HasID=false
// | StaticAppMetricConfigV2N1 HasID=false
// | LQMThresholdConfigV2N1 HasID=false
// | PerfMgmtThresholdProfileScreenV2N1 HasID=true
// +-----------------------------------------------------------------

// Data source.
var (
	_ datasource.DataSource              = &performanceProfileDataSource{}
	_ datasource.DataSourceWithConfigure = &performanceProfileDataSource{}
)

// To enable this data source for TF Provider, go to `provider.go` and inject this into the function
// as below:
//
//	func (p *SdwanProvider) DataSources(_ context.Context) []func() datasource.DataSource {
//	  	return []func() datasource.DataSource{
//	     ... <other existing data sources>
//	     NewPerformanceProfileDataSource,
//	     // -- append next datasource above -- //
//	     }
//	  }
func NewPerformanceProfileDataSource() datasource.DataSource {
	return &performanceProfileDataSource{}
}

type performanceProfileDataSource struct {
	client *sdwan.Client
}

// Metadata returns the data source type name.
func (d *performanceProfileDataSource) Metadata(_ context.Context, req datasource.MetadataRequest, resp *datasource.MetadataResponse) {
	resp.TypeName = "prismasdwan_performance_profile"
}

// Schema defines the schema for this data source.
func (d *performanceProfileDataSource) Schema(_ context.Context, _ datasource.SchemaRequest, resp *datasource.SchemaResponse) {
	resp.Schema = dsschema.Schema{
		Description: "Retrieves a config item.",

		Attributes: map[string]dsschema.Attribute{
			"tfid": dsschema.StringAttribute{
				Computed: true,
			},
			// rest all properties to be read from GET API Schema schema=PerfMgmtThresholdProfileScreenV2N1
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
			// property: name=circuit_utilization_metrics_thresholds, type=REFERENCE macro=rss_schema
			"circuit_utilization_metrics_thresholds": dsschema.SingleNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				Attributes: map[string]dsschema.Attribute{
					// property: name=percentage_circuit_utilization, type=INTEGER macro=rss_schema
					"percentage_circuit_utilization": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=percentage_circuit_utilization, type=INTEGER macro=rss_schema
				},
			},
			// key name holder for attribute: name=percentage_circuit_utilization, type=INTEGER macro=rss_schema
			// property: name=description, type=STRING macro=rss_schema
			"description": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=description, type=STRING macro=rss_schema
			// property: name=flow_metrics_thresholds, type=REFERENCE macro=rss_schema
			"flow_metrics_thresholds": dsschema.SingleNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				Attributes: map[string]dsschema.Attribute{
					// property: name=percentage_flow_utilization, type=INTEGER macro=rss_schema
					"percentage_flow_utilization": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=percentage_flow_utilization, type=INTEGER macro=rss_schema
				},
			},
			// key name holder for attribute: name=percentage_flow_utilization, type=INTEGER macro=rss_schema
			// property: name=hard_limit_app_metrics, type=REFERENCE macro=rss_schema
			"hard_limit_app_metrics": dsschema.SingleNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				Attributes: map[string]dsschema.Attribute{
					// property: name=max_init_failure_rate, type=INTEGER macro=rss_schema
					"max_init_failure_rate": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=max_init_failure_rate, type=INTEGER macro=rss_schema
					// property: name=max_rtt, type=INTEGER macro=rss_schema
					"max_rtt": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=max_rtt, type=INTEGER macro=rss_schema
					// property: name=udp_trt, type=INTEGER macro=rss_schema
					"udp_trt": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=udp_trt, type=INTEGER macro=rss_schema
				},
			},
			// key name holder for attribute: name=udp_trt, type=INTEGER macro=rss_schema
			// property: name=id, type=STRING macro=rss_schema
			"id": dsschema.StringAttribute{
				Required:  false,
				Computed:  true,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=id, type=STRING macro=rss_schema
			// property: name=lqm_thresholds, type=REFERENCE macro=rss_schema
			"lqm_thresholds": dsschema.SingleNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				Attributes: map[string]dsschema.Attribute{
					// property: name=max_jitter, type=INTEGER macro=rss_schema
					"max_jitter": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=max_jitter, type=INTEGER macro=rss_schema
					// property: name=max_latency, type=INTEGER macro=rss_schema
					"max_latency": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=max_latency, type=INTEGER macro=rss_schema
					// property: name=max_packet_loss, type=INTEGER macro=rss_schema
					"max_packet_loss": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=max_packet_loss, type=INTEGER macro=rss_schema
					// property: name=min_mos, type=INTEGER macro=rss_schema
					"min_mos": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=min_mos, type=INTEGER macro=rss_schema
				},
			},
			// key name holder for attribute: name=min_mos, type=INTEGER macro=rss_schema
			// property: name=name, type=STRING macro=rss_schema
			"name": dsschema.StringAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
			},
			// key name holder for attribute: name=name, type=STRING macro=rss_schema
			// property: name=soft_limit_app_metrics, type=REFERENCE macro=rss_schema
			"soft_limit_app_metrics": dsschema.SingleNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				Attributes: map[string]dsschema.Attribute{
					// property: name=max_init_failure_rate, type=INTEGER macro=rss_schema
					"max_init_failure_rate": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=max_init_failure_rate, type=INTEGER macro=rss_schema
					// property: name=max_rtt, type=INTEGER macro=rss_schema
					"max_rtt": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=max_rtt, type=INTEGER macro=rss_schema
					// property: name=udp_trt, type=INTEGER macro=rss_schema
					"udp_trt": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=udp_trt, type=INTEGER macro=rss_schema
				},
			},
			// key name holder for attribute: name=udp_trt, type=INTEGER macro=rss_schema
			// property: name=synthetic_probe_thresholds, type=REFERENCE macro=rss_schema
			"synthetic_probe_thresholds": dsschema.SingleNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				Attributes: map[string]dsschema.Attribute{
					// property: name=dns_txn_failure_pct, type=REFERENCE macro=rss_schema
					"dns_txn_failure_pct": dsschema.SingleNestedAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
						Attributes: map[string]dsschema.Attribute{
							// property: name=probe_config_id, type=STRING macro=rss_schema
							"probe_config_id": dsschema.StringAttribute{
								Required:  false,
								Computed:  false,
								Optional:  true,
								Sensitive: false,
							},
							// key name holder for attribute: name=probe_config_id, type=STRING macro=rss_schema
							// property: name=value, type=INTEGER macro=rss_schema
							"value": dsschema.Int64Attribute{
								Required:  false,
								Computed:  false,
								Optional:  true,
								Sensitive: false,
							},
							// key name holder for attribute: name=value, type=INTEGER macro=rss_schema
						},
					},
					// key name holder for attribute: name=value, type=INTEGER macro=rss_schema
					// property: name=init_failure_pct, type=REFERENCE macro=rss_schema
					"init_failure_pct": dsschema.SingleNestedAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
						Attributes: map[string]dsschema.Attribute{
							// property: name=probe_config_id, type=STRING macro=rss_schema
							"probe_config_id": dsschema.StringAttribute{
								Required:  false,
								Computed:  false,
								Optional:  true,
								Sensitive: false,
							},
							// key name holder for attribute: name=probe_config_id, type=STRING macro=rss_schema
							// property: name=value, type=INTEGER macro=rss_schema
							"value": dsschema.Int64Attribute{
								Required:  false,
								Computed:  false,
								Optional:  true,
								Sensitive: false,
							},
							// key name holder for attribute: name=value, type=INTEGER macro=rss_schema
						},
					},
					// key name holder for attribute: name=value, type=INTEGER macro=rss_schema
					// property: name=jitter, type=REFERENCE macro=rss_schema
					"jitter": dsschema.SingleNestedAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
						Attributes: map[string]dsschema.Attribute{
							// property: name=probe_config_id, type=STRING macro=rss_schema
							"probe_config_id": dsschema.StringAttribute{
								Required:  false,
								Computed:  false,
								Optional:  true,
								Sensitive: false,
							},
							// key name holder for attribute: name=probe_config_id, type=STRING macro=rss_schema
							// property: name=value, type=INTEGER macro=rss_schema
							"value": dsschema.Int64Attribute{
								Required:  false,
								Computed:  false,
								Optional:  true,
								Sensitive: false,
							},
							// key name holder for attribute: name=value, type=INTEGER macro=rss_schema
						},
					},
					// key name holder for attribute: name=value, type=INTEGER macro=rss_schema
					// property: name=latency, type=REFERENCE macro=rss_schema
					"latency": dsschema.SingleNestedAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
						Attributes: map[string]dsschema.Attribute{
							// property: name=probe_config_id, type=STRING macro=rss_schema
							"probe_config_id": dsschema.StringAttribute{
								Required:  false,
								Computed:  false,
								Optional:  true,
								Sensitive: false,
							},
							// key name holder for attribute: name=probe_config_id, type=STRING macro=rss_schema
							// property: name=value, type=INTEGER macro=rss_schema
							"value": dsschema.Int64Attribute{
								Required:  false,
								Computed:  false,
								Optional:  true,
								Sensitive: false,
							},
							// key name holder for attribute: name=value, type=INTEGER macro=rss_schema
						},
					},
					// key name holder for attribute: name=value, type=INTEGER macro=rss_schema
					// property: name=packet_loss, type=REFERENCE macro=rss_schema
					"packet_loss": dsschema.SingleNestedAttribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
						Attributes: map[string]dsschema.Attribute{
							// property: name=probe_config_id, type=STRING macro=rss_schema
							"probe_config_id": dsschema.StringAttribute{
								Required:  false,
								Computed:  false,
								Optional:  true,
								Sensitive: false,
							},
							// key name holder for attribute: name=probe_config_id, type=STRING macro=rss_schema
							// property: name=value, type=INTEGER macro=rss_schema
							"value": dsschema.Int64Attribute{
								Required:  false,
								Computed:  false,
								Optional:  true,
								Sensitive: false,
							},
							// key name holder for attribute: name=value, type=INTEGER macro=rss_schema
						},
					},
					// key name holder for attribute: name=value, type=INTEGER macro=rss_schema
				},
			},
			// key name holder for attribute: name=value, type=INTEGER macro=rss_schema
			// property: name=system_health_metrics_thresholds, type=REFERENCE macro=rss_schema
			"system_health_metrics_thresholds": dsschema.SingleNestedAttribute{
				Required:  false,
				Computed:  false,
				Optional:  true,
				Sensitive: false,
				Attributes: map[string]dsschema.Attribute{
					// property: name=cpu_utilization, type=INTEGER macro=rss_schema
					"cpu_utilization": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=cpu_utilization, type=INTEGER macro=rss_schema
					// property: name=disk_utilization, type=INTEGER macro=rss_schema
					"disk_utilization": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=disk_utilization, type=INTEGER macro=rss_schema
					// property: name=memory_utilization, type=INTEGER macro=rss_schema
					"memory_utilization": dsschema.Int64Attribute{
						Required:  false,
						Computed:  false,
						Optional:  true,
						Sensitive: false,
					},
					// key name holder for attribute: name=memory_utilization, type=INTEGER macro=rss_schema
				},
			},
			// key name holder for attribute: name=memory_utilization, type=INTEGER macro=rss_schema
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
	}
}

// Configure prepares the struct.
func (d *performanceProfileDataSource) Configure(_ context.Context, req datasource.ConfigureRequest, resp *datasource.ConfigureResponse) {
	if req.ProviderData == nil {
		return
	}
	d.client = req.ProviderData.(*sdwan.Client)
}

// Read performs Read for the struct.
func (d *performanceProfileDataSource) Read(ctx context.Context, req datasource.ReadRequest, resp *datasource.ReadResponse) {
	var state dsModelPerfMgmtThresholdProfileScreenV2N1
	resp.Diagnostics.Append(req.Config.Get(ctx, &state)...)
	if resp.Diagnostics.HasError() {
		return
	}
	// pointers
	diagnostics := &resp.Diagnostics

	// Basic logging.
	tflog.Info(ctx, "performing datasource read", map[string]any{
		"terraform_provider_function": "Read",
		"resource_name":               "prismasdwan_performance_profile",
	})

	tfid := state.Tfid.ValueString()
	tokens := strings.Split(tfid, IdSeparator)
	if len(tokens) != 1 {
		resp.Diagnostics.AddError("error in prismasdwan_performance_profile ID format", "Expected 1 tokens")
		return
	}

	// Prepare to read the config.
	svc := sdwan_client.NewClient(d.client)

	// Prepare input for the API endpoint.
	read_request := &sdwan_client.SdwanClientRequestResponse{}
	read_request.Method = "GET"
	read_request.Path = "/sdwan/v2.1/api/perfmgmtthresholdprofiles/{profile_id}"

	// handle parameters
	params := make(map[string]*string)
	read_request.PathParameters = &params
	params["profile_id"] = &tokens[0]

	// Perform the operation.
	svc.ExecuteSdwanRequest(ctx, read_request)
	if read_request.ResponseErr != nil {
		if IsObjectNotFound(*read_request.ResponseErr) {
			resp.State.RemoveResource(ctx)
		} else {
			resp.Diagnostics.AddError("error reading prismasdwan_performance_profile", (*read_request.ResponseErr).Error())
		}
		return
	}

	// Create the Terraform ID.
	var idBuilder strings.Builder
	idBuilder.WriteString("x")

	// Store the answer to state.
	state.Tfid = types.StringValue(idBuilder.String())
	// start copying attributes
	var ans sdwan_schema.PerfMgmtThresholdProfileScreenV2N1
	// copy from json response
	json_err := json.Unmarshal(*read_request.ResponseBytes, &ans)
	// if found, exit
	if json_err != nil {
		resp.Diagnostics.AddError("error in json unmarshal to PerfMgmtThresholdProfileScreenV2N1", json_err.Error())
		return
	}

	// lets copy all items into state schema=PerfMgmtThresholdProfileScreenV2N1
	// copy_to_state: state=state prefix=dsModel ans=ans properties=13
	// property: name=_etag, type=INTEGER macro=copy_to_state
	state.Etag = types.Int64PointerValue(ans.Etag)
	// property: name=_schema, type=INTEGER macro=copy_to_state
	state.Schema = types.Int64PointerValue(ans.Schema)
	// property: name=circuit_utilization_metrics_thresholds, type=REFERENCE macro=copy_to_state
	if ans.CircuitUtilizationMetricsThresholds == nil {
		state.CircuitUtilizationMetricsThresholds = nil
	} else {
		state.CircuitUtilizationMetricsThresholds = &dsModelCircuitUtilizationMetricThresholds{}
		// copy_to_state: state=state.CircuitUtilizationMetricsThresholds prefix=dsModel ans=ans.CircuitUtilizationMetricsThresholds properties=1
		// property: name=percentage_circuit_utilization, type=INTEGER macro=copy_to_state
		state.CircuitUtilizationMetricsThresholds.PercentageCircuitUtilization = types.Int64PointerValue(ans.CircuitUtilizationMetricsThresholds.PercentageCircuitUtilization)
	}
	// property: name=description, type=STRING macro=copy_to_state
	state.Description = types.StringPointerValue(ans.Description)
	// property: name=flow_metrics_thresholds, type=REFERENCE macro=copy_to_state
	if ans.FlowMetricsThresholds == nil {
		state.FlowMetricsThresholds = nil
	} else {
		state.FlowMetricsThresholds = &dsModelFlowMetricThresholds{}
		// copy_to_state: state=state.FlowMetricsThresholds prefix=dsModel ans=ans.FlowMetricsThresholds properties=1
		// property: name=percentage_flow_utilization, type=INTEGER macro=copy_to_state
		state.FlowMetricsThresholds.PercentageFlowUtilization = types.Int64PointerValue(ans.FlowMetricsThresholds.PercentageFlowUtilization)
	}
	// property: name=hard_limit_app_metrics, type=REFERENCE macro=copy_to_state
	if ans.HardLimitAppMetrics == nil {
		state.HardLimitAppMetrics = nil
	} else {
		state.HardLimitAppMetrics = &dsModelStaticAppMetricConfigV2N1{}
		// copy_to_state: state=state.HardLimitAppMetrics prefix=dsModel ans=ans.HardLimitAppMetrics properties=3
		// property: name=max_init_failure_rate, type=INTEGER macro=copy_to_state
		state.HardLimitAppMetrics.MaxInitFailureRate = types.Int64PointerValue(ans.HardLimitAppMetrics.MaxInitFailureRate)
		// property: name=max_rtt, type=INTEGER macro=copy_to_state
		state.HardLimitAppMetrics.MaxRtt = types.Int64PointerValue(ans.HardLimitAppMetrics.MaxRtt)
		// property: name=udp_trt, type=INTEGER macro=copy_to_state
		state.HardLimitAppMetrics.UdpTrt = types.Int64PointerValue(ans.HardLimitAppMetrics.UdpTrt)
	}
	// property: name=id, type=STRING macro=copy_to_state
	state.Id = types.StringPointerValue(ans.Id)
	// property: name=lqm_thresholds, type=REFERENCE macro=copy_to_state
	if ans.LqmThresholds == nil {
		state.LqmThresholds = nil
	} else {
		state.LqmThresholds = &dsModelLQMThresholdConfigV2N1{}
		// copy_to_state: state=state.LqmThresholds prefix=dsModel ans=ans.LqmThresholds properties=4
		// property: name=max_jitter, type=INTEGER macro=copy_to_state
		state.LqmThresholds.MaxJitter = types.Int64PointerValue(ans.LqmThresholds.MaxJitter)
		// property: name=max_latency, type=INTEGER macro=copy_to_state
		state.LqmThresholds.MaxLatency = types.Int64PointerValue(ans.LqmThresholds.MaxLatency)
		// property: name=max_packet_loss, type=INTEGER macro=copy_to_state
		state.LqmThresholds.MaxPacketLoss = types.Int64PointerValue(ans.LqmThresholds.MaxPacketLoss)
		// property: name=min_mos, type=INTEGER macro=copy_to_state
		state.LqmThresholds.MinMos = types.Int64PointerValue(ans.LqmThresholds.MinMos)
	}
	// property: name=name, type=STRING macro=copy_to_state
	state.Name = types.StringPointerValue(ans.Name)
	// property: name=soft_limit_app_metrics, type=REFERENCE macro=copy_to_state
	if ans.SoftLimitAppMetrics == nil {
		state.SoftLimitAppMetrics = nil
	} else {
		state.SoftLimitAppMetrics = &dsModelStaticAppMetricConfigV2N1{}
		// copy_to_state: state=state.SoftLimitAppMetrics prefix=dsModel ans=ans.SoftLimitAppMetrics properties=3
		// property: name=max_init_failure_rate, type=INTEGER macro=copy_to_state
		state.SoftLimitAppMetrics.MaxInitFailureRate = types.Int64PointerValue(ans.SoftLimitAppMetrics.MaxInitFailureRate)
		// property: name=max_rtt, type=INTEGER macro=copy_to_state
		state.SoftLimitAppMetrics.MaxRtt = types.Int64PointerValue(ans.SoftLimitAppMetrics.MaxRtt)
		// property: name=udp_trt, type=INTEGER macro=copy_to_state
		state.SoftLimitAppMetrics.UdpTrt = types.Int64PointerValue(ans.SoftLimitAppMetrics.UdpTrt)
	}
	// property: name=synthetic_probe_thresholds, type=REFERENCE macro=copy_to_state
	if ans.SyntheticProbeThresholds == nil {
		state.SyntheticProbeThresholds = nil
	} else {
		state.SyntheticProbeThresholds = &dsModelSyntheticProbeThresholds{}
		// copy_to_state: state=state.SyntheticProbeThresholds prefix=dsModel ans=ans.SyntheticProbeThresholds properties=5
		// property: name=dns_txn_failure_pct, type=REFERENCE macro=copy_to_state
		if ans.SyntheticProbeThresholds.DnsTxnFailurePct == nil {
			state.SyntheticProbeThresholds.DnsTxnFailurePct = nil
		} else {
			state.SyntheticProbeThresholds.DnsTxnFailurePct = &dsModelSyntheticProbeThreshold{}
			// copy_to_state: state=state.SyntheticProbeThresholds.DnsTxnFailurePct prefix=dsModel ans=ans.SyntheticProbeThresholds.DnsTxnFailurePct properties=2
			// property: name=probe_config_id, type=STRING macro=copy_to_state
			state.SyntheticProbeThresholds.DnsTxnFailurePct.ProbeConfigId = types.StringPointerValue(ans.SyntheticProbeThresholds.DnsTxnFailurePct.ProbeConfigId)
			// property: name=value, type=INTEGER macro=copy_to_state
			state.SyntheticProbeThresholds.DnsTxnFailurePct.Value = types.Int64PointerValue(ans.SyntheticProbeThresholds.DnsTxnFailurePct.Value)
		}
		// property: name=init_failure_pct, type=REFERENCE macro=copy_to_state
		if ans.SyntheticProbeThresholds.InitFailurePct == nil {
			state.SyntheticProbeThresholds.InitFailurePct = nil
		} else {
			state.SyntheticProbeThresholds.InitFailurePct = &dsModelSyntheticProbeThreshold{}
			// copy_to_state: state=state.SyntheticProbeThresholds.InitFailurePct prefix=dsModel ans=ans.SyntheticProbeThresholds.InitFailurePct properties=2
			// property: name=probe_config_id, type=STRING macro=copy_to_state
			state.SyntheticProbeThresholds.InitFailurePct.ProbeConfigId = types.StringPointerValue(ans.SyntheticProbeThresholds.InitFailurePct.ProbeConfigId)
			// property: name=value, type=INTEGER macro=copy_to_state
			state.SyntheticProbeThresholds.InitFailurePct.Value = types.Int64PointerValue(ans.SyntheticProbeThresholds.InitFailurePct.Value)
		}
		// property: name=jitter, type=REFERENCE macro=copy_to_state
		if ans.SyntheticProbeThresholds.Jitter == nil {
			state.SyntheticProbeThresholds.Jitter = nil
		} else {
			state.SyntheticProbeThresholds.Jitter = &dsModelSyntheticProbeThreshold{}
			// copy_to_state: state=state.SyntheticProbeThresholds.Jitter prefix=dsModel ans=ans.SyntheticProbeThresholds.Jitter properties=2
			// property: name=probe_config_id, type=STRING macro=copy_to_state
			state.SyntheticProbeThresholds.Jitter.ProbeConfigId = types.StringPointerValue(ans.SyntheticProbeThresholds.Jitter.ProbeConfigId)
			// property: name=value, type=INTEGER macro=copy_to_state
			state.SyntheticProbeThresholds.Jitter.Value = types.Int64PointerValue(ans.SyntheticProbeThresholds.Jitter.Value)
		}
		// property: name=latency, type=REFERENCE macro=copy_to_state
		if ans.SyntheticProbeThresholds.Latency == nil {
			state.SyntheticProbeThresholds.Latency = nil
		} else {
			state.SyntheticProbeThresholds.Latency = &dsModelSyntheticProbeThreshold{}
			// copy_to_state: state=state.SyntheticProbeThresholds.Latency prefix=dsModel ans=ans.SyntheticProbeThresholds.Latency properties=2
			// property: name=probe_config_id, type=STRING macro=copy_to_state
			state.SyntheticProbeThresholds.Latency.ProbeConfigId = types.StringPointerValue(ans.SyntheticProbeThresholds.Latency.ProbeConfigId)
			// property: name=value, type=INTEGER macro=copy_to_state
			state.SyntheticProbeThresholds.Latency.Value = types.Int64PointerValue(ans.SyntheticProbeThresholds.Latency.Value)
		}
		// property: name=packet_loss, type=REFERENCE macro=copy_to_state
		if ans.SyntheticProbeThresholds.PacketLoss == nil {
			state.SyntheticProbeThresholds.PacketLoss = nil
		} else {
			state.SyntheticProbeThresholds.PacketLoss = &dsModelSyntheticProbeThreshold{}
			// copy_to_state: state=state.SyntheticProbeThresholds.PacketLoss prefix=dsModel ans=ans.SyntheticProbeThresholds.PacketLoss properties=2
			// property: name=probe_config_id, type=STRING macro=copy_to_state
			state.SyntheticProbeThresholds.PacketLoss.ProbeConfigId = types.StringPointerValue(ans.SyntheticProbeThresholds.PacketLoss.ProbeConfigId)
			// property: name=value, type=INTEGER macro=copy_to_state
			state.SyntheticProbeThresholds.PacketLoss.Value = types.Int64PointerValue(ans.SyntheticProbeThresholds.PacketLoss.Value)
		}
	}
	// property: name=system_health_metrics_thresholds, type=REFERENCE macro=copy_to_state
	if ans.SystemHealthMetricsThresholds == nil {
		state.SystemHealthMetricsThresholds = nil
	} else {
		state.SystemHealthMetricsThresholds = &dsModelSystemHealthMetricsThresholds{}
		// copy_to_state: state=state.SystemHealthMetricsThresholds prefix=dsModel ans=ans.SystemHealthMetricsThresholds properties=3
		// property: name=cpu_utilization, type=INTEGER macro=copy_to_state
		state.SystemHealthMetricsThresholds.CpuUtilization = types.Int64PointerValue(ans.SystemHealthMetricsThresholds.CpuUtilization)
		// property: name=disk_utilization, type=INTEGER macro=copy_to_state
		state.SystemHealthMetricsThresholds.DiskUtilization = types.Int64PointerValue(ans.SystemHealthMetricsThresholds.DiskUtilization)
		// property: name=memory_utilization, type=INTEGER macro=copy_to_state
		state.SystemHealthMetricsThresholds.MemoryUtilization = types.Int64PointerValue(ans.SystemHealthMetricsThresholds.MemoryUtilization)
	}
	// property: name=tags, type=SET_PRIMITIVE macro=copy_to_state
	varTags, errTags := types.SetValueFrom(ctx, types.StringType, ans.Tags)
	state.Tags = varTags
	resp.Diagnostics.Append(errTags.Errors()...)

	// Done.
	diagnostics.Append(resp.State.Set(ctx, &state)...)
}
