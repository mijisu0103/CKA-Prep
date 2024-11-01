# Q1: Let us explore the environment first. How many nodes do you see in the cluster?
Including the controlplane and worker nodes.
```bash
kubectl get nodes
```
| NAME          | STATUS | ROLES          | AGE | VERSION |
|---------------|--------|----------------|-----|---------|
| controlplane  | Ready  | control-plane  | 29m | v1.31.0 |
| node01        | Ready  | <none>         | 28m | v1.31.0 |

## A1: 2

<br>

# Q2: How many applications do you see hosted on the cluster?
Check the number of deployments in the `default` namespace.
```bash
kubectl get deployments
```
| NAME | READY | UP-TO-DATE | AVAILABLE | AGE |
|------|-------|------------|-----------|-----|
| blue | 3/3   | 3          | 3         | 50s |

## A2: 1

<br>

# Q3: Which nodes are the applications hosted on?
```bash
kubectl get pods -o wide
```
| NAME                  | READY | STATUS  | RESTARTS | AGE   | IP          | NODE         | NOMINATED NODE | READINESS GATES |
|-----------------------|-------|---------|----------|-------|-------------|--------------|----------------|-----------------|
| blue-56dd475db5-7bqp7 | 1/1   | Running | 0        | 2m38s | 10.244.0.4  | controlplane | <none>         | <none>          |
| blue-56dd475db5-m9snn | 1/1   | Running | 0        | 2m38s | 10.244.1.3  | node01       | <none>         | <none>          |
| blue-56dd475db5-tbxbs | 1/1   | Running | 0        | 2m38s | 10.244.1.2  | node01       | <none>         | <none>          |


## A3: controlplane, node01

<br>

# Q4: We need to take node01 out for maintenance. Empty the node of all applications and mark it unschedulable.
## A4: 
```bash
kubectl drain node01 --ignore-daemonsets
```
```
node/node01 cordoned
Warning: ignoring DaemonSet-managed Pods: kube-flannel/kube-flannel-ds-fkkqf, kube-system/kube-proxy-h9d2q
evicting pod default/blue-56dd475db5-tbxbs
evicting pod default/blue-56dd475db5-m9snn
pod/blue-56dd475db5-tbxbs evicted
pod/blue-56dd475db5-m9snn evicted
node/node01 drained
```

<br>

# Q5: What nodes are the apps on now?
```bash
kubectl get pods -o wide
```
| NAME                  | READY | STATUS  | RESTARTS | AGE   | IP          | NODE         | NOMINATED NODE | READINESS GATES |
|-----------------------|-------|---------|----------|-------|-------------|--------------|----------------|-----------------|
| blue-56dd475db5-27mg2 | 1/1   | Running | 0        | 37s   | 10.244.0.6  | controlplane | <none>         | <none>          |
| blue-56dd475db5-7bqp7 | 1/1   | Running | 0        | 4m52s | 10.244.0.4  | controlplane | <none>         | <none>          |
| blue-56dd475db5-mb2bd | 1/1   | Running | 0        | 37s   | 10.244.0.5  | controlplane | <none>         | <none>          |

## A5: controlplane

<br>

# Q6: The maintenance tasks have been completed. Configure the node node01 to be schedulable again.
## A6:
```bash
kubectl uncordon node01
```
```
node/node01 uncordoned
```

<br>

# Q7: How many pods are scheduled on node01 now in the default namespace?
```bash
kubectl get pods -o wide
```
| NAME                  | READY | STATUS  | RESTARTS | AGE | IP          | NODE         | NOMINATED NODE | READINESS GATES |
|-----------------------|-------|---------|----------|-----|-------------|--------------|----------------|-----------------|
| blue-56dd475db5-27mg2 | 1/1   | Running | 0        | 26m | 10.244.0.6  | controlplane | <none>         | <none>          |
| blue-56dd475db5-7bqp7 | 1/1   | Running | 0        | 30m | 10.244.0.4  | controlplane | <none>         | <none>          |
| blue-56dd475db5-mb2bd | 1/1   | Running | 0        | 26m | 10.244.0.5  | controlplane | <none>         | <none>          |

## A7: 0

<br>

# Q8: Why are there no pods on node01?
## A8: Only when new pods are created they will be scheduled

<br>

