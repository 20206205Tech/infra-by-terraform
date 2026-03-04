variable "doppler_secrets_map" {
  type        = map(string)
  sensitive   = true
  description = "Doppler secrets passed from root module"
}

variable "domain_name" {
  type        = string
  description = "Tên miền chính trên Cloudflare"
}
