# Deploy pgadmin4
 
## Deploy from yaml

```
 kubectl create -f pgadmin-deployment.yaml
```
### Default Setting

|Parameter|Default|
|-|-|
|PGADMIN_DEFAULT_EMAIL|admin@admin.com|
|PGADMIN_DEFAULT_PASSWORD|admin|

###  Service Infomation

|ServiceName|Type|container Port|Expose Port|
|-|-|-|-|
|map|NodePort|80|32008|