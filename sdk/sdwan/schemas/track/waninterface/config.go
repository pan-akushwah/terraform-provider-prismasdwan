package waninterface

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/TrackWANInterface

/*
Config object.

ShortName: kBpyQPJ
Parent chains:
*

Args:

Param ReducePriority (int64): Reduce Priority: Range(max = 254L, SPOKEHA_CONFIG_INVALID_REDUCE_PRIORITY, min = 1L)

Param WanInterfaceId (string): Wan Interface Id
*/
type Config struct {
	ReducePriority *int64  `json:"reduce_priority"`
	WanInterfaceId *string `json:"wan_interface_id"`
}
