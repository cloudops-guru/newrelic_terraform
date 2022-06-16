variable "project"{
    description = "project"
}

variable "service"{
    description = "service"
}

variable "entitie_id"{
    description = "entitie_id" 
}

variable "policy_id"{
    description = "policy_id"
} 

variable "provider_version"{
    default = "2.41.2"
}

variable duration{
    description =  "5"
}
variable operator{
    description =  "above"
}
variable priority{
    description =  "critical"
}
variable threshold{
    description =  "5"
}
variable time_function{
    description =  "all"
}
variable "nr_type"{
    description = "The type of condition. One of: apm_app_metric, apm_jvm_metric, apm_kt_metric, browser_metric, mobile_metric"
}
variable "metric"{
    description = "The metric field accepts parameters based on the type set https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/alert_condition "
}
variable "condition_scope" {
    description = "application or instance. Choose application for most scenarios. If you are using the JVM plugin in New Relic, the instance setting allows your condition to trigger for specific app instances. "
}

    