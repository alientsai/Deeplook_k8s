# NVIDIA device plugin for Kubernetes

## Requires
The list of prerequisites for running the NVIDIA device plugin is described below:
* NVIDIA drivers ~= 361.93
* nvidia-docker version > 2.0 (see how to [install](https://github.com/NVIDIA/nvidia-docker) and it's [prerequisites](https://github.com/nvidia/nvidia-docker/wiki/Installation-\(version-2.0\)#prerequisites))
* Kubernetes version = 1.11
* The `DevicePlugins` feature gate enabled

## 1. Setting default runtime on docker

On GPU node, you will need to check and/or enable the nvidia runtime as your default runtime on your node.
We will be editing the docker daemon config file which is usually present at `/etc/docker/daemon.json`:
```json
{
    "default-runtime": "nvidia",
    "runtimes": {
        "nvidia": {
            "path": "/usr/bin/nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}
```
## 2. Setting feature gate on kubeadm
If your Kubernetes cluster is deployed using kubeadm and your nodes are running systemd you will have to open the kubeadm
systemd unit file at `/etc/systemd/system/kubelet.service.d/10-kubeadm.conf` and add the following environment argument:
```
Environment="KUBELET_EXTRA_ARGS=--feature-gates=DevicePlugins=true"
```
Reload and restart the kubelet to pick up the config change:
```shell
$ sudo systemctl daemon-reload
$ sudo systemctl restart kubelet
```
## 3. Enabling GPU Support in Kubernetes
Once you have enabled this option on *all* the GPU nodes you wish to use,
you can then enable GPU support in your cluster by deploying the following Daemonset:

```shell
$ kubectl create -f https://raw.githubusercontent.com/NVIDIA/k8s-device-plugin/v1.11/nvidia-device-plugin.yml
```

## 4. Check gpu on node

```shell
$ kubectl get nodes "-o=custom-columns=NAME:.metadata.name,GPU:.status.allocatable.nvidia\.com/gpu"
```

**The Detail can see [k8s-device-plugin](https://github.com/NVIDIA/k8s-device-plugin).**