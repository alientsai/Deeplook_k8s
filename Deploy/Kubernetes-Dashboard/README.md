# Deploy kubernetes-dashboard

The deploy inculde `heapster`, `grafana` and `influxdb`.
The yaml files from [kubernetes/heapster][heapster].

```shell
$ kubectl create -f admin-user.yaml,kubernetes-dashboard.yaml,grafana.yaml,heapster.yaml,influxdb.yaml
```

## Get token for Dashboard

```shell
$ kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
```
![alt text](/Images/admin_user_token.png "token")

## Access Dashboard

`http://<master-ip>:6443/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/`

```
https://140.96.29.86:6443/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
```

## Use token login

![alt text](/Images/Dashboard_login.png "login use token")
![alt text](/Images/Dashboard_review.png "Dashboard")

[heapster]: https://github.com/kubernetes/heapster/tree/master/deploy/kube-config/influxdb