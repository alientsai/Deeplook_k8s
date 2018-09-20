# Deploy Database

## Cityeyes database
Use `Helm` install.
```shell
$ helm install --name cityeyes -f cityeyes/values.yaml stable/postgresql
```
 
## PaaS database
Use `Helm` install.
```shell
$ helm install --name paas -f paas/values.yaml stable/postgresql
```

### Import sql file on container
```shell
$ kubectl cp <file.sql> <pod name>:/root
$ kubectl exec -it <pod name> -- psql -h 0.0.0.0 -d postgres -U snake_eyes -f /root/<file.sql>
```

## ACL database

```shell
$ kubectl create -f ./acl/acl-database-deploy.yaml
```

## Remove cityeyes database
Use `Helm` remove.
```
$ helm delete --purge cityeyes
```

## Remove paas database
Use `Helm` remove.
```
$ helm delete --purge paas
```

## Remove ACL database
```
$ kubectl delete -f ./acl/acl-database-deploy.yaml
```

## Service Infomation

|ServiceName|Type|container Port|Expose Port|Node label|
|-|-|-|-|-|
|cityeyes-postgresql|ClusterIP|5432|N/A|`machine:storage`|
|paas-postgresql|ClusterIP|5432|N/A|`machine:storage`|
|acldb|ClusterIP|3306|N/A|`machine:storage`|

## Volume Information

|Name|pvc|hostPath|
|-|-|-|
|cityeyes-postgresql|`pvc-cityeyes`|/pgBackup_cityeyes|
|paas-postgresql|`pvc-paas`|/pgBackup_paas|
|acldb|`pvc-acl`|/mysqlBackup_acl|

## Local file
On **storage node** will auto create folder for saving Data on `/pgBackup_cityeyes`, `/pgBackup_paas` and `/mysqlBackup_acl`.
