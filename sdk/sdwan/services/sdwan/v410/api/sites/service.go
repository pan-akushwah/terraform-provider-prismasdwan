package sites

// This code is automatically generated.
// Manual changes will be overwritten upon SDK generation.

import (
	"context"
	"strings"

	"github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/api"
	uewNibC "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/site/screen/v4/n10"
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

ShortName: vMYBRZK
Parent chains:
* CreateInput

Args:

Param Request (uewNibC.Config): the Request param.
*/
type CreateInput struct {
	Request *uewNibC.Config `json:"request"`
}

// Create creates the specified object.
//
// Method: post
// URI: /sdwan/v4.10/api/sites
func (c *Client) Create(ctx context.Context, input CreateInput) (uewNibC.Config, error) {
	// Variables.
	var err error
	var ans uewNibC.Config
	path := "/sdwan/v4.10/api/sites"
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

ShortName: vMYBRZK
Parent chains:
* ReadInput

Args:

Param SiteId (string, required): Site Id
*/
type ReadInput struct {
	SiteId string `json:"site_id"`
}

// Read returns the configuration of the specified object.
//
// Method: get
// URI: /sdwan/v4.10/api/sites/{site_id}
func (c *Client) Read(ctx context.Context, input ReadInput) (uewNibC.Config, error) {
	// Variables.
	var err error
	var ans uewNibC.Config
	path := "/sdwan/v4.10/api/sites/{site_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_id}", input.SiteId)
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
UpdateInput handles input for the Update function.

ShortName: vMYBRZK
Parent chains:
* UpdateInput

Args:

Param Request (uewNibC.Config): the Request param.

Param SiteId (string, required): Site Id
*/
type UpdateInput struct {
	Request *uewNibC.Config `json:"request"`
	SiteId  string          `json:"site_id"`
}

// Update modifies the configuration of the given object.
//
// Method: put
// URI: /sdwan/v4.10/api/sites/{site_id}
func (c *Client) Update(ctx context.Context, input UpdateInput) (uewNibC.Config, error) {
	// Variables.
	var err error
	var ans uewNibC.Config
	path := "/sdwan/v4.10/api/sites/{site_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_id}", input.SiteId)
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

/*
DeleteInput handles input for the Delete function.

ShortName: vMYBRZK
Parent chains:
* DeleteInput

Args:

Param SiteId (string, required): Site Id
*/
type DeleteInput struct {
	SiteId string `json:"site_id"`
}

// Delete removes the specified configuration.
//
// Method: delete
// URI: /sdwan/v4.10/api/sites/{site_id}
func (c *Client) Delete(ctx context.Context, input DeleteInput) (uewNibC.Config, error) {
	// Variables.
	var err error
	var ans uewNibC.Config
	path := "/sdwan/v4.10/api/sites/{site_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_id}", input.SiteId)
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

/*
ListOutput handles output for the List function.

ShortName:
Parent chains:
* *Delayed*

Args:

Param Items ([]uewNibC.Config): the Items param.

Param TotalItems (int64): the TotalItems param.
*/
type ListOutput struct {
	Items      []uewNibC.Config `json:"items"`
	TotalItems *int64           `json:"count"`
}

// List gets a list of objects back.
//
// Method: get
// URI: /sdwan/v4.10/api/sites
func (c *Client) List(ctx context.Context) (ListOutput, error) {
	// Variables.
	var err error
	var ans ListOutput
	path := "/sdwan/v4.10/api/sites"
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
