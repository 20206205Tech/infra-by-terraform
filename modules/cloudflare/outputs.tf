output "tunnel_id" {
  description = "ID của Cloudflare Zero Trust Tunnel"
  value       = cloudflare_zero_trust_tunnel_cloudflared.my_tunnel.id
}

output "tunnel_cname" {
  description = "CNAME của Tunnel"
  value       = "${cloudflare_zero_trust_tunnel_cloudflared.my_tunnel.id}.cfargotunnel.com"
}