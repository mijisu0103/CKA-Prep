# Q1: How many PODs exist on the system in the default namespace?

```bash
kubectl get pods
# No resources found in default namespace
```

## A1: 0   

<br>

# Q2: How many ReplicaSets exist on the system in the default namespace?
```bash
kubectl get replicasets
# No resources found in default namespace
```

## A2: 0

<br>

# Q3: How about now? How many ReplicaSets do you see?
```bash
kubectl get replicasets
```
| NAME            | DESIRED | CURRENT | READY | AGE  |
|-----------------|---------|---------|-------|------|
| new-replica-set | 4       | 4       | 0     | 31s  |

## A3: 1

<br>

# Q4: How many Pods are DESIRED in the new-replica-set?
```bash
kubectl get replicaset new-replica-set
```
| NAME            | DESIRED | CURRENT | READY | AGE  |
|-----------------|---------|---------|-------|------|
| new-replica-set | 4       | 4       | 0     | 3m5s |

## A4: 4

<br>

# Q5: What is the image used to create the pods in the new-replica-set?
```bash
kubectl describe pods new-replica-set
```
```
Name:             new-replica-set-4qcct
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.2.249.9
Start Time:       Sun, 27 Oct 2024 01:59:46 +0000
Labels:           name=busybox-pod
Annotations:      <none>
Status:           Pending
IP:               10.42.0.9
IPs:
  IP:           10.42.0.9
Controlled By:  ReplicaSet/new-replica-set
Containers:
  busybox-container:
    Container ID:  
    Image:         busybox777
    Image ID:      
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      echo Hello Kubernetes! && sleep 3600
    State:          Waiting
      Reason:       ImagePullBackOff
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-ctvgf (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-ctvgf:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                   From               Message
  ----     ------     ----                  ----               -------
  Normal   Scheduled  4m10s                 default-scheduler  Successfully assigned default/new-replica-set-4qcct to controlplane
  Normal   Pulling    2m38s (x4 over 4m9s)  kubelet            Pulling image "busybox777"
  Warning  Failed     2m38s (x4 over 4m9s)  kubelet            Failed to pull image "busybox777": failed to pull and unpack image "docker.io/library/busybox777:latest": failed to resolve reference "docker.io/library/busybox777:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     2m38s (x4 over 4m9s)  kubelet            Error: ErrImagePull
  Warning  Failed     2m27s (x6 over 4m8s)  kubelet            Error: ImagePullBackOff
  Normal   BackOff    2m13s (x7 over 4m8s)  kubelet            Back-off pulling image "busybox777"

Name:             new-replica-set-hw7wb
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.2.249.9
Start Time:       Sun, 27 Oct 2024 01:59:46 +0000
Labels:           name=busybox-pod
Annotations:      <none>
Status:           Pending
IP:               10.42.0.12
IPs:
  IP:           10.42.0.12
Controlled By:  ReplicaSet/new-replica-set
Containers:
  busybox-container:
    Container ID:  
    Image:         busybox777
    Image ID:      
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      echo Hello Kubernetes! && sleep 3600
    State:          Waiting
      Reason:       ImagePullBackOff
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-fscr8 (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-fscr8:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                   From               Message
  ----     ------     ----                  ----               -------
  Normal   Scheduled  4m10s                 default-scheduler  Successfully assigned default/new-replica-set-hw7wb to controlplane
  Normal   Pulling    2m33s (x4 over 4m9s)  kubelet            Pulling image "busybox777"
  Warning  Failed     2m33s (x4 over 4m8s)  kubelet            Failed to pull image "busybox777": failed to pull and unpack image "docker.io/library/busybox777:latest": failed to resolve reference "docker.io/library/busybox777:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     2m33s (x4 over 4m8s)  kubelet            Error: ErrImagePull
  Warning  Failed     2m3s (x6 over 4m8s)   kubelet            Error: ImagePullBackOff
  Normal   BackOff    112s (x7 over 4m8s)   kubelet            Back-off pulling image "busybox777"

Name:             new-replica-set-hx4qh
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.2.249.9
Start Time:       Sun, 27 Oct 2024 01:59:46 +0000
Labels:           name=busybox-pod
Annotations:      <none>
Status:           Pending
IP:               10.42.0.11
IPs:
  IP:           10.42.0.11
Controlled By:  ReplicaSet/new-replica-set
Containers:
  busybox-container:
    Container ID:  
    Image:         busybox777
    Image ID:      
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      echo Hello Kubernetes! && sleep 3600
    State:          Waiting
      Reason:       ImagePullBackOff
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-gr8vb (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-gr8vb:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                   From               Message
  ----     ------     ----                  ----               -------
  Normal   Scheduled  4m10s                 default-scheduler  Successfully assigned default/new-replica-set-hx4qh to controlplane
  Normal   Pulling    2m32s (x4 over 4m9s)  kubelet            Pulling image "busybox777"
  Warning  Failed     2m32s (x4 over 4m8s)  kubelet            Failed to pull image "busybox777": failed to pull and unpack image "docker.io/library/busybox777:latest": failed to resolve reference "docker.io/library/busybox777:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     2m32s (x4 over 4m8s)  kubelet            Error: ErrImagePull
  Warning  Failed     2m19s (x6 over 4m8s)  kubelet            Error: ImagePullBackOff
  Normal   BackOff    2m5s (x7 over 4m8s)   kubelet            Back-off pulling image "busybox777"

Name:             new-replica-set-kp5cq
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.2.249.9
Start Time:       Sun, 27 Oct 2024 01:59:46 +0000
Labels:           name=busybox-pod
Annotations:      <none>
Status:           Pending
IP:               10.42.0.10
IPs:
  IP:           10.42.0.10
Controlled By:  ReplicaSet/new-replica-set
Containers:
  busybox-container:
    Container ID:  
    Image:         busybox777
    Image ID:      
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      echo Hello Kubernetes! && sleep 3600
    State:          Waiting
      Reason:       ImagePullBackOff
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-spg4p (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-spg4p:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                   From               Message
  ----     ------     ----                  ----               -------
  Normal   Scheduled  4m10s                 default-scheduler  Successfully assigned default/new-replica-set-kp5cq to controlplane
  Normal   Pulling    2m29s (x4 over 4m9s)  kubelet            Pulling image "busybox777"
  Warning  Failed     2m29s (x4 over 4m8s)  kubelet            Failed to pull image "busybox777": failed to pull and unpack image "docker.io/library/busybox777:latest": failed to resolve reference "docker.io/library/busybox777:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     2m29s (x4 over 4m8s)  kubelet            Error: ErrImagePull
  Warning  Failed     2m3s (x6 over 4m8s)   kubelet            Error: ImagePullBackOff
  Normal   BackOff    111s (x7 over 4m8s)   kubelet            Back-off pulling image "busybox777"
```
<br>
Check the Image field under busybox-container under Containers section
<br>

