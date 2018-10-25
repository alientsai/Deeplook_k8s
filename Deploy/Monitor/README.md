# Deploy monitor

<!-- ## Add helm repo

```shell
$ helm repo add coreos https://s3-eu-west-1.amazonaws.com/coreos-charts/stable/
``` -->

## Create namespace `monitoring`

```shell
$ kubectl create namespace monitoring
```

## Deploy `prometheus-operator` and `kube-prometheus`

```shell
$ helm install ../Helm-Charts/prometheus-operator-0.0.29 --name prometheus-operator --namespace monitoring
$ helm install ../Helm-Charts/kube-prometheus-0.0.105 --name kube-prometheus --namespace monitoring
```
The detail can see [prometheus-operator][prometheus-operator] and [kube-prometheus][kube-prometheus]

[prometheus-operator]:https://github.com/coreos/prometheus-operator/tree/master/helm/prometheus-operator

[kube-prometheus]:https://github.com/coreos/prometheus-operator/tree/master/helm/kube-prometheus