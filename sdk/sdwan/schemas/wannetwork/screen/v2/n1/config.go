package n1

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/WANNetworkScreenV2N1

/*
Config object.

ShortName: bQFhoWG
Parent chains:
*

Args:

Param Description (string): Description: Size(max = 256, error = DESCRIPTION_EXCEEDS_LIMIT: Description length exceeds limit, min = 0)

Param Etag (int64): Entity tag for the resource

Param Id (string, read-only): Id

Param Name (string, required): Name: Required(NAME_REQUIRED) Size(max = 128, WANNETWORK_NAME_INVALID_0001, min = 0)

Param ProviderAsNumbers ([]int64): Provider As Numbers: ListNumber(duplicate = true, max = 65535, error = WAN_CONFIG_PROVIDER_AS_OUT_OF_RANGE: AS numbers of the private network is not within 1-65535., min = 1)

Param Tags ([]string): Tags: ListString(allowDuplicate = false, allowEmpty = true, allowNull = true, length = 128, listMaxSize = 10, error = INVALID_TAG: Maximum 10 Unique tags of length 1024 each are allowed, noTrim = false, regex = [^,\\s]+, required = false)

Param Type (string, required): Type: Required(error = NETWORK_TYPE_REQUIRED: WAN Network type (publicwan | privatewan) is a mandatory attribute.) ValidateEnum(enumClass = classOf[WANNetworkType], message = Invalid enum string., nullAllowed = false)
*/
type Config struct {
	Description       *string  `json:"description"`
	Etag              *int64   `json:"_etag"`
	Id                *string  `json:"id"`
	Name              string   `json:"name"`
	ProviderAsNumbers []int64  `json:"provider_as_numbers"`
	Tags              []string `json:"tags"`
	Type              string   `json:"type"`
}
