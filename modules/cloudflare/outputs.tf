# output "tunnel_id" {
#   description = "ID của Cloudflare Zero Trust Tunnel"
#   value       = cloudflare_zero_trust_tunnel_cloudflared.my_tunnel.id
# }

# output "tunnel_cname" {
#   description = "CNAME của Tunnel"
#   value       = "${cloudflare_zero_trust_tunnel_cloudflared.my_tunnel.id}.cfargotunnel.com"
# }


output "colab_tunnel_token" {
  description = "Token để chạy cloudflared cho Colab"
  value       = cloudflare_zero_trust_tunnel_cloudflared.colab_tunnel.tunnel_token
  sensitive   = true
}

output "main_tunnel_token" {
  description = "Token để chạy cloudflared cho hệ thống chính"
  value       = cloudflare_zero_trust_tunnel_cloudflared.my_tunnel.tunnel_token
  sensitive   = true
}