variable "policy_id"{
    description = "policy_id"
}
variable "type"{
    description = "type"
}
variable "name"{
    description = "name"
}
variable "description"{
    description = "description"
}
variable "enabled"{
    description = "enabled"
}
variable "violation_time_limit_seconds"{
    description = "violation_time_limit_seconds"
}
variable "query"{
    description = "query"
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

variable "provider_version"{
    default = "2.41.2"
}
