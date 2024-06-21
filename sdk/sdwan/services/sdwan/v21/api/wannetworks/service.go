package wannetworks

// This code is automatically generated.
// Manual changes will be overwritten upon SDK generation.

import (
	"context"
	"strings"

	"github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/api"
	bQFhoWG "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/wannetwork/screen/v2/n1"
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

ShortName: gOMQArS
Parent chains:
* CreateInput

Args:

Param Request (bQFhoWG.Config): the Request param.
*/
type CreateInput struct {
	Request *bQFhoWG.Config `json:"request"`
}

// Create creates the specified object.
//
// Method: post
// URI: /sdwan/v2.1/api/wannetworks
func (c *Client) Create(ctx context.Context, input CreateInput) (bQFhoWG.Config, error) {
	// Variables.
	var err error
	var ans bQFhoWG.Config
	path := "/sdwan/v2.1/api/wannetworks"
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

ShortName: gOMQArS
Parent chains:
* ReadInput

Args:

Param WanNetworkId (string, required): Wan Network Id
*/
type ReadInput struct {
	WanNetworkId string `json:"wan_network_id"`
}

// Read returns the configuration of the specified object.
//
// Method: get
// URI: /sdwan/v2.1/api/wannetworks/{wan_network_id}
func (c *Client) Read(ctx context.Context, input ReadInput) (bQFhoWG.Config, error) {
	// Variables.
	var err error
	var ans bQFhoWG.Config
	path := "/sdwan/v2.1/api/wannetworks/{wan_network_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{wan_network_id}", input.WanNetworkId)
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

ShortName: gOMQArS
Parent chains:
* UpdateInput

Args:

Param Request (bQFhoWG.Config): the Request param.

Param WanNetworkId (string, required): Wan Network Id
*/
type UpdateInput struct {
	Request      *bQFhoWG.Config `json:"request"`
	WanNetworkId string          `json:"wan_network_id"`
}

// Update modifies the configuration of the given object.
//
// Method: put
// URI: /sdwan/v2.1/api/wannetworks/{wan_network_id}
func (c *Client) Update(ctx context.Context, input UpdateInput) (bQFhoWG.Config, error) {
	// Variables.
	var err error
	var ans bQFhoWG.Config
	path := "/sdwan/v2.1/api/wannetworks/{wan_network_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{wan_network_id}", input.WanNetworkId)
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

ShortName: gOMQArS
Parent chains:
* DeleteInput

Args:

Param WanNetworkId (string, required): Wan Network Id
*/
type DeleteInput struct {
	WanNetworkId string `json:"wan_network_id"`
}

// Delete removes the specified configuration.
//
// Method: delete
// URI: /sdwan/v2.1/api/wannetworks/{wan_network_id}
func (c *Client) Delete(ctx context.Context, input DeleteInput) (bQFhoWG.Config, error) {
	// Variables.
	var err error
	var ans bQFhoWG.Config
	path := "/sdwan/v2.1/api/wannetworks/{wan_network_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{wan_network_id}", input.WanNetworkId)
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

Param Items ([]bQFhoWG.Config): the Items param.

Param TotalItems (int64): the TotalItems param.
*/
type ListOutput struct {
	Items      []bQFhoWG.Config `json:"items"`
	TotalItems *int64           `json:"count"`
}

// List gets a list of objects back.
//
// Method: get
// URI: /sdwan/v2.1/api/wannetworks
func (c *Client) List(ctx context.Context) (ListOutput, error) {
	// Variables.
	var err error
	var ans ListOutput
	path := "/sdwan/v2.1/api/wannetworks"
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
