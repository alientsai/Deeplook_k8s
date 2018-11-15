# Initial data

This is a kubernetes job.

Idea: Make a image have initial data. Use kubernetes job to copy data to pvc.


## Create job
```sh
$ kubectl create -f clone-data-job.yaml
```

## Create job from registry
```sh
$ kubectl create -f clone-data-job-from-registry.yaml
```

## Check job

```sh
$ kubectl get job
```

## Check job's pod status

```sh
$ kubectl get po
```

When job's pod status `completed` then delete job.

```sh
$ kubectl delete -f clone-data-job.yaml
```
## Image infomation
|Image|
|-|
|[aquamars00/deeplook_init_data:1.1](https://hub.docker.com/r/aquamars00/deeplook_init_data/)|

## Idea
![alt text](/Images/Initial_datas.png "Initial Datas")