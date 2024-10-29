# Q1: A pod called `rabbit` is deployed. Identify the CPU requirements set on the Pod in the current(default) namespace
```bash
kubectl describe pod rabbit
```
```
Name:             rabbit
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.37.231.6
Start Time:       Mon, 28 Oct 2024 20:10:00 +0000
Labels:           <none>
Annotations:      <none>
Status:           Running
IP:               10.42.0.9
IPs:
  IP:  10.42.0.9
Containers:
  cpu-stress:
    Container ID:  containerd://d7811cadb4c03aad6d1497c68c17f58059fd2804bc58b40b6e53859314c28c66
    Image:         ubuntu
    Image ID:      docker.io/library/ubuntu@sha256:99c35190e22d294cdace2783ac55effc69d32896daaa265f0bbedbcde4fbe3e5
    Port:          <none>
    Host Port:     <none>
    Args:
      sleep
      1000
    State:          Running
      Started:      Mon, 28 Oct 2024 20:10:03 +0000
    Ready:          True
    Restart Count:  0
    Limits:
      cpu:  1
    Requests:
      cpu:        500m
    Environment:  <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-q4jhk (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  kube-api-access-q4jhk:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   Burstable
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  11m   default-scheduler  Successfully assigned default/rabbit to controlplane
  Normal  Pulling    11m   kubelet            Pulling image "ubuntu"
  Normal  Pulled     11m   kubelet            Successfully pulled image "ubuntu" in 2.414s (2.414s including waiting). Image size: 29759772 bytes.
  Normal  Created    11m   kubelet            Created container cpu-stress
  Normal  Started    11m   kubelet            Started container cpu-stress
```

## A1: 0.5(500m)

<br>

# Q2: Delete the `rabbit` Pod.
Once deleted, wait for the pod to fully terminate.

## A2: 
```bash
kubectl delete pod rabbit
```

<br>

# Q3: Another pod called elephant has been deployed in the default namespace. It fails to get to a running state. Inspect this pod and identify the Reason why it is not running.
## A3:
```bash
kubectl describe pod elephant
```
```
Name:             elephant
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.37.231.6
Start Time:       Mon, 28 Oct 2024 20:24:15 +0000
Labels:           <none>
Annotations:      <none>
Status:           Running
IP:               10.42.0.10
IPs:
  IP:  10.42.0.10
Containers:
  mem-stress:
    Container ID:  containerd://49b90a7771b5654d55161ef9b5c5764ee5d55001ca732dbb0e9580e92245f5a4
    Image:         polinux/stress
    Image ID:      docker.io/polinux/stress@sha256:b6144f84f9c15dac80deb48d3a646b55c7043ab1d83ea0a697c09097aaad21aa
    Port:          <none>
    Host Port:     <none>
    Command:
      stress
    Args:
      --vm
      1
      --vm-bytes
      15M
      --vm-hang
      1
    State:          Terminated
      Reason:       OOMKilled
      Exit Code:    1
      Started:      Mon, 28 Oct 2024 20:25:05 +0000
      Finished:     Mon, 28 Oct 2024 20:25:05 +0000
    Last State:     Terminated
      Reason:       OOMKilled
      Exit Code:    1
      Started:      Mon, 28 Oct 2024 20:24:39 +0000
      Finished:     Mon, 28 Oct 2024 20:24:39 +0000
    Ready:          False
    Restart Count:  3
    Limits:
      memory:  10Mi
    Requests:
      memory:     5Mi
    Environment:  <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-g8qb8 (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-g8qb8:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   Burstable
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                From               Message
  ----     ------     ----               ----               -------
  Normal   Scheduled  59s                default-scheduler  Successfully assigned default/elephant to controlplane
  Normal   Pulled     55s                kubelet            Successfully pulled image "polinux/stress" in 4.452s (4.452s including waiting). Image size: 4041495 bytes.
  Normal   Pulled     53s                kubelet            Successfully pulled image "polinux/stress" in 189ms (189ms including waiting). Image size: 4041495 bytes.
  Normal   Pulled     36s                kubelet            Successfully pulled image "polinux/stress" in 151ms (151ms including waiting). Image size: 4041495 bytes.
  Normal   Pulling    10s (x4 over 59s)  kubelet            Pulling image "polinux/stress"
  Normal   Created    10s (x4 over 55s)  kubelet            Created container mem-stress
  Normal   Started    10s (x4 over 54s)  kubelet            Started container mem-stress
  Normal   Pulled     10s                kubelet            Successfully pulled image "polinux/stress" in 140ms (140ms including waiting). Image size: 4041495 bytes.
  Warning  BackOff    9s (x5 over 52s)   kubelet            Back-off restarting failed container mem-stress in pod elephant_default(e769fbed-5770-4c4d-96a4-4ed4b2a69cbe)
```

## A3: OOMKilled

<br>

# Q4: ℹ️ The status OOMKilled indicates that it is failing because the pod ran out of memory. Identify the memory limit set on the POD.
## A4: OK

<br>

# Q5: The `elephant` pod runs a process that consumes 15Mi of memory. Increase the limit of the `elephant` pod to 20Mi.
Delete and recreate the pod if required. Do not modify anything other than the required fields.
## A5:
```bash
kubectl get po elephant -o yaml > elephant.yaml
```
```bash
vi elephant.yaml
```
```YAML
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: "2024-10-28T20:24:15Z"
  name: elephant
  namespace: default
  resourceVersion: "1228"
  uid: e769fbed-5770-4c4d-96a4-4ed4b2a69cbe
spec:
  containers:
  - args:
    - --vm
    - "1"
    - --vm-bytes
    - 15M
    - --vm-hang
    - "1"
    command:
    - stress
    image: polinux/stress
    imagePullPolicy: Always
    name: mem-stress
    resources:
      limits:
        memory: 20Mi
      requests:
        memory: 5Mi
    terminationMessagePath: /dev/termination-log
    terminationMessagePolicy: File
    volumeMounts:
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-g8qb8
      readOnly: true
  dnsPolicy: ClusterFirst
  enableServiceLinks: true
  nodeName: controlplane
  preemptionPolicy: PreemptLowerPriority
  priority: 0

```
```bash
kubectl replace -f elephant.yaml --force
```

# Q6: ℹ️ Inspect the status of POD. Make sure it's running
```bash
kubectl get pods
```
| NAME     | READY | STATUS  | RESTARTS | AGE |
|----------|-------|---------|----------|-----|
| elephant | 1/1   | Running | 0        | 48s |

## A6: OK

<br>

# Q7: Delete the `elephant` Pod.
Once deleted, wait for the pod to fully terminate.

## A7: 
```bash
kubectl delete pod elephant
```

