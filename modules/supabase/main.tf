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

resource "supabase_settings" "this" {
  for_each = supabase_project.this

  project_ref = each.value.id

  auth = jsonencode({
    external_google_enabled   = true
    external_google_client_id = var.doppler_secrets_map["GOOGLE_CLIENT_ID"]
    external_google_secret    = var.doppler_secrets_map["GOOGLE_CLIENT_SECRET"]

    site_url                 = "https://20206205.tech"
    additional_redirect_urls = ["https://20206205.tech/auth/callback"]
  })
}
