# Deploy MapTile Server
 
## Deploy from yaml

```shell
$ kubectl create -f mapServer-deployment.yaml
```

## Remove MapTile Server

```shell
$ kubectl delete -f mapServer-deployment.yaml
```

### Infomation

|ServiceName|Type|container Port|Expose Port|Node label|
|-|-|-|-|-|
|map|NodePort|80|32009|`machine:storage`|