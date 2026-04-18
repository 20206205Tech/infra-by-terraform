



# Bản ghi DNS cho API trên Render
resource "cloudflare_record" "api_render" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "api"
  type    = "CNAME"
  content = "api-gateway-pyqp.onrender.com"
  proxied = true
  ttl     = 1
}

