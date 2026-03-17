variable "doppler_secrets_map" {
  type      = map(string)
  sensitive = true
}

variable "project_name" {
  type    = string
  default = "project-by-terraform"
}