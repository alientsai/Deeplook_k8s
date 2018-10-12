# Deploy Steps

## 1. Ingress

- See [Ingress](./Ingress/README.md)

## 2. Volume & Sercet
- See [Volume](./Volume/README.md)
- See [Secret](./Secret/README.md)

## 3. Initial Data

- See [Initial Data](./InitialData/README.md)

## 4. Database
- See [Database](./Database/README.md) \
Inculdes `cityeyes-postgresql`, `paas-postgresql`, `acl-mysql`

## 5. NFS

- See [NFS](./NFS/README.md)

## 6. Rabbitmq, Map and nginx
- See [Rabbitmq](./rabbitmq/README.md)
  (Don't forget create queues: [create queues](./rabbitmq/README.md#using-script-create-queues))

- See [MapTileServer](./MapTileServer/README.md)

- See [nginx](./nginx/README.md) (Need create configmap before deploy)

## 7. Tomcat

> Use `noSamba` `yaml`

- See [Tomcat](./Tomcat/README.md) \
Inculdes `Deeplook`, `PaaS`, `ACL` \
Order:
  - [ACL](./Tomcat/README.md#deploy-tomcat-for-acl) (Need create configmap before deploy)
  - [PaaS](./Tomcat/README.md#deploy-paas)
  - [deeplook](./Tomcat/README.md#deploy-deeplook)
> Deeplook NEED change IP in `yaml` 

## 8. Merge Engine

- See [Engine](./Engine/README.md)

## 9. GPU Engine (When `GPU` node available)

- See [gpuPod](./gpuPod/README.md)

## 10. Samba (If use windows engine)

- See [Samba](./Samba/README.md)

# Deeplook_k8s Overview

![alt text](/Images/Overview/Deeplook_k8s_overview.png "Deeplook_k8s_overview")

**If something wrong maybe [Troubleshooting](../Install/Troubleshooting.md) can help you.**