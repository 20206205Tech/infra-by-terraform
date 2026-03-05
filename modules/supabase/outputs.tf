output "project_details" {
  description = "Chi tiết các project Supabase đã tạo"
  sensitive   = true # Đánh dấu sensitive vì có chứa API Keys
  value = {
    for k, v in supabase_project.this : k => {
      project_id   = v.id
      project_url  = "https://${v.id}.supabase.co"
      anon_key     = data.supabase_apikeys.this[k].anon_key
      service_role = data.supabase_apikeys.this[k].service_role_key
      db_host      = data.supabase_pooler.this[k].url
    }
  }
}

output "supabase_urls" {
  description = "Danh sách URL của các project"
  value = {
    for k, v in supabase_project.this : k => "https://${v.id}.supabase.co"
  }
}
