output "kafka_project_name" {
  description = "Tên project Aiven"
  value       = aiven_project.this.project
}

output "kafka_service_uri" {
  description = "URI kết nối đến Kafka service"
  value       = aiven_kafka.kafka_srv.service_uri
  sensitive   = true
}