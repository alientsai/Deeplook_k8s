# Deploy Rabbitmq
 
## Using Helm install
 
```shell
$ helm install --name mq -f values.yaml stable/rabbitmq --version 1.1.9
```
 
The detail can see [kube apphub Rabbitmq][1]

## Expose manage port

```shell
$ kubectl create -f mq-svc.yaml
```

## Service Infomation

|ServiceName|Type|container Port|Expose Port|
|-|-|-|-|
|mq-rabbitmq|ClusterIP|4369,5672,25672,15672|N/A|
|mq-rabbitmq-expose|NodePort|5672|32007|

[1]:https://hub.kubeapps.com/charts/stable/rabbitmq
