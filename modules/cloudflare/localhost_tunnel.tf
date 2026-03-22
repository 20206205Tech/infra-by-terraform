resource "cloudflare_zero_trust_tunnel_cloudflared" "localhost_tunnel" {
  account_id = var.doppler_secrets_map["CLOUDFLARE_ACCOUNT_ID"]
  name       = "localhost-tunnel"
  secret     = base64encode(var.doppler_secrets_map["CLOUDFLARE_TUNNEL_SECRET"])
  config_src = "cloudflare"
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "localhost_tunnel_config" {
  account_id = cloudflare_zero_trust_tunnel_cloudflared.localhost_tunnel.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.localhost_tunnel.id

  config {
    ingress_rule {
      hostname = "dev-be-ai.${var.domain_name}"
      service  = "http://localhost:8000"
    }

    ingress_rule {
      hostname = "ollama.${var.domain_name}"
      service  = "http://127.0.0.1:11434"
    }

    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_record" "localhost_tunnel" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "dev-be-ai"
  type    = "CNAME"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.localhost_tunnel.id}.cfargotunnel.com"
  proxied = true
  ttl     = 1
}

resource "cloudflare_record" "ollama_tunnel" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "ollama"
  type    = "CNAME"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.localhost_tunnel.id}.cfargotunnel.com"
  proxied = true
  ttl     = 1
}