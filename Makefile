certs:
	openssl genpkey -algorithm RSA -out private.key && openssl req -new -key private.key -out server.csr &&	openssl x509 -req -days 365 -in server.csr -signkey private.key -out certificate.crt &&	openssl pkcs12 -export -out keystore.p12 -inkey private.key -in certificate.crt && keytool -importkeystore -srckeystore keystore.p12 -destkeystore keystore.jks -deststoretype pkcs12

pkcs12:
	keytool -genkeypair -v -keystore keystore.p12 -storetype PKCS12 -keyalg RSA -keysize 2048 -validity 365 -alias keystore -storepass store123 -keypass key123 -dname "CN=192.168.100.66, OU=DevLabs, O=DevLabs, L=Kingston, ST=Saint Andrew, C=Jamaica"
jks:
	keytool -genkeypair -v -keystore keystore.jks -keyalg RSA -keysize 2048 -validity 365 -alias keystore -storepass store123 -keypass key123 -dname "CN=192.168.100.66, OU=Dev, O=DevLabs, L=Kingston, ST=Saint Andrew, C=JM"