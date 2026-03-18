output "mongodb_cluster_ids" {
  description = "Danh sách ID các cluster MongoDB đã tạo"
  value = {
    for k, v in mongodbatlas_cluster.free_clusters : k => v.cluster_id
  }
}