## A5: BUSYBOX777

<br>

# Q6: How many PODs are READY in the new-replica-set?
```bash
kubectl get replicasets new-replica-set
```
| NAME            | DESIRED | CURRENT | READY | AGE   |
|-----------------|---------|---------|-------|-------|
| new-replica-set | 4       | 4       | 0     | 6m45s |

## A6: 0

<br>

# Q7: Why do you think the PODs are not ready?
```bash
kubectl describe pods new-replica-set
```
```
Name:             new-replica-set-4qcct
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.2.249.9
Start Time:       Sun, 27 Oct 2024 01:59:46 +0000
Labels:           name=busybox-pod
Annotations:      <none>
Status:           Pending
IP:               10.42.0.9
IPs:
  IP:           10.42.0.9
Controlled By:  ReplicaSet/new-replica-set
Containers:
  busybox-container:
    Container ID:  
    Image:         busybox777
    Image ID:      
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      echo Hello Kubernetes! && sleep 3600
    State:          Waiting
      Reason:       ImagePullBackOff
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-ctvgf (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-ctvgf:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                    From               Message
  ----     ------     ----                   ----               -------
  Normal   Scheduled  9m18s                  default-scheduler  Successfully assigned default/new-replica-set-4qcct to controlplane
  Normal   Pulling    7m47s (x4 over 9m18s)  kubelet            Pulling image "busybox777"
  Warning  Failed     7m47s (x4 over 9m18s)  kubelet            Failed to pull image "busybox777": failed to pull and unpack image "docker.io/library/busybox777:latest": failed to resolve reference "docker.io/library/busybox777:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     7m47s (x4 over 9m18s)  kubelet            Error: ErrImagePull
  Warning  Failed     7m36s (x6 over 9m17s)  kubelet            Error: ImagePullBackOff
  Normal   BackOff    4m6s (x21 over 9m17s)  kubelet            Back-off pulling image "busybox777"

Name:             new-replica-set-hw7wb
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.2.249.9
Start Time:       Sun, 27 Oct 2024 01:59:46 +0000
Labels:           name=busybox-pod
Annotations:      <none>
Status:           Pending
IP:               10.42.0.12
IPs:
  IP:           10.42.0.12
Controlled By:  ReplicaSet/new-replica-set
Containers:
  busybox-container:
    Container ID:  
    Image:         busybox777
    Image ID:      
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      echo Hello Kubernetes! && sleep 3600
    State:          Waiting
      Reason:       ImagePullBackOff
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-fscr8 (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-fscr8:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                     From               Message
  ----     ------     ----                    ----               -------
  Normal   Scheduled  9m18s                   default-scheduler  Successfully assigned default/new-replica-set-hw7wb to controlplane
  Normal   Pulling    7m42s (x4 over 9m18s)   kubelet            Pulling image "busybox777"
  Warning  Failed     7m42s (x4 over 9m17s)   kubelet            Failed to pull image "busybox777": failed to pull and unpack image "docker.io/library/busybox777:latest": failed to resolve reference "docker.io/library/busybox777:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     7m42s (x4 over 9m17s)   kubelet            Error: ErrImagePull
  Warning  Failed     7m12s (x6 over 9m17s)   kubelet            Error: ImagePullBackOff
  Normal   BackOff    4m16s (x19 over 9m17s)  kubelet            Back-off pulling image "busybox777"

Name:             new-replica-set-hx4qh
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.2.249.9
Start Time:       Sun, 27 Oct 2024 01:59:46 +0000
Labels:           name=busybox-pod
Annotations:      <none>
Status:           Pending
IP:               10.42.0.11
IPs:
  IP:           10.42.0.11
Controlled By:  ReplicaSet/new-replica-set
Containers:
  busybox-container:
    Container ID:  
    Image:         busybox777
    Image ID:      
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      echo Hello Kubernetes! && sleep 3600
    State:          Waiting
      Reason:       ImagePullBackOff
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-gr8vb (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-gr8vb:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                     From               Message
  ----     ------     ----                    ----               -------
  Normal   Scheduled  9m18s                   default-scheduler  Successfully assigned default/new-replica-set-hx4qh to controlplane
  Normal   Pulling    7m41s (x4 over 9m18s)   kubelet            Pulling image "busybox777"
  Warning  Failed     7m41s (x4 over 9m17s)   kubelet            Failed to pull image "busybox777": failed to pull and unpack image "docker.io/library/busybox777:latest": failed to resolve reference "docker.io/library/busybox777:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     7m41s (x4 over 9m17s)   kubelet            Error: ErrImagePull
  Warning  Failed     7m28s (x6 over 9m17s)   kubelet            Error: ImagePullBackOff
  Normal   BackOff    4m15s (x20 over 9m17s)  kubelet            Back-off pulling image "busybox777"

Name:             new-replica-set-kp5cq
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.2.249.9
Start Time:       Sun, 27 Oct 2024 01:59:46 +0000
Labels:           name=busybox-pod
Annotations:      <none>
Status:           Pending
IP:               10.42.0.10
IPs:
  IP:           10.42.0.10
Controlled By:  ReplicaSet/new-replica-set
Containers:
  busybox-container:
    Container ID:  
    Image:         busybox777
    Image ID:      
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      echo Hello Kubernetes! && sleep 3600
    State:          Waiting
      Reason:       ImagePullBackOff
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-spg4p (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-spg4p:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                     From               Message
  ----     ------     ----                    ----               -------
  Normal   Scheduled  9m18s                   default-scheduler  Successfully assigned default/new-replica-set-kp5cq to controlplane
  Normal   Pulling    7m38s (x4 over 9m18s)   kubelet            Pulling image "busybox777"
  Warning  Failed     7m38s (x4 over 9m17s)   kubelet            Failed to pull image "busybox777": failed to pull and unpack image "docker.io/library/busybox777:latest": failed to resolve reference "docker.io/library/busybox777:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     7m38s (x4 over 9m17s)   kubelet            Error: ErrImagePull
  Warning  Failed     7m12s (x6 over 9m17s)   kubelet            Error: ImagePullBackOff
  Normal   BackOff    4m12s (x18 over 9m17s)  kubelet            Back-off pulling image "busybox777"

```
<br>

