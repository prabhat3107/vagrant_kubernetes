#!/bin/bash
sudo tee -a /etc/hosts <<EOF
192.168.56.10 k8s-master
192.168.56.11 k8s-worker1
192.168.56.12 k8s-worker2
EOF