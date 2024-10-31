#/bin/bash

echo $CERT_PEM > cert.pem
echo $KEY_PEM > key.pem

nginx &
/app/frps -c /app/frps.toml &
/app/check.sh &

fg %1
