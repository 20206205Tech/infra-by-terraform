# Bản ghi DNS cho Heroku
resource "cloudflare_record" "be_ai_heroku" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "code-payment-service"
  type    = "CNAME"
  content = var.heroku_dns_target
  proxied = true
  ttl     = 1
}
