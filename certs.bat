openssl genrsa -out my.key &&
openssl req -new -key my.key -out csr.pem -subj "/CN=AppInjen" &&
openssl x509 -req -days 365 -in csr.pem -CA ca.pem -CAkey ca.key -CAcreateserial -out crt.pem -sha256 -extfile dn.ext -subj "/CN=AppInjen" &&
openssl pkcs12 -export -out keystore.p12 -inkey my.key -in crt.pem