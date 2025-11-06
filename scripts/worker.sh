#!/bin/bash
# Join worker nodes to the cluster
# Wait for the join_command.sh to be created by the master
while [ ! -f /vagrant/join_command.sh ]; do
  sleep 5
done
sudo /bin/bash /vagrant/join_command.sh
