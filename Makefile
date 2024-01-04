ca:
	openssl genrsa -des3 -out ca.key 2048 &&\
	openssl req -x509 -new -nodes -key ca.key -sha256 -days 1825 -out ca.pem -subj "/CN=DevLabs"
certs:
	openssl genrsa -out my.key && \
	openssl req -new -key my.key -out csr.pem -subj "/CN=DevLabs" && \
	openssl x509 -req -days 365 -in csr.pem -CA ca.pem -CAkey ca.key -CAcreateserial -out crt.pem -sha256 -extfile dn.ext -subj "/CN=DevLabs" && \
	openssl pkcs12 -export -out keystore.p12 -inkey my.key -in crt.pem