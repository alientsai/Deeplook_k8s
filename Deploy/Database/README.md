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

### Infomation

|ServiceName|Type|container Port|Expose Port|
|-|-|-|-|
|cityeyes-postgresql|ClusterIP|5432|N/A|
|paas-postgresql|ClusterIP|5432|N/A|
