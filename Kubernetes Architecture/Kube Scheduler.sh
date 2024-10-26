#!/bin/bash

# Installing the kube-scheduler
# Download the kube-scheduler binary from the Kubernetes release page
wget https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kube-scheduler

# Extract it and run it as a service
# kube-scheduler.service
ExecStart=/usr/local/bin/kube-scheduler \\
    --config=/etc/kubernetes/config/kube-scheduler.yaml \\
    --v=2

# View the kube-scheduler server options (kubeadm)
cat /etc/kubernetes/manifests/kube-scheduler.yaml

# View the running process and the effective options
ps -aux | grep kube-scheduler

