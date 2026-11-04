package provider

import (
	"testing"

	"github.com/hashicorp/terraform-plugin-framework/attr"
	"github.com/hashicorp/terraform-plugin-framework/diag"
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

func TestSetIfNull(t *testing.T) {
	cases := map[string]string{
		`{"a":null}`:       `{"a":"none"}`,
		`{"b":1}`:          `{"b":1,"a":"none"}`,
		`{"a":"cellular"}`: `{"a":"cellular"}`,
	}
	for in, want := range cases {
		if got := SetIfNull(in, "a", "none"); got != want {
			t.Errorf("SetIfNull(%s) = %s, want %s", in, got, want)
		}
	}
}

func TestJSONStringToMapAndBack(t *testing.T) {
	var diags diag.Diagnostics
	if JSONStringToMap(types.StringNull(), &diags) != nil || JSONStringToMap(types.StringValue(" "), &diags) != nil || diags.HasError() {
		t.Fatalf("null and blank are no object, without an error: %v", diags)
	}
	object := JSONStringToMap(types.StringValue(`{"email":"a@b.c","eventcodes":["X"],"get_suppressed":false}`), &diags)
	if diags.HasError() || object == nil || (*object)["email"] != "a@b.c" {
		t.Fatalf("object not decoded: %v %v", object, diags)
	}
	JSONStringToMap(types.StringValue(`["not","an","object"]`), &diags)
	if !diags.HasError() {
		t.Fatalf("a JSON array must be an error")
	}

	// the same object keeps the configured text, whatever its formatting
	written := types.StringValue("{ \"get_suppressed\": false,\n  \"email\": \"a@b.c\", \"eventcodes\": [\"X\"] }")
	if got := JSONStringFromMap(object, written); !got.Equal(written) {
		t.Fatalf("configured text not kept: %s", got)
	}
	// a changed object is returned as compact JSON
	changed := types.StringValue(`{"email":"other@b.c"}`)
	if got := JSONStringFromMap(object, changed); got.Equal(changed) || got.IsNull() {
		t.Fatalf("a different object must not keep the old text: %s", got)
	}
	if got := JSONStringFromMap(nil, written); !got.IsNull() {
		t.Fatalf("no object is null: %s", got)
	}
}

func TestDeleteIfNullInEveryListElement(t *testing.T) {
	body := `{"name":"n","filters":[{"type":"ipv4","site":null,"path":["p"]},{"type":"ipv6","site":{"id":"s"},"path":null}]}`
	got := DeleteIfNull(DeleteIfNull(body, "filters.#.site"), "filters.#.path")
	want := `{"name":"n","filters":[{"type":"ipv4","path":["p"]},{"type":"ipv6","site":{"id":"s"}}]}`
	if got != want {
		t.Fatalf("got %s, want %s", got, want)
	}
	if got := DeleteIfNull(`{"name":null}`, "missing.#.x"); got != `{"name":null}` {
		t.Fatalf("a missing list must leave the body alone, got %s", got)
	}
}

func TestSetIfNullInEveryListElement(t *testing.T) {
	body := `{"groups":[{"name":"a","tunnels":null},{"name":"b","tunnels":["t"]},{"name":"c"}]}`
	got := SetIfNull(body, "groups.#.tunnels", []interface{}{})
	want := `{"groups":[{"name":"a","tunnels":[]},{"name":"b","tunnels":["t"]},{"name":"c","tunnels":[]}]}`
	if got != want {
		t.Fatalf("got %s, want %s", got, want)
	}
}

func TestFloat64KeepPlanWhenNear(t *testing.T) {
	answer := -98.497406
	if got := Float64KeepPlanWhenNear(&answer, types.Float64Value(-98.497408)); got.ValueFloat64() != -98.497408 {
		t.Fatalf("a rounded answer must keep the configured value, got %v", got)
	}
	if got := Float64KeepPlanWhenNear(&answer, types.Float64Value(-98.5)); got.ValueFloat64() != answer {
		t.Fatalf("a different answer must win, got %v", got)
	}
	if got := Float64KeepPlanWhenNear(&answer, types.Float64Null()); got.ValueFloat64() != answer {
		t.Fatalf("no configured value: the answer, got %v", got)
	}
	if got := Float64KeepPlanWhenNear(nil, types.Float64Value(1)); !got.IsNull() {
		t.Fatalf("no answer is null, got %v", got)
	}
}
