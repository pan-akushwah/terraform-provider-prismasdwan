package dhcpservers

// This code is automatically generated.
// Manual changes will be overwritten upon SDK generation.

import (
	"context"
	"strings"

	"github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/api"
	dEowMJz "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/dhcpserver/screen/v2/n3"
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

ShortName: hHIIBxy
Parent chains:
* CreateInput

Args:

Param Request (dEowMJz.Config): the Request param.

Param SiteId (string, required): Site Id
*/
type CreateInput struct {
	Request *dEowMJz.Config `json:"request"`
	SiteId  string          `json:"site_id"`
}

// Create creates the specified object.
//
// Method: post
// URI: /sdwan/v2.3/api/sites/{site_id}/dhcpservers
func (c *Client) Create(ctx context.Context, input CreateInput) (dEowMJz.Config, error) {
	// Variables.
	var err error
	var ans dEowMJz.Config
	path := "/sdwan/v2.3/api/sites/{site_id}/dhcpservers"

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

ShortName: hHIIBxy
Parent chains:
* ReadInput

Args:

Param DhcpServerId (string, required): Dhcp Server Id

Param SiteId (string, required): Site Id
*/
type ReadInput struct {
	DhcpServerId string `json:"dhcp_server_id"`
	SiteId       string `json:"site_id"`
}

// Read returns the configuration of the specified object.
//
// Method: get
// URI: /sdwan/v2.3/api/sites/{site_id}/dhcpservers/{dhcp_server_id}
func (c *Client) Read(ctx context.Context, input ReadInput) (dEowMJz.Config, error) {
	// Variables.
	var err error
	var ans dEowMJz.Config
	path := "/sdwan/v2.3/api/sites/{site_id}/dhcpservers/{dhcp_server_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_id}", input.SiteId)
	path = strings.ReplaceAll(path, "{dhcp_server_id}", input.DhcpServerId)
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

ShortName: hHIIBxy
Parent chains:
* UpdateInput

Args:

Param DhcpServerId (string, required): Dhcp Server Id

Param Request (dEowMJz.Config): the Request param.

Param SiteId (string, required): Site Id
*/
type UpdateInput struct {
	DhcpServerId string          `json:"dhcp_server_id"`
	Request      *dEowMJz.Config `json:"request"`
	SiteId       string          `json:"site_id"`
}

// Update modifies the configuration of the given object.
//
// Method: put
// URI: /sdwan/v2.3/api/sites/{site_id}/dhcpservers/{dhcp_server_id}
func (c *Client) Update(ctx context.Context, input UpdateInput) (dEowMJz.Config, error) {
	// Variables.
	var err error
	var ans dEowMJz.Config
	path := "/sdwan/v2.3/api/sites/{site_id}/dhcpservers/{dhcp_server_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_id}", input.SiteId)
	path = strings.ReplaceAll(path, "{dhcp_server_id}", input.DhcpServerId)
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

ShortName: hHIIBxy
Parent chains:
* DeleteInput

Args:

Param DhcpServerId (string, required): Dhcp Server Id

Param SiteId (string, required): Site Id
*/
type DeleteInput struct {
	DhcpServerId string `json:"dhcp_server_id"`
	SiteId       string `json:"site_id"`
}

// Delete removes the specified configuration.
//
// Method: delete
// URI: /sdwan/v2.3/api/sites/{site_id}/dhcpservers/{dhcp_server_id}
func (c *Client) Delete(ctx context.Context, input DeleteInput) (dEowMJz.Config, error) {
	// Variables.
	var err error
	var ans dEowMJz.Config
	path := "/sdwan/v2.3/api/sites/{site_id}/dhcpservers/{dhcp_server_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_id}", input.SiteId)
	path = strings.ReplaceAll(path, "{dhcp_server_id}", input.DhcpServerId)
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

ShortName: hHIIBxy
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

Param Items ([]dEowMJz.Config): the Items param.

Param TotalItems (int64): the TotalItems param.
*/
type ListOutput struct {
	Items      []dEowMJz.Config `json:"items"`
	TotalItems *int64           `json:"count"`
}

// List gets a list of objects back.
//
// Method: get
// URI: /sdwan/v2.3/api/sites/{site_id}/dhcpservers
func (c *Client) List(ctx context.Context, input ListInput) (ListOutput, error) {
	// Variables.
	var err error
	var ans ListOutput
	path := "/sdwan/v2.3/api/sites/{site_id}/dhcpservers"

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