Closely look at the error message:
```
Failed to pull image "busybox777": failed to pull and unpack image "docker.io/library/busybox777:latest": failed to resolve reference "docker.io/library/busybox777:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
```
<br>

## A7: The image BUSYBOX777 doesn’t exist

<br>

# Q8: Delete any one of the 4 PODS
## A8:
```bash
kubectl get pods
```
| NAME                    | READY | STATUS             | RESTARTS | AGE  |
|-------------------------|-------|--------------------|----------|------|
| new-replica-set-4qcct   | 0/1   | ImagePullBackOff   | 0        | 11m  |
| new-replica-set-hw7wb   | 0/1   | ImagePullBackOff   | 0        | 11m  |
| new-replica-set-hx4qh   | 0/1   | ImagePullBackOff   | 0        | 11m  |
| new-replica-set-kp5cq   | 0/1   | ImagePullBackOff   | 0        | 11m  |

<br>

```bash
kubectl delete pods new-replica-set-4qcct
```

```bash
kubectl get pods
```

| NAME                    | READY | STATUS             | RESTARTS | AGE  |
|-------------------------|-------|--------------------|----------|------|
| new-replica-set-8xhz2   | 0/1   | ErrImagePull       | 0        | 7s   |
| new-replica-set-hw7wb   | 0/1   | ImagePullBackOff   | 0        | 12m  |
| new-replica-set-hx4qh   | 0/1   | ImagePullBackOff   | 0        | 12m  |
| new-replica-set-kp5cq   | 0/1   | ImagePullBackOff   | 0        | 12m  |

