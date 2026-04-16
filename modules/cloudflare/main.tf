data "cloudflare_zone" "domain" {
  name = var.domain_name
}

  

# # Bản ghi DNS cho Heroku
# resource "cloudflare_record" "be_ai_heroku" {
#   zone_id = data.cloudflare_zone.domain.id
#   name    = "be-ai"
#   type    = "CNAME"
#   content = var.heroku_dns_target
#   proxied = true
#   ttl     = 1
# }




# Bản ghi DNS cho API trên Render
resource "cloudflare_record" "api_render" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "api"
  type    = "CNAME"
  content = "api-gateway-pyqp.onrender.com"
  proxied = true
  ttl     = 1
}




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

