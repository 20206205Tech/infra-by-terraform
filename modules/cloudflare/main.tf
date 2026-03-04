# infra-by-terraform/modules/cloudflare/main.tf

data "cloudflare_zone" "domain" {
  name = var.domain_name
}

# Tạo mật khẩu ngẫu nhiên cho Tunnel
resource "random_password" "tunnel_secret" {
  length = 64
}

# Cấu hình Zero Trust Tunnel
resource "cloudflare_zero_trust_tunnel_cloudflared" "my_tunnel" {
  account_id = var.doppler_secrets_map["CLOUDFLARE_ACCOUNT_ID"]
  name       = "${replace(var.domain_name, ".", "")}-tunnel"
  secret     = base64encode(random_password.tunnel_secret.result)
  config_src = "cloudflare"
}

# Cấu hình Routing cho Tunnel
resource "cloudflare_zero_trust_tunnel_cloudflared_config" "my_tunnel_config" {
  account_id = cloudflare_zero_trust_tunnel_cloudflared.my_tunnel.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.my_tunnel.id

  config {
    ingress_rule {
      hostname = "dev-be-ai.${var.domain_name}"
      service  = "http://localhost:8000"
    }

    ingress_rule {
      service = "http_status:404"
    }
  }
}

# Bản ghi DNS trỏ về Tunnel
resource "cloudflare_record" "localhost_tunnel" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "dev-be-ai"
  type    = "CNAME"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.my_tunnel.id}.cfargotunnel.com"
  proxied = true
  ttl     = 1
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
