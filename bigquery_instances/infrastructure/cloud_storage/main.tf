resource "google_storage_bucket" "this" {
  name          = "kfai_customer_feedback"
  location      = var.location
  force_destroy = true

  uniform_bucket_level_access = true
}