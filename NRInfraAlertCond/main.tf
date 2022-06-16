
resource "newrelic_infra_alert_condition" "nr_infra_alert" {
  policy_id       = var.policy_id 
  name            = "${var.project}-${var.service}"
  type            = var.nr_type
  event           = var.event
  select          = var.select
  comparison      = var.comparison
  where           = var.where_condiction

  dynamic "critical" {
    for_each = length(keys(var.critical)) == 0 ? [] : [var.critical]

    content {
      duration       = lookup(critical.value, "duration", null)
      value          = lookup(critical.value, "value", null)
      time_function  = lookup(critical.value, "time_function", null)

    }
  }
   

  dynamic "warning" {
    for_each = length(keys(var.warning)) == 0 ? [] : [var.warning]

    content {
      duration       = lookup(warning.value, "duration", null)
      value          = lookup(warning.value, "value", null)
      time_function  = lookup(warning.value, "time_function", null)

    }
  }
 
 
} 