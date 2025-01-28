package services

// This code is automatically generated.
// Manual changes will be overwritten upon SDK generation.

import (
	"context"
	"strings"

	"github.com/bhmj/jsonslice"
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
	Path               string
	FinalPath          *string
	PathParameters     *(map[string]*string)
	Method             string
	RequestBody        *string
	ResponseBytes      *[]byte
	ResponseErr        *error
	ResponseErrorCode  *string
	ResponseStatusCode int
}

// executes a http function using sdwan client implementation
// the request and response data is captured in the same request object for ease of debugging and logging.
func (c *Client) ExecuteSdwanRequest(ctx context.Context, request *SdwanClientRequestResponse) {
	// Variables.
	path := request.Path
	for k, v := range *request.PathParameters {
		path = strings.ReplaceAll(path, "{"+k+"}", *v)
	}
	// Path param handling.
	prefix, ok := Servers[c.client.GetHost()]
	if !ok {
		err := api.UnknownHostError
		request.ResponseErr = &err
	}
	if prefix != "" {
		path = prefix + path
	}
	// set path
	request.FinalPath = &path

	// check for nil
	request_body := ""
	if request.RequestBody == nil {
		request.RequestBody = &request_body
	}

	// Execute the command.
	r_bytes, r_status, r_err := c.client.Do(ctx, request.Method, path, nil, request.RequestBody, nil)
	request.ResponseBytes = &r_bytes
	request.ResponseStatusCode = r_status
	if r_err != nil {
		request.ResponseErr = &r_err
		if len(r_bytes) > 0 {
			err_code, err := jsonslice.Get(r_bytes, "$._error[0].code")
			if err == nil {
				// json slice will give you values with quotes
				err_code_name := string(err_code)
				err_code_name = strings.ReplaceAll(err_code_name, "\"", "")
				request.ResponseErrorCode = &err_code_name
			}
		}
	}
}
