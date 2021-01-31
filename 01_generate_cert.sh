mkdir ./cert
cd ./cert
cfssl gencert -initca ../cert_cfg/ca-csr.json | cfssljson -bare ca
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=../cert_cfg/ca-config.json -profile=server ../cert_cfg/server-csr.json | cfssljson -bare server
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=../cert_cfg/ca-config.json -profile=client ../cert_cfg/client-csr.json | cfssljson -bare client
