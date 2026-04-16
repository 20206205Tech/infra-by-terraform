


resource "cloudflare_r2_bucket" "dev_documents" {
  account_id = var.doppler_secrets_map["CLOUDFLARE_ACCOUNT_ID"]
  name       = "dev-documents"
  location   = "APAC"
}

resource "cloudflare_r2_bucket" "prod_documents" {
  account_id = var.doppler_secrets_map["CLOUDFLARE_ACCOUNT_ID"]
  name       = "prod-documents"
  location   = "APAC"
}







# ==========================================
# MÔI TRƯỜNG DEV (Sử dụng tên miền mặc định)
# ==========================================


resource "cloudflare_r2_bucket" "dev_share" {
  account_id = var.doppler_secrets_map["CLOUDFLARE_ACCOUNT_ID"]
  name       = "dev-share"
  location   = "APAC"
}

# Dùng API để bật managed domain (.r2.dev)
resource "null_resource" "enable_r2_dev_dev" {
  # Chạy lại script này nếu bucket được tạo mới hoặc thay đổi tên
  triggers = {
    bucket_name = cloudflare_r2_bucket.dev_share.name
  }

  provisioner "local-exec" {
    command = <<EOT
      curl -X PUT "https://api.cloudflare.com/client/v4/accounts/${var.doppler_secrets_map["CLOUDFLARE_ACCOUNT_ID"]}/r2/buckets/${cloudflare_r2_bucket.dev_share.name}/managed_domain" \
           -H "Authorization: Bearer ${var.doppler_secrets_map["CLOUDFLARE_API_TOKEN"]}" \
           -H "Content-Type: application/json" \
           -d '{"enabled":true}'
    EOT
  }
}



# ==========================================
# MÔI TRƯỜNG PROD (Sử dụng tên miền riêng)
# ==========================================



resource "cloudflare_r2_bucket" "prod_share" {
  account_id = var.doppler_secrets_map["CLOUDFLARE_ACCOUNT_ID"]
  name       = "prod-share"
  location   = "APAC"
}

# Dùng API để bật managed domain (.r2.dev)
resource "null_resource" "enable_r2_dev_prod" {
  # Chạy lại script này nếu bucket được tạo mới hoặc thay đổi tên
  triggers = {
    bucket_name = cloudflare_r2_bucket.prod_share.name
  }

  provisioner "local-exec" {
    command = <<EOT
      curl -X PUT "https://api.cloudflare.com/client/v4/accounts/${var.doppler_secrets_map["CLOUDFLARE_ACCOUNT_ID"]}/r2/buckets/${cloudflare_r2_bucket.prod_share.name}/managed_domain" \
           -H "Authorization: Bearer ${var.doppler_secrets_map["CLOUDFLARE_API_TOKEN"]}" \
           -H "Content-Type: application/json" \
           -d '{"enabled":true}'
    EOT
  }
}
