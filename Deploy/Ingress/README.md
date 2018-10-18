# Deploy Ingress

## Install Ingress controller

Use `helm` install ingress controller.

```shell
$ helm install stable/nginx-ingress --name ing -f values.yaml --version=0.23.0
```
The detail can see [kube apphub stable/nginx-ingress](https://hub.kubeapps.com/charts/stable/nginx-ingress)

## Check Ingress controller is working

```shell
$ curl -v http://${Master IP}/healthz
```

Should be like this:

```shell
*   Trying 140.96.29.86...
* Connected to 140.96.29.86 (140.96.29.86) port 80 (#0)
> GET /healthz HTTP/1.1
> Host: 140.96.29.86
> User-Agent: curl/7.47.0
> Accept: */*
>
< HTTP/1.1 200 OK
< Server: nginx/1.13.12
< Date: Thu, 11 Oct 2018 04:43:45 GMT
< Content-Type: text/html
< Content-Length: 0
< Connection: keep-alive
<
* Connection #0 to host 140.96.29.86 left intact
```

## Deploy Ingress service (After Ingrss controller is working)

```shell
$ kubectl create -f ./
```

## Remove Ingress service

```shell
$ kubectl delete ./
```

## Remove Ingress controller

Use `helm` remove ingress controller.

```shell
$ helm delete --purge ing
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