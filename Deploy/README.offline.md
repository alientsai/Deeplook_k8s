# OFFLINE Deploy Steps

## 0. Change Registry Host in `yaml`

The script will find `*-from-registry.yaml` files and change image registry.

```shell
$ sh changeRegistryHost.sh
```

## 1. Volume & Secret
- See [Deploy Volume](./Volume#deploy-volume)
- See [Deploy Secret](./Secret#deploy-secret)

## 2. Docker Registry

### 2.1 Unpacking registryBackup
> The link already updated! \
> This registry has 37 registries 
> 
You can download `registryBackup.tar` from [link](https://mega.nz/#!AANVXKRI!-7C012UIWFvsu8YR2N8FZp5qGpIdGQXAqThO70IPfUI)
<!-- (https://mega.nz/#!9EFAwYKJ!WXacgqo5V6c0oGAld22WzQrrKybxQ62FbKCilEo3T3w) -->

The `registryBackup.tar` must upacking to `/` . (the docker registry existed node)

Unpacking:
```shell
$ tar xvf registryBackup.tar
```

### 2.2 Enable Insecure registry
**Each Node MUST enable insecure registry**
- See [Enable Insecure registry](./DockerRegistry#enable-insecure-registry)

### 2.3 Deploy Docker Registry
- See[Docker Registry](./DockerRegistry#docker-registry)

### 2.4 Deploy Docker Registry UI
- See[Docker Registry UI](./DockerRegistry#docker-registry-ui)

## 3. Ingress

### 3.1  Install ingress cortroller from registry
- See [Install Ingress controller from registry](./Ingress/README.md#install-ingress-controller-from-registry)

### 3.2 Deploy Ingress service
- See [Deploy Ingress service](./Ingress#deploy-ingress-service-after-ingrss-controller-is-working)

## 4. Initial Data

### 4.1 Create job from registry
- See [Initial Data - create job from registry](./InitialData#create-job-from-registry)

### 4.2 Check job's pod status
- See [Initial Data - check job](./InitialData#check-job)

## 5. Database

### 5.1 ACL database deploy from registry
- See [ACL database deploy from registry](./Database#acl-database-deploy-from-registry)

### 5.2 Cityeyes database deploy from registry
- See [Cityeyes database deploy from registry](./Database#cityeyes-database-deploy-from-registry)

### 5.3 PaaS database deploy from registry
- See [PaaS database deploy from registry](./Database#paas-database-deploy-from-registry)

## 6. NFS

- See [Deloy NFS from registry](./NFS#deloy-nfs-from-registry)

## 7. Rabbitmq

### 7.1 Install from registry
- See [Install from registry](./rabbitmq#using-helm-install-from-registry)

### 7.2 Expose manage port
- See [Expose manage port](./rabbitmq#expose-manage-port)

### 7.3 Create queues
- See [Create queues](./rabbitmq#using-script-create-queues)

## 8 Map
- See [MapTileServer](./MapTileServer#deploy-from-registry)

## 9 Nginx

### 9.1 Create configmap 

- See [Create configmap](/nginx#1-create-configmaps-from-files)

### 9.2 Deloy nginx from registry

- See [Deloy nginx from registry](./nginx#deloy-nginx-from-registry)

## 10. Tomcat

### 10.1 Deploy ACL

Create configmap from file : \
See [Create configmap](./Tomcat#1-create-configmap-from-file) \
Deploy tomcat for acl (from registry) : \
See [Deploy ACL](./Tomcat#deploy-tomcat-for-acl-from-registry)

### 10.2 Deploy PaaS
- [Deploy paas (from registry)](./Tomcat/README.md#deploy-paas-from-registry)

### 10.2 Deploy Deeplook
- [Deploy deeplook (from registry)](./Tomcat/README.md#deploy-deeplook-from-registry)

## 11. Merge Engine

- See [Deploy merge engine form registry](./Engine#deploy-merge-engine-form-registry)

## 12. GPU Engine (When `GPU` node available)

- See [Deploy engine from script](./gpuPod#deploy-engine-from-script)

## 13. Samba (If use windows engine)

- See [Samba](./Samba/README.md)

# Deeplook_k8s Overview

![alt text](/Images/Overview/Deeplook_k8s_overview.png "Deeplook_k8s_overview")

**If something wrong maybe [Troubleshooting](../Install/Troubleshooting.md) can help you.**