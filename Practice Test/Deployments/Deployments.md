# Q1: How many PODs exist in the system in the default namespace?
```bash
kubectl get pods
# No resources found in default namespace
```
## A1: 0

<br>

# Q2: How many ReplicaSets exist on the system in the default namespace?
```bash
kubectl get replicaset
# No resources found in default namespace
```
## A2: 0

<br>

# Q3: How many Deployments exist on the system in the default namespace?
```bash
kubectl get deployment
# No resources found in default namespace
```
## A3: 0

<br>

# Q4: How many Deployments exist on the system now?
```bash
kubectl get deployment
```

| NAME               | READY | UP-TO-DATE | AVAILABLE | AGE |
|--------------------|-------|------------|-----------|-----|
| frontend-deployment | 0/4  | 4          | 0         | 47s |

## A4: 1

<br>

# Q5: How many ReplicaSets exist on the system now?
```bash
kubectl get replicaset
```
| NAME                          | DESIRED | CURRENT | READY | AGE |
|-------------------------------|---------|---------|-------|-----|
| frontend-deployment-649fb4c7c | 4       | 4       | 0     | 99s |

## A5: 1

<br>

# Q6: How many PODs exist on the system now?
```bash
kubectl get pods
```

| NAME                                | READY | STATUS           | RESTARTS | AGE   |
|-------------------------------------|-------|------------------|----------|-------|
| frontend-deployment-649fb4c7c-62nt8 | 0/1   | ImagePullBackOff | 0        | 2m30s |
| frontend-deployment-649fb4c7c-9x7fq | 0/1   | ImagePullBackOff | 0        | 2m30s |
| frontend-deployment-649fb4c7c-dvvsf | 0/1   | ImagePullBackOff | 0        | 2m30s |
| frontend-deployment-649fb4c7c-mtcvj | 0/1   | ImagePullBackOff | 0        | 2m30s |

## A6: 4

<br>

# Q7: Out of all the existing PODs, how many are ready?
```bash
kubectl get pods
```

| NAME                                | READY | STATUS           | RESTARTS | AGE   |
|-------------------------------------|-------|------------------|----------|-------|
| frontend-deployment-649fb4c7c-62nt8 | 0/1   | ImagePullBackOff | 0        | 3m35s |
| frontend-deployment-649fb4c7c-9x7fq | 0/1   | ImagePullBackOff | 0        | 3m35s |
| frontend-deployment-649fb4c7c-dvvsf | 0/1   | ImagePullBackOff | 0        | 3m35s |
| frontend-deployment-649fb4c7c-mtcvj | 0/1   | ImagePullBackOff | 0        | 3m35s |

# A7: 0

<br>

