#!/bin/bash

# Installing kubelet (kubeadm)
  # Does not automatically deploy kubelets
wget https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kubelet

#kubelet.service
ExecStart=/usr/local/bin/kubelet \\
    --config=/var/lib/kubelet/kubelet-config.yaml \\
    --container-runtime=remote \\
    --container-runtime=endpoint=unix://var/run/containerd/containerd.sock \\
    --image-pull-progress-deadline=2m \\
    --kubeconfig=/var/lib/kubelet/kubeconfig \\
    --network-plugin=cni \\
    --register-node=true \\
    --v=2

# Should always manually install the kubelet on the worker nodes

# View the running kubelet process and the effective options
ps -aux | grep kubelet

