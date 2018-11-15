IP=$(ip route get 1 | sed -n 's/^.*src \([0-9.]*\) .*$/\1/p')
kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=$IP --kubernetes-version=v1.11.3 --ignore-preflight-errors=all && \
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
export KUBECONFIG=$HOME/.kube/config
kubectl apply -f ../flannel/kube-flannel.yml && \
kubectl apply -f ../flannel/kube-flannel-rbac.yml
kubectl apply -f ../nvidia-device-plugin/nvidia-device-plugin.yml
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl label node $(hostname | sed 's/\([A-Z]\)/\L\1/g') machine=storage
kubectl label node $(hostname | sed 's/\([A-Z]\)/\L\1/g') role=master
kubectl create -f ../helm_rbac/rbac-config.yaml
helm init --service-account tiller --skip-refresh