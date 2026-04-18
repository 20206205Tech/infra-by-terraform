resource "random_password" "localhost_tunnel_secret" {
  length = 64
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "localhost_tunnel" {
  account_id = var.doppler_secrets_map["CLOUDFLARE_ACCOUNT_ID"]
  name       = "localhost-tunnel"
  secret     = base64encode(random_password.localhost_tunnel_secret.result)
  config_src = "cloudflare"
}




resource "cloudflare_zero_trust_tunnel_cloudflared_config" "localhost_tunnel_config" {
  account_id = cloudflare_zero_trust_tunnel_cloudflared.localhost_tunnel.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.localhost_tunnel.id

  config {
    ingress_rule {
      hostname = "dev-data-pipeline-service.${var.domain_name}"
      service  = "http://localhost:30000"
    }

    ingress_rule {
      hostname = "dev-code-payment-service.${var.domain_name}"
      service  = "http://localhost:30001"
    }

    ingress_rule {
      hostname = "dev-code-conversation-service.${var.domain_name}"
      service  = "http://localhost:30002"
    }

    ingress_rule {
      hostname = "dev-code-chatbot-service.${var.domain_name}"
      service  = "http://localhost:30003"
    }

    ingress_rule {
      hostname = "dev-code-document-service.${var.domain_name}"
      service  = "http://localhost:30004"
    }

    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_record" "data_pipeline_tunnel_dns" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "dev-data-pipeline-service"
  type    = "CNAME"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.localhost_tunnel.id}.cfargotunnel.com"
  proxied = true
  ttl     = 1
}

resource "cloudflare_record" "payment_tunnel_dns" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "dev-code-payment-service"
  type    = "CNAME"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.localhost_tunnel.id}.cfargotunnel.com"
  proxied = true
  ttl     = 1
}

resource "cloudflare_record" "conversation_tunnel_dns" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "dev-code-conversation-service"
  type    = "CNAME"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.localhost_tunnel.id}.cfargotunnel.com"
  proxied = true
  ttl     = 1
}

resource "cloudflare_record" "chatbot_tunnel_dns" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "dev-code-chatbot-service"
  type    = "CNAME"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.localhost_tunnel.id}.cfargotunnel.com"
  proxied = true
  ttl     = 1
}

resource "cloudflare_record" "document_tunnel_dns" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "dev-code-document-service"
  type    = "CNAME"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.localhost_tunnel.id}.cfargotunnel.com"
  proxied = true
  ttl     = 1
}
