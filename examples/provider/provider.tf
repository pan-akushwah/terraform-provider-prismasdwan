provider "prismasdwan" {
  client_id     = "your-id@12345"
  client_secret = "secret"
  scope         = "tsg_id:12345"
}

terraform {
  required_providers {
    prismasdwan = {
      source  = "paloaltonetworks/terraform-provider-prismasdwan"
      version = "0.1.0"
    }
  }
}
