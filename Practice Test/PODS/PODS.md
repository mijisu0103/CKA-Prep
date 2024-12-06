# Q1: How many ppods exist on the system in the default namespace?  

```shell
kubectl get pods
# No resources found in default namespace.
```

## A1: 0   

<br>

# Q2: Create a new pod with the nginx image

## A2: 
```shell
kubectl run nginx --image=nginx
```

<br>

# Q3: How many pods are created now?
```shell
kubectl get pods
```

```shell
NAME            READY   STATUS    RESTARTS   AGE
newpods-2qvc5   1/1     Running   0          6m59s
newpods-cwv62   1/1     Running   0          6m59s
newpods-twfkm   1/1     Running   0          6m59s
nginx           1/1     Running   0          68s
```

## A3: 4

<br>

# Q4: What is the image used to create the new pods?
```shell
kubectl describe pods newpods
```

```YAML
Name:             newpods-2qvc5
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.26.242.9
Start Time:       Sat, 26 Oct 2024 20:18:13 +0000
Labels:           tier=busybox
Annotations:      <none>
Status:           Running
IP:               10.42.0.11
IPs:
  IP:           10.42.0.11
Controlled By:  ReplicaSet/newpods
Containers:
  busybox:
    Container ID:  containerd://21cf242b4c738c3e6e8f1f0b4044120a5e409f944c5e818e8eb1ddf53ecd5517
    Image:         busybox
    Image ID:      docker.io/library/busybox@sha256:768e5c6f5cb6db0794eec98dc7a967f40631746c32232b78a3105fb946f3ab83
    Port:          <none>
    Host Port:     <none>
    Command:
      sleep
      1000
    State:          Running
      Started:      Sat, 26 Oct 2024 20:18:14 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-wps4q (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  kube-api-access-wps4q:
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
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  10m   default-scheduler  Successfully assigned default/newpods-2qvc5 to controlplane
  Normal  Pulling    10m   kubelet            Pulling image "busybox"
  Normal  Pulled     10m   kubelet            Successfully pulled image "busybox" in 289ms (289ms including waiting). Image size: 2166802 bytes.
  Normal  Created    10m   kubelet            Created container busybox
  Normal  Started    10m   kubelet            Started container busybox

Name:             newpods-cwv62
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.26.242.9
Start Time:       Sat, 26 Oct 2024 20:18:13 +0000
Labels:           tier=busybox
Annotations:      <none>
Status:           Running
IP:               10.42.0.9
IPs:
  IP:           10.42.0.9
Controlled By:  ReplicaSet/newpods
Containers:
  busybox:
    Container ID:  containerd://658c155d0e9c4dab9bcfb509fd538f946113b9d2a67feb549f0ce396cdc489e6
    Image:         busybox
    Image ID:      docker.io/library/busybox@sha256:768e5c6f5cb6db0794eec98dc7a967f40631746c32232b78a3105fb946f3ab83
    Port:          <none>
    Host Port:     <none>
    Command:
      sleep
      1000
    State:          Running
      Started:      Sat, 26 Oct 2024 20:18:14 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-j5hp6 (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  kube-api-access-j5hp6:
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
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  10m   default-scheduler  Successfully assigned default/newpods-cwv62 to controlplane
  Normal  Pulling    10m   kubelet            Pulling image "busybox"
  Normal  Pulled     10m   kubelet            Successfully pulled image "busybox" in 396ms (396ms including waiting). Image size: 2166802 bytes.
  Normal  Created    10m   kubelet            Created container busybox
  Normal  Started    10m   kubelet            Started container busybox

Name:             newpods-twfkm
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.26.242.9
Start Time:       Sat, 26 Oct 2024 20:18:13 +0000
Labels:           tier=busybox
Annotations:      <none>
Status:           Running
IP:               10.42.0.10
IPs:
  IP:           10.42.0.10
Controlled By:  ReplicaSet/newpods
Containers:
  busybox:
    Container ID:  containerd://4048ce4932354ead0e61e4b50ea53185e54cf35569a6606d4e96a8d91192a9b0
    Image:         busybox
    Image ID:      docker.io/library/busybox@sha256:768e5c6f5cb6db0794eec98dc7a967f40631746c32232b78a3105fb946f3ab83
    Port:          <none>
    Host Port:     <none>
    Command:
      sleep
      1000
    State:          Running
      Started:      Sat, 26 Oct 2024 20:18:14 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-bxpmz (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  kube-api-access-bxpmz:
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
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  10m   default-scheduler  Successfully assigned default/newpods-twfkm to controlplane
  Normal  Pulling    10m   kubelet            Pulling image "busybox"
  Normal  Pulled     10m   kubelet            Successfully pulled image "busybox" in 394ms (394ms including waiting). Image size: 2166802 bytes.
  Normal  Created    10m   kubelet            Created container busybox
  Normal  Started    10m   kubelet            Started container busybox
```
## A4: BUSYBOX

