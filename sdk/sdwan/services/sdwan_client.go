package services

// This code is automatically generated.
// Manual changes will be overwritten upon SDK generation.

import (
	"context"
	"encoding/json"
	"os"
	"path/filepath"
	"strconv"
	"strings"
	"time"

	"github.com/bhmj/jsonslice"
	"github.com/google/uuid"
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
	ResourceType       string
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

func (r *SdwanClientRequestResponse) ToString() string {
	json_body, err := json.Marshal(r)
	if err != nil {
		return "json_marhsall_error:" + err.Error()
	}
	return string(json_body)
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

	// dump to file
	if dump_dir, exists := os.LookupEnv("SDWAN_DUMP_PATH_DIR"); exists {
		// create a new file under this directory
		t_stamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
		// file name
		file_name := strings.Join([]string{t_stamp, request.ResourceType, request.Method, uuid.New().String(), "json"}, ".")
		// file path
		file_path := filepath.Join(dump_dir, file_name)
		// write
		os.WriteFile(file_path, []byte(request.ToString()), 0644)
	}

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
