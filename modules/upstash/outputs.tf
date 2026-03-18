output "topic_id" {
  description = "ID của QStash Topic"
  value       = upstash_qstash_topic_v2.events.id
}

output "topic_name" {
  description = "Tên của QStash Topic"
  value       = upstash_qstash_topic_v2.events.name
}