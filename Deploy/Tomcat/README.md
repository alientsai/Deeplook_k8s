# Deploy Tomcat

## **Deploy Order :**

1. [ACL](./README.md#deploy-tomcat-for-acl)
2. [PaaS](./README.md#deploy-paas)
3. [Deeplook](./README.md#deploy-deeplook)

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

## Deploy Tomcat for PaaS & deeplook

### Deploy paas (from image)
```shell
$ kubectl create -f ./paas/paas.yaml
```

> Paas tomcat logs
>```shell
>$ watch kubectl logs --tail=55 -lapp=paas
>```


### Deploy deeplook (from code)

> Need change the `IP` in `yaml` !

```shell
$ kubectl create -f ./deeplook/deeplook-deploy-from-code.noSamba.yaml
```

> Deeplook build logs
>```shell
>$ watch kubectl logs --tail=55 -lapp=deeplook -c build-war
>```
> Deeplook tomcat logs
>```shell
>$ watch kubectl logs --tail=55 -lapp=deeplook -c cityeyes
>```

### Project information

|Project|branch/tag|
|-|-|
|[ITRI-ICL-DivX/deeplook_cityeyes](https://github.com/ITRI-ICL-DivX/deeplook_cityeyes)|[v1.1.0](https://github.com/ITRI-ICL-DivX/deeplook_cityeyes/tree/v1.1.0)|
|[ITRI-ICL-DivX/deeplook_paas](https://github.com/ITRI-ICL-DivX/deeplook_paas)|[develop](https://github.com/ITRI-ICL-DivX/deeplook_paas/tree/develop)|

### Concept

![alt text](/Images/Deploy_from_code.png "Deploy From Code")

### Paas Pod Information
|Container Path|Volume|
|-|-|
|/usr/local/tomcat/webapps|sambaURL/snakeeyes/webapps/paas|

## Image Information
|PodName|Container Image|
|-|-|
|deeplook|tomcat:8-jre8|
|paas|aquamars00/deeplook_paas:1.0|
|acl|aquamars00/deeplook_acl:1.0|

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

## Service Infomation
|ServiceName|Type|container Port|Expose Port|
|-|-|-|-|
|deeplook|clusterIP|8080|N/A|
|paas|clusterIP|8080|N/A|
|acl|clusterIP|8080|N/A|

## Watch logs

Watch logs from **kibana**
`https://${Master IP}:6443/api/v1/namespaces/kube-system/services/kibana-logging/proxy` on browser.