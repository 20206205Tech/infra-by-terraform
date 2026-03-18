provider "doppler" {
  doppler_token = var.DOPPLER_TOKEN
}

data "doppler_secrets" "this" {
  project = var.DOPPLER_PROJECT
  config  = var.DOPPLER_CONFIG
}

provider "cloudflare" {
  api_token = data.doppler_secrets.this.map["CLOUDFLARE_API_TOKEN"]
}

provider "mongodbatlas" {
  public_key  = data.doppler_secrets.this.map["MONGODB_ATLAS_PUBLIC_KEY"]
  private_key = data.doppler_secrets.this.map["MONGODB_ATLAS_PRIVATE_KEY"]
}

provider "supabase" {
  access_token = data.doppler_secrets.this.map["SUPABASE_ACCESS_TOKEN"]
}

provider "neon" {
  api_key = data.doppler_secrets.this.map["NEON_API_KEY"]
}

provider "heroku" {
  email   = data.doppler_secrets.this.map["HEROKU_EMAIL"]
  api_key = data.doppler_secrets.this.map["HEROKU_API_KEY"]
}

provider "herokux" {
  api_key = data.doppler_secrets.this.map["HEROKU_API_KEY"]
}

provider "aiven" {
  api_token = data.doppler_secrets.this.map["AIVEN_TOKEN"]
}

provider "upstash" {
  email   = data.doppler_secrets.this.map["UPSTASH_EMAIL"]
  api_key = data.doppler_secrets.this.map["UPSTASH_API_KEY"]
}

provider "langsmith" {
  api_key = data.doppler_secrets.this.map["LANGSMITH_API_KEY"]
}

provider "checkly" {
  api_key    = data.doppler_secrets.this.map["CHECKLY_API_KEY"]
  account_id = data.doppler_secrets.this.map["CHECKLY_ACCOUNT_ID"]
}
