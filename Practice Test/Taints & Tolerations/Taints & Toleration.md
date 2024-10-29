# Q1: How many `nodes` exist on the system?
Including the `controlplane` node.
```bash
kubectl get nodes
```
| NAME          | STATUS | ROLES          | AGE   | VERSION |
|---------------|--------|----------------|-------|---------|
| controlplane  | Ready  | control-plane  | 7m53s | v1.31.0 |
| node01        | Ready  | `<none>`       | 7m12s | v1.31.0 |

## A1: 2

<br>

# Q2: Do any taints exist on node01 node?
```bash
kubectl describe node node01 | grep -i taints
```
```
Taints:             <none>
```
## A2: No

<br>

# Q3: Create a taint on node01 with key of spray, value of mortein and effect of NoSchedule
## A3:
```bash
kubectl taint nodes node01 spray=mortein:NoSchedule
```

<br>

# Q4: Create a new pod with the nginx image and pod name as mosquito.
## A4:
```bash
kubectl run mosquito --image=nginx
```

<br>

# Q5: What is the state of the POD?
```bash
kubectl get pods
```
| NAME     | READY | STATUS  | RESTARTS | AGE |
|----------|-------|---------|----------|-----|
| mosquito | 0/1   | Pending | 0        | 37s |

## A5: Pending

<br>

# Q6: Why do you think the pod is in a pending state?
```bash
kubectl describe pods
```
```
Name:             mosquito
Namespace:        default
Priority:         0
Service Account:  default
Node:             <none>
Labels:           run=mosquito
Annotations:      <none>
Status:           Pending
IP:               
IPs:              <none>
Containers:
  mosquito:
    Image:        nginx
    Port:         <none>
    Host Port:    <none>
    Environment:  <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-kkpwd (ro)
Conditions:
  Type           Status
  PodScheduled   False 
Volumes:
  kube-api-access-kkpwd:
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
  Type     Reason            Age   From               Message
  ----     ------            ----  ----               -------
  Warning  FailedScheduling  93s   default-scheduler  0/2 nodes are available: 1 node(s) had untolerated taint {node-role.kubernetes.io/control-plane: }, 1 node(s) had untolerated taint {spray: mortein}. preemption: 0/2 nodes are available: 2 Preemption is not helpful for scheduling.
```
```
Warning  FailedScheduling  93s   default-scheduler  0/2 nodes are available: 1 node(s) had untolerated taint {node-role.kubernetes.io/control-plane: }, 1 node(s) had untolerated taint {spray: mortein}. preemption: 0/2 nodes are available: 2 Preemption is not helpful for scheduling.
```
## A6: POD Mosquito can not tolerate taint Mortein

<br>

# Q7: Create another pod named bee with the nginx image, which has a toleration set to the taint mortein.
## A7:
```bash
vi bee.yaml
```
```YAML
---
apiVersion: v1
kind: Pod
metadata:
  name: bee
spec:
  containers:
  - image: nginx
    name: bee
  tolerations:
  - key: spray
    value: mortein
    effect: NoSchedule
    operator: Equal
```
```bash
kubectl create -f bee.yaml
```

<br>

# Q8: ℹ️ Notice the bee pod was scheduled on node node01 despite the taint.
## A8: OK

<br>

# Q9: Do you see any taints on controlplane node?
```bash
kubectl describe node controlplane | grep -i taints
```
## A9: Yes - NoSchedule

<br>

# Q10: Remove the taint on controlplane, which currently has the taint effect of NoSchedule.
## A10: 
```bash
kubectl taint nodes controlplane node-role.kubernetes.io/control-plane:NoSchedule-
```

<br>

# Q11: What is the state of the pod mosquito now?
```bash
kubectl get pods mosquito
```
| NAME     | READY | STATUS  | RESTARTS | AGE   |
|----------|-------|---------|----------|-------|
| mosquito | 1/1   | Running | 0        | 9m47s |

## A11: Running

<br>

# Q12: Which node is the POD mosquito on now?
```bash
kubectl describe pods mosquito
```
```
Name:             mosquito
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.33.66.3
Start Time:       Mon, 28 Oct 2024 18:45:31 +0000
Labels:           run=mosquito
Annotations:      <none>
Status:           Running
IP:               10.244.0.4
IPs:
  IP:  10.244.0.4
Containers:
  mosquito:
    Container ID:   containerd://0e05d40f10723b9467711b16a905a5f116752fbfc58eae5a2451fbda324c1edd
    Image:          nginx
    Image ID:       docker.io/library/nginx@sha256:28402db69fec7c17e179ea87882667f1e054391138f77ffaf0c3eb388efc3ffb
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Mon, 28 Oct 2024 18:45:40 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-kkpwd (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  kube-api-access-kkpwd:
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
  Type     Reason            Age                  From               Message
  ----     ------            ----                 ----               -------
  Warning  FailedScheduling  5m17s (x2 over 10m)  default-scheduler  0/2 nodes are available: 1 node(s) had untolerated taint {node-role.kubernetes.io/control-plane: }, 1 node(s) had untolerated taint {spray: mortein}. preemption: 0/2 nodes are available: 2 Preemption is not helpful for scheduling.
  Normal   Scheduled         104s                 default-scheduler  Successfully assigned default/mosquito to controlplane
  Normal   Pulling           103s                 kubelet            Pulling image "nginx"
  Normal   Pulled            96s                  kubelet            Successfully pulled image "nginx" in 7.122s (7.122s including waiting). Image size: 72950530 bytes.
  Normal   Created           96s                  kubelet            Created container mosquito
  Normal   Started           95s                  kubelet            Started container mosquito
```
## A12: conrolplane

