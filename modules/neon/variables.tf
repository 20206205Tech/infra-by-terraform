variable "doppler_secrets_map" {
  type        = map(string)
  sensitive   = true
  description = "Doppler secrets passed from root module"
}

variable "projects" {
  type        = list(string)
  description = "Danh sách tên các project Neon cần tạo"
  default = [
    "dev-api-gateway",
    "prod-api-gateway",

    "dev-api-gateway-http-log",
    "prod-api-gateway-http-log",

    "dev-be-ai",
    "prod-be-ai",


    "dev-code-be-ai",
    "prod-code-be-ai",


    "dev-crawl-data-luatvietnam",
    "prod-crawl-data-luatvietnam",




    "dev-data-pipeline-vbpl",
    "prod-data-pipeline-vbpl",




    # chat_history


    "dev-persona-service",
    "prod-persona-service",

    "dev-setting-service",
    "prod-setting-service",

    "dev-subscription-service",
    "prod-subscription-service",

    "dev-document-service",
    "prod-document-service",

    "dev-chatbot-service",
    "prod-chatbot-service",





    "dev-everything",
    "prod-everything",

  ]
}
