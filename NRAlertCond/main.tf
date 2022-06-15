
resource "newrelic_alert_condition" "nr_alert" {
  policy_id       = var.policy_id 
  name            = "${var.project}-${var.service}"
  type            = var.nr_type
  entities        = [ var.entitie_id ]
  metric          = var.metric
  condition_scope = var.condition_scope

  term {
    duration      = var.duration
    operator      = var.operator
    priority      = var.priority
    threshold     = var.threshold
    time_function = var.time_function
  }
} 