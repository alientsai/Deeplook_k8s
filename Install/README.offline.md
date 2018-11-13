# Offline Installation

**Ubuntu 16.04 is working on this guide**

## 1. Get Deeplook_k8s project

```shell
$ git clone https://gitlab.com/Aquamars/Deeplook_k8s
```

## 2. Packages

### 2.1 Get packages

You can download from [link](https://mega.nz/#F!5V9BUYoL!5jfhpfT8F0OCscJMCndumA)


```sh
├── docker_NVdocker
├── helm
├── Kubernetes
│   └── 1.11.3
├── nvidiaDrive
└── vim
```

### 2.2 Install vim

```shell
dpkg -i vim-runtime_2%3a7.4.1689-3ubuntu1.2_all.deb
dpkg -i vim_2%3a7.4.1689-3ubuntu1.2_amd64.deb
```

### 2.3 Install nvidia driver

Disable nouveau:

```shell 
$ vim /etc/modprobe.d/blacklist.conf
## Add these lines
blacklist nouveau
options nouveau modeset=0

$ sudo update-initramfs -u
$ reboot

## Check disable nouveau
$ lsmod | grep nouveau
```
Install driver:

```shell 
$ sudo chmod +x NVIDIA-Linux-x86_64-390.87.run
$ sudo ./NVIDIA-Linux-x86_64-390.87.run -no-x-check -no-nouveau-check -no-opengl-files
```
Reference: 
- https://blog.csdn.net/CosmosHua/article/details/76644029
- https://gist.github.com/wangruohui/df039f0dc434d6486f5d4d098aa52d07
<!-- On packages folder exec this command: -->

<!-- ```shell
$ ary=$(find ./ -iname "*.deb" | sort -n \;);for file in $ary; do dpkg -i $file;done
``` -->


### 2.3 Install helm client

On packages folder exec this command:

```shell
$ tar -zxvf ./helm/helm-v2.10.0-rc.1-linux-amd64.tar.gz && mv ./helm/linux-amd64/helm /usr/local/bin/helm
```

### 2.4 Install docker

```shell
apt -f install ./docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb
```

### 2.5 Install nv-docker

```shell
dpkg -i nvidia-docker_1.0.1-1_amd64.deb
dpkg -i libnvidia-container1_1.0.0-1_amd64.deb
dpkg -i libnvidia-container-tools_1.0.0-1_amd64.deb
apt -f install nvidia-container-runtime-hook_1.4.0-1_amd64.deb
dpkg -i nvidia-container-runtime_2.0.0+docker18.06.1-1_amd64.deb
apt -f install ./nvidia-docker2_2.0.3+docker18.06.1-1_all.deb
```

### 2.5 Install kubernetes 1.11.3 packages

```shell
dpkg -i apt-transport-https_1.2.29_amd64.deb
dpkg -i libcurl3-gnutls_7.47.0-1ubuntu2.9_amd64.deb
dpkg -i curl_7.47.0-1ubuntu2.9_amd64.deb
dpkg -i libnfsidmap2_0.25-5_amd64.deb
dpkg -i libtirpc1_0.2.5-1ubuntu0.1_amd64.deb
dpkg -i rpcbind_0.2.3-0.2_amd64.deb
dpkg -i keyutils_1.5.9-8ubuntu1_amd64.deb
dpkg -i nfs-common_1%3a1.2.8-9ubuntu12.1_amd64.deb
dpkg -i nfs-kernel-server_1%3a1.2.8-9ubuntu12.1_amd64.deb
dpkg -i kubernetes-cni_0.6.0-00_amd64.deb
dpkg -i kubectl_1.11.3-00_amd64.deb
dpkg -i socat_1.7.3.1-1_amd64.deb
dpkg -i ebtables_2.0.10.4-3.4ubuntu2.16.04.2_amd64.deb
dpkg -i kubelet_1.11.3-00_amd64.deb
dpkg -i cri-tools_1.12.0-00_amd64.deb
dpkg -i kubeadm_1.11.3-00_amd64.deb
```

### 2.6 Install helm

```shell
$ tar -zxvf helm-v2.10.0-rc.1-linux-amd64.tar.gz
$ mv linux-amd64/helm /usr/local/bin/helm
```

Check:

```shell
helm help
```

## 3. Setting IP address

Open `/etc/network/interfaces` add address, netmask and gateway.
```shell
$ vim /etc/network/interfaces
auto enp3s0
iface enp3s0 inet static
address 10.10.10.25
netmask 255.255.255.0
gateway 10.10.10.1
```

## 4. Import docker images

### 4.1 Get images
You can download [`master images`](https://mega.nz/#!ANVSzCRC!YjP2F45WyO633Id9R9QBfFHqnrAlSQV76b46Tl3uihU) and [`workerWithGPU images`](https://mega.nz/#!0YUy3K6D!UtveWIpxnZheAdQEL--Xg9zWiStWUvkvMejBliS4gOo)

### 4.2 Import images
Import image on `every node`
See [Load ALL images](./DockerImage.md#load-all-images)

## 5. Kubernetes

### 5.1 Initializing master
See [Initializing master](./Kubernetes.md#3-initializing-master)

### 5.2 Config kubectl
See [Config kubectl](./Kubernetes.md#4-config-kubectl)

### 5.3 Setting KUBECONFIG
See [Setting KUBECONFIG](./Kubernetes.md#5-setting-kubeconfig)

### 5.4 Install CNI
See [Install CNI](./Kubernetes.md#6-install-cni)

### 5.5 Install Worker
See [Install Worker](./Kubernetes.md#install-minion-worker)

### 5.6 Setting labels
See [Setting labels](./Kubernetes.md#7-setting-labels)

## 6. GPU for Kubernetes
See [GPUforKubernetes.md](./GPUforKubernetes.md)

## 7. Helm (Master)
> Use RBAC install
See [Helm offline install](./Helm.md#rbac-offline-install) 

## Troubleshooting
See [Troubleshooting](./Troubleshooting.md)

[k8s-install-docker]: https://kubernetes.io/docs/setup/independent/install-kubeadm/#installing-docker
[install-docker-ce]: https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce
[nvidia-docker#quickstart]: https://github.com/NVIDIA/nvidia-docker#quickstart
[Docker Engine setup]: https://github.com/nvidia/nvidia-container-runtime#docker-engine-setup