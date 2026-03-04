variable "doppler_secrets_map" {
  type        = map(string)
  sensitive   = true
  description = "Doppler secrets passed from root module"
}

variable "project_names" {
  type        = map(string)
  description = "Map of Supabase project names to create"
  default = {
    dev  = "project-DEV"
    prod = "project-PROD"
  }
}
