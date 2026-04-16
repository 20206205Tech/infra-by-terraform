


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

resource "cloudflare_r2_bucket" "dev_share" {
  account_id = var.doppler_secrets_map["CLOUDFLARE_ACCOUNT_ID"]
  name       = "dev-share"
  location   = "APAC"
}

resource "cloudflare_r2_bucket" "prod_share" {
  account_id = var.doppler_secrets_map["CLOUDFLARE_ACCOUNT_ID"]
  name       = "prod-share"
  location   = "APAC"
}

