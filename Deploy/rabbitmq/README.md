# Deploy Rabbitmq
 
## Using Helm install
 
```shell
$ helm install --name mq -f values.yaml stable/rabbitmq --version 1.1.9
```
 
The detail can see [kube apphub stable/rabbitmq][1]

## Expose manage port

```shell
$ kubectl create -f mq-svc.yaml
```

## Using script Create queues

```shell
$ chmod 755 ./setQueues.sh && ./setQueues.sh
```

The script will created quenes :
```js
3, 3_L, 3_H,
5, 5_L, 5_L,
10, 10_L, 10_H,
11, 11_L, 11_H,
12, 12_L, 12_H
```

## Service Infomation

|ServiceName|Type|container Port|Expose Port|
|-|-|-|-|
|mq-rabbitmq|ClusterIP|4369,5672,25672,15672|N/A|
|mq-rabbitmq-expose|NodePort|5672,15672|31072,31075|

[1]:https://hub.kubeapps.com/charts/stable/rabbitmq
