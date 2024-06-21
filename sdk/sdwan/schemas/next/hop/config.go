package hop

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/NextHop

/*
Config object.

ShortName: tyOPiTo
Parent chains:
*

Args:

Param AdminDistance (int64): Admin Distance: Range(max = 255L, error = STATICROUTE_CONFIG_INVALID_DISTANCE: Distance should be between 1 and 255., min = 1L)

Param NexthopInterfaceId (string): Nexthop Interface Id

Param NexthopIp (string): Nexthop Ip

Param Self (bool): Self
*/
type Config struct {
	AdminDistance      *int64  `json:"admin_distance"`
	NexthopInterfaceId *string `json:"nexthop_interface_id"`
	NexthopIp          *string `json:"nexthop_ip"`
	Self               *bool   `json:"self"`
}
