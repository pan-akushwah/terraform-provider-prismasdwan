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
