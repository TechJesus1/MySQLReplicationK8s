#!/bin/bash

# You should already have minikube & kubectl installed before running the following commands

# Start a 3-node cluster (1 control plane, 2 workers)
# https://minikube.sigs.k8s.io/docs/tutorials/multi_node/
minikube start --nodes 3 -p minikube

# Enable local disk to be used as Persistent Volume
# https://minikube.sigs.k8s.io/docs/tutorials/volume_snapshots_and_csi/
minikube addons enable volumesnapshots -p minikube
minikube addons enable csi-hostpath-driver -p minikube

# Disable other drivers to make disk the default storage provisioner for all PVs
minikube addons disable storage-provisioner -p minikube
minikube addons disable default-storageclass -p minikube
kubectl patch storageclass csi-hostpath-sc -p '{"metadata":{"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}' -p minikube

echo "All done"

