# Deploy Engine

## 1. Create ConfigMaps from files

```shell
$ kubectl create configmap engine-merge --from-file=./merge/config.properties
```

## 2. Deploy merge engine

```shell
$ kubectl create -f ./merge/engine_merge.yaml
```

## 3.  Watch log

```shell
$ watch kubectl logs --tail=55 -lapp=engine-merge -c engine-merge-agent
```

## Deploy merge engine form registry

```shell
$ kubectl create -f ./merge/engine_merge-from-registry.yaml
```

## Engine infomation
|Engine|CNName|Image|
|-|-|-|
|engine-merge|merge|[aquamars00/deeplook_engine_merge:1.2](https://hub.docker.com/r/aquamars00/deeplook_engine_merge/)|