package waninterfaces

// This code is automatically generated.
// Manual changes will be overwritten upon SDK generation.

import (
	"context"
	"strings"

	"github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/api"
	uAgupQd "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/waninterface/screen/v2/n8"
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

ShortName: ccUusFA
Parent chains:
* CreateInput

Args:

Param Request (uAgupQd.Config): the Request param.

Param SiteId (string, required): Site Id
*/
type CreateInput struct {
	Request *uAgupQd.Config `json:"request"`
	SiteId  string          `json:"site_id"`
}

// Create creates the specified object.
//
// Method: post
// URI: /sdwan/v2.8/api/sites/{site_id}/waninterfaces
func (c *Client) Create(ctx context.Context, input CreateInput) (uAgupQd.Config, error) {
	// Variables.
	var err error
	var ans uAgupQd.Config
	path := "/sdwan/v2.8/api/sites/{site_id}/waninterfaces"

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
	_, err = c.client.Do(ctx, "POST", path, nil, input.Request, &ans)

	// Done.
	return ans, err
}

/*
ReadInput handles input for the Read function.

ShortName: ccUusFA
Parent chains:
* ReadInput

Args:

Param SiteId (string, required): Site Id

Param WanInterfaceId (string, required): Wan Interface Id
*/
type ReadInput struct {
	SiteId         string `json:"site_id"`
	WanInterfaceId string `json:"wan_interface_id"`
}

// Read returns the configuration of the specified object.
//
// Method: get
// URI: /sdwan/v2.8/api/sites/{site_id}/waninterfaces/{wan_interface_id}
func (c *Client) Read(ctx context.Context, input ReadInput) (uAgupQd.Config, error) {
	// Variables.
	var err error
	var ans uAgupQd.Config
	path := "/sdwan/v2.8/api/sites/{site_id}/waninterfaces/{wan_interface_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_id}", input.SiteId)
	path = strings.ReplaceAll(path, "{wan_interface_id}", input.WanInterfaceId)
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

ShortName: ccUusFA
Parent chains:
* UpdateInput

Args:

Param Request (uAgupQd.Config): the Request param.

Param SiteId (string, required): Site Id

Param WanInterfaceId (string, required): Wan Interface Id
*/
type UpdateInput struct {
	Request        *uAgupQd.Config `json:"request"`
	SiteId         string          `json:"site_id"`
	WanInterfaceId string          `json:"wan_interface_id"`
}

// Update modifies the configuration of the given object.
//
// Method: put
// URI: /sdwan/v2.8/api/sites/{site_id}/waninterfaces/{wan_interface_id}
func (c *Client) Update(ctx context.Context, input UpdateInput) (uAgupQd.Config, error) {
	// Variables.
	var err error
	var ans uAgupQd.Config
	path := "/sdwan/v2.8/api/sites/{site_id}/waninterfaces/{wan_interface_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_id}", input.SiteId)
	path = strings.ReplaceAll(path, "{wan_interface_id}", input.WanInterfaceId)
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

ShortName: ccUusFA
Parent chains:
* DeleteInput

Args:

Param SiteId (string, required): Site Id

Param WanInterfaceId (string, required): Wan Interface Id
*/
type DeleteInput struct {
	SiteId         string `json:"site_id"`
	WanInterfaceId string `json:"wan_interface_id"`
}

// Delete removes the specified configuration.
//
// Method: delete
// URI: /sdwan/v2.8/api/sites/{site_id}/waninterfaces/{wan_interface_id}
func (c *Client) Delete(ctx context.Context, input DeleteInput) (uAgupQd.Config, error) {
	// Variables.
	var err error
	var ans uAgupQd.Config
	path := "/sdwan/v2.8/api/sites/{site_id}/waninterfaces/{wan_interface_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_id}", input.SiteId)
	path = strings.ReplaceAll(path, "{wan_interface_id}", input.WanInterfaceId)
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
ListInput handles input for the List function.

ShortName: ccUusFA
Parent chains:
* ListInput

Args:

Param SiteId (string, required): Site Id
*/
type ListInput struct {
	SiteId string `json:"site_id"`
}

/*
ListOutput handles output for the List function.

ShortName:
Parent chains:
* *Delayed*

Args:

Param Items ([]uAgupQd.Config): the Items param.

Param TotalItems (int64): the TotalItems param.
*/
type ListOutput struct {
	Items      []uAgupQd.Config `json:"items"`
	TotalItems *int64           `json:"count"`
}

// List gets a list of objects back.
//
// Method: get
// URI: /sdwan/v2.8/api/sites/{site_id}/waninterfaces
func (c *Client) List(ctx context.Context, input ListInput) (ListOutput, error) {
	// Variables.
	var err error
	var ans ListOutput
	path := "/sdwan/v2.8/api/sites/{site_id}/waninterfaces"

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
