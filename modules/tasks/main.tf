resource "terracurl_request" "cron_jobs" {
  for_each = {
    "ping-api" = {
      title   = "test-stacloud-vps-ping-api"
      url     = "http://dsg1.stacloud.tech:30005/docs"
      method  = 0  
      hour    = 8
      headers = {}
      body    = ""
    },
    "github-trigger" = {
      title   = "test-stacloud-vps-trigger"
      url     = "https://api.github.com/repos/20206205Tech/test-stacloud-vps/dispatches"
      method  = 1  
      hour    = 9
      headers = {
        "Authorization" = "Bearer ${var.doppler_secrets_map["PAT"]}"
        "Accept"        = "application/vnd.github.v3+json"
        "User-Agent"    = "Cron-Job-Org-Check"
        "Content-Type"  = "application/json"
      }
      body = jsonencode({
        "event_type" = "trigger"
      })
    }
  }

  name   = "cron-job-${each.key}"
  url    = "https://api.cron-job.org/jobs"
  method = "PUT"

  headers = {
    "Authorization" = "Bearer ${var.doppler_secrets_map["CRONJOB_ORG_API_KEY"]}"
    "Content-Type"  = "application/json"
  }

  request_body = jsonencode({
    "job" = {
      "title"          = each.value.title
      "url"            = each.value.url
      "enabled"        = true
      "saveResponses"  = true
      "requestMethod"  = each.value.method
      "requestHeaders" = each.value.headers
      "requestBody"    = each.value.body
      "schedule" = {
        "timezone" = "Asia/Ho_Chi_Minh"
        "hours"    = [each.value.hour]
        "minutes"  = [0]
        "mdays"    = [-1]
        "months"   = [-1]
        "wdays"    = [-1]
      }
    }
  })

  response_codes = [200, 201]
}