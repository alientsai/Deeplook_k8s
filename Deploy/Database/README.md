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

The database port must be `3306` or api can't get DB.
(No ACL source code for changing this bug.)

Using docker container for deploying ACL database.

```shell
$ docker run -it -d --name acl_db -p  3306:3306 aquamars00/deeplook_acl_database:1.0
$ docker exec -it acl_db /etc/init.d/mysql start
```

## Service Infomation

|ServiceName|Type|container Port|Expose Port|Node label|
|-|-|-|-|-|
|cityeyes-postgresql|ClusterIP|5432|N/A|`machine:storage`|
|paas-postgresql|ClusterIP|5432|N/A|`machine:storage`|
|acl_db (docker container)|N/A|3306|3306|N/A|

## Volume Information

|Name|pvc|hostPath|
|-|-|-|
|cityeyes-postgresql|`pvc-cityeyes`|/pgBackup_cityeyes|
|paas-postgresql|`pvc-paas`|/pgBackup_paas|

## Local file
On **storage node** will auto create folder for saving pgData on `/pgBackup_cityeyes`, `/pgBackup_paas`
