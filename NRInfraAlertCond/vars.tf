variable "project"{
    description = "project"
}

variable "service"{
    description = "service"
} 

variable "nr_type"{
    description = "The type of condition. One of: apm_app_metric, apm_jvm_metric, apm_kt_metric, browser_metric, mobile_metric"
}

variable "policy_id"{
    description = "policy_id"
} 

variable "provider_version"{
    default = "2.41.2"
}

variable event{
    description =  "event"
}
variable select{
    description =  "select"
}
variable comparison{
    description =  "comparison"
}
variable where_condiction{
    description =  "where_condiction"
}
variable critical{
    description =  "critical"
    type        = map(string)
    default     = {}
}
variable warning{
    description =  "critical"
    type        = map(string)
    default     = {}
} 