
# Deploy Engine

## Engine infomation
|Engine|CNName|Image|size|
|-|-|-|-|
|engine-classify|classify|140.96.29.86:31115/classify:1.2|6.54G|
|engine-clustering|clustering|140.96.29.86:31115/clustering:1.0|17.6G|

## 1. Create ConfigMaps from files

```shell
$ kubectl create configmap engine-classify --from-file=./engine/classify/config.properties
$ kubectl create configmap engine-clustering --from-file=./engine/clustering/config.properties
```

### Check Configmap

```shell
$ kubectl get configmap engine-classify
$ kubectl get configmap engine-classify -o yaml
```

## 2. Deploy engine

```shell
$ kubectl create -f ./engine/classify/engine_classify.yaml
$ kubectl create -f ./engine/clustering/engine_clustering.yaml
```

## 3. Start Orchestrator in container


### Into container
```shell
$ kubectl exec -it engine-XXXXXX-XXXXXX-XXXXX bash
```

### Start Orchestrator in container use atd
```shell
root@engine-XXXXXX-XXXXXX-XXXXX:/#  cd ~
root@engine-XXXXXX-XXXXXX-XXXXX:/#  at now
at> java -jar /root/Orchestrator-0.2.7.jar &
at>
at> <EOT>
```

## 4. Watch log in container
```shell
root@engine-XXXXXX-XXXXXX-XXXXX:/# -n 100 -f /root/log/CN\ -\ 10.244.2.42.log
```

## Service information
|ServiceName|Type|container Port|Expose Port|Node label|
|-|-|-|-|-|-|
|engine-classify|ClusterIP|80|N/A|`gpu:1080ti`, `machine:gpu`|
|engine-clustering|ClusterIP|80|N/A|`gpu:1080ti`, `machine:gpu`|


## Logging collection
[Using a sidecar container with the logging agent][logging agent].

![alt text](/Images/logging_with_streaming_sidecar.png "Dashboard")

[logging agent]: https://kubernetes.io/docs/concepts/cluster-administration/logging/#using-a-sidecar-container-with-the-logging-agent
