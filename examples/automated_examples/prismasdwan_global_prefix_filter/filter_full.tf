resource "prismasdwan_global_prefix_filter" "filter_main" {
  # Required fields
  name = var.global_prefix_filter_name
  
  # Required filters field - array of filter objects
  filters = var.filters
  
  # Optional fields
  description = var.description
}