# A8: What is the image used to create the pods in the new deployment?
```bash
kubectl describe pods
```
```
Name:             frontend-deployment-649fb4c7c-62nt8
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.23.84.9
Start Time:       Sun, 27 Oct 2024 16:22:33 +0000
Labels:           name=busybox-pod
                  pod-template-hash=649fb4c7c
Annotations:      <none>
Status:           Pending
IP:               10.42.0.10
IPs:
  IP:           10.42.0.10
Controlled By:  ReplicaSet/frontend-deployment-649fb4c7c
Containers:
  busybox-container:
    Container ID:  
    Image:         busybox888
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
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-8ccn4 (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-8ccn4:
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
  Normal   Scheduled  4m31s                  default-scheduler  Successfully assigned default/frontend-deployment-649fb4c7c-62nt8 to controlplane
  Normal   Pulling    2m57s (x4 over 4m30s)  kubelet            Pulling image "busybox888"
  Warning  Failed     2m56s (x4 over 4m30s)  kubelet            Failed to pull image "busybox888": failed to pull and unpack image "docker.io/library/busybox888:latest": failed to resolve reference "docker.io/library/busybox888:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     2m56s (x4 over 4m30s)  kubelet            Error: ErrImagePull
  Warning  Failed     2m46s (x6 over 4m29s)  kubelet            Error: ImagePullBackOff
  Normal   BackOff    2m31s (x7 over 4m29s)  kubelet            Back-off pulling image "busybox888"


Name:             frontend-deployment-649fb4c7c-9x7fq
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.23.84.9
Start Time:       Sun, 27 Oct 2024 16:22:33 +0000
Labels:           name=busybox-pod
                  pod-template-hash=649fb4c7c
Annotations:      <none>
Status:           Pending
IP:               10.42.0.11
IPs:
  IP:           10.42.0.11
Controlled By:  ReplicaSet/frontend-deployment-649fb4c7c
Containers:
  busybox-container:
    Container ID:  
    Image:         busybox888
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
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-bbmzx (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-bbmzx:
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
  Normal   Scheduled  4m31s                  default-scheduler  Successfully assigned default/frontend-deployment-649fb4c7c-9x7fq to controlplane
  Normal   Pulling    3m1s (x4 over 4m30s)   kubelet            Pulling image "busybox888"
  Warning  Failed     3m (x4 over 4m30s)     kubelet            Failed to pull image "busybox888": failed to pull and unpack image "docker.io/library/busybox888:latest": failed to resolve reference "docker.io/library/busybox888:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     3m (x4 over 4m30s)     kubelet            Error: ErrImagePull
  Warning  Failed     2m49s (x6 over 4m29s)  kubelet            Error: ImagePullBackOff
  Normal   BackOff    2m34s (x7 over 4m29s)  kubelet            Back-off pulling image "busybox888"


Name:             frontend-deployment-649fb4c7c-dvvsf
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.23.84.9
Start Time:       Sun, 27 Oct 2024 16:22:33 +0000
Labels:           name=busybox-pod
                  pod-template-hash=649fb4c7c
Annotations:      <none>
Status:           Pending
IP:               10.42.0.12
IPs:
  IP:           10.42.0.12
Controlled By:  ReplicaSet/frontend-deployment-649fb4c7c
Containers:
  busybox-container:
    Container ID:  
    Image:         busybox888
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
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-n445k (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-n445k:
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
  Normal   Scheduled  4m31s                  default-scheduler  Successfully assigned default/frontend-deployment-649fb4c7c-dvvsf to controlplane
  Normal   Pulling    3m7s (x4 over 4m30s)   kubelet            Pulling image "busybox888"
  Warning  Failed     3m6s (x4 over 4m30s)   kubelet            Failed to pull image "busybox888": failed to pull and unpack image "docker.io/library/busybox888:latest": failed to resolve reference "docker.io/library/busybox888:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     3m6s (x4 over 4m30s)   kubelet            Error: ErrImagePull
  Warning  Failed     2m39s (x6 over 4m29s)  kubelet            Error: ImagePullBackOff
  Normal   BackOff    2m27s (x7 over 4m29s)  kubelet            Back-off pulling image "busybox888"


Name:             frontend-deployment-649fb4c7c-mtcvj
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.23.84.9
Start Time:       Sun, 27 Oct 2024 16:22:33 +0000
Labels:           name=busybox-pod
                  pod-template-hash=649fb4c7c
Annotations:      <none>
Status:           Pending
IP:               10.42.0.9
IPs:
  IP:           10.42.0.9
Controlled By:  ReplicaSet/frontend-deployment-649fb4c7c
Containers:
  busybox-container:
    Container ID:  
    Image:         busybox888
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
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-j8fdh (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-j8fdh:
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
  Normal   Scheduled  4m31s                  default-scheduler  Successfully assigned default/frontend-deployment-649fb4c7c-mtcvj to controlplane
  Normal   Pulling    3m9s (x4 over 4m30s)   kubelet            Pulling image "busybox888"
  Warning  Failed     3m8s (x4 over 4m30s)   kubelet            Failed to pull image "busybox888": failed to pull and unpack image "docker.io/library/busybox888:latest": failed to resolve reference "docker.io/library/busybox888:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     3m8s (x4 over 4m30s)   kubelet            Error: ErrImagePull
  Warning  Failed     2m43s (x6 over 4m29s)  kubelet            Error: ImagePullBackOff
  Normal   BackOff    2m32s (x7 over 4m29s)  kubelet            Back-off pulling image "busybox888"
```

