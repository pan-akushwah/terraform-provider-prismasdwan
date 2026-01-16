resource "prismasdwan_performance_profile" "performance_profile_main" {
  # Required fields
  name = var.profile_name
  
  # Optional fields
  description = var.description
  tags = var.tags
  
  # Flow Metrics Thresholds - only include if not null
  flow_metrics_thresholds = var.flow_metrics_thresholds != null ? {
    percentage_flow_utilization = var.flow_metrics_thresholds.percentage_flow_utilization
  } : null
  
  # Circuit Utilization Metrics Thresholds - only include if not null
  circuit_utilization_metrics_thresholds = var.circuit_utilization_metrics_thresholds != null ? {
    percentage_circuit_utilization = var.circuit_utilization_metrics_thresholds.percentage_circuit_utilization
  } : null
  
  # System Health Metrics Thresholds - only include if not null
  system_health_metrics_thresholds = var.system_health_metrics_thresholds != null ? {
    cpu_utilization    = var.system_health_metrics_thresholds.cpu_utilization
    memory_utilization = var.system_health_metrics_thresholds.memory_utilization
    disk_utilization   = var.system_health_metrics_thresholds.disk_utilization
  } : null
  
  # Synthetic Probe Thresholds - only include if not null
  synthetic_probe_thresholds = var.synthetic_probe_thresholds != null ? {
    latency = var.synthetic_probe_thresholds.latency != null ? {
      value           = var.synthetic_probe_thresholds.latency.value
      probe_config_id = var.synthetic_probe_thresholds.latency.probe_config_id
    } : null
    
    jitter = var.synthetic_probe_thresholds.jitter != null ? {
      value           = var.synthetic_probe_thresholds.jitter.value
      probe_config_id = var.synthetic_probe_thresholds.jitter.probe_config_id
    } : null
    
    packet_loss = var.synthetic_probe_thresholds.packet_loss != null ? {
      value           = var.synthetic_probe_thresholds.packet_loss.value
      probe_config_id = var.synthetic_probe_thresholds.packet_loss.probe_config_id
    } : null
    
    dns_txn_failure_pct = var.synthetic_probe_thresholds.dns_txn_failure_pct != null ? {
      value           = var.synthetic_probe_thresholds.dns_txn_failure_pct.value
      probe_config_id = var.synthetic_probe_thresholds.dns_txn_failure_pct.probe_config_id
    } : null
    
    init_failure_pct = var.synthetic_probe_thresholds.init_failure_pct != null ? {
      value           = var.synthetic_probe_thresholds.init_failure_pct.value
      probe_config_id = var.synthetic_probe_thresholds.init_failure_pct.probe_config_id
    } : null
  } : null
  
  # Hard Limit App Metrics - only include if not null
  hard_limit_app_metrics = var.hard_limit_app_metrics != null ? {
    max_rtt               = var.hard_limit_app_metrics.max_rtt
    max_init_failure_rate = var.hard_limit_app_metrics.max_init_failure_rate
    udp_trt               = var.hard_limit_app_metrics.udp_trt
  } : null
  
  # Soft Limit App Metrics - only include if not null
  soft_limit_app_metrics = var.soft_limit_app_metrics != null ? {
    max_rtt               = var.soft_limit_app_metrics.max_rtt
    max_init_failure_rate = var.soft_limit_app_metrics.max_init_failure_rate
    udp_trt               = var.soft_limit_app_metrics.udp_trt
  } : null
  
  # LQM Thresholds - only include if not null
  lqm_thresholds = var.lqm_thresholds != null ? {
    max_latency     = var.lqm_thresholds.max_latency
    max_jitter      = var.lqm_thresholds.max_jitter
    max_packet_loss = var.lqm_thresholds.max_packet_loss
    min_mos         = var.lqm_thresholds.min_mos
  } : null
}