# Install Helm

Can follow [installing-helm][1]

## Install Helm client

Can follow [installing-the-helm-client][2]

Choose version on [release][3]

```shell
$ wget https://storage.googleapis.com/kubernetes-helm/helm-v2.10.0-rc.1-linux-amd64.tar.gz
$ tar -zxvf helm-v2.10.0-rc.1-linux-amd64.tar.gz
$ mv linux-amd64/helm /usr/local/bin/helm
```

Check helm is work

```shell
$ helm help
```

## Install Tiller

> When you reset k8s(kubeadm reset). \
> You need do this step again.

### RBAC install
You can follow this [tiller-and-role-based-access-control][4]
```shell
$ kubectl create -f ./helm_rbac/rbac-config.yaml
$ helm init --service-account tiller
```

<!-- ### Basic install
Bascially, You only need:
```shell
$ helm init
``` -->



[1]: https://docs.helm.sh/using_helm/#installing-helm
[2]: https://docs.helm.sh/using_helm/#installing-the-helm-client
[3]: https://github.com/helm/helm/releases
[4]: https://github.com/helm/helm/blob/master/docs/rbac.md#tiller-and-role-based-access-control