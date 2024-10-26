#!/bin/bash

# Monitor the health of the nodes
kubectl get nodes

# Install and view the Kubernetes controller manager
# Download the Kube controller manager from the Kubernetes release page
wget https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kube-controller-manager

# Extract it and run it as a service
# kube-controller-manager.service
ExecStart=/usr/local/bin/kube-controller-manager \\
--address=0.0.0.0
--cluster-cidr=10.200.0.0/16 \\
--cluster-name=kubernetes \\
--cluster-signing-cert-file=/var/lib/kubernetes/ca.pem \\
--cluster-signing-key-file=/var/lib/kubernetes/ca-key.pem \\
--kubeconfig=/var/lib/kubernetes/kube-controller-manager.kubeconfig \\
--leader-elct=true \\
--root-ca.file=/var/lib/kubernetes/ca.pem \\
--service-account-private-key-file=/var/lib/kubernetes/service-account-key.pem \\
--service-cluster-ip-range=10.32.0.0/24 \\
--use-service-account-credentials=true \\
--v=2
--node-monitor-period=5s
--node-monitor-grace-period=40s
--pod-eviction-timeout=5m0s
--controllers stringSlice    Default: [*]
"""A list of controlelrs to enable. '*' enables all on-by-default conrollers, 'foo' enables the controller named 'foo', '-foo' disables the controller named 'foo'.
All controllers: attachdetach, bootstrapsigner, clusterrole-aggregation, cronjob, csrapproving, csrcleaner, csrsigning, daemonset, deployment, disruption, endpoint, garbagecollector, horizontalpodautoscaling, job, namespace, nodeipam, nodelifecycle, persistentvolume-binder, persistentvolume-expander, podgc, pv-protection, pvc-protection, replicaset, replicationcontroller, resourcequota, root-ca-cert-publisher, route, service, serviceaccount, serviceaccount-token, statefulset, tokencleaner, ttl, ttl-after-finished
Disabled-by-default controllers: bootstrapsigner, tokencleaner"""

# How to view kube-controller-manager (kubeadm)
kubectl get pods -n kube-system

# How to view kube-controller-manager options (kubeadm)
cat /etc/kubernetes/manifests/kube-controller-manager.yaml

# How to view controller-manager options (non-kubeadm)
cat /etc/systemd/system/kube-controller-manager.service

# View the running process & effective options
ps -aux | grep kube-controller-manager


