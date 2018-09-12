# Deploy Steps

## 1. Volume & Sercet
- See [Volume](./Volume/README.md)
- See [Sercet](./Sercet/README.md)

## 2. Initial Data

- See [Initial Data](./InitialData/README.md)

## 3. Database
- See [Database](./Database/README.md) \
Inculdes `cityeyes-postgresql`, `paas-postgresql`, `acl-mysql`

## 4. Rabbitmq, Map and nginx
- See [Rabbitmq](./Rabbitmq/README.md)

- See [MapTileServer](./MapTileServer/README.md)

- See [nginx](./nginx/README.md) (Use SAMBA can ignore this.)

## 5. Tomcat

> If system without samba use `noSamba` `yaml`

- See [Tomcat](./Tomcat/README.md) \
Inculdes `Deeplook`, `PaaS`, `ACL`
  - [ACL](./Tomcat/README.md#deploy-tomcat-for-acl)
  - [PaaS](./Tomcat/README.md#deploy-paas)
  - [deeplook](./Tomcat/README.md#deploy-deeplook)
> Deeplook NEED change IP in `yaml` 