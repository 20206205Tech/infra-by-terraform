variable "doppler_secrets_map" {
  type        = map(string)
  sensitive   = true
  description = "Doppler secrets passed from root module"
}

variable "domain_name" {
  type        = string
  description = "Tên miền chính trên Cloudflare"
  default     = "20206205.tech"
}

variable "heroku_dns_target" {
  type        = string
  description = "CNAME target lấy tự động từ Heroku"
}