<br>

# Q5: Which nodes are these pods placed on?
```shell
kubectl describe pod newpoads-<id>
```
Then check the node field <br>

```shell
Node:    controlplane/192.26.242.9
```

Or:
```shell
kubectl get pods -o wide
```
```shell
NAME            READY   STATUS    RESTARTS   AGE     IP           NODE           NOMINATED NODE   READINESS GATES
newpods-2qvc5   1/1     Running   0          13m     10.42.0.11   controlplane   <none>           <none>
newpods-cwv62   1/1     Running   0          13m     10.42.0.9    controlplane   <none>           <none>
newpods-twfkm   1/1     Running   0          13m     10.42.0.10   controlplane   <none>           <none>
nginx           1/1     Running   0          7m52s   10.42.0.12   controlplane   <none>           <none>
``` 

## A5: controlplane

<br>

# Q6: How many containers are part of the pod webapp?
```shell
kubectl get pod webapp
```
```shell
NAME     READY   STATUS         RESTARTS   AGE
webapp   1/2     ErrImagePull   0          65s
```

## A6: 2

<br>

# Q7: What images are used in the new webapp pod?
```shell
kubectl describe pod webapp
```
```YAML
Name:             webapp
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.26.242.9
Start Time:       Sat, 26 Oct 2024 20:36:58 +0000
Labels:           <none>
Annotations:      <none>
Status:           Pending
IP:               10.42.0.13
IPs:
  IP:  10.42.0.13
Containers:
  nginx:
    Container ID:   containerd://92405d188e8e30c8c819b961ddb80fdf554b01371e54c73d4577a7d27ae94997
    Image:          nginx
    Image ID:       docker.io/library/nginx@sha256:28402db69fec7c17e179ea87882667f1e054391138f77ffaf0c3eb388efc3ffb
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Sat, 26 Oct 2024 20:36:59 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-g68zm (ro)
  agentx:
    Container ID:   
    Image:          agentx
    Image ID:       
    Port:           <none>
    Host Port:      <none>
    State:          Waiting
      Reason:       ImagePullBackOff
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-g68zm (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-g68zm:
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
  Type     Reason     Age                  From               Message
  ----     ------     ----                 ----               -------
  Normal   Scheduled  2m21s                default-scheduler  Successfully assigned default/webapp to controlplane
  Normal   Pulling    2m21s                kubelet            Pulling image "nginx"
  Normal   Pulled     2m21s                kubelet            Successfully pulled image "nginx" in 161ms (161ms including waiting). Image size: 72950530 bytes.
  Normal   Created    2m21s                kubelet            Created container nginx
  Normal   Started    2m21s                kubelet            Started container nginx
  Normal   Pulling    98s (x3 over 2m21s)  kubelet            Pulling image "agentx"
  Warning  Failed     98s (x3 over 2m20s)  kubelet            Failed to pull image "agentx": failed to pull and unpack image "docker.io/library/agentx:latest": failed to resolve reference "docker.io/library/agentx:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     98s (x3 over 2m20s)  kubelet            Error: ErrImagePull
  Normal   BackOff    61s (x6 over 2m20s)  kubelet            Back-off pulling image "agentx"
  Warning  Failed     61s (x6 over 2m20s)  kubelet            Error: ImagePullBackOff
```

