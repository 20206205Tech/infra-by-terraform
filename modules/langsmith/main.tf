resource "langsmith_project" "this" {
  for_each = var.project_names

  name        = each.key
  description = "Project ${each.key} được tạo tự động qua Terraform"
}
