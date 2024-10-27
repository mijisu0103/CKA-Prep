#!/bin/bash

# Operational aspects of namespaces

# To list all the pods
kubectl get pods
# But this only lists the pods in the default namespace

# To list pods in another namespace
kubectl get pods --namespace=kube-system


# pod-definition.yml
"""
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
  labels:
    app: myapp
    type: front-end
spec:
  containers:
  - name: nginx-container
    image: nginx
"""
# When one creates a pod using this file, the pod is created in the default namespace

# To create the pod in another namespace
kubectl create -f pod-definition.yml --namespace=dev
# This is just one time command, but if one wants to make sure that this pod gets created in the dev environment all the time, even if one does not specify the namespace in the commandline:
# pod-definition.yml
"""
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
  namespace: dev
  labels:
    app: myapp
    type: front-end
spec:
  containers:
  - name: nginx-container
    image: nginx
"""
# This is a good way to ensure one's resources are always created in the same namespace

# How to create a namespace
# namespace-dev.yml
"""
apiVersion: v1
kind: Namespace
metadata:
  name: dev
"""
kubectl create -f namespace-dev.yml

# OR
# Command
kubectl create namespace dev

# Switch between namespaces
kubectl config set-context $(kubectl config current-context) --namespace=dev

"""
1. $(kubectl config current-context) firstly identifies the current context
2. Then `kubectl config set-context` sets the namespace to the desired one (`—namespace=dev`) for that current context
"""

# View pods in all namespaces
kubectl get pods --all-namespaces

# To limit resources in a namespace
  # Create a resource quota
# compute-quota.yaml
"""
apiVersion: v1
kind: ResourceQuota
metadata:
  name: compute-quota
  namespace: dev
spec:
  hard:
    pods: "10"
    requests.cpu: "4"
    requests.memory: 5Gi
    limits.cpu: "10"
    limits.memory: 10Gi
"""
kubectl create -f compute-quota.yaml

