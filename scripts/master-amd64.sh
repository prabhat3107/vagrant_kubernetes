#!/bin/bash

# Initialize Kubernetes master
kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.56.10

# Configure kubectl
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

# Deploy CNI (e.g., Flannel)
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# Save join command for worker nodes
kubeadm token create --print-join-command > /vagrant/join_command.sh
chmod +x /vagrant/join_command.sh
