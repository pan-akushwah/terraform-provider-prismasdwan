package v1

// This code is automatically generated.
// Manual changes made will be overwritten upon SDK generation.

// Schema: #/components/schemas/IPSECAuthenticationV1

import (
	mKyPIKy "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/ikev1/params"
	qSUpByF "github.com/paloaltonetworks/terraform-provider-prismasdwan/sdk/sdwan/schemas/x509/objects"
)

/*
Config object.

ShortName: xdEvbZX
Parent chains:
*

Args:

Param Certificate (string): Certificate

Param CertificateProfileId (string): Certificate Profile Id

Param Comment (string): Comment

Param Ikev1Params (mKyPIKy.Config): the Ikev1Params param.

Param LocalCaCertificate (string): Local Ca Certificate

Param LocalId (string, required): Local Id: ValidateEnum(enumClass = classOf[IPSECLocalIdType], error = IPSECCONFIG_INVALID_LOCAL_ID_TYPE: Invalid local id type.Should be either hostname, dn, local_ip or custom, nullAllowed = false)  String must be one of these: `"LOCAL_IP"`, `"DN"`, `"HOSTNAME"`, `"CUSTOM"`, `"NONE"`.

Param LocalIdCustom (string): Local Id Custom: Length(max = 255, error = IPSECCONFIG_INVALID_LOCAL_ID_LEN: Invalid local id len.Should be between 2-255., min = 2)

Param LocalPaCertificateId (string): Local Pa Certificate Id

Param PaMasterKeyId (string): Pa Master Key Id

Param Passphrase (string): Passphrase

Param PassphraseEncrypted (string): Passphrase Encrypted: JsonIgnore(value = true)

Param PeerIdCheck (string): Peer Id Check String must be one of these: `"EXACT"`, `"WILDCARD"`.

Param PermitPeerIdMismatch (bool): Permit Peer Id Mismatch

Param PrivateKey (string): Private Key

Param PrivateKeyEncrypted (string): Private Key Encrypted: JsonIgnore(value = true)

Param RemoteCaCertificate (string): Remote Ca Certificate

Param RemoteId (string): Remote Id: Length(max = 255, error = IPSECCONFIG_INVALID_REMOTE_ID_LEN: Invalid remote id len.Should be between 2-255., min = 2)

Param Secret (string): Secret

Param SecretEncrypted (string): Secret Encrypted: JsonIgnore(value = true)

Param SecretHash (string): Secret Hash: JsonIgnore(value = true)

Param StrictValidationPeerExtendedKeyUse (bool): Strict Validation Peer Extended Key Use

Param Type (string, required): Type: ValidateEnum(enumClass = classOf[IPSECAuthenticationType], error = IPSECCONFIG_INVALID_AUTHENTICATION_TYPE: Invalid authentication type specified.Valid type are x509, psk or none., nullAllowed = false)  String must be one of these: `"NONE"`, `"PSK"`, `"X509"`.

Param X509Objects (qSUpByF.Config): the X509Objects param.
*/
type Config struct {
	Certificate                        *string         `json:"certificate"`
	CertificateProfileId               *string         `json:"certificate_profile_id"`
	Comment                            *string         `json:"comment"`
	Ikev1Params                        *mKyPIKy.Config `json:"ikev1_params"`
	LocalCaCertificate                 *string         `json:"local_ca_certificate"`
	LocalId                            string          `json:"local_id"`
	LocalIdCustom                      *string         `json:"local_id_custom"`
	LocalPaCertificateId               *string         `json:"local_pa_certificate_id"`
	PaMasterKeyId                      *string         `json:"pa_master_key_id"`
	Passphrase                         *string         `json:"passphrase"`
	PassphraseEncrypted                *string         `json:"passphrase_encrypted"`
	PeerIdCheck                        *string         `json:"peer_id_check"`
	PermitPeerIdMismatch               *bool           `json:"permit_peer_id_mismatch"`
	PrivateKey                         *string         `json:"private_key"`
	PrivateKeyEncrypted                *string         `json:"private_key_encrypted"`
	RemoteCaCertificate                *string         `json:"remote_ca_certificate"`
	RemoteId                           *string         `json:"remote_id"`
	Secret                             *string         `json:"secret"`
	SecretEncrypted                    *string         `json:"secret_encrypted"`
	SecretHash                         *string         `json:"secret_hash"`
	StrictValidationPeerExtendedKeyUse *bool           `json:"strict_validation_peer_extended_key_use"`
	Type                               string          `json:"type"`
	X509Objects                        *qSUpByF.Config `json:"x509Objects"`
}
