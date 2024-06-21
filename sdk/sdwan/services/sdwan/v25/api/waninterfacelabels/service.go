package waninterfacelabels

// This code is automatically generated.
// Manual changes will be overwritten upon SDK generation.

import (
	"context"
	"strings"

	"github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/api"
	rrePbcM "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/waninterface/label/screen/v2/n5"
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

ShortName: iujuWin
Parent chains:
* ReadInput

Args:

Param WantinterfaceLabelId (string, required): Wantinterface Label Id
*/
type ReadInput struct {
	WantinterfaceLabelId string `json:"wantinterface_label_id"`
}

// Read returns the configuration of the specified object.
//
// Method: get
// URI: /sdwan/v2.5/api/waninterfacelabels/{wantinterface_label_id}
func (c *Client) Read(ctx context.Context, input ReadInput) (rrePbcM.Config, error) {
	// Variables.
	var err error
	var ans rrePbcM.Config
	path := "/sdwan/v2.5/api/waninterfacelabels/{wantinterface_label_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{wantinterface_label_id}", input.WantinterfaceLabelId)
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

ShortName: iujuWin
Parent chains:
* UpdateInput

Args:

Param Request (rrePbcM.Config): the Request param.

Param WantinterfaceLabelId (string, required): Wantinterface Label Id
*/
type UpdateInput struct {
	Request              *rrePbcM.Config `json:"request"`
	WantinterfaceLabelId string          `json:"wantinterface_label_id"`
}

// Update modifies the configuration of the given object.
//
// Method: put
// URI: /sdwan/v2.5/api/waninterfacelabels/{wantinterface_label_id}
func (c *Client) Update(ctx context.Context, input UpdateInput) (rrePbcM.Config, error) {
	// Variables.
	var err error
	var ans rrePbcM.Config
	path := "/sdwan/v2.5/api/waninterfacelabels/{wantinterface_label_id}"

	// Path param handling.
	path = strings.ReplaceAll(path, "{wantinterface_label_id}", input.WantinterfaceLabelId)
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

Param Items ([]rrePbcM.Config): the Items param.

Param TotalItems (int64): the TotalItems param.
*/
type ListOutput struct {
	Items      []rrePbcM.Config `json:"items"`
	TotalItems *int64           `json:"count"`
}

// List gets a list of objects back.
//
// Method: get
// URI: /sdwan/v2.5/api/waninterfacelabels
func (c *Client) List(ctx context.Context) (ListOutput, error) {
	// Variables.
	var err error
	var ans ListOutput
	path := "/sdwan/v2.5/api/waninterfacelabels"
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
