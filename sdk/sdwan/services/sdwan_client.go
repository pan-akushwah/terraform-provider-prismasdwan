package services

// This code is automatically generated.
// Manual changes will be overwritten upon SDK generation.

import (
	"context"
	"strings"

	"github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/api"
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

// request & response struct
type SdwanClientRequestResponse struct {
	Path           string
	PathParameters *map[string]string
	Method         string
	RequestBody    interface{}
	ResponseBytes  []byte
	ResponseBody   *map[string]interface{}
	ResponseErr    error
}

// executes a http function using sdwan client implementation
func (c *Client) ExecuteSdwanRequest(ctx context.Context, request SdwanClientRequestResponse) {
	// Variables.
	path := request.Path
	for k, v := range *request.PathParameters {
		path = strings.ReplaceAll(path, "{"+k+"}", v)
	}
	// Path param handling.
	prefix, ok := Servers[c.client.GetHost()]
	if !ok {
		request.ResponseErr = api.UnknownHostError
	}
	if prefix != "" {
		path = prefix + path
	}

	// Execute the command.
	request.ResponseBytes, request.ResponseErr = c.client.Do(ctx, request.Method, path, nil, request.RequestBody, request.ResponseBody)
}
