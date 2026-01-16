provider "prismasdwan" {
  client_id     = ""
  client_secret = ""
  scope         = ""
  auth_url      = ""
  host          = ""  
}

terraform {
  required_providers {
    prismasdwan = {
      source  = "paloaltonetworks/prismasdwan"
      version = "0.1.0"
    }
  }
}
