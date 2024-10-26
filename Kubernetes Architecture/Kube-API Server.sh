#!/bin/bash

# When one runs a kubectl command, the kubectl utility is in fact reaching to the kube-apiserver
kubectl get nodes

# Invoke the APIs directly by sending a POST request
curl -X POST /api/v1/namespaces/default/pods ...[other]

# Installing kube-api server (manually)
wget https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kube-apiserver

# kube-apiserver.service
ExecStart=/usr/local/bin/kube-apiserver \\
--advertise-address=${INTERNAL_IP} \\
--allow-priviledged=true \\
--apiserver-count=3 \\
--authorization-mode=Node,RBAC \\
--bind-address=0.0.0.0 \\
--client-ca-file=/var/lib/kubernetes/ca.pem \\
--enable-admission-
plugins=Initializers,NamespaceLifecycle,NodeRestriction,LimitRanger,ServiceAccount,DefaultStorageClass,ResourceQuota \\
--enable-swagger-ui=true \\
--etcd-cafile=/var/lib/kubernetes/ca.pem \\
--etcd-certfile=/var/lib/kubernetes/kubernetes.pem \\
--etcd-keyfile=/var/lib/kubernetes/kubernetes-key.pem \\
--etcd-server=https://127.0.0.1:2379 \\
--event-ttl=1h \\
--experimental-encryption-provider-config=/var/lib/kubernetes/encryption-config.yaml \\
--kubelet-certificate-authority=/var/lib/kubernetes/ca.pem \\
--kuberlet-client-certificate=/var/lib/kubernetes/kubernetes.pem \\
--kubelet-client-key=/var/lib/kubernetes/kubernetes-key.pem \\
--kubelet-https=true \\
--runtime-config=api/all \\
--service-account-key-file=/var/lib/kubernetes/service-account.pem \\
--service-cluster-ip-range=10.32.0.0/24 \\

# View api-server (kubeadm)
kubectl get pods -n kube-system
# Can check kube-apiserver-master pod in kube-system namespace

# See the options within the pod definition file
cat /etc/kubernetes/manifests/kube-apiserver.yaml

# View api-server (non-kubeadm)
cat /etc/systemd/system/kube-apiserver.service

# View the running process & effective options by listing the process on the master node and searching for kube-apiserver
ps -aux | grep kube-apiserver

