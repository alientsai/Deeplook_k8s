# Deploy Docker Registry
 
> This is insecure registry !

## Docker Registry

```
kubectl create -f docker-registry.yaml
```

## Docker Registry UI

```
kubectl create -f ./UI/registry-UI.yaml
```

## Infomation
|ServiceName|Type|container Port|Expose Port|Node label|
|-|-|-|-|-|
|registry|NodePort|5000|31115|machine: storage|
|registry-ui|NodePort|80|31116|N/A|

## Enable Insecure registry

1. Edit the daemon.json file, whose default location is `/etc/docker/daemon.json`
If the daemon.json file does not exist, create it. Assuming there are no other settings in the file, it should have the following contents:

```
 {
  "insecure-registries" : ["140.96.29.86:31115"]
 }
```

2. Restart docker
> Don't interrupt restarting docker !
```
 service docker restart
```
 
The detail can fallow [Test an insecure registry][1]

## Push image to registry

```
 docker tag <target images> 140.96.29.86:31115/<image name and tag>
 docker push 140.96.29.86:31115/<image name and tag>
```
 [1]: https://docs.docker.com/registry/insecure/