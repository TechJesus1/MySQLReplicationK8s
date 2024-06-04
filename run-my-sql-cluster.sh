#!/bin/bash

kubectl apply -f configmap.yaml
kubectl apply -f services.yaml
kubectl apply -f statefulset.yaml

echo "Now watching progress of Pods"

kubectl get pods -l app=mysql --watch
