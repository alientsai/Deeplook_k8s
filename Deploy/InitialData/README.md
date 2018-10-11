# Initial data

This is a kubernetes job.

Idea: Make a image have initial data. Use kubernetes job to copy data to pvc.

```sh
$ kubectl create -f ./
```

Check job

```sh
$ kubectl get job
```

Check job's pod status

```sh
$ kubectl get po
```

When job's pod status `completed` then delete job.

```sh
$ kubectl delete -f ./
```
## Image infomation
|Image|
|-|-|-|
|[aquamars00/deeplook_init_data:1.0](https://hub.docker.com/r/aquamars00/deeplook_init_data/)|

## Idea
![alt text](/Images/Initial_datas.png "Initial Datas")