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

    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 1.16.0"
    }

    supabase = {
      source  = "supabase/supabase"
      version = "~> 1.0"
    }
  }
}
