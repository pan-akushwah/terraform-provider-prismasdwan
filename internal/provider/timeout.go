package provider

import (
	"regexp"
	"time"

	"github.com/hashicorp/terraform-plugin-framework/resource/schema"
	"github.com/hashicorp/terraform-plugin-framework/resource/schema/stringdefault"
	"github.com/hashicorp/terraform-plugin-framework/schema/validator"
	"github.com/hashicorp/terraform-plugin-framework/types"

	"github.com/hashicorp/terraform-plugin-framework-validators/stringvalidator"
)

var timeoutsRegexString = `^([1-9]\d*h)?([1-9]\d*m)?([1-9]\d*s)?$`
var timeoutsRegex = regexp.MustCompile(timeoutsRegexString)

func TimeoutSchema(v string) schema.StringAttribute {
	return schema.StringAttribute{
		Description: `Timeouts for this resource's operations. A custom timeout is a string that has a number and a units suffix, such as 30s or 1h1m1s. Valid units are "h", "m", or "s". Note that changes to custom timeouts only take effect during resource creation or update. Default: ` + v + ".",
		Optional:    true,
		Computed:    true,
		Default:     stringdefault.StaticString(v),
		Validators: []validator.String{
			stringvalidator.RegexMatches(timeoutsRegex, ""),
		},
	}
}

func TimeoutFrom(v types.String) time.Duration {
	ans, _ := time.ParseDuration(v.ValueString())
	return ans
}
