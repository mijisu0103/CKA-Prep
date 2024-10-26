#!/bin/bash

# Installing kube-proxy
# Download the kube-proxy binary, from the Kubernetes release page, extract it, and run it as a service
wget https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kube-proxy

# kube-proxy.service
ExecStart=/usr/local/bin/kube-proxy \\
   --config=/var/lib/kube-proxy/kube-proxy-config.yaml
Restart=on-failure
RestartSec=5

# kubeadm tool deploys kube-proxy as pods on each node
kubectl get pods -n kube-system

# It is deployed as a DaemonSet
kubectl get daemonset -n kube-system

# A single pod is always deployed on each node in the cluster

