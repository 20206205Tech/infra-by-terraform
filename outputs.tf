output "heroku_dns_target" {
  value       = module.heroku.heroku_dns_target
  description = "CNAME target for Heroku custom domain"
}
