# Deploy Steps

> Offline Deplioy please follow this steps: **[Offline Install](./README.offline.md)**

## 1. Ingress

- See [Ingress](./Ingress/README.md)

> Video: [Deploy Ingress](https://drive.google.com/open?id=1piVyRAlkLACsL0JH324VPJUX8DhZFTyC)

## 2. Volume & Secret
- See [Volume](./Volume/README.md)
- See [Secret](./Secret/README.md)

> Video: [Deploy Volume, secret, initailData and Database](https://drive.google.com/open?id=1DEUaQSSg97j-DDB4uH-yZsRuTCW7wDvI)

## 3. Initial Data

- See [Initial Data](./InitialData/README.md)

## 4. Database
- See [Database](./Database/README.md) \
Inculdes `cityeyes-postgresql`, `paas-postgresql`, `acl-mysql`

## 5. NFS

- See [NFS](./NFS/README.md)

> Video: [Deploy nfs, rabbitmq, map and nginx](https://drive.google.com/open?id=1SogJR_q4K-pLYrOch6bgKm93KZfCq5_E)

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

> Video: [Deploy acl, paas and deeplook](https://drive.google.com/open?id=1V3xHirZ0oGVT95kj1p-Cntiq4KMfN-We)

## 8. Merge Engine

- See [Engine](./Engine/README.md)

## 9. GPU Engine (When `GPU` node available)

- See [gpuPod](./gpuPod/README.md)

> Video: \
> [Deploy engine classify and clustering #1](https://drive.google.com/open?id=1ReD3ZVPxi-xRgiGX8hfprj7YSeAOWF8B) \
> [Deploy engine classify and clustering #2](https://drive.google.com/open?id=1G5-AWaDXgzDHKJ_AHpGtldZCBsG4lApB)

## 10. Samba (If use windows engine)

- See [Samba](./Samba/README.md)

# Deeplook_k8s Overview

![alt text](/Images/Overview/Deeplook_k8s_overview.png "Deeplook_k8s_overview")

**If something wrong maybe [Troubleshooting](../Install/Troubleshooting.md) can help you.**