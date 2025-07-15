package provider

import (
	"github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/api"
)

func IsObjectNotFound(e error) bool {
	return e == api.ObjectNotFoundError
}
