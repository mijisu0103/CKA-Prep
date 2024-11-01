# Q1: This lab tests your skills on upgrading a kubernetes cluster. We have a production cluster with applications running on it. Let us explore the setup first.
What is the current version of the cluster?
```bash
kubectl get nodes
```
| NAME          | STATUS | ROLES          | AGE | VERSION |
|---------------|--------|----------------|-----|---------|
| controlplane  | Ready  | control-plane  | 67m | v1.30.0 |
| node01        | Ready  | <none>         | 66m | v1.30.0 |

## A1: v1.30.0

<br>

# Q2: How many nodes are part of this cluster?
Including controlplane and worker nodes
```bash
kubectl get nodes
```
| NAME          | STATUS | ROLES          | AGE | VERSION |
|---------------|--------|----------------|-----|---------|
| controlplane  | Ready  | control-plane  | 70m | v1.30.0 |
| node01        | Ready  | <none>         | 69m | v1.30.0 |
## A2: 2

<br>

# Q3: How many nodes can host workloads in this cluster?
Inspect the applications and taints set on the nodes.
```bash
kubectl describe node | grep -i taints
```
```
Taints:             <none>
Taints:             <none>
```
## A3: 2

<br>

# Q4: How many applications are hosted on the cluster?
Count the number of deployments in the `default` namespace.
```bash
kubectl get deployments
```
| NAME | READY | UP-TO-DATE | AVAILABLE | AGE   |
|------|-------|------------|-----------|-------|
| blue | 5/5   | 5          | 5         | 5m37s |

## A4: 1

<br>

# Q5: What nodes are the pods hosted on?
```bash
kubectl get pods -o wide
```
| NAME                 | READY | STATUS  | RESTARTS | AGE   | IP          | NODE         | NOMINATED NODE | READINESS GATES |
|----------------------|-------|---------|----------|-------|-------------|--------------|----------------|-----------------|
| blue-fffb6db8d-d6f45 | 1/1   | Running | 0        | 6m28s | 10.244.1.4  | node01       | <none>         | <none>          |
| blue-fffb6db8d-hpxkk | 1/1   | Running | 0        | 6m28s | 10.244.1.3  | node01       | <none>         | <none>          |
| blue-fffb6db8d-r9sf6 | 1/1   | Running | 0        | 6m28s | 10.244.1.2  | node01       | <none>         | <none>          |
| blue-fffb6db8d-srtq9 | 1/1   | Running | 0        | 6m28s | 10.244.0.5  | controlplane | <none>         | <none>          |
| blue-fffb6db8d-w4v8f | 1/1   | Running | 0        | 6m28s | 10.244.0.4  | controlplane | <none>         | <none>          |

## A5: controlplane, node01

<br>

# Q6: You are tasked to upgrade the cluster. Users accessing the applications must not be impacted, and you cannot provision new VMs. What strategy would you use to upgrade the cluster?
## A6: Upgrade one node at a time while moving the workloads to the other

<br>

# Q7: What is the latest version available for an upgrade with the current version of the kubeadm tool installed?
Use the `kubeadm` tool
```bash
kubeadm upgrade plan
```
```
[upgrade/config] Making sure the configuration is correct:
[preflight] Running pre-flight checks.
[upgrade/config] Reading configuration from the cluster...
[upgrade/config] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -o yaml'
[upgrade] Running cluster health checks
[upgrade] Fetching available versions to upgrade to
[upgrade/versions] Cluster version: 1.30.0
[upgrade/versions] kubeadm version: v1.30.0
I1101 19:12:42.297778   32451 version.go:256] remote version is much newer: v1.31.2; falling back to: stable-1.30
[upgrade/versions] Target version: v1.30.6
[upgrade/versions] Latest version in the v1.30 series: v1.30.6

Components that must be upgraded manually after you have upgraded the control plane with 'kubeadm upgrade apply':
COMPONENT   NODE           CURRENT   TARGET
kubelet     controlplane   v1.30.0   v1.30.6
kubelet     node01         v1.30.0   v1.30.6

Upgrade to the latest version in the v1.30 series:

COMPONENT                 NODE           CURRENT    TARGET
kube-apiserver            controlplane   v1.30.0    v1.30.6
kube-controller-manager   controlplane   v1.30.0    v1.30.6
kube-scheduler            controlplane   v1.30.0    v1.30.6
kube-proxy                               1.30.0     v1.30.6
CoreDNS                                  v1.10.1    v1.11.1
etcd                      controlplane   3.5.12-0   3.5.12-0

You can now apply the upgrade by executing the following command:

        kubeadm upgrade apply v1.30.6

Note: Before you can perform this upgrade, you have to update kubeadm to v1.30.6.

_____________________________________________________________________


The table below shows the current state of component configs as understood by this version of kubeadm.
Configs that have a "yes" mark in the "MANUAL UPGRADE REQUIRED" column require manual config upgrade or
resetting to kubeadm defaults before a successful upgrade can be performed. The version to manually
upgrade to is denoted in the "PREFERRED VERSION" column.

API GROUP                 CURRENT VERSION   PREFERRED VERSION   MANUAL UPGRADE REQUIRED
kubeproxy.config.k8s.io   v1alpha1          v1alpha1            no
kubelet.config.k8s.io     v1beta1           v1beta1             no
_____________________________________________________________________

```
## A7: v1.30.6

