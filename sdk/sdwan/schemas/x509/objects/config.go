package objects

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/X509Objects

/*
Config object.

ShortName: qSUpByF
Parent chains:
*

Args:

Param CertHolder (any): the CertHolder param. Default: `false`.

Param Certificate (string): Certificate

Param IsLocalCaCertSet (bool): Is Local Ca Cert Set

Param IsRemoteCaCertSet (bool): Is Remote Ca Cert Set

Param KeyPair (any): the KeyPair param. Default: `false`.

Param LocalCaCertificate (string): Local Ca Certificate

Param LocalCaCertsSet ([]any): Local Ca Certs Set

Param Passphrase (string): Passphrase

Param PrivateKey (string): Private Key

Param RemoteCaCertificate (string): Remote Ca Certificate

Param RemoteCaCertsSet ([]any): Remote Ca Certs Set
*/
type Config struct {
	CertHolder          any     `json:"certHolder"`
	Certificate         *string `json:"certificate"`
	IsLocalCaCertSet    *bool   `json:"is_local_ca_cert_set"`
	IsRemoteCaCertSet   *bool   `json:"is_remote_ca_cert_set"`
	KeyPair             any     `json:"keyPair"`
	LocalCaCertificate  *string `json:"local_ca_certificate"`
	LocalCaCertsSet     []any   `json:"local_ca_certs_set"`
	Passphrase          *string `json:"passphrase"`
	PrivateKey          *string `json:"private_key"`
	RemoteCaCertificate *string `json:"remote_ca_certificate"`
	RemoteCaCertsSet    []any   `json:"remote_ca_certs_set"`
}
