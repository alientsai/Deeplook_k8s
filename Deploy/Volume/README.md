# Deploy Volume

```shell
$ kubectl create -f ./
```

## Volume Inforamtion

### PersistentVolume
|name|capacity|hostPath|storageClassName|
|-|-|-|-|
|pv-cityeyes|100Gi|/pgBackup_cityeyes|class-cityeyes|
|pv-paas|100Gi|/pgBackup_paas|class-paas|
|pv-acl|100Gi|/mysqlBackup_acl|class-acl|
|pv-registry|100Gi|/registryBackup|class-registry|
|pv-map|100Gi|/mapBackup|class-map|
|pv-maven|100Gi|/mavenRepo|class-maven|
|pv-media|100Gi|/deeplook_media|class-media|
|pv-nfs|100Gi|N/A (pvc-media)|class-nfs|
|pv-nfs-maven|100Gi|N/A (pvc-maven)|class-nfs-maven|
|pv-nfs-war|100Gi|N/A (pvc-war)|class-nfs-war|

### PersistentVolumeClaim
|name|requests|storageClassName|
|-|-|-|
|pvc-cityeyes|100Gi|class-cityeyes|
|pvc-paas|100Gi|class-paas|
|pvc-acl|100Gi|class-acl|
|pvc-registry|100Gi|class-registry|
|pvc-map|100Gi|class-map|
|pvc-maven|100Gi|class-maven|
|pvc-media|100Gi|class-media|
|pvc-nfs|100Gi|class-nfs|
|pvc-nfs-maven|100Gi|class-nfs-maven|
|pvc-nfs-war|100Gi|class-nfs-war|

## Check pv, pvc

```shell
$ kubectl get pv,pvc
```
