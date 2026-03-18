output "neon_project_ids" {
  description = "Danh sách ID các project Neon đã tạo"
  value = {
    for k, v in neon_project.this : k => v.id
  }
}