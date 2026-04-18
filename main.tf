locals {
  # Gom tất cả các biến đã khai báo thành 1 map để truyền xuống các module
  secrets_map = {
    CLOUDFLARE_API_TOKEN      = var.CLOUDFLARE_API_TOKEN
    CLOUDFLARE_ACCOUNT_ID     = var.CLOUDFLARE_ACCOUNT_ID
    MONGODB_ATLAS_PUBLIC_KEY  = var.MONGODB_ATLAS_PUBLIC_KEY
    MONGODB_ATLAS_PRIVATE_KEY = var.MONGODB_ATLAS_PRIVATE_KEY
    MONGODB_ATLAS_ORG_ID      = var.MONGODB_ATLAS_ORG_ID
    MONGODB_DB_PASSWORD       = var.MONGODB_DB_PASSWORD
    SUPABASE_ACCESS_TOKEN     = var.SUPABASE_ACCESS_TOKEN
    SUPABASE_ORGANIZATION_ID  = var.SUPABASE_ORGANIZATION_ID
    SUPABASE_DB_PASSWORD      = var.SUPABASE_DB_PASSWORD
    GOOGLE_CLIENT_ID          = var.GOOGLE_CLIENT_ID
    GOOGLE_CLIENT_SECRET      = var.GOOGLE_CLIENT_SECRET
    NEON_API_KEY              = var.NEON_API_KEY
    NEON_ORGANIZATION_ID      = var.NEON_ORGANIZATION_ID
    HEROKU_EMAIL              = var.HEROKU_EMAIL
    HEROKU_API_KEY            = var.HEROKU_API_KEY
    AIVEN_TOKEN               = var.AIVEN_TOKEN
    AIVEN_PARENT_ID           = var.AIVEN_PARENT_ID
    UPSTASH_EMAIL             = var.UPSTASH_EMAIL
    UPSTASH_API_KEY           = var.UPSTASH_API_KEY
    LANGSMITH_API_KEY         = var.LANGSMITH_API_KEY
    OCI_TENANCY_OCID          = var.OCI_TENANCY_OCID
    OCI_USER_OCID             = var.OCI_USER_OCID
    OCI_FINGERPRINT           = var.OCI_FINGERPRINT
    OCI_PRIVATE_KEY           = var.OCI_PRIVATE_KEY
    OCI_REGION                = var.OCI_REGION
    OCI_SSH_PUBLIC_KEY        = var.OCI_SSH_PUBLIC_KEY
  }
}

module "heroku" {
  source              = "./modules/heroku"
  doppler_secrets_map = local.secrets_map
}

module "cloudflare" {
  source              = "./modules/cloudflare"
  doppler_secrets_map = local.secrets_map

  # Lấy output heroku_dns_target từ module heroku truyền vào
  heroku_dns_target = module.heroku.heroku_dns_target
}

module "mongodb" {
  source              = "./modules/mongodb"
  doppler_secrets_map = local.secrets_map
}

module "supabase" {
  source              = "./modules/supabase"
  doppler_secrets_map = local.secrets_map
}

module "neon" {
  source              = "./modules/neon"
  doppler_secrets_map = local.secrets_map
}

module "aiven" {
  source              = "./modules/aiven"
  doppler_secrets_map = local.secrets_map
}

module "upstash" {
  source              = "./modules/upstash"
  doppler_secrets_map = local.secrets_map
}

module "langsmith" {
  source              = "./modules/langsmith"
  doppler_secrets_map = local.secrets_map
}

module "oracle" {
  source              = "./modules/oracle"
  doppler_secrets_map = local.secrets_map
}



