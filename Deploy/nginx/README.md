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

## Watch Log

```shell
$ watch kubectl logs --tail=55 -lapp=nginx
```