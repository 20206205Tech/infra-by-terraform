# 1. Tạo Secret mới
resource "random_password" "colab_tunnel_secret" {
  length = 64
}

# 2. Tạo Tunnel mới
resource "cloudflare_zero_trust_tunnel_cloudflared" "colab_tunnel" {
  account_id = var.doppler_secrets_map["CLOUDFLARE_ACCOUNT_ID"]
  name       = "google-colab-tunnel"
  secret     = base64encode(random_password.colab_tunnel_secret.result)
  config_src = "cloudflare"
}

# 3. Cấu hình cho Tunnel mới
resource "cloudflare_zero_trust_tunnel_cloudflared_config" "colab_config" {
  account_id = cloudflare_zero_trust_tunnel_cloudflared.colab_tunnel.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.colab_tunnel.id

  config {
    ingress_rule {
      hostname = "colab.${var.domain_name}"
      service  = "http://localhost:11434"
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

# 4. DNS Record cho Tunnel mới
resource "cloudflare_record" "colab_dns" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "colab"
  type    = "CNAME"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.colab_tunnel.id}.cfargotunnel.com"
  proxied = true
}