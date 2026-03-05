output "heroku_dns_target" {
  value       = module.heroku.heroku_dns_target
  description = "CNAME target for Heroku custom domain"
}

output "supabase_project_urls" {
  value       = module.supabase.supabase_urls
  description = "Danh sách URL của các project Supabase"
}

output "supabase_full_details" {
  value       = module.supabase.project_details
  description = "Toàn bộ thông tin cấu hình Supabase (Sensitive)"
  sensitive   = true
}
