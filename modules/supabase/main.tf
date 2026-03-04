resource "supabase_project" "this" {
  for_each = var.project_names

  organization_id   = var.doppler_secrets_map["SUPABASE_ORGANIZATION_ID"]
  name              = each.value
  database_password = var.doppler_secrets_map["SUPABASE_DB_PASSWORD"]
  region            = var.doppler_secrets_map["SUPABASE_REGION"]

  lifecycle {
    ignore_changes = [database_password]
  }
}

data "supabase_apikeys" "this" {
  for_each    = supabase_project.this
  project_ref = each.value.id
}

data "supabase_pooler" "this" {
  for_each    = supabase_project.this
  project_ref = each.value.id
}
