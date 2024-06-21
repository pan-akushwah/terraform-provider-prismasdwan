package intf

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/TrackInterface

/*
Config object.

ShortName: uvXdTvM
Parent chains:
*

Args:

Param InterfaceId (string): Interface Id

Param ReducePriority (int64): Reduce Priority: Range(max = 254L, SPOKEHA_CONFIG_INVALID_REDUCE_PRIORITY, min = 1L)
*/
type Config struct {
	InterfaceId    *string `json:"interface_id"`
	ReducePriority *int64  `json:"reduce_priority"`
}
