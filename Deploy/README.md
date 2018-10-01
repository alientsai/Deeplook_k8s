# Deploy Steps

## 1. Volume & Sercet
- See [Volume](./Volume/README.md)
- See [Secret](./Secret/README.md)

## 2. Initial Data

- See [Initial Data](./InitialData/README.md)

## 3. Database
- See [Database](./Database/README.md) \
Inculdes `cityeyes-postgresql`, `paas-postgresql`, `acl-mysql`

## 4. NFS (Use SAMBA skip this step.)

- See [NFS](./NFS/README.md)

## 5. Rabbitmq, Map and nginx
- See [Rabbitmq](./rabbitmq/README.md)

- See [MapTileServer](./MapTileServer/README.md)

- See [nginx](./nginx/README.md) (Use SAMBA can ignore this.)

## 6. Ingress

- See [Ingress](./Ingress/README.md)

## 7. Tomcat

> If system without samba use `noSamba` `yaml`

- See [Tomcat](./Tomcat/README.md) \
Inculdes `Deeplook`, `PaaS`, `ACL` \
Order:
  - [ACL](./Tomcat/README.md#deploy-tomcat-for-acl)
  - [PaaS](./Tomcat/README.md#deploy-paas)
  - [deeplook](./Tomcat/README.md#deploy-deeplook)
> Deeplook NEED change IP in `yaml` 

## 8. Merge Engine

- See [Engine](./Engine/README.md)

## 9. GPU Engine (When `GPU` node available)

- See [gpuPod](./gpuPod/README.md)

## 10. Samba (If use windows engine)

- See [Samba](./Samba/README.md)