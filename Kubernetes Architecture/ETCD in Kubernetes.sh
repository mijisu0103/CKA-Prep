#!/bin/bash

# Setup - Manual
wget -q --https-only \
	"https://github.com/coreos/etcd/releases/download/v3.3.9/etcd-v3.3.9-linux-amd64.tar.gz"

#etcd.service
ExecStart=/usr/local/bin/etcd \\
--name ${ETCD_name} \\
--cert-file=/etc/etcd/kubernetes.pem \\
--key-file=/etc/etcd/kubernetes-key.pem \\
--peer-cert-file=/etc/etcd/kubernetes.pem \\
--peer-key-file=/etc/etcd/kubernetes-key.pem \\
--trusted-ca-file=/etc/etcd/ca.pem \\
--peer-trusted-ca-file=/etc/etcd/ca.pem \\
--peer-client-cert-auth \\
--client-cert-auth \\
--initial-advertise-peer-urls https://${INTERNAL_IP}:2380 \\
--listen-peer-urls https://${INTERNAL_IP}:2379, https://127.0.0.1:2379 \\
--advertise-client-urls https://${INTERNAL_IP}:2379 \\ # The address on which ETCD listens
# Happens to be on the IP of the server and on port 2379 - default port on which ETCD listens
# This is the URL that should be configured on the kube API server when it tries to reach the ETCD server
--initial-cluster-token etcd-cluster-0 \\
--initial-cluster controller-0=https://${CONTROLLER0_IP}:2380,controller-1=https://${CONTROLLER1_IP}:2380 \\
--initial-cluster-state new \\
--data-dir=/var/lib/etcd

# Setup - kubeadm
kubectl get pods -n kube-system

# To list all keys stored by Kubernetes
kubectl exec etcd-master -n kube-system etcdctl get / --prefix -keys-only
# Output:
/registry/apiregistration.k8x.io/apiservices/v1.
/registry/apiregistration.k8x.io/apiservices/v1.apps
/registry/apiregistration.k8x.io/apiservices/v1.authentication.k8s.io
/registry/apiregistration.k8x.io/apiservices/v1.authorization.k8s.io
/registry/apiregistration.k8x.io/apiservices/v1.autoscaling
/registry/apiregistration.k8x.io/apiservices/v1.batch
/registry/apiregistration.k8x.io/apiservices/v1.networking.k8s.io
/registry/apiregistration.k8x.io/apiservices/v1.rbac.authorization.k8s.io
/registry/apiregistration.k8x.io/apiservices/v1.storage.k8s.io
/registry/apiregistration.k8x.io/apiservices/v1beta1.admissionregistration.k8s.io

