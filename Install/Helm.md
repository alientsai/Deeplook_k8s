# Install Helm

Can follow [installing-helm][1]

## Install Helm client

Can follow [installing-the-helm-client][2]

Choose version on [release][3]

```
wget https://storage.googleapis.com/kubernetes-helm/helm-v2.10.0-rc.1-linux-amd64.tar.gz
tar -zxvf helm-v2.10.0-rc.1-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
```

Check helm is work

```
helm help
```

## Install Tiller

### Basic
Bascially, You only need:
```
helm init
```

### RBAC
You can follow this [tiller-and-role-based-access-control][4]
```
kubectl create -f rbac-config.yaml
helm init --service-account tiller
```

[1]: https://docs.helm.sh/using_helm/#installing-helm
[2]: https://docs.helm.sh/using_helm/#installing-the-helm-client
[3]: https://github.com/helm/helm/releases
[4]: https://github.com/helm/helm/blob/master/docs/rbac.md#tiller-and-role-based-access-control