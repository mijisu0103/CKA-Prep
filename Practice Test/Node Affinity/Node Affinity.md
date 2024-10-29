# Q1: How many Labels exist on node node01?
```bash
kubectl describe node node01
```
```
Name:               node01
Roles:              <none>
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/os=linux
                    kubernetes.io/arch=amd64
                    kubernetes.io/hostname=node01
                    kubernetes.io/os=linux
Annotations:        flannel.alpha.coreos.com/backend-data: {"VNI":1,"VtepMAC":"ee:fb:84:84:2f:dd"}
                    flannel.alpha.coreos.com/backend-type: vxlan
                    flannel.alpha.coreos.com/kube-subnet-manager: true
                    flannel.alpha.coreos.com/public-ip: 192.36.111.6
                    kubeadm.alpha.kubernetes.io/cri-socket: unix:///var/run/containerd/containerd.sock
                    node.alpha.kubernetes.io/ttl: 0
                    volumes.kubernetes.io/controller-managed-attach-detach: true
CreationTimestamp:  Mon, 28 Oct 2024 19:03:28 +0000
Taints:             <none>
Unschedulable:      false
Lease:
  HolderIdentity:  node01
  AcquireTime:     <unset>
  RenewTime:       Mon, 28 Oct 2024 19:08:23 +0000
Conditions:
  Type                 Status  LastHeartbeatTime                 LastTransitionTime                Reason                       Message
  ----                 ------  -----------------                 ------------------                ------                       -------
  NetworkUnavailable   False   Mon, 28 Oct 2024 19:03:33 +0000   Mon, 28 Oct 2024 19:03:33 +0000   FlannelIsUp                  Flannel is running on this node
  MemoryPressure       False   Mon, 28 Oct 2024 19:03:59 +0000   Mon, 28 Oct 2024 19:03:28 +0000   KubeletHasSufficientMemory   kubelet has sufficient memory available
  DiskPressure         False   Mon, 28 Oct 2024 19:03:59 +0000   Mon, 28 Oct 2024 19:03:28 +0000   KubeletHasNoDiskPressure     kubelet has no disk pressure
  PIDPressure          False   Mon, 28 Oct 2024 19:03:59 +0000   Mon, 28 Oct 2024 19:03:28 +0000   KubeletHasSufficientPID      kubelet has sufficient PID available
  Ready                True    Mon, 28 Oct 2024 19:03:59 +0000   Mon, 28 Oct 2024 19:03:31 +0000   KubeletReady                 kubelet is posting ready status
Addresses:
  InternalIP:  192.36.111.6
  Hostname:    node01
Capacity:
  cpu:                36
  ephemeral-storage:  1016057248Ki
  hugepages-1Gi:      0
  hugepages-2Mi:      0
  memory:             214587048Ki
  pods:               110
Allocatable:
  cpu:                36
  ephemeral-storage:  936398358207
  hugepages-1Gi:      0
  hugepages-2Mi:      0
  memory:             214484648Ki
  pods:               110
System Info:
  Machine ID:                 132e3d2451f947fe9214456160254717
  System UUID:                aac6731f-b99d-f878-0d80-7077d2479feb
  Boot ID:                    2ecede85-79a8-4b23-a82c-b60eb00e3028
  Kernel Version:             5.4.0-1106-gcp
  OS Image:                   Ubuntu 22.04.4 LTS
  Operating System:           linux
  Architecture:               amd64
  Container Runtime Version:  containerd://1.6.26
  Kubelet Version:            v1.31.0
  Kube-Proxy Version:         
PodCIDR:                      10.244.1.0/24
PodCIDRs:                     10.244.1.0/24
Non-terminated Pods:          (2 in total)
  Namespace                   Name                     CPU Requests  CPU Limits  Memory Requests  Memory Limits  Age
  ---------                   ----                     ------------  ----------  ---------------  -------------  ---
  kube-flannel                kube-flannel-ds-644xt    100m (0%)     0 (0%)      50Mi (0%)        0 (0%)         4m58s
  kube-system                 kube-proxy-sgg4c         0 (0%)        0 (0%)      0 (0%)           0 (0%)         4m58s
Allocated resources:
  (Total limits may be over 100 percent, i.e., overcommitted.)
  Resource           Requests   Limits
  --------           --------   ------
  cpu                100m (0%)  0 (0%)
  memory             50Mi (0%)  0 (0%)
  ephemeral-storage  0 (0%)     0 (0%)
  hugepages-1Gi      0 (0%)     0 (0%)
  hugepages-2Mi      0 (0%)     0 (0%)
Events:
  Type     Reason                   Age                    From             Message
  ----     ------                   ----                   ----             -------
  Normal   Starting                 4m55s                  kube-proxy       
  Normal   Starting                 4m58s                  kubelet          Starting kubelet.
  Warning  InvalidDiskCapacity      4m58s                  kubelet          invalid capacity 0 on image filesystem
  Warning  CgroupV1                 4m58s                  kubelet          Cgroup v1 support is in maintenance mode, please migrate to Cgroup v2.
  Normal   NodeHasSufficientMemory  4m58s (x2 over 4m58s)  kubelet          Node node01 status is now: NodeHasSufficientMemory
  Normal   NodeHasNoDiskPressure    4m58s (x2 over 4m58s)  kubelet          Node node01 status is now: NodeHasNoDiskPressure
  Normal   NodeHasSufficientPID     4m58s (x2 over 4m58s)  kubelet          Node node01 status is now: NodeHasSufficientPID
  Normal   NodeAllocatableEnforced  4m58s                  kubelet          Updated Node Allocatable limit across pods
  Normal   RegisteredNode           4m55s                  node-controller  Node node01 event: Registered Node node01 in Controller
  Normal   NodeReady                4m55s                  kubelet          Node node01 status is now: NodeReady
```

