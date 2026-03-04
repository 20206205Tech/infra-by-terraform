module "cloudflare" {
  source              = "./modules/cloudflare"
  domain_name         = "20206205.tech"
  doppler_secrets_map = data.doppler_secrets.this.map
}

module "mongodb" {
  source              = "./modules/mongodb"
  project_names       = ["project-DEV", "project-PROD"]
  doppler_secrets_map = data.doppler_secrets.this.map
}

module "supabase" {
  source = "./modules/supabase"
  project_names = {
    dev  = "project-DEV"
    prod = "project-PROD"
  }
  doppler_secrets_map = data.doppler_secrets.this.map
}

module "neon" {
  source = "./modules/neon"
  # Bạn có thể ghi đè danh sách projects ở đây nếu không muốn dùng default trong variables
  # projects          = ["project-1", "project-2"]
  doppler_secrets_map = data.doppler_secrets.this.map
}
