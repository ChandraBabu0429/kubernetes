#!/bin/bash

CERT_FILE=certs/itversity_ssl_chained.crt
KEY_FILE=certs/itversity_ssl.key
YAML_FILE=minio-tls-secret.yaml
NAMESPACE=minio

# Base64 encode the certificate and key
CERT_ENCODED=$(base64 -w 0 "$CERT_FILE")
KEY_ENCODED=$(base64 -w 0 "$KEY_FILE")

# Create the YAML content
cat > "$YAML_FILE" <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: itversity-tls
  namespace: $NAMESPACE
type: kubernetes.io/tls
data:
  tls.crt: $CERT_ENCODED
  tls.key: $KEY_ENCODED
EOF

echo "Created $YAML_FILE successfully."