## A8: BUSYBOX888

<br>

# Q9: Why do you think the deployment is not ready?
```bash
kubectl describe pods
```

```
Name:             frontend-deployment-649fb4c7c-62nt8
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.23.84.9
Start Time:       Sun, 27 Oct 2024 16:22:33 +0000
Labels:           name=busybox-pod
                  pod-template-hash=649fb4c7c
Annotations:      <none>
Status:           Pending
IP:               10.42.0.10
IPs:
  IP:           10.42.0.10
Controlled By:  ReplicaSet/frontend-deployment-649fb4c7c
Containers:
  busybox-container:
    Container ID:  
    Image:         busybox888
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
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-8ccn4 (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-8ccn4:
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
  Normal   Scheduled  4m31s                  default-scheduler  Successfully assigned default/frontend-deployment-649fb4c7c-62nt8 to controlplane
  Normal   Pulling    2m57s (x4 over 4m30s)  kubelet            Pulling image "busybox888"
  Warning  Failed     2m56s (x4 over 4m30s)  kubelet            Failed to pull image "busybox888": failed to pull and unpack image "docker.io/library/busybox888:latest": failed to resolve reference "docker.io/library/busybox888:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     2m56s (x4 over 4m30s)  kubelet            Error: ErrImagePull
  Warning  Failed     2m46s (x6 over 4m29s)  kubelet            Error: ImagePullBackOff
  Normal   BackOff    2m31s (x7 over 4m29s)  kubelet            Back-off pulling image "busybox888"


Name:             frontend-deployment-649fb4c7c-9x7fq
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.23.84.9
Start Time:       Sun, 27 Oct 2024 16:22:33 +0000
Labels:           name=busybox-pod
                  pod-template-hash=649fb4c7c
Annotations:      <none>
Status:           Pending
IP:               10.42.0.11
IPs:
  IP:           10.42.0.11
Controlled By:  ReplicaSet/frontend-deployment-649fb4c7c
Containers:
  busybox-container:
    Container ID:  
    Image:         busybox888
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
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-bbmzx (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-bbmzx:
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
  Normal   Scheduled  4m31s                  default-scheduler  Successfully assigned default/frontend-deployment-649fb4c7c-9x7fq to controlplane
  Normal   Pulling    3m1s (x4 over 4m30s)   kubelet            Pulling image "busybox888"
  Warning  Failed     3m (x4 over 4m30s)     kubelet            Failed to pull image "busybox888": failed to pull and unpack image "docker.io/library/busybox888:latest": failed to resolve reference "docker.io/library/busybox888:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     3m (x4 over 4m30s)     kubelet            Error: ErrImagePull
  Warning  Failed     2m49s (x6 over 4m29s)  kubelet            Error: ImagePullBackOff
  Normal   BackOff    2m34s (x7 over 4m29s)  kubelet            Back-off pulling image "busybox888"


Name:             frontend-deployment-649fb4c7c-dvvsf
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.23.84.9
Start Time:       Sun, 27 Oct 2024 16:22:33 +0000
Labels:           name=busybox-pod
                  pod-template-hash=649fb4c7c
Annotations:      <none>
Status:           Pending
IP:               10.42.0.12
IPs:
  IP:           10.42.0.12
Controlled By:  ReplicaSet/frontend-deployment-649fb4c7c
Containers:
  busybox-container:
    Container ID:  
    Image:         busybox888
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
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-n445k (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-n445k:
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
  Normal   Scheduled  4m31s                  default-scheduler  Successfully assigned default/frontend-deployment-649fb4c7c-dvvsf to controlplane
  Normal   Pulling    3m7s (x4 over 4m30s)   kubelet            Pulling image "busybox888"
  Warning  Failed     3m6s (x4 over 4m30s)   kubelet            Failed to pull image "busybox888": failed to pull and unpack image "docker.io/library/busybox888:latest": failed to resolve reference "docker.io/library/busybox888:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     3m6s (x4 over 4m30s)   kubelet            Error: ErrImagePull
  Warning  Failed     2m39s (x6 over 4m29s)  kubelet            Error: ImagePullBackOff
  Normal   BackOff    2m27s (x7 over 4m29s)  kubelet            Back-off pulling image "busybox888"


Name:             frontend-deployment-649fb4c7c-mtcvj
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.23.84.9
Start Time:       Sun, 27 Oct 2024 16:22:33 +0000
Labels:           name=busybox-pod
                  pod-template-hash=649fb4c7c
Annotations:      <none>
Status:           Pending
IP:               10.42.0.9
IPs:
  IP:           10.42.0.9
Controlled By:  ReplicaSet/frontend-deployment-649fb4c7c
Containers:
  busybox-container:
    Container ID:  
    Image:         busybox888
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
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-j8fdh (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-j8fdh:
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
  Normal   Scheduled  4m31s                  default-scheduler  Successfully assigned default/frontend-deployment-649fb4c7c-mtcvj to controlplane
  Normal   Pulling    3m9s (x4 over 4m30s)   kubelet            Pulling image "busybox888"
  Warning  Failed     3m8s (x4 over 4m30s)   kubelet            Failed to pull image "busybox888": failed to pull and unpack image "docker.io/library/busybox888:latest": failed to resolve reference "docker.io/library/busybox888:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     3m8s (x4 over 4m30s)   kubelet            Error: ErrImagePull
  Warning  Failed     2m43s (x6 over 4m29s)  kubelet            Error: ImagePullBackOff
  Normal   BackOff    2m32s (x7 over 4m29s)  kubelet            Back-off pulling image "busybox888"
```

