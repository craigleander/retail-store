resource "time_sleep" "this" {
  create_duration  = var.create_duration
  destroy_duration = var.destroy_duration
}