<br>

# Q9: How many PODs exist now?
```bash
kubectl get pods
```
| NAME                    | READY | STATUS             | RESTARTS | AGE  |
|-------------------------|-------|--------------------|----------|------|
| new-replica-set-8xhz2   | 0/1   | ErrImagePull       | 0        | 7s   |
| new-replica-set-hw7wb   | 0/1   | ImagePullBackOff   | 0        | 12m  |
| new-replica-set-hx4qh   | 0/1   | ImagePullBackOff   | 0        | 12m  |
| new-replica-set-kp5cq   | 0/1   | ImagePullBackOff   | 0        | 12m  |
## A9: 4

<br>

# Q10: Why are there still 4 PODs, even after you deleted one?
## A10: ReplicaSet ensures that desired number of PODs always run

<br>

# Q11: Create a ReplicaSet using the replicaset-definition-1.yaml file located at /root/.
- There is an issue with the file, so try to fix it
  
## A11:

Check apiVersion of replicaset by command

```bash
kubectl api-resources | grep replicaset
```
| NAME                  | SHORT NAME | APIGROUP  | VERSION | STATUS |
|-----------------------|------------|-----------|---------|--------|
| replicasets           | rs         | apps/v1   |         | true   |


<br>


Check the current version by command
```bash
kubectl explain replicaset | grep VERSION
```
```
VERSION:    v1
```

