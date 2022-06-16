# Create NR SImple Alertb
 
This module can be used to generate Newrelic Alert. This is not based on Quenries rather based on APM metrices. 

We would recommend an alerting strategy based on the Four Signals introduced in Google’s widely read book on Site Reliability Engineering.

The signals chosen for this module are:

Latency: High response time (seconds)
Traffic: Low throughput (requests/minute)
Errors: Error rate (errors/minute)
Saturation: CPU utilization (percentage utilized) [ This will be part of infra alert]


```shell

  resource "newrelic_alert_policy" "node-alerts" {
     name = "Atlas-Omni-Eks-${var.enviornment}"
  }  
#Throughput
  module "NRCond-Latency" {
  count             = length(var.apps_list)
  source            = "git::https://github.com/cloudops-guru/newrelic_terraform.git//NRAlertCond"
  policy_id         = newrelic_alert_policy.node-alerts.id
  project           = "NAME OF YOUR PROJECT"
  service           = "${var.apps_list[count.index]} - High Response Time (web)"
  entitie_id        = data.newrelic_entity.my-app1[count.index].application_id 
  nr_type           = "apm_app_metric"
  metric            = "response_time_web" 
  condition_scope   = "application"
  provider_version  = var.provider_version  
  duration          = 5
  operator          = "above"
  priority          = "critical"
  threshold         = "5"
  time_function     = "all" 
}
module "NRCond-Traffic" {
  count             = length(var.apps_list)
  source            = "git::https://github.com/cloudops-guru/newrelic_terraform.git//NRAlertCond"
  policy_id         = newrelic_alert_policy.node-alerts.id
  project           = "NAME OF YOUR PROJECT"
  service           = "${var.apps_list[count.index]} - Low Throughput (web)"
  entitie_id        = data.newrelic_entity.my-app1[count.index].application_id 
  nr_type           = "apm_app_metric"
  metric            = "throughput_web" 
  condition_scope   = "application"
  provider_version  = var.provider_version  
  duration          = 5
  operator          = "above"
  priority          = "critical"
  threshold         = "5"
  time_function     = "all" 
}
module "NRCond-Errors" {
  count             = length(var.apps_list)
  source            = "git::https://github.com/cloudops-guru/newrelic_terraform.git//NRAlertCond"
  policy_id         = newrelic_alert_policy.node-alerts.id
  project           = "NAME OF YOUR PROJECT"
  service           = "${var.apps_list[count.index]} - Error percentage (High)"
  entitie_id        = data.newrelic_entity.my-app1[count.index].application_id
  app_name          = "servicename"
  nr_type           = "apm_app_metric"
  metric            = "error_percentage" 
  condition_scope   = "application"
  provider_version  = var.provider_version  
  duration          = 5
  operator          = "above"
  priority          = "critical"
  threshold         = "5"
  time_function     = "all" 
} 
```
