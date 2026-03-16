resource "upstash_qstash_topic_v2" "events" {
  name = var.topic_name

  endpoints = [
    "https://dev-countdown-queries-service.toeichust.me/api/event-listener"
    # "https://countdown-queries-service.toeichust.me/api/event-listener",
  ]
}