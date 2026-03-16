module "heroku" {
  source              = "./modules/heroku"
  doppler_secrets_map = data.doppler_secrets.this.map
}

module "cloudflare" {
  source              = "./modules/cloudflare"
  doppler_secrets_map = data.doppler_secrets.this.map

  # Lấy output heroku_dns_target từ module heroku truyền vào
  heroku_dns_target = module.heroku.heroku_dns_target
}

module "mongodb" {
  source              = "./modules/mongodb"
  doppler_secrets_map = data.doppler_secrets.this.map
}

module "supabase" {
  source              = "./modules/supabase"
  doppler_secrets_map = data.doppler_secrets.this.map
}

module "neon" {
  source              = "./modules/neon"
  doppler_secrets_map = data.doppler_secrets.this.map
}

module "aiven" {
  source              = "./modules/aiven"
  doppler_secrets_map = data.doppler_secrets.this.map
}

module "upstash" {
  source              = "./modules/upstash"
  doppler_secrets_map = data.doppler_secrets.this.map
}
