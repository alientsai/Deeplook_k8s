# Deploy EFK

This is a combination of [Elasticsearch][elasticsearch],
[Fluentd][fluentd] and [Kibana][kibana].

The files `es-service.yaml`, `es-statefulset.yaml`, `fluentd-es-configmap.yaml`, `fluentd-es-ds.yaml`, `kibana-deployment.yaml` and `kibana-service.yaml` are from [Fluentd-elasticsearch][fluentd-elasticsearch].

`rbac.yaml` is from iussue - [Can not access service kibana-logging][Can not access service kibana-logging].

`rbac.yaml` let anonymous can access kibana.

## Deploy

```shel
$ kubectl create -f ./
```

## Get url

```shell
$ kubectl cluster-info | grep kibana
```

## Information

|ServiceName|Type|container Port|Expose Port|namespace|
|-|-|-|-|-|-|
|elasticsearch-logging|ClusterIP|9200|N/A|`kube-system`|
|kibana-logging|ClusterIP|5601|N/A|`kube-system`|


[fluentd-elasticsearch]: https://github.com/kubernetes/kubernetes/tree/master/cluster/addons/fluentd-elasticsearch
[fluentd]: http://www.fluentd.org/
[elasticsearch]: https://www.elastic.co/products/elasticsearch
[kibana]: https://www.elastic.co/products/kibana
[Can not access service kibana-logging]: https://github.com/kubernetes-incubator/kubespray/issues/2349
