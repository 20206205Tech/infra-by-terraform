output "heroku_dns_target" {
  value       = heroku_domain.this.cname
  description = "The CNAME record target for the Heroku app"
}
