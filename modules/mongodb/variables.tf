variable "doppler_secrets_map" {
  type        = map(string)
  sensitive   = true
  description = "Doppler secrets passed from root module"
}

variable "project_names" {
  type        = list(string)
  description = "List of MongoDB project names to create"
  default     = ["project-DEV", "project-PROD"]
}