Check image field under Containers section == Can see NGINX and AGENTX

## A7: NGINX & AGENTX

<br>

# Q8: What is the state of the container agentx in the pod webapp?
```shell
kubectl describe pod webapp
```
```YAML
Name:             webapp
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.26.242.9
Start Time:       Sat, 26 Oct 2024 20:36:58 +0000
Labels:           <none>
Annotations:      <none>
Status:           Pending
IP:               10.42.0.13
IPs:
  IP:  10.42.0.13
Containers:
  nginx:
    Container ID:   containerd://92405d188e8e30c8c819b961ddb80fdf554b01371e54c73d4577a7d27ae94997
    Image:          nginx
    Image ID:       docker.io/library/nginx@sha256:28402db69fec7c17e179ea87882667f1e054391138f77ffaf0c3eb388efc3ffb
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Sat, 26 Oct 2024 20:36:59 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-g68zm (ro)
  agentx:
    Container ID:   
    Image:          agentx
    Image ID:       
    Port:           <none>
    Host Port:      <none>
    State:          Waiting
      Reason:       ImagePullBackOff
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-g68zm (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-g68zm:
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
  Normal   Scheduled  6m30s                  default-scheduler  Successfully assigned default/webapp to controlplane
  Normal   Pulling    6m30s                  kubelet            Pulling image "nginx"
  Normal   Pulled     6m30s                  kubelet            Successfully pulled image "nginx" in 161ms (161ms including waiting). Image size: 72950530 bytes.
  Normal   Created    6m30s                  kubelet            Created container nginx
  Normal   Started    6m30s                  kubelet            Started container nginx
  Normal   Pulling    5m47s (x3 over 6m30s)  kubelet            Pulling image "agentx"
  Warning  Failed     5m47s (x3 over 6m29s)  kubelet            Failed to pull image "agentx": failed to pull and unpack image "docker.io/library/agentx:latest": failed to resolve reference "docker.io/library/agentx:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     5m47s (x3 over 6m29s)  kubelet            Error: ErrImagePull
  Warning  Failed     5m10s (x6 over 6m29s)  kubelet            Error: ImagePullBackOff
  Normal   BackOff    84s (x21 over 6m29s)   kubelet            Back-off pulling image "agentx"
```
## A8: Error or Waiting

<br>

# Q9: Why do you think the container agentx in the pod webapp is in error?
```shell
kubectl describe pod webapp
```
```YAML
Name:             webapp
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.26.242.9
Start Time:       Sat, 26 Oct 2024 20:36:58 +0000
Labels:           <none>
Annotations:      <none>
Status:           Pending
IP:               10.42.0.13
IPs:
  IP:  10.42.0.13
Containers:
  nginx:
    Container ID:   containerd://92405d188e8e30c8c819b961ddb80fdf554b01371e54c73d4577a7d27ae94997
    Image:          nginx
    Image ID:       docker.io/library/nginx@sha256:28402db69fec7c17e179ea87882667f1e054391138f77ffaf0c3eb388efc3ffb
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Sat, 26 Oct 2024 20:36:59 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-g68zm (ro)
  agentx:
    Container ID:   
    Image:          agentx
    Image ID:       
    Port:           <none>
    Host Port:      <none>
    State:          Waiting
      Reason:       ImagePullBackOff
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-g68zm (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-g68zm:
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
  Normal   Scheduled  8m33s                   default-scheduler  Successfully assigned default/webapp to controlplane
  Normal   Pulling    8m32s                   kubelet            Pulling image "nginx"
  Normal   Pulled     8m32s                   kubelet            Successfully pulled image "nginx" in 161ms (161ms including waiting). Image size: 72950530 bytes.
  Normal   Created    8m32s                   kubelet            Created container nginx
  Normal   Started    8m32s                   kubelet            Started container nginx
  Normal   Pulling    7m49s (x3 over 8m32s)   kubelet            Pulling image "agentx"
  Warning  Failed     7m49s (x3 over 8m31s)   kubelet            Failed to pull image "agentx": failed to pull and unpack image "docker.io/library/agentx:latest": failed to resolve reference "docker.io/library/agentx:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     7m49s (x3 over 8m31s)   kubelet            Error: ErrImagePull
  Warning  Failed     7m12s (x6 over 8m31s)   kubelet            Error: ImagePullBackOff
  Normal   BackOff    3m26s (x21 over 8m31s)  kubelet            Back-off pulling image "agentx"
```