<br>

Issue: apiVersion — v1 is right for replication controller but for replicaset, it should be apps/v1

<br>

Edited version:
```bash
vi replicaset-definition-1.yaml
```

```YAML
apiVersion: v1
kind: ReplicaSet
metadata:
  name: replicaset-1
spec:
  replicas: 2
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: nginx
        image: nginx
```

<br>

Correct the version to apps/v1:
```YAML
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: replicaset-1
spec:
  replicas: 2
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: nginx
        image: nginx
```

<br>

Create a ReplicaSet by running this command:
```bash
kubectl create -f /root/replicaset-definition-1.yaml
```
<br>

# Q12: Fix the issue in the replicaset-definition-2.yaml file and create a ReplicaSet using it
- This file is located at /root/

## A12:

<br>

```bash
vi replicaset-definition-2.yaml
```
```YAML
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: replicaset-2
spec:
  replicas: 2
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
```

<br>

Issue: tier under matchLabels for replicaset and tier under labels for pod’s template do not match

<br>

Updated the /root/replicaset-definition-2.yaml:
```YAML
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: replicaset-2
spec:
  replicas: 2
  selector:
    matchLabels:
      tier: nginx
  template:
    metadata:
      labels:
        tier: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
```

<br>

Create ReplicaSet by this command:
```bash
kubectl create -f /root/replicaset-definition-2.yaml
```

<br>

# Q13: Delete the two newly created ReplicaSets - replicaset-1 and replicaset-2
## A13:

```bash
kubectl delete replicaset replicaset-1
kubectl delete replicaset replicaset-2
```

OR:
```bash
kubectl delete -f replicaset-definition-1.yaml
kubectl delete -f replicaset-definition-2.yaml
```

<br>

# Q14: Fix the original replica set new-replica-set to use the correct busybox image
- Either delete and recreate the ReplicaSet or Update the existing ReplicaSet and then delete all PODs, so new ones with the correct image will be created

## A14:

```bash
kubectl edit replicaset new-replica-set
```
```YAML
  creationTimestamp: "2024-10-27T01:59:46Z"
  generation: 1
  name: new-replica-set
  namespace: default
  resourceVersion: "1566"
  uid: e50043d7-4731-4e40-857c-c9629e7d10dd
spec:
  replicas: 4
  selector:
    matchLabels:
      name: busybox-pod
  template:
    metadata:
      creationTimestamp: null
      labels:
        name: busybox-pod
    spec:
      containers:
      - command:
        - sh
        - -c
        - echo Hello Kubernetes! && sleep 3600
        image: busybox777
        imagePullPolicy: Always
        name: busybox-container
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
      dnsPolicy: ClusterFirst
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
      terminationGracePeriodSeconds: 30
status:
  fullyLabeledReplicas: 4
  observedGeneration: 1
  replicas: 4
```

<br>

Fixed:

```bash
  creationTimestamp: "2024-10-27T01:59:46Z"
  generation: 1
  name: new-replica-set
  namespace: default
  resourceVersion: "1566"
  uid: e50043d7-4731-4e40-857c-c9629e7d10dd
spec:
  replicas: 4
  selector:
    matchLabels:
      name: busybox-pod
  template:
    metadata:
      creationTimestamp: null
      labels:
        name: busybox-pod
    spec:
      containers:
      - command:
        - sh
        - -c
        - echo Hello Kubernetes! && sleep 3600
        image: busybox
        imagePullPolicy: Always
        name: busybox-container
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
      dnsPolicy: ClusterFirst
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
      terminationGracePeriodSeconds: 30
status:
  fullyLabeledReplicas: 4
  observedGeneration: 1
  replicas: 4
```

<br>

```bash
kubectl get pods
```

