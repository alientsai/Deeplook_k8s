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
|pv-registry|100Gi|/registryBackup|class-registry|

### PersistentVolumeClaim

|name|requests|storageClassName|
|-|-|-|
|pvc-cityeyes|100Gi|class-cityeyes|
|pvc-paas|100Gi|class-paas|
|pvc-registry|100Gi|class-registry|

## Check pv, pvc

```shell
$ kubectl get pv
$ kubectl get pvc
```
