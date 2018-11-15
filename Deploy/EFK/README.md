# Deploy EFK

This is a combination of [Elasticsearch][elasticsearch],
[Fluentd][fluentd] and [Kibana][kibana].

The files `es-service.yaml`, `es-statefulset.yaml`, `fluentd-es-configmap.yaml`, `fluentd-es-ds.yaml`, `kibana-deployment.yaml` and `kibana-service.yaml` are from [Fluentd-elasticsearch][fluentd-elasticsearch].

`rbac.yaml` is from iussue - [Can not access service kibana-logging][Can not access service kibana-logging].

`rbac.yaml` let anonymous can access kibana.

> **Note:** in order for Fluentd to work, every Kubernetes node must be labeled with beta.kubernetes.io/fluentd-ds-ready=true, as otherwise the Fluentd DaemonSet will ignore them.

![alt text](/Images/kibana_logging.png "Kibana")

## Deploy

```shel
$ kubectl create -f es-service.yaml,es-statefulset.yaml,fluentd-es-configmap.yaml,fluentd-es-ds.yaml,kibana-deployment.yaml,kibana-service.yaml,rbac.yaml
```

## Get url

```shell
$ kubectl cluster-info | grep kibana
```
## Kibana Setting 

Follow [`Kibana Setting`](./KibanaPatternSetting.md)

## Information

|ServiceName|Type|container Port|Expose Port|namespace|
|-|-|-|-|-|
|elasticsearch-logging|ClusterIP|9200|N/A|`kube-system`|
|kibana-logging|ClusterIP|5601|N/A|`kube-system`|


[fluentd-elasticsearch]: https://github.com/kubernetes/kubernetes/tree/master/cluster/addons/fluentd-elasticsearch
[fluentd]: http://www.fluentd.org/
[elasticsearch]: https://www.elastic.co/products/elasticsearch
[kibana]: https://www.elastic.co/products/kibana
[Can not access service kibana-logging]: https://github.com/kubernetes-incubator/kubespray/issues/2349

