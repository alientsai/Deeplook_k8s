# Deploy monitor

## Add helm repo

```shell
$ helm repo add coreos https://s3-eu-west-1.amazonaws.com/coreos-charts/stable/
```

## Create namespace `monitoring`

```shell
$ kubectl create namespace monitoring
```

## Deploy `prometheus-operator` and `kube-prometheus`

```shell
$ helm install coreos/prometheus-operator --name prometheus-operator --namespace monitoring
$ helm install coreos/kube-prometheus --name kube-prometheus --namespace monitoring
```

https://github.com/coreos/prometheus-operator/tree/master/helm/prometheus-operator
https://github.com/coreos/prometheus-operator/tree/master/helm/kube-prometheus