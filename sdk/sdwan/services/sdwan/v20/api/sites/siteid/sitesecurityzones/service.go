package sitesecurityzones

// This code is automatically generated.
// Manual changes will be overwritten upon SDK generation.

import (
	"context"
	"strings"

	"github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/api"
	eItpily "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/security/zone/network/association"
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

ShortName: xCzsxgj
Parent chains:
* CreateInput

Args:

Param Request (eItpily.Config): the Request param.

Param SiteId (string, required): Site Id
*/
type CreateInput struct {
	Request *eItpily.Config `json:"request"`
	SiteId  string          `json:"site_id"`
}

// Create creates the specified object.
//
// Method: post
// URI: /sdwan/v2.0/api/sites/{site_id}/sitesecurityzones
func (c *Client) Create(ctx context.Context, input CreateInput) (eItpily.Config, error) {
	// Variables.
	var err error
	var ans eItpily.Config
	path := "/sdwan/v2.0/api/sites/{site_id}/sitesecurityzones"

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

ShortName: xCzsxgj
Parent chains:
* ReadInput

Args:

Param SiteId (string, required): Site Id

Param ZoneId (string, required): Zone Id
*/
type ReadInput struct {
	SiteId string `json:"site_id"`
	ZoneId string `json:"zone_id"`
}

// Read returns the configuration of the specified object.
//
// Method: get
// URI: /sdwan/v2.0/api/sites/{site_id}/sitesecurityzones/{zone_id}
func (c *Client) Read(ctx context.Context, input ReadInput) (eItpily.Config, error) {
	// Variables.
	var err error
	var ans eItpily.Config
	path := "/sdwan/v2.0/api/sites/{site_id}/sitesecurityzones/{zone_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_id}", input.SiteId)
	path = strings.ReplaceAll(path, "{zone_id}", input.ZoneId)
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

ShortName: xCzsxgj
Parent chains:
* UpdateInput

Args:

Param Request (eItpily.Config): the Request param.

Param SiteId (string, required): Site Id

Param ZoneId (string, required): Zone Id
*/
type UpdateInput struct {
	Request *eItpily.Config `json:"request"`
	SiteId  string          `json:"site_id"`
	ZoneId  string          `json:"zone_id"`
}

// Update modifies the configuration of the given object.
//
// Method: put
// URI: /sdwan/v2.0/api/sites/{site_id}/sitesecurityzones/{zone_id}
func (c *Client) Update(ctx context.Context, input UpdateInput) (eItpily.Config, error) {
	// Variables.
	var err error
	var ans eItpily.Config
	path := "/sdwan/v2.0/api/sites/{site_id}/sitesecurityzones/{zone_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_id}", input.SiteId)
	path = strings.ReplaceAll(path, "{zone_id}", input.ZoneId)
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

ShortName: xCzsxgj
Parent chains:
* DeleteInput

Args:

Param SiteId (string, required): Site Id

Param ZoneId (string, required): Zone Id
*/
type DeleteInput struct {
	SiteId string `json:"site_id"`
	ZoneId string `json:"zone_id"`
}

// Delete removes the specified configuration.
//
// Method: delete
// URI: /sdwan/v2.0/api/sites/{site_id}/sitesecurityzones/{zone_id}
func (c *Client) Delete(ctx context.Context, input DeleteInput) (eItpily.Config, error) {
	// Variables.
	var err error
	var ans eItpily.Config
	path := "/sdwan/v2.0/api/sites/{site_id}/sitesecurityzones/{zone_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_id}", input.SiteId)
	path = strings.ReplaceAll(path, "{zone_id}", input.ZoneId)
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

ShortName: xCzsxgj
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

Param Items ([]eItpily.Config): the Items param.

Param TotalItems (int64): the TotalItems param.
*/
type ListOutput struct {
	Items      []eItpily.Config `json:"items"`
	TotalItems *int64           `json:"count"`
}

// List gets a list of objects back.
//
// Method: get
// URI: /sdwan/v2.0/api/sites/{site_id}/sitesecurityzones
func (c *Client) List(ctx context.Context, input ListInput) (ListOutput, error) {
	// Variables.
	var err error
	var ans ListOutput
	path := "/sdwan/v2.0/api/sites/{site_id}/sitesecurityzones"

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
