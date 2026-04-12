variable "setting_service_projects" {
  type    = list(string)
  default = ["dev-setting-service", "prod-setting-service"]
}

resource "neon_project" "setting_service" {
  for_each = toset(var.setting_service_projects)

  org_id    = var.doppler_secrets_map["NEON_ORGANIZATION_ID"]
  name      = each.key
  region_id = "aws-ap-southeast-1"

  history_retention_seconds = 21600
}
