# 1. Check Ping API - Chạy chính xác vào 8:00 sáng hàng ngày (GMT+7)
resource "checkly_check" "dsg1_api_check" {
  name                      = "test-stacloud-vps-ping-api"
  type                      = "API"
  activated                 = true
  locations                 = ["ap-southeast-1"]

  # Cấu hình lịch chạy Cron
  scheduling_strategy = "CRON"
  schedule            = "0 8 * * *" # Chạy vào phút 0, giờ 8 hàng ngày

  request {
    url    = "http://dsg1.stacloud.tech:30005/docs"
    method = "GET"
  }
}

# 2. Check Trigger GitHub - Chạy chính xác vào 9:00 sáng hàng ngày (GMT+7)
resource "checkly_check" "dsg1_trigger_check" {
  name      = "test-stacloud-vps-trigger"
  type      = "API"
  activated = true
  locations = ["ap-southeast-1"]

  # Cấu hình lịch chạy Cron
  scheduling_strategy = "CRON"
  schedule            = "0 9 * * *" # Chạy vào phút 0, giờ 9 hàng ngày

  request {
    url    = "https://api.github.com/repos/20206205Tech/test-stacloud-vps/dispatches"
    method = "POST"
    
    headers = {
      "Authorization" = "Bearer ${var.doppler_secrets_map["PAT"]}"
      "Accept"        = "application/vnd.github.v3+json"
      "Content-Type"  = "application/json"
    }

    body = jsonencode({
      "event_type" = "trigger"
    })
    body_type = "JSON"
  }
}