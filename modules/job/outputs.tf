output "cron_job_ids" {
  description = "Danh sách ID của các Cron Jobs"
  value = {
    ping_heroku   = cronjoborg_job.my_api_job.id
    # crawl_trigger = cronjoborg_job.crawl_trigger.id
  }
}