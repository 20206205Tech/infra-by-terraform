resource "langsmith_project" "this" {
  name        = var.project_name
  description = "Project được tạo tự động qua Terraform"
}