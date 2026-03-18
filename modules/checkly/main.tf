# 1. Check Ping API (GET)
resource "checkly_check" "dsg1_api_check" {
  name                      = "test-stacloud-vps-ping-api"
  type                      = "API"
  activated                 = true
  frequency                 = 1440 
  locations                 = ["ap-southeast-1"]

  request {
    url    = "http://dsg1.stacloud.tech:30005/docs"
    method = "GET"
  }
}

# 2. Check Trigger GitHub (POST)
resource "checkly_check" "dsg1_trigger_check" {
  name      = "test-stacloud-vps-trigger"
  type      = "API"
  activated = true
  frequency = 1440
  locations = ["ap-southeast-1"]

  request {
    url    = "https://api.github.com/repos/20206205Tech/test-stacloud-vps/dispatches"
    method = "POST"
    
    headers = {
      "Authorization" = "Bearer ${var.doppler_secrets_map["PAT"]}"
      "Accept"        = "application/vnd.github.v3+json"
    }

    body = jsonencode({
      "event_type" = "trigger"
    })
    body_type = "JSON"
  }
}