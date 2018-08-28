# Deploy Tomcat

**There are two kind of deploy.**

## 1: Deploy from git-repository (Highly RECOMMEND)

### Deploy deeplook
```shell
$ kubectl create -f deeplook-deploy-from-code.yaml
```

### Deploy paas
```shell
$ kubectl create -f paas-deploy-from-code.yaml
```

### Concept

![alt text](/Images/Deploy_from_code.png "Deploy From Code")

## 2: Deploy from file(.war)

### Tomcat for deeplook
```shell
$ kubectl create -f deeplook.yaml
```
### Deeplook Pod Information

|Container Path|Volume|
|-|-|
|/usr/local/tomcat/webapps|sambaURL/snakeeyes/webapps/deeplook|
|/var/www/html/|sambaURL/snakeeyes/|

### Tomcat for paas
```shell
$ kubectl create -f paas.yaml
```
### Paas Pod Information
|Container Path|Volume|
|-|-|
|/usr/local/tomcat/webapps|sambaURL/snakeeyes/webapps/paas|

## Image Information
|PodName|Container Image|
|-|-|
|deeplook|tomcat:8-jre8|
|paas|tomcat:7-jre8-alpine|

## Service Infomation
|ServiceName|Type|container Port|Expose Port|
|-|-|-|-|
|deeplook|NodePort|8080|32010|
|paas|NodePort|8080|32011|

## Watch logs

Watch logs from **kibana**
`https://140.96.29.86:6443/api/v1/namespaces/kube-system/services/kibana-logging/proxy` on browser.

### Deeplook logs
```shell
$ watch kubectl logs --tail=55 -lapp=deeplook 
```

### Paas logs
```shell
$ watch kubectl logs --tail=55 -lapp=paas 
```