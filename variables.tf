# ==========================================
# CÁC BIẾN SECRET ĐƯỢC SYNC TỪ DOPPLER LÊN TERRAFORM CLOUD
# ==========================================

variable "CLOUDFLARE_API_TOKEN" { type = string, sensitive = true }
variable "CLOUDFLARE_ACCOUNT_ID" { type = string, sensitive = true }

variable "MONGODB_ATLAS_PUBLIC_KEY" { type = string, sensitive = true }
variable "MONGODB_ATLAS_PRIVATE_KEY" { type = string, sensitive = true }
variable "MONGODB_ATLAS_ORG_ID" { type = string, sensitive = true }
variable "MONGODB_DB_PASSWORD" { type = string, sensitive = true }

variable "SUPABASE_ACCESS_TOKEN" { type = string, sensitive = true }
variable "SUPABASE_ORGANIZATION_ID" { type = string, sensitive = true }
variable "SUPABASE_DB_PASSWORD" { type = string, sensitive = true }
variable "GOOGLE_CLIENT_ID" { type = string, sensitive = true }
variable "GOOGLE_CLIENT_SECRET" { type = string, sensitive = true }

variable "NEON_API_KEY" { type = string, sensitive = true }
variable "NEON_ORGANIZATION_ID" { type = string, sensitive = true }

variable "HEROKU_EMAIL" { type = string, sensitive = true }
variable "HEROKU_API_KEY" { type = string, sensitive = true }

variable "AIVEN_TOKEN" { type = string, sensitive = true }
variable "AIVEN_PARENT_ID" { type = string, sensitive = true }

variable "UPSTASH_EMAIL" { type = string, sensitive = true }
variable "UPSTASH_API_KEY" { type = string, sensitive = true }

variable "LANGSMITH_API_KEY" { type = string, sensitive = true }

variable "OCI_TENANCY_OCID" { type = string, sensitive = true }
variable "OCI_USER_OCID" { type = string, sensitive = true }
variable "OCI_FINGERPRINT" { type = string, sensitive = true }
variable "OCI_PRIVATE_KEY" { type = string, sensitive = true }
variable "OCI_REGION" { type = string, sensitive = true }
variable "OCI_SSH_PUBLIC_KEY" { type = string, sensitive = true }