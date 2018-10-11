# Deploy Ingress

## Install Ingress controller

Use `helm` install ingress controller.

```shell
$ helm install stable/nginx-ingress --name ing --set controller.hostNetwork=true --version=0.23.0
```
The detail can see [kube apphub stable/nginx-ingress](https://hub.kubeapps.com/charts/stable/nginx-ingress)

## Deploy ingress service

```shell
$ kubectl create -f ./
```

## Expose service

**Don't forget ' `/` ' !**

|ServiceName|Expose url|
|-|-|
|deeplook|140.96.29.86|
|paas|140.96.29.86/`PaaS`/|
|media|140.96.29.86/`media`/|
|map|140.96.29.86/`map`/|
|rabbitmq|140.96.29.86/`rabbitmq`/|