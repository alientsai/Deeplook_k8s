# Deploy pgadmin4
 
## Deploy from yaml

```shell
 $ kubectl create -f pgadmin-deployment.yaml
```
## Remove pgadmin4

```shell
$ kubectl delete -f pgadmin-deployment.yaml
```

### Default Setting

|Parameter|Default|
|-|-|
|PGADMIN_DEFAULT_EMAIL|admin@admin.com|
|PGADMIN_DEFAULT_PASSWORD|admin|

###  Service Infomation

|ServiceName|Type|container Port|Expose Port|
|-|-|-|-|
|pgadmin4|NodePort|80|32008|