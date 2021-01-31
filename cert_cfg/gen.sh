mkdir ./cert
cd ./cert
cfssl gencert -initca ../gen_cert/ca-csr.json | cfssljson -bare ca
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=../gen_cert/ca-config.json -profile=server ../gen_cert/server-csr.json | cfssljson -bare server
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=../gen_cert/ca-config.json -profile=client ../gen_cert/client-csr.json | cfssljson -bare client