## A1: 5

<br>

# Q2: What is the value set to the label key beta.kubernetes.io/arch on node01?
```bash
kubectl describe node node01
```
```
Name:               node01
Roles:              <none>
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/os=linux
                    kubernetes.io/arch=amd64
                    kubernetes.io/hostname=node01
                    kubernetes.io/os=linux
Annotations:        flannel.alpha.coreos.com/backend-data: {"VNI":1,"VtepMAC":"ee:fb:84:84:2f:dd"}
                    flannel.alpha.coreos.com/backend-type: vxlan
                    flannel.alpha.coreos.com/kube-subnet-manager: true
                    flannel.alpha.coreos.com/public-ip: 192.36.111.6
                    kubeadm.alpha.kubernetes.io/cri-socket: unix:///var/run/containerd/containerd.sock
                    node.alpha.kubernetes.io/ttl: 0
                    volumes.kubernetes.io/controller-managed-attach-detach: true
CreationTimestamp:  Mon, 28 Oct 2024 19:03:28 +0000
Taints:             <none>
Unschedulable:      false
Lease:
  HolderIdentity:  node01
  AcquireTime:     <unset>
  RenewTime:       Mon, 28 Oct 2024 19:08:23 +0000
Conditions:
  Type                 Status  LastHeartbeatTime                 LastTransitionTime                Reason                       Message
  ----                 ------  -----------------                 ------------------                ------                       -------
  NetworkUnavailable   False   Mon, 28 Oct 2024 19:03:33 +0000   Mon, 28 Oct 2024 19:03:33 +0000   FlannelIsUp                  Flannel is running on this node
  MemoryPressure       False   Mon, 28 Oct 2024 19:03:59 +0000   Mon, 28 Oct 2024 19:03:28 +0000   KubeletHasSufficientMemory   kubelet has sufficient memory available
  DiskPressure         False   Mon, 28 Oct 2024 19:03:59 +0000   Mon, 28 Oct 2024 19:03:28 +0000   KubeletHasNoDiskPressure     kubelet has no disk pressure
  PIDPressure          False   Mon, 28 Oct 2024 19:03:59 +0000   Mon, 28 Oct 2024 19:03:28 +0000   KubeletHasSufficientPID      kubelet has sufficient PID available
  Ready                True    Mon, 28 Oct 2024 19:03:59 +0000   Mon, 28 Oct 2024 19:03:31 +0000   KubeletReady                 kubelet is posting ready status
Addresses:
  InternalIP:  192.36.111.6
  Hostname:    node01
Capacity:
  cpu:                36
  ephemeral-storage:  1016057248Ki
  hugepages-1Gi:      0
  hugepages-2Mi:      0
  memory:             214587048Ki
  pods:               110
Allocatable:
  cpu:                36
  ephemeral-storage:  936398358207
  hugepages-1Gi:      0
  hugepages-2Mi:      0
  memory:             214484648Ki
  pods:               110
System Info:
  Machine ID:                 132e3d2451f947fe9214456160254717
  System UUID:                aac6731f-b99d-f878-0d80-7077d2479feb
  Boot ID:                    2ecede85-79a8-4b23-a82c-b60eb00e3028
  Kernel Version:             5.4.0-1106-gcp
  OS Image:                   Ubuntu 22.04.4 LTS
  Operating System:           linux
  Architecture:               amd64
  Container Runtime Version:  containerd://1.6.26
  Kubelet Version:            v1.31.0
  Kube-Proxy Version:         
PodCIDR:                      10.244.1.0/24
PodCIDRs:                     10.244.1.0/24
Non-terminated Pods:          (2 in total)
  Namespace                   Name                     CPU Requests  CPU Limits  Memory Requests  Memory Limits  Age
  ---------                   ----                     ------------  ----------  ---------------  -------------  ---
  kube-flannel                kube-flannel-ds-644xt    100m (0%)     0 (0%)      50Mi (0%)        0 (0%)         4m58s
  kube-system                 kube-proxy-sgg4c         0 (0%)        0 (0%)      0 (0%)           0 (0%)         4m58s
Allocated resources:
  (Total limits may be over 100 percent, i.e., overcommitted.)
  Resource           Requests   Limits
  --------           --------   ------
  cpu                100m (0%)  0 (0%)
  memory             50Mi (0%)  0 (0%)
  ephemeral-storage  0 (0%)     0 (0%)
  hugepages-1Gi      0 (0%)     0 (0%)
  hugepages-2Mi      0 (0%)     0 (0%)
Events:
  Type     Reason                   Age                    From             Message
  ----     ------                   ----                   ----             -------
  Normal   Starting                 4m55s                  kube-proxy       
  Normal   Starting                 4m58s                  kubelet          Starting kubelet.
  Warning  InvalidDiskCapacity      4m58s                  kubelet          invalid capacity 0 on image filesystem
  Warning  CgroupV1                 4m58s                  kubelet          Cgroup v1 support is in maintenance mode, please migrate to Cgroup v2.
  Normal   NodeHasSufficientMemory  4m58s (x2 over 4m58s)  kubelet          Node node01 status is now: NodeHasSufficientMemory
  Normal   NodeHasNoDiskPressure    4m58s (x2 over 4m58s)  kubelet          Node node01 status is now: NodeHasNoDiskPressure
  Normal   NodeHasSufficientPID     4m58s (x2 over 4m58s)  kubelet          Node node01 status is now: NodeHasSufficientPID
  Normal   NodeAllocatableEnforced  4m58s                  kubelet          Updated Node Allocatable limit across pods
  Normal   RegisteredNode           4m55s                  node-controller  Node node01 event: Registered Node node01 in Controller
  Normal   NodeReady                4m55s                  kubelet          Node node01 status is now: NodeReady
```
```
beta.kubernetes.io/arch=amd64
```
## A2: amd64