```shell
failed to pull and unpack image "docker.io/library/agentx:latest": failed to resolve reference "docker.io/library/agentx:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
```

## A9: A Docker image with this name does not exist on Docker Hub

<br>

# Q10: What does the READY column in the output of the kubectl get pods command indicate?
```shell
kubectl get pods
```
```shell
NAME            READY   STATUS             RESTARTS      AGE
newpods-2qvc5   1/1     Running            1 (12m ago)   29m
newpods-cwv62   1/1     Running            1 (12m ago)   29m
newpods-twfkm   1/1     Running            1 (12m ago)   29m
nginx           1/1     Running            0             23m
webapp          1/2     ImagePullBackOff   0             10m
```

## A10: Running Containers in POD / Total Containers in POD

<br>

# Q11: Delete the webapp Pod

## A11:
```shell
kubectl delete pod webapp
kubectl get pods
```
```shell
NAME            READY   STATUS    RESTARTS      AGE
newpods-2qvc5   1/1     Running   1 (14m ago)   31m
newpods-cwv62   1/1     Running   1 (14m ago)   31m
newpods-twfkm   1/1     Running   1 (14m ago)   31m
nginx           1/1     Running   0             25m
```
<br>

# Q12: Create a new pod with the name redis and the image redis123
## Use a pod-definition YAML file

## A12: 
```shell
kubectl run redis --image=redis123 --dry-run=client -o yaml > redis-definition.yaml
kubectl create -f redis-definition.yaml
kubectl get pods
```
<br>

# Q13: Now change the image on this pod to redis
## A13:
```shell
kubectl edit pod redis
```
<br>

Press 'i' on the keyboard to enter INSERT mode then change image from redis123 to redis as shown below
```YAML
# Please edit the object below. Lines beginning with a '#' will be ignored,
# and an empty file will abort the edit. If an error occurs while saving this file will be
# reopened with the relevant failures.

apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: "2024-10-26T20:55:05Z"
  labels:
    run: redis
  name: redis
  namespace: default
  resourceVersion: "1847"
  uid: 5d93870d-a5e0-46a6-aa33-b17b352290a5
spec:
  containers:
  - image: redis
    imagePullPolicy: Always
    name: redis
    resources: {}
    terminationMessagePath: /dev/termination-log
    terminationMessagePolicy: File
    volumeMounts:
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-66b6t
      readOnly: true
  dnsPolicy: ClusterFirst
  enableServiceLinks: true
  nodeName: controlplane
  preemptionPolicy: PreemptLowerPriority
  priority: 0
  restartPolicy: Always
  schedulerName: default-scheduler
  securityContext: {}
  serviceAccount: default
  serviceAccountName: default
"/tmp/kubectl-edit-2002508901.yaml" 120L, 3375B
```
<br>

If kubectl edit command does not work to reflect the changes, then try to change it through vi editor:
```shell
vi redis-definition.yaml
```
```YAML
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: redis
  name: redis
spec:
  containers:
  - image: redis
    name: redis
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
```

<br>

Press ESC key then type :wq to save yaml file and exit the editor
```shell
kubectl apply -f redis-definition.yaml
```
<br>

Check pod running state:
```shell
kubectl get pod redis
```

```shell
NAME    READY   STATUS    RESTARTS       AGE
redis   1/1     Running   6 (4m5s ago)   14m
```

<br>


