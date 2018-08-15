# Deploy Database postgrsql
 
## Using Helm

### Cityeyes database
```shell
$ helm install --name cityeyes -f cityeyes/values.yaml stable/postgresql
```
 
### PaaS database
```shell
$ helm install --name paas -f paas/values.yaml stable/postgresql
```

### Import sql file on container
```shell
$ psql -h 0.0.0.0 -d postgres -U snake_eyes -f <file.sql>
```

### Service Infomation

|ServiceName|Type|container Port|Expose Port|Node label|
|-|-|-|-|-|
|cityeyes-postgresql|ClusterIP|5432|N/A|`machine:storage`|
|paas-postgresql|ClusterIP|5432|N/A|`machine:storage`|

### Volume Information

|Name|pvc|hostPath|
|-|-|-|
|cityeyes-postgresql|`pvc-cityeyes`|/pgBackup_cityeyes|
|paas-postgresql|`pvc-paas`|/pgBackup_paas|

## Local file
On **storage node** will auto create folder for saving pgData on `/pgBackup_cityeyes`, `/pgBackup_paas`
