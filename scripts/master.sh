#!/bin/bash
# Initialize Kubernetes master
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.56.10

while [ ! -f /etc/kubernetes/admin.conf ]; do
  sleep 5
done

# Configure kubectl for vagrant user
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Install a Pod Network Add-on (e.g., Flannel)
kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/master/Documentation/kube-flannel.yml

# Generate join command for worker nodes
kubeadm token create --print-join-command > /vagrant/join_command.sh
chmod +x /vagrant/join_command.sh
