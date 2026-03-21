data "cloudflare_zone" "domain" {
  name = var.domain_name
}

  

# Bản ghi DNS cho Heroku
resource "cloudflare_record" "be_ai_heroku" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "be-ai"
  type    = "CNAME"
  content = var.heroku_dns_target
  proxied = true
  ttl     = 1
}




# Bản ghi DNS cho API trên Render
resource "cloudflare_record" "api_render" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "api"
  type    = "CNAME"
  content = "api-gateway-pyqp.onrender.com"
  proxied = true
  ttl     = 1
}




# Lệnh tự động tạo R2 Bucket
resource "cloudflare_r2_bucket" "vbpl_data" {
  account_id = cloudflare_zero_trust_tunnel_cloudflared.localhost_tunnel.account_id
  name       = "crawl-data-vbpl"
  location   = "APAC"
}