<br>

# Q3: Apply a label color=blue to node node01
## A3:
```bash
kubectl label node node01 color=blue
```

<br>

# Q4: Create a new deployment named blue with the nginx image and 3 replicas.
## A4: 
```bash
kubectl create deployment blue --image=nginx --replicas=3
```

<br>

# Q5: Which nodes `can` the pods for the `blue` deployment be placed on?

Make sure to check taints on both nodes!
```bash
kubectl describe node controlplane | grep -i taints
```
```
Taints:             <none>
```
```bash
kubectl describe node node01 | grep -i taints
```
```
Taints:             <none>
```

## A5: controlplane and node01

<br>

# Q6: Set Node Affinity to the deployment to place the pods on node01 only.
## A6:

```bash
kubectl edit deployment blue
```
```YAML
kind: Deployment
metadata:
  annotations:
    deployment.kubernetes.io/revision: "1"
  creationTimestamp: "2024-10-28T19:12:28Z"
  generation: 1
  labels:
    app: blue
  name: blue
  namespace: default
spec:
  progressDeadlineSeconds: 600
  replicas: 3
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app: blue
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: blue
    spec:
      containers:
      - image: nginx
        imagePullPolicy: Always
        name: nginx
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: color
                operator: In
                values:
                - blue
      dnsPolicy: ClusterFirst
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
```

<br>

# Q7: Which nodes are the pods placed on now?
```bash
kubectl get pods -o wide
```
| NAME                   | READY | STATUS  | RESTARTS | AGE   | IP          | NODE   | NOMINATED NODE | READINESS GATES |
|------------------------|-------|---------|----------|-------|-------------|--------|----------------|-----------------|
| blue-5659879b55-2vss9  | 1/1   | Running | 0        | 2m31s | 10.244.1.6  | node01 | `<none>`       | `<none>`        |
| blue-5659879b55-6k5j7  | 1/1   | Running | 0        | 2m36s | 10.244.1.4  | node01 | `<none>`       | `<none>`        |
| blue-5659879b55-wkjkw  | 1/1   | Running | 0        | 2m34s | 10.244.1.5  | node01 | `<none>`       | `<none>`        |

## A7: node01

<br>

# Q8: Create a new deployment named `red` with the `nginx` image and `2` replicas, and ensure it gets placed on the `controlplane` node only.
Use the label key - `node-role.kubernetes.io/control-plane` - which is already set on the `controlplane` node.

## A8:
```bash
vi red-deployment.yaml
```
```YAML
apiVersion: apps/v1
kind: Deployment
metadata:
  name: red
spec:
  replicas: 2
  selector:
    matchLabels:
      run: nginx
  template:
    metadata:
      labels:
        run: nginx
    spec: 
      containers:
      - image: nginx
        imagePullPolicy: Always
        name: nginx
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: node-role.kubernetes.io/control-plane
                operator: Exists                              
```
```bash
kubectl create -f red-deployment.yaml
```

