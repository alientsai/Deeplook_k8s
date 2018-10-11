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
|deeplook|${Master IP}|
|paas|${Master IP}/`PaaS`/|
|media|${Master IP}/`media`/|
|map|${Master IP}/`map`/|
|rabbitmq|${Master IP}/`rabbitmq`/|