package dns

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/DNS

/*
Config object.

ShortName: mTuoPRe
Parent chains:
*

Args:

Param NameServers ([]string): Name Servers

Param Search ([]string): Search
*/
type Config struct {
	NameServers []string `json:"name_servers"`
	Search      []string `json:"search"`
}
