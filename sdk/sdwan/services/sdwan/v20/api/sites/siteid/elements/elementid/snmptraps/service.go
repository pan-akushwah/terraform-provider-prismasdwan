package snmptraps

// This code is automatically generated.
// Manual changes will be overwritten upon SDK generation.

import (
	"context"
	"strings"

	"github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/api"
	uzXNpRw "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/snmptrap"
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

ShortName: zAHtTyI
Parent chains:
* CreateInput

Args:

Param ElementId (string, required): Element Id

Param Request (uzXNpRw.Config): the Request param.

Param SiteId (string, required): Site Id
*/
type CreateInput struct {
	ElementId string          `json:"element_id"`
	Request   *uzXNpRw.Config `json:"request"`
	SiteId    string          `json:"site_id"`
}

// Create creates the specified object.
//
// Method: post
// URI: /sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/snmptraps
func (c *Client) Create(ctx context.Context, input CreateInput) (uzXNpRw.Config, error) {
	// Variables.
	var err error
	var ans uzXNpRw.Config
	path := "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/snmptraps"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_id}", input.SiteId)
	path = strings.ReplaceAll(path, "{element_id}", input.ElementId)
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

ShortName: zAHtTyI
Parent chains:
* ReadInput

Args:

Param ElementId (string, required): Element Id

Param SiteId (string, required): Site Id

Param SnmptrapId (string, required): Snmptrap Id
*/
type ReadInput struct {
	ElementId  string `json:"element_id"`
	SiteId     string `json:"site_id"`
	SnmptrapId string `json:"snmptrap_id"`
}

// Read returns the configuration of the specified object.
//
// Method: get
// URI: /sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/snmptraps/{snmptrap_id}
func (c *Client) Read(ctx context.Context, input ReadInput) (uzXNpRw.Config, error) {
	// Variables.
	var err error
	var ans uzXNpRw.Config
	path := "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/snmptraps/{snmptrap_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_id}", input.SiteId)
	path = strings.ReplaceAll(path, "{element_id}", input.ElementId)
	path = strings.ReplaceAll(path, "{snmptrap_id}", input.SnmptrapId)
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

ShortName: zAHtTyI
Parent chains:
* UpdateInput

Args:

Param ElementId (string, required): Element Id

Param Request (uzXNpRw.Config): the Request param.

Param SiteId (string, required): Site Id

Param SnmptrapId (string, required): Snmptrap Id
*/
type UpdateInput struct {
	ElementId  string          `json:"element_id"`
	Request    *uzXNpRw.Config `json:"request"`
	SiteId     string          `json:"site_id"`
	SnmptrapId string          `json:"snmptrap_id"`
}

// Update modifies the configuration of the given object.
//
// Method: put
// URI: /sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/snmptraps/{snmptrap_id}
func (c *Client) Update(ctx context.Context, input UpdateInput) (uzXNpRw.Config, error) {
	// Variables.
	var err error
	var ans uzXNpRw.Config
	path := "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/snmptraps/{snmptrap_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_id}", input.SiteId)
	path = strings.ReplaceAll(path, "{element_id}", input.ElementId)
	path = strings.ReplaceAll(path, "{snmptrap_id}", input.SnmptrapId)
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

ShortName: zAHtTyI
Parent chains:
* DeleteInput

Args:

Param ElementId (string, required): Element Id

Param SiteId (string, required): Site Id

Param SnmptrapId (string, required): Snmptrap Id
*/
type DeleteInput struct {
	ElementId  string `json:"element_id"`
	SiteId     string `json:"site_id"`
	SnmptrapId string `json:"snmptrap_id"`
}

// Delete removes the specified configuration.
//
// Method: delete
// URI: /sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/snmptraps/{snmptrap_id}
func (c *Client) Delete(ctx context.Context, input DeleteInput) (uzXNpRw.Config, error) {
	// Variables.
	var err error
	var ans uzXNpRw.Config
	path := "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/snmptraps/{snmptrap_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_id}", input.SiteId)
	path = strings.ReplaceAll(path, "{element_id}", input.ElementId)
	path = strings.ReplaceAll(path, "{snmptrap_id}", input.SnmptrapId)
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

ShortName: zAHtTyI
Parent chains:
* ListInput

Args:

Param ElementId (string, required): Element Id

Param SiteId (string, required): Site Id
*/
type ListInput struct {
	ElementId string `json:"element_id"`
	SiteId    string `json:"site_id"`
}

/*
ListOutput handles output for the List function.

ShortName:
Parent chains:
* *Delayed*

Args:

Param Items ([]uzXNpRw.Config): the Items param.

Param TotalItems (int64): the TotalItems param.
*/
type ListOutput struct {
	Items      []uzXNpRw.Config `json:"items"`
	TotalItems *int64           `json:"count"`
}

// List gets a list of objects back.
//
// Method: get
// URI: /sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/snmptraps
func (c *Client) List(ctx context.Context, input ListInput) (ListOutput, error) {
	// Variables.
	var err error
	var ans ListOutput
	path := "/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/snmptraps"

	// Path param handling.
	path = strings.ReplaceAll(path, "{site_id}", input.SiteId)
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
