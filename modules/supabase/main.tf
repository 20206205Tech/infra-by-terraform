locals {
  default_callback = "https://20206205tech.github.io/auth-callback"




  project_configs = {
    "dev" = {
      # Khi dev api không có giao diện, vào url sẽ sang trang này
      site_url = local.default_callback
      # Cho phép React redirect về localhost khi cần
      allowed_uris = ["http://localhost:3000/auth/callback"]
    }
    "prod" = {
      site_url = local.default_callback
      # Cho phép React redirect về domain chính khi cần
      allowed_uris = ["https://20206205.tech/auth/callback"]
    }
  }
}

resource "supabase_project" "this" {
  for_each = var.project_names

  organization_id   = var.doppler_secrets_map["SUPABASE_ORGANIZATION_ID"]
  name              = each.value
  database_password = var.doppler_secrets_map["SUPABASE_DB_PASSWORD"]
  region            = "ap-southeast-1"

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
    # Mặc định là 1 giờ
    # Thêm cấu hình thời gian token (12 giờ = 43200 giây)
    jwt_exp = 43200

    external_google_enabled   = true
    external_google_client_id = var.doppler_secrets_map["GOOGLE_CLIENT_ID"]
    external_google_secret    = var.doppler_secrets_map["GOOGLE_CLIENT_SECRET"]

    site_url = local.project_configs[each.key].site_url

    # Dùng join để biến list thành string cách nhau bởi dấu phẩy
    uri_allow_list = join(",", distinct(concat(
      [local.project_configs[each.key].site_url],
      local.project_configs[each.key].allowed_uris
    )))
  })
}