```
Failed to pull image "busybox888": failed to pull and unpack image "docker.io/library/busybox888:latest": failed to resolve reference "docker.io/library/busybox888:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
```

## A9: The image BUSYBOX888 does not exist

<br>

# Q10: Create a new Deployment using the deployment-definition-1.yaml file located in /root/ 
- There is an issue with the file, so try to fix it

## A10:
```
vi deployment-definition-1.yaml
```
```YAML
---
apiVersion: apps/v1
kind: deployment
metadata:
  name: deployment-1
spec:
  replicas: 2
  selector:
    matchLabels:
      name: busybox-pod
  template:
    metadata:
      labels:
        name: busybox-pod
    spec:
      containers:
      - name: busybox-container
        image: busybox888
        command:
        - sh
        - "-c"
        - echo Hello Kubernetes! && sleep 3600
```

<br>

Issue: Under spec, containers field, the image is set to be busybox888, thus have to correct this to busybox + also, kind states deployment, and it should be capitalised

<br>

- Tip:
```bash
kubectl explain deployment
```  
Using this command, one can easily check the syntax error 

<br>

Fixed:
```YAML
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-1
spec:
  replicas: 2
  selector:
    matchLabels:
      name: busybox-pod
  template:
    metadata:
      labels:
        name: busybox-pod
    spec:
      containers:
      - name: busybox-container
        image: busybox
        command:
        - sh
        - "-c"
        - echo Hello Kubernetes! && sleep 3600
```
```bash
kubectl create -f /root/deployment-definition-1.yaml
```

<br>

# Q11: Create a new Deployment with the below attributes using your own deployment definition file
- Name: httpd-frontend;
- Replicas: 3;
- Image: httpd:2.4-alpine

<br>

## A11:
```bash
vi deployment-definition-2.yaml
```
```YAML
apiVersion: apps/v1
kind: Deployment
metadata:
  name: httpd-frontend
spec:
  replicas: 3
  selector:
    matchLabels:
      name: httpd-frontend
  template:
    metadata:
      labels:
        name: httpd-frontend
    spec:
      containers:
      - name: httpd-frontend
        image: httpd:2.4-alpine
```
```bash
kubectl create -f /root/deployment-definition-2.yaml
```
