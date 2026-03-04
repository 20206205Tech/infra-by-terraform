variable "doppler_secrets_map" {
  type        = map(string)
  sensitive   = true
  description = "Doppler secrets passed from root module"
}

variable "app_name" {
  type    = string
  default = "code-fastapi-be-ai"
}

variable "app_region" {
  type    = string
  default = "us"
}

variable "app_stack" {
  type    = string
  default = "container"
}

variable "domain_name" {
  type    = string
  default = "be-ai.20206205.tech"
}

variable "github_org_repo" {
  type    = string
  default = "20206205Tech/code-fastapi-be-ai"
}

variable "github_branch" {
  type    = string
  default = "main"
}
