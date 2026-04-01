resource "mongodbatlas_project" "projects" {
  for_each = toset(var.project_names)
  name     = each.value
  org_id   = var.doppler_secrets_map["MONGODB_ATLAS_ORG_ID"]
}

resource "mongodbatlas_cluster" "free_clusters" {
  for_each   = mongodbatlas_project.projects
  project_id = each.value.id
  name       = "${each.key}-Cluster"

  provider_name               = "TENANT"
  backing_provider_name       = "AWS"
  provider_region_name        = "AP_SOUTHEAST_1"
  provider_instance_size_name = "M0"
}

resource "mongodbatlas_project_ip_access_list" "allow_all" {
  for_each   = mongodbatlas_project.projects
  project_id = each.value.id
  cidr_block = "0.0.0.0/0"
  comment    = "Allow access from anywhere for development"
}

resource "mongodbatlas_database_user" "db_user" {
  for_each           = mongodbatlas_project.projects
  username           = "admin"
  password           = var.doppler_secrets_map["MONGODB_DB_PASSWORD"]
  project_id         = each.value.id
  auth_database_name = "admin"

  roles {
    role_name     = "atlasAdmin"
    database_name = "admin"
  }
}