| NAME                    | READY | STATUS             | RESTARTS | AGE  |
|-------------------------|-------|--------------------|----------|------|
| new-replica-set-8xhz2   | 0/1   | ImagePullBackOff   | 0        | 24m  |
| new-replica-set-hw7wb   | 0/1   | ImagePullBackOff   | 0        | 36m  |
| new-replica-set-hx4qh   | 0/1   | ImagePullBackOff   | 0        | 36m  |
| new-replica-set-kp5cq   | 0/1   | ImagePullBackOff   | 0        | 36m  |

<br>

```bash
kubectl delete pods --all
```
```
pod "new-replica-set-8xhz2" deleted
pod "new-replica-set-hw7wb" deleted
pod "new-replica-set-hx4qh" deleted
pod "new-replica-set-kp5cq" deleted
```

<br>

# Q15: Scale the ReplicaSet to 5 PODs.
- Use kubectl scale command or edit the replicaset using kubectl edit replicaset

## A15:
```bash
kubectl scale replicaset new-replica-set --replicas=5
```
```
replicaset.apps/new-replica-set scaled
```

<br>
OR:
<br>

```bash
kubectl edit replicaset new-replica-set
```
```YAML
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  creationTimestamp: "2024-10-27T01:59:46Z"
  generation: 3
  name: new-replica-set
  namespace: default
  resourceVersion: "2428"
  uid: e50043d7-4731-4e40-857c-c9629e7d10dd
spec:
  replicas: 3
  selector:
    matchLabels:
      name: busybox-pod
  template:
    metadata:
      creationTimestamp: null
      labels:
        name: busybox-pod
    spec:
      containers:
      - command:
        - sh
        - -c
        - echo Hello Kubernetes! && sleep 3600
        image: busybox
        imagePullPolicy: Always
        name: busybox-container
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
```

<br>

Change replicas: 3 to replicas: 5

<br>

Fixed:
```YAML
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  creationTimestamp: "2024-10-27T01:59:46Z"
  generation: 3
  name: new-replica-set
  namespace: default
  resourceVersion: "2428"
  uid: e50043d7-4731-4e40-857c-c9629e7d10dd
spec:
  replicas: 5
  selector:
    matchLabels:
      name: busybox-pod
  template:
    metadata:
      creationTimestamp: null
      labels:
        name: busybox-pod
    spec:
      containers:
      - command:
        - sh
        - -c
        - echo Hello Kubernetes! && sleep 3600
        image: busybox
        imagePullPolicy: Always
        name: busybox-container
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
```

<br>

# Q16: Now scale the ReplicaSet down to 2 PODs.
- Use the kubectl scale command or edit the replicaset using kubectl edit replicaset

## A16:
```bash
kubectl scale replicaset new-replica-set --replicas=2
```
```
replicaset.apps/new-replica-set scaled
```

<br>

OR:
```bash
kubectl edit replicaset new-replica-set
```
```YAML
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  creationTimestamp: "2024-10-27T01:59:46Z"
  generation: 3
  name: new-replica-set
  namespace: default
  resourceVersion: "2428"
  uid: e50043d7-4731-4e40-857c-c9629e7d10dd
spec:
  replicas: 5
  selector:
    matchLabels:
      name: busybox-pod
  template:
    metadata:
      creationTimestamp: null
      labels:
        name: busybox-pod
    spec:
      containers:
      - command:
        - sh
        - -c
        - echo Hello Kubernetes! && sleep 3600
        image: busybox
        imagePullPolicy: Always
        name: busybox-container
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
```

<br>

Fix replicas:5 to replicas: 2
```YAML
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  creationTimestamp: "2024-10-27T01:59:46Z"
  generation: 3
  name: new-replica-set
  namespace: default
  resourceVersion: "2428"
  uid: e50043d7-4731-4e40-857c-c9629e7d10dd
spec:
  replicas: 2
  selector:
    matchLabels:
      name: busybox-pod
  template:
    metadata:
      creationTimestamp: null
      labels:
        name: busybox-pod
    spec:
      containers:
      - command:
        - sh
        - -c
        - echo Hello Kubernetes! && sleep 3600
        image: busybox
        imagePullPolicy: Always
        name: busybox-container
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
```
