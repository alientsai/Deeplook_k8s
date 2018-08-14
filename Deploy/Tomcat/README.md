# Deploy Tomcat

## Tomcat for deeplook
```shell
$ kubectl create -f deeplook.yaml
```
### Deeplook Pod Information

|Container Path|Volume|
|-|-|
|/usr/local/tomcat/webapps|sambaURL/snakeeyes/webapps/deeplook|
|/var/www/html/|sambaURL/snakeeyes/|

## Tomcat for paas
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
|paas|ClusterIP|8080|N/A|