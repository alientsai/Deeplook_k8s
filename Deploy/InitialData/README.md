# Initial data

This is a kubernetes job.

Idea: Make a image have initial data. Use kubernetes job to copy data to pvc.

```sh
$ kubectl create -f ./
```

When job status `completed` then delete job.

```sh
$ kubectl delete -f ./
```

## Idea
![alt text](/Images/Initial_datas.png "Initial Datas")