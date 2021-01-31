# Ruta Demo 

## Notice
- This is a demo lab for ruta project.
- ETCD connections are encrypted with TLS.
- Dataplane encapsulation changes to cleartext mode.
- Dataplane disable DPDK support for easy deployment and limit performance.
- This project is written by golang, we could support multiple platform include X86/ARM/MIPS 
- This demo is verified by Unbuntu 20.04 only.

## 1. IP address and topology

The pre-configed topology shows as below:

| Hostname | Address       |
|----------|---------------|
| ETCD1    | 192.168.99.71 |
| ETCD2    | 192.168.99.72 |
| ETCD3    | 192.168.99.73 |
| STUN1    | 192.168.99.74 |
| Fabric1  | 192.168.99.75 |
| Fabric2  | 192.168.99.76 |
| Linecard1| 192.168.99.77 |
| Linecard2| 192.168.99.78 |
| Operation| 192.168.99.79 |

You can modify the configuration file in each component.

## 2. Installation

git clone or directly download all files to /opt/ruta_demo

```bash
cd /opt
git clone https://www.github.com/zartbot/ruta_demo
```
## 3. Create certification

```bash
cd /opt/ruta_demo
./01_generate_cert.sh
```
## notice
- Certificate MUST be generated ONCE!
- Then you MUST copy /opt/ruta_demo/cert fold to other VMs on the same path
- The certificate path in the other binary file("stun"/"fabric"/"linecard") are hardcoded as "/opt/ruta_demo/cert"
- If you need deploy etcd cluster with other IP address, you must change the "hosts" section in "cert_cfg/server-csr.json"
```json
  "hosts": [
    "localhost",
    "0.0.0.0",
    "192.168.99.71",
    "192.168.99.72",
    "192.168.99.73"
  ],
```

## 4. Setup ETCD Cluster

on ETCD1

```bash
cd /opt/ruta_demo
./start_etcd1.sh
```
on ETCD2

```bash
cd /opt/ruta_demo
./start_etcd2.sh
```

on ETCD3

```bash
cd /opt/ruta_demo
./start_etcd1.sh
```

## notice
- IP address information are defined in "etcd/etcdX.yaml"

## 5. Start STUN Service

on STUN1

```bash
cd /opt/ruta_demo/stun
./stun 
```
- you could change the config in conf.yaml or defined your config.yaml by using ./stun -c=your_config.yaml
- STUN service must have a public IP address or behind 1:1 NAT
- SRLOC is encoded by the following fields, you MUST defined correct Private/Public IP Address
```
srloc: [ INET|1000|1000|192.168.99.74:5555|192.168.99.74:5555]
         COLOR | UP_LINK_BW(Mbps) | DOWN_LINK_BW(Mbps) | Private_IP_Address:Port | Public_IP_Address:Port 
```

## 6. Start Fabric Service






