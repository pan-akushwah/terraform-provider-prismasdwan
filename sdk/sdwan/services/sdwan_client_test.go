package services

import (
	"context"
	"strings"
	"testing"
)

// CGSDW-41556: a path with an unreplaced "{param}" must fail before any request is sent (the API answers an
// opaque HTTP 502). The client has no HTTP backend, so sending would panic.
func TestExecuteSdwanRequestMissingPathParameters(t *testing.T) {
	tests := []struct {
		path   string
		params map[string]*string
		want   string
	}{
		{"/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/deviceidconfigs", map[string]*string{},
			`path parameter "site_id" is required; set x_parameters.site_id, x_parameters.element_id`},
		{"/sdwan/v2.3/api/perfmgmtpolicysets/{perfmgmtpolicyset_id}/perfmgmtpolicyrules", map[string]*string{},
			`path parameter "perfmgmtpolicyset_id" is required; set x_parameters.perfmgmtpolicyset_id`},
		{"/sdwan/v2.0/api/sites/{site_id}/elements/{element_id}/deviceidconfigs", map[string]*string{"site_id": ptr("123")},
			`path parameter "element_id" is required; set x_parameters.element_id`},
	}
	for _, tt := range tests {
		t.Run(tt.path, func(t *testing.T) {
			params := tt.params
			request := &SdwanClientRequestResponse{Method: "POST", Path: tt.path, PathParameters: &params}
			(&Client{}).ExecuteSdwanRequest(context.Background(), request)
			if request.ResponseErr == nil {
				t.Fatal("expected an error before sending")
			}
			if got := (*request.ResponseErr).Error(); !strings.HasPrefix(got, tt.want) {
				t.Errorf("error = %q, want prefix %q", got, tt.want)
			}
		})
	}
}

func ptr(s string) *string { return &s }
