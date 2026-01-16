# Performance Profile Configuration
profile_name = "TerraformTest1"
description = "This is managed by Terraform."
tags = ["Terraform"]

# Flow Metrics Thresholds
flow_metrics_thresholds = null

# Circuit Utilization Metrics Thresholds
circuit_utilization_metrics_thresholds = null

# System Health Metrics Thresholds
system_health_metrics_thresholds = null

# Synthetic Probe Thresholds
synthetic_probe_thresholds = {
  latency = {
    probe_config_id = "1732165509335008096"
    value           = 25
  }
  jitter = {
    probe_config_id = "1732165509335008096"
    value           = 35
  }
  packet_loss = {
    probe_config_id = "1732165509335008096"
    value           = 2
  }
  dns_txn_failure_pct = null
  init_failure_pct    = null
}

# Hard Limit App Metrics
hard_limit_app_metrics = {
  max_init_failure_rate = 2
  max_rtt               = null
  udp_trt               = null
}

# Soft Limit App Metrics
soft_limit_app_metrics = {
  max_init_failure_rate = 2
  max_rtt               = null
  udp_trt               = null
}

# LQM Thresholds
lqm_thresholds = {
  max_latency     = 1
  max_jitter      = null
  max_packet_loss = null
  min_mos         = null
}