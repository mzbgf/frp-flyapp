#/bin/sh

echo $CERT_PEM | base64 -d > cert.pem
echo $KEY_PEM | base64 -d > key.pem

nginx &
/app/frps -c /app/frps.toml &
exec /app/check.sh

