# Deploy NFS

## Install `nfs-common` and `nfs-kernel-server`

Each node need install.

```shell
$ apt-get install -y nfs-common nfs-kernel-server
```

## Deloy NFS

```
$ kubectl create -f nfs-deployment.yaml,nfs-maven-deployment.yaml
```

## Service Infomation
|ServiceName|Type|container Port|Expose Port|
|-|-|-|-|
|nfs-server|ClusterIP(10.100.95.27)|2049, 20048, 111|N/A|
|nfs-maven-server|ClusterIP(10.100.55.66)|2049, 20048, 111|N/A|
|nfs-war-server|ClusterIP(10.100.87.87)|2049, 20048, 111|N/A|

## NFS use for pvc

For cross node sharing data.

![alt text](/Images/NFS.png "NFS")