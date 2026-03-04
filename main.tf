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
