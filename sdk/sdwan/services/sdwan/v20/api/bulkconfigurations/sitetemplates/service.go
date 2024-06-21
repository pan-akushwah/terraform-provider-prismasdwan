package sitetemplates

// This code is automatically generated.
// Manual changes will be overwritten upon SDK generation.

import (
	"context"
	"strings"

	"github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/api"
	hhIWLbI "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/bulk/config/create/screen"
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
CreateInput handles input for the Create function.

ShortName: ljRBvXJ
Parent chains:
* CreateInput

Args:

Param Request (hhIWLbI.Config): the Request param.
*/
type CreateInput struct {
	Request *hhIWLbI.Config `json:"request"`
}

// Create creates the specified object.
//
// Method: post
// URI: /sdwan/v2.0/api/bulkconfigurations/sitetemplates
func (c *Client) Create(ctx context.Context, input CreateInput) (hhIWLbI.Config, error) {
	// Variables.
	var err error
	var ans hhIWLbI.Config
	path := "/sdwan/v2.0/api/bulkconfigurations/sitetemplates"
	prefix, ok := Servers[c.client.GetHost()]
	if !ok {
		return ans, api.UnknownHostError
	}
	if prefix != "" {
		path = prefix + path
	}

	// Execute the command.
	_, err = c.client.Do(ctx, "POST", path, nil, input.Request, &ans)

	// Done.
	return ans, err
}

/*
ReadInput handles input for the Read function.

ShortName: ljRBvXJ
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
// URI: /sdwan/v2.0/api/bulkconfigurations/sitetemplates/{site_template_id}
func (c *Client) Read(ctx context.Context, input ReadInput) (hhIWLbI.Config, error) {
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
	_, err = c.client.Do(ctx, "GET", path, nil, nil, &ans)

	// Done.
	return ans, err
}

/*
DeleteInput handles input for the Delete function.

ShortName: ljRBvXJ
Parent chains:
* DeleteInput

Args:

Param SiteTemplateId (string, required): Site Template Id
*/
type DeleteInput struct {
	SiteTemplateId string `json:"site_template_id"`
}

// Delete removes the specified configuration.
//
// Method: delete
// URI: /sdwan/v2.0/api/bulkconfigurations/sitetemplates/{site_template_id}
func (c *Client) Delete(ctx context.Context, input DeleteInput) (hhIWLbI.Config, error) {
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
	_, err = c.client.Do(ctx, "DELETE", path, nil, nil, &ans)

	// Done.
	return ans, err
}
