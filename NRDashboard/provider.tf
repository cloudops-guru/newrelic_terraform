terraform { 
  experiments = [module_variable_optional_attrs]
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic" 
      version = "2.41.2"
    }
  } 
}