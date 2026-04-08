variable "doppler_secrets_map" {
  type      = map(string)
  sensitive = true
}

variable "project_names" {
  type        = set(string)
  description = "Danh sách tên các dự án cần tạo"
  default = [
    "project-chatbot-by-terraform",
    "project-document-by-terraform"
  ]
}
