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