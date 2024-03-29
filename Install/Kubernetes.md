# Install Kubernetes using kubeadm

## Node information
|Hostername|OS|IP|GPU|
| - | - | - | - |
|a4050302-un62|Ubuntu 16.04|140.96.29.86|0|
|990293dnn|Ubuntu 16.04|140.96.29.171|1|

## Install Master
Install on `a4050302-un62`

### 1. Update packages and install some packages
For download from https.
```shell
$ apt-get update
$ apt-get install -y apt-transport-https curl nfs-common nfs-kernel-server
```

The [CIFS Flexvolume Plugin][0] requires (Can ignore if not use):

* `mount.cifs`, on Ubuntu this is in the [cifs-utils][1] package.
* `jq`, on Ubuntu this is in the [jq][2] package.
* `mountpoint`, on Ubuntu this is in the [util-linux][3] package.
* `base64`, on Ubuntu this is in the [coreutils][4] package.

```shell
$ apt-get install -y mount.cifs jq mountpoint base64
```

### 2. Install kubelet and kubeadm on hosts

```shell
$ curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
$ cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
$ apt-get update
$ apt-get install -y kubelet kubeadm kubectl kubernetes-cni
```
### 3. Initializing Master

> Need disable swap first !!

```shell
$ sudo swapoff -a 
```
> Disable Swap forever
> ref : http://www.dayexie.com/detail1298500.html
> 
> Change `/etc/fstab`, comment `swap` then `reboot`>  

Initial from kubeadm :
```shell
$ kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=${Master IP}
```

Initial from kubeadm with specific version and skip preflight (Offline):
```shell
$ kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=${Master IP} --kubernetes-version=v1.11.3 --ignore-preflight-errors=all
```

### 4. Config kubectl
```shell
$ mkdir -p $HOME/.kube
$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
$ sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

### 5. setting KUBECONFIG
```shell
$ export KUBECONFIG=$HOME/.kube/config
```

### 6. Install CNI

```shell
$ kubectl apply -f ./flannel/kube-flannel.yml
$ kubectl apply -f ./flannel/kube-flannel-rbac.yml
```
`kube-flannel.yaml` from [kube-flannel](https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml)
`kube-flannel-rbac.yaml` from [kube-flannel-rbac](https://raw.githubusercontent.com/coreos/flannel/master/Documentation/k8s-manifests/kube-flannel-rbac.yml)


You can use another cni like `Calico`, `canal`, `weave` or something else you wanted.

## Install Minion (Worker)

Install on `990293dnn`
Repeat `Install Master` step :
- [1. Update packages and install some packages](#1-update-packages-and-install-some-packages)
- [2. Install kubelet and kubeadm on hosts](#2-install-kubelet-and-kubeadm-on-hosts) then join node.

> Need disable swap first !!

```shell
$ sudo swapoff -a 
```
> Disable Swap forever
> ref : http://www.dayexie.com/detail1298500.html
> 
> Change `/etc/fstab`, comment `swap` then `reboot`>  

### Join nodes

**On `master` copy command:**

```sh
$ kubeadm token create --print-join-command
# Copy follow command:
# `kubeadm join 140.96.29.86:6443 --token fzuf2f.ihdf67ai1rg2y578 --discovery-token-ca-cert-hash sha256:044da37f2afe22ce8ca78a99d2f841d8e3c2599b4660508053ff66fa5720f8b4`
```

**On `minion node`:**

```shell
$ kubeadm join ${Master IP}:6443 --token fzuf2f.ihdf67ai1rg2y578 --discovery-token-ca-cert-hash sha256:044da37f2afe22ce8ca78a99d2f841d8e3c2599b4660508053ff66fa5720f8b4
```

### 7. Setting labels

> Each Node can't have same key label !

#### Gpu node label

```shell
$ kubectl label node ${GPU Node Name} gpu=1080ti
$ kubectl label node ${GPU Node Name} machine=gpu
```

#### Storage node label

```shell
$ kubectl label node $(hostname | sed 's/\([A-Z]\)/\L\1/g') machine=storage
```

#### Role node label

```shell
$ kubectl label node $(hostname | sed 's/\([A-Z]\)/\L\1/g') role=master
```

#### Check labels

```shell
$ kubectl get node --show-labels
```

## Additional

### Enabling shell auto completion

```shell
$ apt-get install -y bash-completion
$ echo "source <(kubectl completion bash)" >> ~/.bashrc
$ source /etc/bash_completion
$ source <(kubectl completion bash)
```

### Enable scheduling pods on the master

```shell
$ kubectl taint nodes --all node-role.kubernetes.io/master-
```

<!-- ### Create Token for join node

```shell
$ kubeadm token create
$ kubeadm token list
```

### Get token ca cert hash

```shell
$ openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'
``` -->

[0]: https://github.com/fstab/cifs
[1]: https://packages.ubuntu.com/bionic/cifs-utils
[2]: https://packages.ubuntu.com/bionic/jq
[3]: https://packages.ubuntu.com/bionic/util-linux