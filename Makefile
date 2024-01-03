ca:
	openssl genrsa -des3 -out ca.key 2048 &&\
	openssl req -x509 -new -nodes -key ca.key -sha256 -days 1825 -out ca.pem	
certs:
	openssl genrsa -out private.key && \
	openssl req -new -key private.key -out server.csr -subj "/CN=DevLabs" && \
	openssl x509 -req -days 365 -in server.csr -CA ca.pem -CAkey ca.key -CAcreateserial -out certificate.crt -sha256 -extfile dn.ext -subj "/CN=DevLabs" && \
	openssl pkcs12 -export -out keystore.p12 -inkey private.key -in certificate.crt && \
	keytool -importkeystore -srckeystore keystore.p12 -srcstoretype PKCS12 -destkeystore keystore.jks -deststoretype JKS