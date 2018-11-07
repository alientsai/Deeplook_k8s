# Deploy nginx (for no samba)

## 1. Create ConfigMaps from files

```shell
$ kubectl create configmap nginx-config --from-file=./nginx.conf
```
### Check Configmap

```shell
$ kubectl get configmap nginx-config -o yaml
```

## 2. Deloy nginx

```shell
$ kubectl create -f nginx-deployment.yaml
```

## Deloy nginx from registry

```shell
$ kubectl create -f nginx-deployment-from-registry.yaml
```

## Remove nginx

```shell
$ kubectl delete -f nginx-deployment.yaml
```

## Remove nginx configmap

```shell
$  kubectl delete configmap nginx-config
```

## Service Infomation
|ServiceName|Type|container Port|Expose Port|
|-|-|-|-|
|nginx|ClusterIP|80|N/A|

## Watch Log

```shell
$ watch kubectl logs --tail=55 -lapp=nginx
```