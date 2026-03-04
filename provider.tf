provider "doppler" {
  doppler_token = var.DOPPLER_TOKEN
}

data "doppler_secrets" "this" {
  project = var.DOPPLER_PROJECT
  config  = var.DOPPLER_CONFIG
}

provider "mongodbatlas" {
  public_key  = data.doppler_secrets.this.map["MONGODB_ATLAS_PUBLIC_KEY"]
  private_key = data.doppler_secrets.this.map["MONGODB_ATLAS_PRIVATE_KEY"]
}

provider "supabase" {
  access_token = data.doppler_secrets.this.map["SUPABASE_ACCESS_TOKEN"]
}
