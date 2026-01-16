terraform {
  required_providers {
    prismasdwan = {
      source  = "paloaltonetworks/prismasdwan"
      version = "6.5.2-ga.1"
    }
  }
}

provider "prismasdwan" {
  client_id     = "terraform_client@123456.iam.panserviceaccount.com"
  client_secret = "9ec3b7d9-c7e5-4779-a413-34072db36e68"
  scope         = "tsg_id:123456"
}
