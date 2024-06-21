package deployments

// This code is automatically generated.
// Manual changes will be overwritten upon SDK generation.

import (
	"context"
	"strings"

	"github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/api"
	ljnPEAA "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/bulk/config/push/screen"
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

ShortName: xNwmFxK
Parent chains:
* CreateInput

Args:

Param Request (ljnPEAA.Config): the Request param.

Param SiteTemplateId (string, required): Site Template Id
*/
type CreateInput struct {
	Request        *ljnPEAA.Config `json:"request"`
	SiteTemplateId string          `json:"site_template_id"`
}

// Create creates the specified object.
//
// Method: post
// URI: /sdwan/v2.0/api/bulkconfigurations/sitetemplates/{site_template_id}/deployments
func (c *Client) Create(ctx context.Context, input CreateInput) (ljnPEAA.Config, error) {
	// Variables.
	var err error
	var ans ljnPEAA.Config
	path := "/sdwan/v2.0/api/bulkconfigurations/sitetemplates/{site_template_id}/deployments"

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
	_, err = c.client.Do(ctx, "POST", path, nil, input.Request, &ans)

	// Done.
	return ans, err
}

/*
ReadInput handles input for the Read function.

ShortName: xNwmFxK
Parent chains:
* ReadInput

Args:

Param DeploymentId (string, required): Deployment Id

Param SiteTemplateId (string, required): Site Template Id
*/
type ReadInput struct {
	DeploymentId   string `json:"deployment_id"`
	SiteTemplateId string `json:"site_template_id"`
}

// Read returns the configuration of the specified object.
//
// Method: get
// URI: /sdwan/v2.0/api/bulkconfigurations/sitetemplates/{site_template_id}/deployments/{deployment_id}
func (c *Client) Read(ctx context.Context, input ReadInput) (ljnPEAA.Config, error) {
	// Variables.
	var err error
	var ans ljnPEAA.Config
	path := "/sdwan/v2.0/api/bulkconfigurations/sitetemplates/{site_template_id}/deployments/{deployment_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_template_id}", input.SiteTemplateId)
	path = strings.ReplaceAll(path, "{deployment_id}", input.DeploymentId)
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

ShortName: xNwmFxK
Parent chains:
* DeleteInput

Args:

Param DeploymentId (string, required): Deployment Id

Param SiteTemplateId (string, required): Site Template Id
*/
type DeleteInput struct {
	DeploymentId   string `json:"deployment_id"`
	SiteTemplateId string `json:"site_template_id"`
}

// Delete removes the specified configuration.
//
// Method: delete
// URI: /sdwan/v2.0/api/bulkconfigurations/sitetemplates/{site_template_id}/deployments/{deployment_id}
func (c *Client) Delete(ctx context.Context, input DeleteInput) (ljnPEAA.Config, error) {
	// Variables.
	var err error
	var ans ljnPEAA.Config
	path := "/sdwan/v2.0/api/bulkconfigurations/sitetemplates/{site_template_id}/deployments/{deployment_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_template_id}", input.SiteTemplateId)
	path = strings.ReplaceAll(path, "{deployment_id}", input.DeploymentId)
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
