package provider

import (
	"context"
	"crypto/aes"
	"crypto/cipher"
	"crypto/rand"
	"encoding/hex"
	"fmt"
	"io"
	"strings"

	"github.com/hashicorp/terraform-plugin-framework/attr"
	"github.com/hashicorp/terraform-plugin-framework/diag"
	"github.com/hashicorp/terraform-plugin-framework/path"
	"github.com/hashicorp/terraform-plugin-framework/tfsdk"
	"github.com/hashicorp/terraform-plugin-framework/types"
	"github.com/hashicorp/terraform-plugin-framework/types/basetypes"
)

func ValueStringPointerFromPlanOrState(planVal, stateVal types.String) *string {
	// null: removed from the config, so send null and let the api clear it
	if planVal.IsNull() {
		return nil
	}
	// unknown: computed and not configured, so fall back to what the server has
	if !planVal.IsUnknown() {
		return planVal.ValueStringPointer()
	}
	if stateVal.IsNull() || stateVal.IsUnknown() {
		return nil
	}
	return stateVal.ValueStringPointer()
}

func ValueBoolPointerFromPlanOrState(planVal, stateVal types.Bool) *bool {
	// null: removed from the config, so send null and let the api clear it
	if planVal.IsNull() {
		return nil
	}
	// unknown: computed and not configured, so fall back to what the server has
	if !planVal.IsUnknown() {
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
	// null: removed from the config, so send null and let the api clear it
	if planVal.IsNull() {
		return nil
	}
	// unknown: computed and not configured, so fall back to what the server has
	if !planVal.IsUnknown() {
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
	// null: removed from the config, so send null and let the api clear it
	if planVal.IsNull() {
		return nil
	}
	// unknown: computed and not configured, so fall back to what the server has
	if !planVal.IsUnknown() {
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
	if v.IsNull() {
		return nil
	}
	if v.IsUnknown() {
		return []int64{}
	}
	var result []int64
	v.ElementsAs(ctx, &result, false)
	return result
}

func SetInt64ValueOrNil(ctx context.Context, v types.Set) []int64 {
	if v.IsNull() {
		return nil
	}
	if v.IsUnknown() {
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

// ListEqualIgnoringAdditions reports whether have holds exactly the elements of want plus, optionally, some of
// additions (items the API adds on its own). Order is ignored. A null or unknown list never matches, so callers
// fall back to the value the API returned.
func ListEqualIgnoringAdditions(have, want types.List, additions ...string) bool {
	if want.IsNull() || want.IsUnknown() || have.IsNull() || have.IsUnknown() {
		return false
	}
	wanted := make(map[string]bool, len(want.Elements()))
	for _, v := range want.Elements() {
		wanted[listElementKey(v)] = true
	}
	allowed := make(map[string]bool, len(additions))
	for _, a := range additions {
		allowed[a] = true
	}
	found := make(map[string]bool, len(wanted))
	for _, v := range have.Elements() {
		key := listElementKey(v)
		if wanted[key] {
			found[key] = true
		} else if !allowed[key] {
			return false
		}
	}
	return len(found) == len(wanted)
}

// listElementKey compares string elements by their raw value; String() would quote them.
func listElementKey(v attr.Value) string {
	if s, ok := v.(types.String); ok {
		return s.ValueString()
	}
	return v.String()
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

// generates a random string of a given length in HEX format
func GenerateRandomString(length int) string {
	bytes := make([]byte, length/2)
	if _, err := rand.Read(bytes); err != nil {
		return err.Error()
	}
	return hex.EncodeToString(bytes)
}

// encrypts a byte array and returns a hex encoded string
func Encrypt(text []byte) (string, error) {
	key := make([]byte, 16)
	if _, err := rand.Read(key); err != nil {
		return "", err
	}

	block, err := aes.NewCipher(key)
	if err != nil {
		return "", err
	}
	ciphertext := make([]byte, aes.BlockSize+len(text))
	iv := ciphertext[:aes.BlockSize]
	if _, err := io.ReadFull(rand.Reader, iv); err != nil {
		return "", err
	}
	cfb := cipher.NewCFBEncrypter(block, iv)
	cfb.XORKeyStream(ciphertext[aes.BlockSize:], text)
	// text would be <key>.<string>
	return hex.EncodeToString(key) + "." + hex.EncodeToString(ciphertext), nil
}

func Decrypt(cryptoText string) (string, error) {
	// split on .
	parts := strings.Split(cryptoText, ".")
	// decode
	key, err := hex.DecodeString(parts[0])
	if err != nil {
		return "", err
	}
	ciphertext, err := hex.DecodeString(parts[1])
	if err != nil {
		return "", err
	}
	block, err := aes.NewCipher(key)
	if err != nil {
		return "", err
	}
	if len(ciphertext) < aes.BlockSize {
		return "", fmt.Errorf("ciphertext too short")
	}
	iv := ciphertext[:aes.BlockSize]
	ciphertext = ciphertext[aes.BlockSize:]
	cfb := cipher.NewCFBDecrypter(block, iv)
	cfb.XORKeyStream(ciphertext, ciphertext)
	return string(ciphertext), nil
}

func TfidFromParams(params *map[string]*string) types.String {
	// Create the Terraform ID.
	var idBuilder strings.Builder
	idValue, ok := (*params)["id"]
	if ok {
		idBuilder.WriteString(*idValue)
	}
	for p, v := range *params {
		idBuilder.WriteString(IdSeparator)
		idBuilder.WriteString(p)
		idBuilder.WriteString("=")
		idBuilder.WriteString(*v)
	}
	return types.StringValue(idBuilder.String())
}

// ValidateRequiredXParameters reports each path parameter the resource needs that is missing from x_parameters.
// An unknown x_parameters (built from values known only after apply) is checked again when the request is sent.
func ValidateRequiredXParameters(ctx context.Context, config tfsdk.Config, required []string) diag.Diagnostics {
	var params types.Map
	diags := config.GetAttribute(ctx, path.Root("x_parameters"), &params)
	if diags.HasError() || params.IsUnknown() {
		return diags
	}
	elements := params.Elements()
	for _, name := range required {
		if v, ok := elements[name]; !ok || v.IsNull() {
			diags.AddAttributeError(path.Root("x_parameters"), "Missing path parameter",
				fmt.Sprintf("path parameter %q is required; set x_parameters.%s", name, name))
		}
	}
	return diags
}
