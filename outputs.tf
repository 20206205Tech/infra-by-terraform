# ==========================================
# HEROKU OUTPUTS
# ==========================================
output "heroku_dns_target" {
  value       = module.heroku.heroku_dns_target
  description = "CNAME target for Heroku custom domain"
}

# ==========================================
# SUPABASE OUTPUTS
# ==========================================
output "supabase_project_urls" {
  value       = module.supabase.supabase_urls
  description = "Danh sách URL của các project Supabase"
}

output "supabase_full_details" {
  value       = module.supabase.project_details
  description = "Toàn bộ thông tin cấu hình Supabase (Sensitive)"
  sensitive   = true
}

# ==========================================
# CLOUDFLARE OUTPUTS
# ==========================================
output "cloudflare_tunnel_id" {
  value       = module.cloudflare.tunnel_id
  description = "ID của Zero Trust Tunnel"
}

output "cloudflare_tunnel_cname" {
  value       = module.cloudflare.tunnel_cname
  description = "Đường dẫn CNAME tới Cloudflare Tunnel"
}

# ==========================================
# MONGODB OUTPUTS
# ==========================================
output "mongodb_clusters" {
  value       = module.mongodb.mongodb_cluster_ids
  description = "Danh sách ID của các cluster MongoDB"
}

# ==========================================
# NEON OUTPUTS
# ==========================================
output "neon_projects" {
  value       = module.neon.neon_project_ids
  description = "Danh sách ID của các databases trên Neon"
}

# ==========================================
# AIVEN OUTPUTS
# ==========================================
output "aiven_kafka_project" {
  value       = module.aiven.kafka_project_name
  description = "Tên Aiven Project chứa Kafka"
}

output "aiven_kafka_uri" {
  value       = module.aiven.kafka_service_uri
  description = "URI kết nối Kafka"
  sensitive   = true
}

# ==========================================
# LANGSMITH OUTPUTS
# ==========================================
output "langsmith_project_id" {
  value       = module.langsmith.project_id
  description = "ID của Langsmith project"
}

# ==========================================
# UPSTASH OUTPUTS
# ==========================================
output "upstash_qstash_topic" {
  value       = module.upstash.topic_name
  description = "Tên Topic QStash trên Upstash"
}

# # 1. Khai báo Provider
# terraform {
#   required_providers {
#     checkly = {
#       source  = "checkly/checkly"
#       version = "1.17.0"  
#     }
#   }
# }

# provider "checkly" {
#   api_key     
#   account_id  
#   CHECKLY_API_KEY    

# CHECKLY_ACCOUNT_ID  

# }

# # 2. Tạo Check cho API (GET)
# resource "checkly_check" "dsg1_api_check" {
#   name                      = "test-stacloud-vps-ping-api"
#   type                      = "API"
#   activated                 = true
#   frequency                 = 1440 # 1 ngày chạy 1 lần
#   locations                 = ["ap-southeast-1"] # Singapore cho gần Việt Nam

#   request {
#     url    = "http://dsg1.stacloud.tech:30005/docs"
#     method = "GET"
#   }
# }

# # 3. Tạo Check cho GitHub Trigger (POST) - Giải quyết vấn đề Headers/Body
# resource "checkly_check" "dsg1_trigger_check" {
#   name      = "test-stacloud-vps-trigger"
#   type      = "API"
#   activated = true
#   frequency = 1440
#   locations = ["ap-southeast-1"]

#   request {
#     url    = "https://api.github.com/repos/20206205Tech/test-stacloud-vps/dispatches"
#     method = "POST"
    
#     headers = {
#       "Authorization" = "Bearer ${var.doppler_secrets_map["PAT"]}"
#       "Accept"        = "application/vnd.github.v3+json"
#     }

#     body = jsonencode({
#       "event_type" = "trigger"
#     })
#     body_type = "JSON"
#   }
# }