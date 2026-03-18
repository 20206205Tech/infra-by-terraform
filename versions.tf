terraform {
  cloud {
    organization = "20206205tech"

    workspaces {
      name = "infra-by-terraform"
    }
  }

  required_providers {
    doppler = {
      source  = "DopplerHQ/doppler"
      version = "1.21.1"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 1.16.0"
    }
    supabase = {
      source  = "supabase/supabase"
      version = "~> 1.0"
    }
    neon = {
      source  = "kislerdm/neon"
      version = "~> 0.6.0"
    }
    heroku = {
      source  = "heroku/heroku"
      version = "~> 5.0"
    }
    herokux = {
      source  = "davidji99/herokux"
      version = "~> 0.0"
    }
    aiven = {
      source  = "aiven/aiven"
      version = ">= 4.0.0"
    }
    upstash = {
      source  = "upstash/upstash"
      version = "2.1.0"
    }
    langsmith = {
      source  = "bogware/langsmith"
      version = "~> 0.8.0"
    }
    cronjoborg = {
      source  = "plain-insure/cronjoborg"
      version = "~> 1.0"
    }
  }
}
