# Deploy MapTile Server
 
## Deploy from yaml

```shell
$ kubectl create -f mapServer-deployment.yaml
```

## Deploy from registry

```shell
$ kubectl create -f mapServer-deployment-from-registry.yaml
```

## Remove MapTile Server

```shell
$ kubectl delete -f mapServer-deployment.yaml
```

### Infomation

|ServiceName|Type|container Port|Expose Port|Node label|
|-|-|-|-|-|
|map|ClusterIP|80|N/A|`machine:storage`|