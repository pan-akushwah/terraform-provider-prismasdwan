package sitetemplateid

// This code is automatically generated.
// Manual changes will be overwritten upon SDK generation.

import (
	"context"
	"strings"

	"github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/api"
	hhIWLbI "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/bulk/config/create/screen"
	fVAkWHS "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/bulk/config/create/screen/update"
)

// Servers specficiation.
var (
	Servers = map[string]string{
		"api.sase.paloaltonetworks.com":    "",
		"api.strata.paloaltonetworks.com":  "/config/security/v1",
		"qa.api.sase.paloaltonetworks.com": "",
	}
)

// Client is the client for the namespace.
type Client struct {
	client api.Client
}

// NewClient returns a new client for this namespace.
func NewClient(client api.Client) *Client {
	return &Client{client: client}
}

/*
UpdateInput handles input for the Update function.

ShortName: lDGsTGZ
Parent chains:
* UpdateInput

Args:

Param Request (fVAkWHS.Config): the Request param.

Param SiteTemplateId (string, required): Site Template Id
*/
type UpdateInput struct {
	Request        *fVAkWHS.Config `json:"request"`
	SiteTemplateId string          `json:"site_template_id"`
}

// Update modifies the configuration of the given object.
//
// Method: put
// URI: /sdwan/v2.0/api/bulkconfigurations/sitetemplates/{site_template_id}
func (c *Client) Update(ctx context.Context, input UpdateInput) (hhIWLbI.Config, error) {
	// Variables.
	var err error
	var ans hhIWLbI.Config
	path := "/sdwan/v2.0/api/bulkconfigurations/sitetemplates/{site_template_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_template_id}", input.SiteTemplateId)
	prefix, ok := Servers[c.client.GetHost()]
	if !ok {
		return ans, api.UnknownHostError
	}
	if prefix != "" {
		path = prefix + path
	}

	// Execute the command.
	_, err = c.client.Do(ctx, "PUT", path, nil, input.Request, &ans)

	// Done.
	return ans, err
}
