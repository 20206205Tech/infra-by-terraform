# output "projects_info" {
#   value = {
#     for key, project in supabase_project.this : key => {
#       project_id   = project.id
#       project_url  = "https://${project.id}.supabase.co"
#       anon_key     = data.supabase_apikeys.this[key].anon_key
#       service_role = data.supabase_apikeys.this[key].service_role_key
#     }
#   }
#   sensitive = true
# }

# output "db_connection_strings" {
#   value = {
#     for key, pooler in data.supabase_pooler.this : key => pooler.url["transaction"]
#   }
#   sensitive = true
# }
