resource "random_string" "this" {
  length           = var.length
  special          = var.special
  override_special = var.override_special
  lower            = var.lower
  upper            = var.upper
  numeric          = var.numeric
  min_lower        = min(var.min_lower, 0)
  min_upper        = min(var.min_upper, 0)
  min_numeric      = min(var.min_numeric, 0)
  min_special      = min(var.min_special, 0)
}
