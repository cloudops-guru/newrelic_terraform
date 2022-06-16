resource "newrelic_nrql_alert_condition" "node-workshop-slow-txn" {
  policy_id                    = var.policy_id
  type                         = var.type
  name                         = var.name
  description                  = var.description
  enabled                      = var.enabled 
  violation_time_limit_seconds = var.violation_time_limit_seconds
  
  nrql {
    query = var.query
  } 

   
  dynamic "critical" {
    for_each = length(keys(var.critical)) == 0 ? [] : [var.critical]

    content {
      operator            = lookup(critical.value, "operator", null)
      threshold           = lookup(critical.value, "threshold", null)
      threshold_duration  = lookup(critical.value, "threshold_duration", null)
      threshold_occurrences       = lookup(critical.value, "threshold_occurrences", null)

    }
  }
   

  dynamic "warning" {
    for_each = length(keys(var.warning)) == 0 ? [] : [var.warning] 
     content {
      operator            = lookup(warning.value, "operator", null)
      threshold           = lookup(warning.value, "threshold", null)
      threshold_duration  = lookup(warning.value, "threshold_duration", null)
      threshold_occurrences       = lookup(warning.value, "threshold_occurrences", null)

    }
  }
}