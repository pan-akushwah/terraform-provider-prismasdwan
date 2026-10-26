package provider

import (
	"testing"

	"github.com/hashicorp/terraform-plugin-framework/attr"
	"github.com/hashicorp/terraform-plugin-framework/types"
)

func stringList(items ...string) types.List {
	values := make([]attr.Value, 0, len(items))
	for _, item := range items {
		values = append(values, types.StringValue(item))
	}
	return types.ListValueMust(types.StringType, values)
}

func TestListEqualIgnoringAdditions(t *testing.T) {
	tests := []struct {
		name      string
		have      types.List
		want      types.List
		additions []string
		expected  bool
	}{
		{"identical", stringList("A", "B"), stringList("A", "B"), nil, true},
		{"allowed addition", stringList("A", "B", "VRF_NAME"), stringList("A", "B"), []string{"VRF_NAME"}, true},
		{"order ignored", stringList("VRF_NAME", "B", "A"), stringList("A", "B"), []string{"VRF_NAME"}, true},
		{"configured item already listed", stringList("A", "VRF_NAME"), stringList("A", "VRF_NAME"), []string{"VRF_NAME"}, true},
		{"unlisted addition", stringList("A", "B", "OTHER"), stringList("A", "B"), []string{"VRF_NAME"}, false},
		{"configured item missing", stringList("A", "VRF_NAME"), stringList("A", "B"), []string{"VRF_NAME"}, false},
		{"null configured list", stringList("A"), types.ListNull(types.StringType), []string{"VRF_NAME"}, false},
		{"unknown configured list", stringList("A"), types.ListUnknown(types.StringType), []string{"VRF_NAME"}, false},
		{"null response", types.ListNull(types.StringType), stringList("A"), []string{"VRF_NAME"}, false},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := ListEqualIgnoringAdditions(tt.have, tt.want, tt.additions...); got != tt.expected {
				t.Errorf("ListEqualIgnoringAdditions() = %v, want %v", got, tt.expected)
			}
		})
	}
}

func TestValueStringPointerFromPlanOrState(t *testing.T) {
	state := types.StringValue("from-state")
	if got := ValueStringPointerFromPlanOrState(types.StringNull(), state); got != nil {
		t.Errorf("null plan (attribute removed) must send null, got %q", *got)
	}
	if got := ValueStringPointerFromPlanOrState(types.StringUnknown(), state); got == nil || *got != "from-state" {
		t.Errorf("unknown plan (computed) must fall back to state, got %v", got)
	}
	if got := ValueStringPointerFromPlanOrState(types.StringValue("from-plan"), state); got == nil || *got != "from-plan" {
		t.Errorf("known plan must win, got %v", got)
	}
	if got := ValueStringPointerFromPlanOrState(types.StringUnknown(), types.StringNull()); got != nil {
		t.Errorf("unknown plan with null state must send null, got %q", *got)
	}
}

func TestTenantIdFromScope(t *testing.T) {
	for scope, want := range map[string]string{"tsg_id:1413225143": "1413225143", "profile tsg_id:42 email": "42", "": "", "profile": ""} {
		got := TenantIdFromScope(scope)
		if (want == "") != (got == nil) || (got != nil && *got != want) {
			t.Errorf("TenantIdFromScope(%q) = %v, want %q", scope, got, want)
		}
	}
}

func TestDeleteIfNull(t *testing.T) {
	cases := map[string]string{
		`{"a":null,"b":1}`:   `{"b":1}`,
		`{"a":"port","b":1}`: `{"a":"port","b":1}`,
		`{"b":1}`:            `{"b":1}`,
	}
	for in, want := range cases {
		if got := DeleteIfNull(in, "a"); got != want {
			t.Errorf("DeleteIfNull(%s) = %s, want %s", in, got, want)
		}
	}
}
