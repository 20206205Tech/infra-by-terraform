resource "upstash_qstash_topic_v2" "events" {
  name = "events"

  endpoints = [
    "https://example.com",
    # "https://dev-countdown-queries-service.20206205.tech/api/event-listener"
    # "https://countdown-queries-service.20206205.tech/api/event-listener",
  ]
}