<br>

# Q8: We will be upgrading the controlplane node first. Drain the controlplane node of workloads and mark it UnSchedulable
## A8: 
```bash
kubectl drain controlplane --ignore-daemonsets
```
```
node/controlplane cordoned
Warning: ignoring DaemonSet-managed Pods: kube-flannel/kube-flannel-ds-xplg4, kube-system/kube-proxy-lv2k2
evicting pod kube-system/coredns-768b85b76f-hvk62
evicting pod default/blue-fffb6db8d-w4v8f
evicting pod default/blue-fffb6db8d-srtq9
evicting pod kube-system/coredns-768b85b76f-hkscj
pod/blue-fffb6db8d-srtq9 evicted
pod/blue-fffb6db8d-w4v8f evicted
pod/coredns-768b85b76f-hkscj evicted
pod/coredns-768b85b76f-hvk62 evicted
node/controlplane drained
```

<br>

# Q9: Upgrade the `controlplane` components to exact version `v1.31.0`
Upgrade the kubeadm tool (if not already), then the controlplane components, and finally the kubelet. Practice referring to the Kubernetes documentation page.
## A9:
```bash
vim /etc/apt/sources.list.d/kubernetes.list
```
```
deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /
```
```bash
apt update
```
```bash
apt-cache madison kubeadm
```
```bash
apt-get install kubeadm=1.31.0-1.1
```
```bash
kubeadm upgrade plan v1.31.0
```
```bash
kubeadm upgrade apply v1.31.0
```
```bash
apt-get install kubelet=1.31.0-1.1
```
```bash
systemctl daemon-reload
```
```bash
systemctl restart kubelet
```

<br>

# Q10: Mark the controlplane node as "Schedulable" again
## A10:
```bash
kubectl uncordon controlplane
```
```
node/controlplane uncordoned
```

<br>

# Q11: Next is the worker node. Drain the worker node of the workloads and mark it UnSchedulable
## A11: 
```bash
kubectl drain node01 --ignore-daemonsets
```
```
node/node01 cordoned
Warning: ignoring DaemonSet-managed Pods: kube-flannel/kube-flannel-ds-84f9n, kube-system/kube-proxy-pzfw6
evicting pod kube-system/coredns-6f6b679f8f-rh6ft
evicting pod default/blue-fffb6db8d-hpxkk
evicting pod default/blue-fffb6db8d-r9sf6
evicting pod default/blue-fffb6db8d-6cpqp
evicting pod default/blue-fffb6db8d-d6f45
evicting pod kube-system/coredns-6f6b679f8f-ndx98
evicting pod default/blue-fffb6db8d-mw6zm
pod/blue-fffb6db8d-mw6zm evicted
pod/blue-fffb6db8d-6cpqp evicted
pod/blue-fffb6db8d-d6f45 evicted
pod/blue-fffb6db8d-r9sf6 evicted
pod/blue-fffb6db8d-hpxkk evicted
pod/coredns-6f6b679f8f-rh6ft evicted
pod/coredns-6f6b679f8f-ndx98 evicted
node/node01 drained
```

<br>

# Q12: Upgrade the worker node to the exact version v1.31.0
## A12:
```bash
ssh node01
```
```bash
vim /etc/apt/sources.list.d/kubernetes.list
```
```
deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /
```
```bash
apt update
```
```bash
apt-cache madison kubeadm
```
```bash
apt-get install kubeadm=1.31.0-1.1
```
```bash
kubeadm upgrade node
```
```bash
apt-get install kubelet=1.31.0-1.1
```
```bash
systemctl daemon-reload
```
```bash
systemctl restart kubelet
```

<br>

# Q13: Remove the restriction and mark the worker node as schedulable again.
## A13:
```bash
exit # To disconnect ssh connection to node01
```
```bash
kubectl uncordon node01
```

