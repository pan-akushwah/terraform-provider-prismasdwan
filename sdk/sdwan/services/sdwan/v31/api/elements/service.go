package elements

// This code is automatically generated.
// Manual changes will be overwritten upon SDK generation.

import (
	"context"
	"strings"

	"github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/api"
	nNBVXzb "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/element/screen/v3/n1"
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

ShortName: fZwFwyb
Parent chains:
* ReadInput

Args:

Param ElementId (string, required): Element Id
*/
type ReadInput struct {
	ElementId string `json:"element_id"`
}

// Read returns the configuration of the specified object.
//
// Method: get
// URI: /sdwan/v3.1/api/elements/{element_id}
func (c *Client) Read(ctx context.Context, input ReadInput) (nNBVXzb.Config, error) {
	// Variables.
	var err error
	var ans nNBVXzb.Config
	path := "/sdwan/v3.1/api/elements/{element_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{element_id}", input.ElementId)
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

ShortName: fZwFwyb
Parent chains:
* UpdateInput

Args:

Param ElementId (string, required): Element Id

Param Request (nNBVXzb.Config): the Request param.
*/
type UpdateInput struct {
	ElementId string          `json:"element_id"`
	Request   *nNBVXzb.Config `json:"request"`
}

// Update modifies the configuration of the given object.
//
// Method: put
// URI: /sdwan/v3.1/api/elements/{element_id}
func (c *Client) Update(ctx context.Context, input UpdateInput) (nNBVXzb.Config, error) {
	// Variables.
	var err error
	var ans nNBVXzb.Config
	path := "/sdwan/v3.1/api/elements/{element_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{element_id}", input.ElementId)
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
ListOutput handles output for the List function.

ShortName:
Parent chains:
* *Delayed*

Args:

Param Items ([]nNBVXzb.Config): the Items param.

Param TotalItems (int64): the TotalItems param.
*/
type ListOutput struct {
	Items      []nNBVXzb.Config `json:"items"`
	TotalItems *int64           `json:"count"`
}

// List gets a list of objects back.
//
// Method: get
// URI: /sdwan/v3.1/api/elements
func (c *Client) List(ctx context.Context) (ListOutput, error) {
	// Variables.
	var err error
	var ans ListOutput
	path := "/sdwan/v3.1/api/elements"
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
