variable "project"{
    description = "project"
}
 
variable "env"{
    description = "Please pass envionrment name"
}
     
variable "resources" {
  description = "My Dashboard"
  type = list(object({
    bu                    = string
    title                 = optional(list(string))
    nrql_query            = optional(list(string))
    title_pie             = optional(list(string))
    nrql_query_pie        = optional(list(string))
    title_table           = optional(list(string))
    nrql_query_table      = optional(list(string))
    title_billboard       = optional(list(string))
    nrql_query_billboard  = optional(list(string))
    title_bar             = optional(list(string))
    nrql_query_bar        = optional(list(string))
  }))
}
 