# Q9: Why are the pods placed on the `controlplane` node?
Check the controlplane node details.
```bash
kubectl describe node controlplane
```
```
Name:               controlplane
Roles:              control-plane
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/os=linux
                    kubernetes.io/arch=amd64
                    kubernetes.io/hostname=controlplane
                    kubernetes.io/os=linux
                    node-role.kubernetes.io/control-plane=
                    node.kubernetes.io/exclude-from-external-load-balancers=
Annotations:        flannel.alpha.coreos.com/backend-data: {"VNI":1,"VtepMAC":"1a:6a:8d:fb:8d:2b"}
                    flannel.alpha.coreos.com/backend-type: vxlan
                    flannel.alpha.coreos.com/kube-subnet-manager: true
                    flannel.alpha.coreos.com/public-ip: 192.5.12.9
                    kubeadm.alpha.kubernetes.io/cri-socket: unix:///var/run/containerd/containerd.sock
                    node.alpha.kubernetes.io/ttl: 0
                    volumes.kubernetes.io/controller-managed-attach-detach: true
CreationTimestamp:  Fri, 01 Nov 2024 03:21:43 +0000
Taints:             <none>
Unschedulable:      false
Lease:
  HolderIdentity:  controlplane
  AcquireTime:     <unset>
  RenewTime:       Fri, 01 Nov 2024 04:24:11 +0000
Conditions:
  Type                 Status  LastHeartbeatTime                 LastTransitionTime                Reason                       Message
  ----                 ------  -----------------                 ------------------                ------                       -------
  NetworkUnavailable   False   Fri, 01 Nov 2024 03:21:57 +0000   Fri, 01 Nov 2024 03:21:57 +0000   FlannelIsUp                  Flannel is running on this node
  MemoryPressure       False   Fri, 01 Nov 2024 04:23:15 +0000   Fri, 01 Nov 2024 03:21:38 +0000   KubeletHasSufficientMemory   kubelet has sufficient memory available
  DiskPressure         False   Fri, 01 Nov 2024 04:23:15 +0000   Fri, 01 Nov 2024 03:21:38 +0000   KubeletHasNoDiskPressure     kubelet has no disk pressure
  PIDPressure          False   Fri, 01 Nov 2024 04:23:15 +0000   Fri, 01 Nov 2024 03:21:38 +0000   KubeletHasSufficientPID      kubelet has sufficient PID available
  Ready                True    Fri, 01 Nov 2024 04:23:15 +0000   Fri, 01 Nov 2024 03:21:55 +0000   KubeletReady                 kubelet is posting ready status
Addresses:
  InternalIP:  192.5.12.9
  Hostname:    controlplane
Capacity:
  cpu:                36
  ephemeral-storage:  1016057248Ki
  hugepages-1Gi:      0
  hugepages-2Mi:      0
  memory:             214587056Ki
  pods:               110
Allocatable:
  cpu:                36
  ephemeral-storage:  936398358207
  hugepages-1Gi:      0
  hugepages-2Mi:      0
  memory:             214484656Ki
  pods:               110
System Info:
  Machine ID:                 132e3d2451f947fe9214456160254717
  System UUID:                d8824692-34a6-3c58-d6c1-cf72665cc71f
  Boot ID:                    69850b9c-b954-4233-ba8e-efeec257da81
  Kernel Version:             5.4.0-1106-gcp
  OS Image:                   Ubuntu 22.04.4 LTS
  Operating System:           linux
  Architecture:               amd64
  Container Runtime Version:  containerd://1.6.26
  Kubelet Version:            v1.31.0
  Kube-Proxy Version:         
PodCIDR:                      10.244.0.0/24
PodCIDRs:                     10.244.0.0/24
Non-terminated Pods:          (11 in total)
  Namespace                   Name                                    CPU Requests  CPU Limits  Memory Requests  Memory Limits  Age
  ---------                   ----                                    ------------  ----------  ---------------  -------------  ---
  default                     blue-56dd475db5-27mg2                   0 (0%)        0 (0%)      0 (0%)           0 (0%)         28m
  default                     blue-56dd475db5-7bqp7                   0 (0%)        0 (0%)      0 (0%)           0 (0%)         32m
  default                     blue-56dd475db5-mb2bd                   0 (0%)        0 (0%)      0 (0%)           0 (0%)         28m
  kube-flannel                kube-flannel-ds-d5dj7                   100m (0%)     0 (0%)      50Mi (0%)        0 (0%)         62m
  kube-system                 coredns-77d6fd4654-fzlvq                100m (0%)     0 (0%)      70Mi (0%)        170Mi (0%)     62m
  kube-system                 coredns-77d6fd4654-zqcbd                100m (0%)     0 (0%)      70Mi (0%)        170Mi (0%)     62m
  kube-system                 etcd-controlplane                       100m (0%)     0 (0%)      100Mi (0%)       0 (0%)         62m
  kube-system                 kube-apiserver-controlplane             250m (0%)     0 (0%)      0 (0%)           0 (0%)         62m
  kube-system                 kube-controller-manager-controlplane    200m (0%)     0 (0%)      0 (0%)           0 (0%)         62m
  kube-system                 kube-proxy-fdfpw                        0 (0%)        0 (0%)      0 (0%)           0 (0%)         62m
  kube-system                 kube-scheduler-controlplane             100m (0%)     0 (0%)      0 (0%)           0 (0%)         62m
Allocated resources:
  (Total limits may be over 100 percent, i.e., overcommitted.)
  Resource           Requests    Limits
  --------           --------    ------
  cpu                950m (2%)   0 (0%)
  memory             290Mi (0%)  340Mi (0%)
  ephemeral-storage  0 (0%)      0 (0%)
  hugepages-1Gi      0 (0%)      0 (0%)
  hugepages-2Mi      0 (0%)      0 (0%)
Events:              <none>
```
```
Taints:             <none>
```
## A9: controlplane node does not have any taints

