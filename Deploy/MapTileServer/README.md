# Deploy MapTile Server
 
## Deploy from yaml

```
 kubectl create -f mapServer-deployment.yaml
```

### Infomation

|ServiceName|Type|container Port|Expose Port|
|-|-|-|-|
|map|NodePort|80|32009|