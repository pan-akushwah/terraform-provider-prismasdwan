package address

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/Address

/*
Config object.

ShortName: mhJDwSQ
Parent chains:
*

Args:

Param City (string): City: Length(max = 100, , min = 0)

Param Country (string): Country: Length(max = 100, , min = 0)

Param PostCode (string): Post Code: Length(max = 100, , min = 0)

Param State (string): State: Length(max = 100, , min = 0)

Param Street (string): Street: Length(max = 100, , min = 0)

Param Street2 (string): Street2: Length(max = 100, , min = 0)
*/
type Config struct {
	City     *string `json:"city"`
	Country  *string `json:"country"`
	PostCode *string `json:"post_code"`
	State    *string `json:"state"`
	Street   *string `json:"street"`
	Street2  *string `json:"street2"`
}
