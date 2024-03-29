# Deploy Database

## ACL database

### ACL database deploy

```shell
$ kubectl create -f ./acl/acl-database-deploy.yaml
```

### ACL database deploy from registry
```shell
$ kubectl create -f ./acl/acl-database-deploy-from-registry.yaml
```

## Cityeyes database

### Cityeyes database deploy

Use `Helm` install.
```shell
$ helm install --name cityeyes -f cityeyes/values.yaml ../Helm-Charts/postgresql-0.18.0/
```

 The detail can see [kube apphub stable/postgresql](https://hub.kubeapps.com/charts/stable/postgresql)

### Cityeyes database deploy from registry

Use `Helm` install.
```shell
$ helm install --name cityeyes -f cityeyes/values-from-registry.yaml ../Helm-Charts/postgresql-0.18.0/
```

## PaaS database

### PaaS database deploy
Use `Helm` install.
```shell
$ helm install --name paas -f paas/values.yaml ../Helm-Charts/postgresql-0.18.0/
```

 The detail can see [kube apphub stable/postgresql](https://hub.kubeapps.com/charts/stable/postgresql)

### PaaS database deploy from registry

Use `Helm` install.
```shell
$ helm install --name paas -f paas/values-from-registry.yaml ../Helm-Charts/postgresql-0.18.0/
```
## Expose database

```shell
$ kubectl create -f db-expose.yaml
```

### Import sql file on container
```shell
$ kubectl cp <file.sql> <pod name>:/root
$ kubectl exec -it <pod name> -- psql -h 0.0.0.0 -d postgres -U snake_eyes -f /root/<file.sql>
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

## Remove expose database
```
$ kubectl delete -f db-expose.yaml
```


## Service Infomation

|ServiceName|Type|container Port|Expose Port|Node label|
|-|-|-|-|-|
|cityeyes-postgresql|ClusterIP|5432|N/A|`machine:storage`|
|paas-postgresql|ClusterIP|5432|N/A|`machine:storage`|
|acldb|ClusterIP|3306|N/A|`machine:storage`|
|cityeyes-postgresql-expose|ClusterIP|5432|32006||
|paas-postgresql-expose|ClusterIP|5432|32005||
|acldb-expose|ClusterIP|3306|32004||

## Volume Information

|Name|pvc|hostPath|
|-|-|-|
|cityeyes-postgresql|`pvc-cityeyes`|/pgBackup_cityeyes|
|paas-postgresql|`pvc-paas`|/pgBackup_paas|
|acldb|`pvc-acl`|/mysqlBackup_acl|

## Local file
On **storage node** will auto create folder for saving Data on `/pgBackup_cityeyes`, `/pgBackup_paas` and `/mysqlBackup_acl`.
