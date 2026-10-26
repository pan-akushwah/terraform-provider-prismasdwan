package api

import (
	"net/http"
	"strings"
	"testing"
)

func TestParseResponse(t *testing.T) {
	data := []byte(`
{
    "_error":[
        {
            "code":"API_I00035",
            "message":"Invalid Request Payload ",
            "details":["\"folder\" is required"]
        }
    ],
    "_request_id":"167e22a1-6250-42f8-8e36-74b8e52f24bb"
}`)

	ans := NewResponse(http.StatusBadRequest, data)

	if !ans.Failed() {
		t.Fatalf("No errors present")
	}

	if len(ans.Errors) != 1 {
		t.Fatalf("Errors is len %d, not 1", len(ans.Errors))
	}

	if ans.Errors[0].Code != "API_I00035" {
		t.Errorf("Code is %q", ans.Errors[0].Code)
	}
	if ans.Errors[0].Message != "Invalid Request Payload " {
		t.Errorf("Message is %q", ans.Errors[0].Message)
	}
	if ans.Errors[0].Details == nil {
		t.Errorf("Details is nil")
	}
}

// The SD-WAN API reports some request errors in _warning with an empty _error; they must not be lost.
func TestResponseErrorFallsBackToWarning(t *testing.T) {
	data := []byte(`{"_status_code":"400","_warning":[{"code":"INVALID_REQUEST_ERROR_0001",
		"message":"Invalid API request: Entity of type PerfMgmtPolicySet"}]}`)
	got := NewResponse(http.StatusBadRequest, data).Error()
	for _, want := range []string{"[HTTP 400]", "INVALID_REQUEST_ERROR_0001", "Entity of type PerfMgmtPolicySet"} {
		if !strings.Contains(got, want) {
			t.Errorf("Error() = %q, missing %q", got, want)
		}
	}
}
