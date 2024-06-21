package status

// This code is automatically generated.
// Manual changes will be overwritten upon SDK generation.

import (
	"context"
	"strings"

	"github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/api"
	tephihM "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/bulk/config/status"
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
ReadInput handles input for the Read function.

ShortName: dvnOhnM
Parent chains:
* ReadInput

Args:

Param SiteTemplateId (string, required): Site Template Id
*/
type ReadInput struct {
	SiteTemplateId string `json:"site_template_id"`
}

// Read returns the configuration of the specified object.
//
// Method: get
// URI: /sdwan/v2.0/api/bulkconfigurations/sitetemplates/{site_template_id}/status
func (c *Client) Read(ctx context.Context, input ReadInput) (tephihM.Config, error) {
	// Variables.
	var err error
	var ans tephihM.Config
	path := "/sdwan/v2.0/api/bulkconfigurations/sitetemplates/{site_template_id}/status"

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
	_, err = c.client.Do(ctx, "GET", path, nil, nil, &ans)

	// Done.
	return ans, err
}
