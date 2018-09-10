# Deploy Tomcat

**There are two kind of deploy.**

## 1: Deploy from git-repository (Highly RECOMMEND)

### Deploy deeplook
```shell
$ kubectl create -f ./deeplook/deeplook-deploy-from-code.yaml
```

> Deeplook build logs
>```shell
>$ watch kubectl logs --tail=55 -lapp=deeplook -c build-war
>```
> Deeplook tomcat logs
>```shell
>$ watch kubectl logs --tail=55 -lapp=deeplook -c cityeyes
>```

### Deploy paas
```shell
$ kubectl create -f ./paas/paas-deploy-from-code.yaml
```

> Paas build logs
>```shell
>$ watch kubectl logs --tail=55 -lapp=paas -c build-war
>```
> Paas tomcat logs
>```shell
>$ watch kubectl logs --tail=55 -lapp=paas -c paas
>```

### Concept

![alt text](/Images/Deploy_from_code.png "Deploy From Code")

## 2: Deploy from file(.war)

### Tomcat for deeplook
```shell
$ kubectl create -f deeplook.yaml
```

>Deeplook logs
>```shell
>$ watch kubectl logs --tail=55 -lapp=deeplook 
>```

### Deeplook Pod Information

|Container Path|Volume|
|-|-|
|/usr/local/tomcat/webapps|sambaURL/snakeeyes/webapps/deeplook|
|/var/www/html/|sambaURL/snakeeyes/|

### Tomcat for paas
```shell
$ kubectl create -f paas.yaml
```

>Paas logs
>```shell
>$ watch kubectl logs --tail=55 -lapp=paas 
>```

### Paas Pod Information
|Container Path|Volume|
|-|-|
|/usr/local/tomcat/webapps|sambaURL/snakeeyes/webapps/paas|

## Deploy Tomcat for ACL

### 1. Create configmap from file

```shell
$ kubectl create configmap acl-config --from-file=./acl/config/
```

Check configmap

```shell
$ kubectl get configmap acl-config
$ kubectl get configmap acl-config -o yaml
```
### 2. Deploy tomcat for acl

```shell
$ kubectl create -f ./acl/acl.yaml
```

## Image Information
|PodName|Container Image|
|-|-|
|deeplook|tomcat:8-jre8|
|paas|tomcat:7-jre8-alpine|
|acl|aquamars00/deeplook_acl:1.0|

## Service Infomation
|ServiceName|Type|container Port|Expose Port|
|-|-|-|-|
|deeplook|NodePort|8080|32010|
|paas|NodePort|8080|32011|

## Watch logs

Watch logs from **kibana**
`https://140.96.29.86:6443/api/v1/namespaces/kube-system/services/kibana-logging/proxy` on browser.