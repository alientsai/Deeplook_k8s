
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

Execute script `deploy_engines.sh` for deploying multi engines.

### Step 1: Change privilege of script

```shell
$ chmod 755 ./deploy_engines.sh
```
### Step 2. Execut script

```shell
$ ./deploy_engines.sh
```

**Follow the video**

[![asciicast](https://asciinema.org/a/Z8qfeVL8XAaQpFA6BF685rrGD.png)](https://asciinema.org/a/Z8qfeVL8XAaQpFA6BF685rrGD)

```shell
$ kubectl create -f ./engine/classify/engine_classify.yaml
$ kubectl create -f ./engine/clustering/engine_clustering.yaml
```

## 3. Watch log

```shell
$ watch kubectl logs --tail=55 -lapp=engine-classify -c engine-classify-agent
$ watch kubectl logs --tail=55 -lapp=engine-clustering -c engine-clustering-agent
```

Watch logs from **kibana**
`https://140.96.29.86:6443/api/v1/namespaces/kube-system/services/kibana-logging/proxy` on browser.

## Service information
|ServiceName|Type|container Port|Expose Port|Node label|
|-|-|-|-|-|-|
|engine-classify|ClusterIP|80|N/A|`gpu:1080ti`, `machine:gpu`|
|engine-clustering|ClusterIP|80|N/A|`gpu:1080ti`, `machine:gpu`|


## Logging collection
[Using a sidecar container with the logging agent][logging agent].

![alt text](/Images/logging_with_streaming_sidecar.png "Logging with streaming sidecar")

[logging agent]: https://kubernetes.io/docs/concepts/cluster-administration/logging/#using-a-sidecar-container-with-the-logging-agent
