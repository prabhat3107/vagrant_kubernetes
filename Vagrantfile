# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Define the base box for all VMs
  config.vm.box = "bento/ubuntu-22.04" # Or your preferred Ubuntu box
  config.vm.box_check_update = true

  # Define network settings
  IP_BASE = "192.168.56."

  # Master Node
  config.vm.define "master" do |master|
    master.vm.hostname = "k8s-master"
    master.vm.network "private_network", ip: "#{IP_BASE}10"
    master.vm.provider "virtualbox" do |vb|
      vb.memory = 4006 # Adjust as needed
      vb.cpus = 4      # Adjust as needed
    end
    master.vm.provision "shell", path: "scripts/common-containerd.sh"
    master.vm.provision "shell", path: "scripts/hostsfile_update.sh"
    master.vm.provision "shell", path: "scripts/master.sh"
  end

  # Worker Nodes
  (1..2).each do |i|
    config.vm.define "worker#{i}" do |worker|
      worker.vm.hostname = "k8s-worker#{i}"
      worker.vm.network "private_network", ip: "#{IP_BASE}#{10 + i}"
      worker.vm.provider "virtualbox" do |vb|
        vb.memory = 2048 # Adjust as needed
        vb.cpus = 4      # Adjust as needed
      end
      worker.vm.provision "shell", path: "scripts/common-containerd.sh"
      worker.vm.provision "shell", path: "scripts/hostsfile_update.sh"
      worker.vm.provision "shell", path: "scripts/worker.sh"
    end
  end
end
