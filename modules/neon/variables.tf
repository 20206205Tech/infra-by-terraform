variable "doppler_secrets_map" {
  type        = map(string)
  sensitive   = true
  description = "Doppler secrets passed from root module"
}

variable "projects" {
  type        = list(string)
  description = "Danh sách tên các project Neon cần tạo"
  default = [
    "dev-test-everything",

    "dev-api-gateway",
    "prod-api-gateway",
    "dev-api-gateway-http-log",
    "prod-api-gateway-http-log",

    "dev-be-ai",
    "prod-be-ai",

    "dev-crawl-data-vbpl",
    "prod-crawl-data-vbpl",

    "dev-crawl-data-luatvietnam",
    "prod-crawl-data-luatvietnam",

    "dev-crawl-data-thuvienphapluat",
    "prod-crawl-data-thuvienphapluat",

    "dev-data-pipeline-vbpl",
    "prod-data-pipeline-vbpl",



    "dev-vector-database",
    "prod-vector-database",



  ]
}
