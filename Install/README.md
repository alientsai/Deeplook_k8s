# Installation

**Ubuntu 16.04 is working on this guide**

## Before Install - Check your dns

**On `/etc/resolv.conf` check your dns.**

### Change dns

Open `/etc/network/interfaces` and add `dns-nameservers 8.8.8.8 8.8.8.4`.

```shell
$ vim /etc/network/interfaces
# Add follows :
# dns-nameservers 8.8.8.8
# dns-nameservers 8.8.8.4
$ reboot
```



## 1. Docker

Install Docker from Ubuntu’s repositories:

```shell
$ apt-get update
$ apt-get install -y docker.io
```

Or install Docker CE 18.06

```shell
$ apt-get update
$ apt-get install -y apt-transport-https ca-certificates curl software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
$ add-apt-repository "deb https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable"
$ apt-get update && apt-get install -y docker-ce=$(apt-cache madison docker-ce | grep 18.06 | head -1 | awk '{print $3}')
```

The more detail can referrer [install-kubadm/installing-docker][k8s-install-docker] and [install-docker-ce][install-docker-ce]

## 2. nvidia Driver (GPU Node)

Reference: 
- https://blog.csdn.net/CosmosHua/article/details/76644029
- https://gist.github.com/wangruohui/df039f0dc434d6486f5d4d098aa52d07


## 3. nvidia-Docker (GPU Node)

#### Ubuntu 14.04/16.04/18.04, Debian Jessie/Stretch
```sh
# If you have nvidia-docker 1.0 installed: we need to remove it and all existing GPU containers
$ docker volume ls -q -f driver=nvidia-docker | xargs -r -I{} -n1 docker ps -q -a -f volume={} | xargs -r docker rm -f
$ sudo apt-get purge -y nvidia-docker

# Add the package repositories
$ curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -
$ distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
$ curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
$ sudo apt-get update

# Install nvidia-docker2 and reload the Docker daemon configuration
$ sudo apt-get install -y nvidia-docker2
$ sudo pkill -SIGHUP dockerd

# Test nvidia-smi with the latest official CUDA image
$ docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi
```

The more detail can referrer [nvidia-docker][nvidia-docker#quickstart] and [Docker Engine setup][Docker Engine setup]

## 3. Kubernetes
See [Kubernetes.md](./Kubernetes.md)

> Video: [Install k8s with gpu](https://drive.google.com/open?id=1e-UygnAXL0NJzqmf7xzY5i7GHfQDm5AW)

## 4. GPU for Kubernetes
See [GPUforKubernetes.md](./GPUforKubernetes.md)

## 5. Helm (Master)
> Use RBAC install
See [Helm.md](./Helm.md) 

> Video: [Install helm](https://drive.google.com/open?id=18Ka-U_y0yosOErhYEY0I-Y6TvADBKc1a)

## Troubleshooting
See [Troubleshooting](./Troubleshooting.md)

[k8s-install-docker]: https://kubernetes.io/docs/setup/independent/install-kubeadm/#installing-docker
[install-docker-ce]: https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce
[nvidia-docker#quickstart]: https://github.com/NVIDIA/nvidia-docker#quickstart
[Docker Engine setup]: https://github.com/nvidia/nvidia-container-runtime#docker-engine-setup