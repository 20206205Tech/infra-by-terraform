output "project_ids" {
  description = "Danh sách ID của các project đã được tạo"
  value       = { for k, project in langsmith_project.this : k => project.id }
}
