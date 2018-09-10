# Deploy Secret

```shell
$ kubectl create -f ./
```

## Secret Information
|Secret Name|DATA|Deploy for|
|-|-|-|
|database-secret|1 (postgres-password)|cityeyes-postgresql, paas-postgresql|
|pagadmin-secret|2 (username, password)|pgAdmin|
|cifs-secret|2 (username, password)|all the samba volume|

## Check secret

```shell
$ kuberctl get secret
```

## Create Secret Manually

```shell
$ echo -n 'admin' | base64
YWRtaW4=
```