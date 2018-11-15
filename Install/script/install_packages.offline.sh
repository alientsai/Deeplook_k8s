echo "Install vim."
dpkg -i ./vim/vim-runtime_2%3a7.4.1689-3ubuntu1.2_all.deb && \
dpkg -i ./vim/vim_2%3a7.4.1689-3ubuntu1.2_amd64.deb && \
echo "Install helm."
tar -zxvf ./helm/helm-v2.10.0-rc.1-linux-amd64.tar.gz && mv ./linux-amd64/helm /usr/local/bin/helm  && \
echo "Install docker 18.06"
apt -f install ./docker_NVdocker/docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb && \
echo "Install nv docker 2"
dpkg -i ./docker_NVdocker/nvidia-docker_1.0.1-1_amd64.deb && \
dpkg -i ./docker_NVdocker/libnvidia-container1_1.0.0-1_amd64.deb && \
dpkg -i ./docker_NVdocker/libnvidia-container-tools_1.0.0-1_amd64.deb && \
dpkg -i ./docker_NVdocker/nvidia-container-runtime-hook_1.4.0-1_amd64.deb && \
dpkg -i ./docker_NVdocker/nvidia-container-runtime_2.0.0+docker18.06.1-1_amd64.deb && \
apt -f install ./docker_NVdocker/nvidia-docker2_2.0.3+docker18.06.1-1_all.deb && \
echo "Install kubernetes 1.11.3"
dpkg -i ./kubernetes/1.11.3/apt-transport-https_1.2.29_amd64.deb && \
dpkg -i ./kubernetes/1.11.3/libcurl3-gnutls_7.47.0-1ubuntu2.9_amd64.deb && \
dpkg -i ./kubernetes/1.11.3/curl_7.47.0-1ubuntu2.9_amd64.deb && \
dpkg -i ./kubernetes/1.11.3/libnfsidmap2_0.25-5_amd64.deb && \
dpkg -i ./kubernetes/1.11.3/libtirpc1_0.2.5-1ubuntu0.1_amd64.deb && \
dpkg -i ./kubernetes/1.11.3/rpcbind_0.2.3-0.2_amd64.deb && \
dpkg -i ./kubernetes/1.11.3/keyutils_1.5.9-8ubuntu1_amd64.deb && \
dpkg -i ./kubernetes/1.11.3/nfs-common_1%3a1.2.8-9ubuntu12.1_amd64.deb && \
dpkg -i ./kubernetes/1.11.3/nfs-kernel-server_1%3a1.2.8-9ubuntu12.1_amd64.deb && \
dpkg -i ./kubernetes/1.11.3/kubernetes-cni_0.6.0-00_amd64.deb && \
dpkg -i ./kubernetes/1.11.3/kubectl_1.11.3-00_amd64.deb && \
dpkg -i ./kubernetes/1.11.3/socat_1.7.3.1-1_amd64.deb && \
dpkg -i ./kubernetes/1.11.3/ebtables_2.0.10.4-3.4ubuntu2.16.04.2_amd64.deb && \
dpkg -i ./kubernetes/1.11.3/kubelet_1.11.3-00_amd64.deb && \
dpkg -i ./kubernetes/1.11.3/cri-tools_1.12.0-00_amd64.deb && \
dpkg -i ./kubernetes/1.11.3/kubeadm_1.11.3-00_amd64.deb