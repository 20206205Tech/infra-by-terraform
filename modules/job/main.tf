# # Định nghĩa Job để trigger ứng dụng Heroku (giữ cho nó không bị sleep nếu dùng gói free/eco)
# resource "cronjoborg_job" "ping_heroku" {
#   title          = "Ping Heroku App"
#   url            = "https://${var.doppler_secrets_map["HEROKU_APP_NAME"]}.herokuapp.com/health"
#   enabled        = true
#   save_responses = true

#   schedule {
#     timezone = "Asia/Ho_Chi_Minh"
#     hours    = [-1] # Chạy mỗi giờ
#     mdays    = [-1]
#     minutes  = [0]  # Vào phút thứ 0
#     months   = [-1]
#     wdays    = [-1]
#   }
# }

# # Ví dụ thêm một job để trigger crawl data định kỳ
# resource "cronjoborg_job" "crawl_trigger" {
#   title          = "Daily Data Crawl"
#   url            = "https://api.20206205.tech/v1/crawl/trigger"
#   enabled        = true
#   save_responses = true

#   schedule {
#     timezone = "Asia/Ho_Chi_Minh"
#     hours    = [1] # Chạy vào lúc 1 giờ sáng
#     mdays    = [-1]
#     minutes  = [0]
#     months   = [-1]
#     wdays    = [-1]
#   }

#   # Nếu API yêu cầu Header Secret để bảo mật
#   # auth {
#   #   user     = "admin"
#   #   password = var.doppler_secrets_map["CRON_SECRET_KEY"]
#   # }
# }




 
resource "cronjoborg_job" "my_api_job" {
  title          = "task-by-terraform"
  url            = "https://webhook.site/cdf44db5-008e-4511-8f33-cd6284322ee8"
  enabled        = true
  save_responses = true

  schedule {
    timezone = "Asia/Ho_Chi_Minh"
    hours    = [-1]
    mdays    = [-1]
    minutes  = [-1]
    months   = [-1]
    wdays    = [-1]
  }
 
}

