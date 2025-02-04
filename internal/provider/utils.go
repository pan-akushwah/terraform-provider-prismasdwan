package provider

import (
	"context"
	"strings"

	"github.com/hashicorp/terraform-plugin-framework/types"
	"github.com/hashicorp/terraform-plugin-framework/types/basetypes"
)

func ValueStringPointerFromPlanOrState(planVal, stateVal types.String) *string {
	if !planVal.IsNull() && !planVal.IsUnknown() {
		return planVal.ValueStringPointer()
	}
	if stateVal.IsNull() || stateVal.IsUnknown() {
		return nil
	}
	return stateVal.ValueStringPointer()
}

func ValueBoolPointerFromPlanOrState(planVal, stateVal types.Bool) *bool {
	if !planVal.IsNull() && !planVal.IsUnknown() {
		value := planVal.ValueBool()
		return &value
	}
	if stateVal.IsNull() || stateVal.IsUnknown() {
		return nil
	}
	value := stateVal.ValueBool()
	return &value
}

func ValueStringFromPlanOrState(planVal, stateVal types.String) string {
	if !planVal.IsNull() && !planVal.IsUnknown() {
		return planVal.ValueString()
	}
	if stateVal.IsNull() || stateVal.IsUnknown() {
		return ""
	}
	return stateVal.ValueString()
}

func ValueBoolFromPlanOrState(planVal, stateVal types.Bool) bool {
	if !planVal.IsNull() && !planVal.IsUnknown() {
		return planVal.ValueBool()
	}
	if stateVal.IsNull() || stateVal.IsUnknown() {
		return false
	}
	return stateVal.ValueBool()
}

func ValueInt64PointerFromPlanOrState(planVal, stateVal types.Int64) *int64 {
	if !planVal.IsNull() && !planVal.IsUnknown() {
		value := planVal.ValueInt64()
		return &value
	}
	if stateVal.IsNull() || stateVal.IsUnknown() {
		return nil
	}
	value := stateVal.ValueInt64()
	return &value
}

func ValueInt64FromPlanOrState(planVal, stateVal types.Int64) int64 {
	if !planVal.IsNull() && !planVal.IsUnknown() {
		return planVal.ValueInt64()
	}
	if stateVal.IsNull() || stateVal.IsUnknown() {
		return 0
	}
	return stateVal.ValueInt64()
}

func ValueFloat64PointerFromPlanOrState(planVal, stateVal types.Float64) *float64 {
	if !planVal.IsNull() && !planVal.IsUnknown() {
		value := planVal.ValueFloat64()
		return &value
	}
	if stateVal.IsNull() || stateVal.IsUnknown() {
		return nil
	}
	value := stateVal.ValueFloat64()
	return &value
}

// Helper Function
func StringValueOrNil(s types.String) *string {
	if s.IsNull() || s.IsUnknown() {
		return nil
	}
	return s.ValueStringPointer()
}

func BoolValueOrNil(b types.Bool) *bool {
	if b.IsNull() || b.IsUnknown() {
		return nil
	}
	return b.ValueBoolPointer()
}

func Int64ValueOrNil(i types.Int64) *int64 {
	if i.IsNull() || i.IsUnknown() {
		return nil
	}
	return i.ValueInt64Pointer()
}

func Int64Value(i basetypes.Int64Value) int64 {
	return i.ValueInt64()
}

func Float64ValueOrNil(f types.Float64) *float64 {
	if f.IsNull() || f.IsUnknown() {
		return nil
	}
	return f.ValueFloat64Pointer()
}

func StringValue(s types.String) string {
	if s.IsNull() || s.IsUnknown() {
		return ""
	}
	return s.ValueString()
}

func BoolValue(s types.Bool) bool {
	if s.IsNull() || s.IsUnknown() {
		return false
	}
	return s.ValueBool()
}

func ListInt64ValueOrNil(ctx context.Context, v types.List) []int64 {
	if v.IsNull() || v.IsUnknown() {
		return []int64{}
	}
	var result []int64
	v.ElementsAs(ctx, &result, false)
	return result
}

func SetInt64ValueOrNil(ctx context.Context, v types.Set) []int64 {
	if v.IsNull() || v.IsUnknown() {
		return []int64{}
	}
	var result []int64
	v.ElementsAs(ctx, &result, false)
	return result
}

func ListStringValueOrNil(ctx context.Context, v types.List) []string {
	if v.IsNull() {
		return nil
	}
	if v.IsUnknown() {
		return []string{}
	}
	var result []string
	v.ElementsAs(ctx, &result, false)
	return result
}

func SetStringValueOrNil(ctx context.Context, v types.Set) []string {
	if v.IsNull() {
		return nil
	}
	if v.IsUnknown() {
		return []string{}
	}
	var result []string
	v.ElementsAs(ctx, &result, false)
	return result
}

func MapStringValueOrNil(ctx context.Context, v types.Map) map[string]*string {
	if v.IsNull() {
		return map[string]*string{}
	}
	if v.IsUnknown() {
		return map[string]*string{}
	}
	result := make(map[string]*string)
	for k, v := range v.Elements() {
		string_value := strings.Replace(v.String(), "\"", "", 2)
		result[k] = &string_value
	}
	return result
}
