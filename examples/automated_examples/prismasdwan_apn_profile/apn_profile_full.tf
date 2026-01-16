resource "prismasdwan_apn_profile" "profile_main" {
  # Required fields
  name           = var.apn_profile_name
  authentication = var.authentication
  
  # Optional APN configuration
  apn            = var.apn
  user_name      = var.user_name
  password       = var.password
  clear_password = var.clear_password
  
  # Optional metadata
  description = var.description
  tags        = var.tags
}