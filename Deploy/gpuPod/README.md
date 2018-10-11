
# Deploy Engine

## Engine infomation
|Engine|CNName|Image|
|-|-|-|
|engine-classify|classify|[aquamars00/deeplook_engine_classify:1.2](https://hub.docker.com/r/aquamars00/deeplook_engine_classify/)|
|engine-clustering|clustering|[aquamars00/deeplook_engine_clustering:1.2](https://hub.docker.com/r/aquamars00/deeplook_engine_clustering/)|

<!-- ## 1. Create ConfigMaps from files

```shell
$ kubectl create configmap engine-classify --from-file=./engine/classify/config.properties
$ kubectl create configmap engine-clustering --from-file=./engine/clustering/config.properties
```

### Check Configmap

```shell
$ kubectl get configmap engine-classify
$ kubectl get configmap engine-classify -o yaml
``` -->

## Deploy engine from script

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

## Watch log

According to different engine number need add number on `lapp` and `-c`.

e.g.: `watch kubectl logs --tail=55 -lapp=engine-classify-0 -c engine-classify-0-agent`

```shell
$ watch kubectl logs --tail=55 -lapp=engine-classify -c engine-classify-agent
$ watch kubectl logs --tail=55 -lapp=engine-clustering -c engine-clustering-agent
```

Watch logs from **kibana**
`https://${Master IP}:6443/api/v1/namespaces/kube-system/services/kibana-logging/proxy` on browser.

## Service information
|ServiceName|Type|container Port|Expose Port|Node label|
|-|-|-|-|-|
|engine-classify|ClusterIP|80|N/A|`gpu:1080ti`, `machine:gpu`|
|engine-clustering|ClusterIP|80|N/A|`gpu:1080ti`, `machine:gpu`|


## Logging collection
[Using a sidecar container with the logging agent][logging agent].

![alt text](/Images/logging_with_streaming_sidecar.png "Logging with streaming sidecar")

[logging agent]: https://kubernetes.io/docs/concepts/cluster-administration/logging/#using-a-sidecar-container-with-the-logging-agent
