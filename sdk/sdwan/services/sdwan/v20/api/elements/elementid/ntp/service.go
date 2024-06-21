package ntp

// This code is automatically generated.
// Manual changes will be overwritten upon SDK generation.

import (
	"context"
	"strings"

	"github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/api"
	mSjVWwC "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/element/ntp"
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

ShortName: ctlHcHg
Parent chains:
* ReadInput

Args:

Param ElementId (string, required): Element Id

Param NtpId (string, required): Ntp Id
*/
type ReadInput struct {
	ElementId string `json:"element_id"`
	NtpId     string `json:"ntp_id"`
}

// Read returns the configuration of the specified object.
//
// Method: get
// URI: /sdwan/v2.0/api/elements/{element_id}/ntp/{ntp_id}
func (c *Client) Read(ctx context.Context, input ReadInput) (mSjVWwC.Config, error) {
	// Variables.
	var err error
	var ans mSjVWwC.Config
	path := "/sdwan/v2.0/api/elements/{element_id}/ntp/{ntp_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{element_id}", input.ElementId)
	path = strings.ReplaceAll(path, "{ntp_id}", input.NtpId)
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

ShortName: ctlHcHg
Parent chains:
* UpdateInput

Args:

Param ElementId (string, required): Element Id

Param NtpId (string, required): Ntp Id

Param Request (mSjVWwC.Config): the Request param.
*/
type UpdateInput struct {
	ElementId string          `json:"element_id"`
	NtpId     string          `json:"ntp_id"`
	Request   *mSjVWwC.Config `json:"request"`
}

// Update modifies the configuration of the given object.
//
// Method: put
// URI: /sdwan/v2.0/api/elements/{element_id}/ntp/{ntp_id}
func (c *Client) Update(ctx context.Context, input UpdateInput) (mSjVWwC.Config, error) {
	// Variables.
	var err error
	var ans mSjVWwC.Config
	path := "/sdwan/v2.0/api/elements/{element_id}/ntp/{ntp_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{element_id}", input.ElementId)
	path = strings.ReplaceAll(path, "{ntp_id}", input.NtpId)
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
ListInput handles input for the List function.

ShortName: ctlHcHg
Parent chains:
* ListInput

Args:

Param ElementId (string, required): Element Id
*/
type ListInput struct {
	ElementId string `json:"element_id"`
}

/*
ListOutput handles output for the List function.

ShortName:
Parent chains:
* *Delayed*

Args:

Param Items ([]mSjVWwC.Config): the Items param.

Param TotalItems (int64): the TotalItems param.
*/
type ListOutput struct {
	Items      []mSjVWwC.Config `json:"items"`
	TotalItems *int64           `json:"count"`
}

// List gets a list of objects back.
//
// Method: get
// URI: /sdwan/v2.0/api/elements/{element_id}/ntp
func (c *Client) List(ctx context.Context, input ListInput) (ListOutput, error) {
	// Variables.
	var err error
	var ans ListOutput
	path := "/sdwan/v2.0/api/elements/{element_id}/ntp"

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
