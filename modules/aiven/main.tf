resource "aiven_project" "this" {
  project   = "vuvannghia-by-terraform"
  parent_id = var.doppler_secrets_map["AIVEN_PARENT_ID"]
}


resource "aiven_kafka" "kafka_srv" {
  project      = aiven_project.this.project
  cloud_name   = "do-sgp"
  plan         = "free-0"
  service_name = "kafka-by-terraform"


  kafka_user_config {
    kafka_version   = "4.1"
    kafka_rest    = true
    kafka_connect = false
    schema_registry = true


    public_access {
      kafka_rest    = true
      kafka_connect = false
    }
  }
}


resource "aiven_kafka_topic" "test_topic" {
  project      = aiven_project.this.project
  service_name = aiven_kafka.kafka_srv.service_name
  topic_name   = "test-events"
  partitions   = 1
  replication  = 2  
}