<br>

# Q10: ℹ️ Time travelling to the next maintenance window…
## A10: OK

<br>

# Q11: We need to carry out a maintenance activity on `node01` again. Try draining the node again using the same command as before: `kubectl drain node01 --ignore-daemonsets`
Did that work?
```bash
kubectl drain node01 --ignore-daemonsets
```
```
node/node01 cordoned
error: unable to drain node "node01" due to error: cannot delete cannot delete Pods that declare no controller (use --force to override): default/hr-app, continuing command...
There are pending nodes to be drained:
 node01
cannot delete cannot delete Pods that declare no controller (use --force to override): default/hr-app
```
## A11: NO

<br>

# Q12: Why did the drain command fail on node01? It worked the first time!
```bash
kubectl get pods -o wide
```

| NAME                  | READY | STATUS  | RESTARTS | AGE   | IP          | NODE         | NOMINATED NODE | READINESS GATES |
|-----------------------|-------|---------|----------|-------|-------------|--------------|----------------|-----------------|
| blue-56dd475db5-27mg2 | 1/1   | Running | 0        | 32m   | 10.244.0.6  | controlplane | <none>         | <none>          |
| blue-56dd475db5-7bqp7 | 1/1   | Running | 0        | 37m   | 10.244.0.4  | controlplane | <none>         | <none>          |
| blue-56dd475db5-mb2bd | 1/1   | Running | 0        | 32m   | 10.244.0.5  | controlplane | <none>         | <none>          |
| hr-app                | 1/1   | Running | 0        | 2m23s | 10.244.1.4  | node01       | <none>         | <none>          |


hr-app is scheduled on node01, which is not part of a replicaset — The drain command won’t work in this case. 
## A12: there is a pod in node01 which is not part of a replicaset

<br>

# Q13: What is the name of the POD hosted on node01 that is not part of a replicaset?
```bash
kubectl get pods -o wide
```
| NAME                  | READY | STATUS  | RESTARTS | AGE   | IP          | NODE         | NOMINATED NODE | READINESS GATES |
|-----------------------|-------|---------|----------|-------|-------------|--------------|----------------|-----------------|
| blue-56dd475db5-27mg2 | 1/1   | Running | 0        | 32m   | 10.244.0.6  | controlplane | <none>         | <none>          |
| blue-56dd475db5-7bqp7 | 1/1   | Running | 0        | 37m   | 10.244.0.4  | controlplane | <none>         | <none>          |
| blue-56dd475db5-mb2bd | 1/1   | Running | 0        | 32m   | 10.244.0.5  | controlplane | <none>         | <none>          |
| hr-app                | 1/1   | Running | 0        | 2m23s | 10.244.1.4  | node01       | <none>         | <none>          |

## A13: hr-app

<br>

# Q14: What would happen to `hr-app` if `node01` is drained forcefully?
Try it and see for yourself.
## A14: hr-app will be lost forever

<br>

# Q15: ℹ️ Oops! We did not want to do that! hr-app is a critical application that should not be destroyed. We have now reverted back to the previous state and re-deployed hr-app as a deployment.
## A15: OK

<br>

# Q16: `hr-app` is a critical app and we do not want it to be removed and we do not want to schedule any more pods on `node01`.
Mark `node01` as `unschedulable` so that no new pods are scheduled on this node.
Make sure that `hr-app` is not affected.
## A16: 
```bash
kubectl cordon node01
```
```
node/node01 cordoned
```
This will ensure that no new pods are scheduled on this node and the existing pods will not be affected by this operation

