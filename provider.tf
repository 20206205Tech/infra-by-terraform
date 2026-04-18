provider "cloudflare" {
  api_token = var.CLOUDFLARE_API_TOKEN
}

provider "mongodbatlas" {
  public_key  = var.MONGODB_ATLAS_PUBLIC_KEY
  private_key = var.MONGODB_ATLAS_PRIVATE_KEY
}

provider "supabase" {
  access_token = var.SUPABASE_ACCESS_TOKEN
}

provider "neon" {
  api_key = var.NEON_API_KEY
}

provider "heroku" {
  email   = var.HEROKU_EMAIL
  api_key = var.HEROKU_API_KEY
}

provider "herokux" {
  api_key = var.HEROKU_API_KEY
}

provider "aiven" {
  api_token = var.AIVEN_TOKEN
}

provider "upstash" {
  email   = var.UPSTASH_EMAIL
  api_key = var.UPSTASH_API_KEY
}

provider "langsmith" {
  api_key = var.LANGSMITH_API_KEY
}

provider "oci" {
  tenancy_ocid = var.OCI_TENANCY_OCID
  user_ocid    = var.OCI_USER_OCID
  fingerprint  = var.OCI_FINGERPRINT
  private_key  = var.OCI_PRIVATE_KEY
  region       = var.OCI_REGION
}
