module "cloudflare" {
  source              = "./modules/cloudflare"
  doppler_secrets_map = data.doppler_secrets.this.map
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
