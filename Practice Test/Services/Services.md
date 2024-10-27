# Q1: How many Services exist on the system in the default namespace?
```bash
kubectl get service
```
| NAME       | TYPE       | CLUSTER-IP | EXTERNAL-IP | PORT(S) | AGE |
|------------|------------|------------|-------------|---------|-----|
| kubernetes | ClusterIP  | 10.43.0.1  | <none>      | 443/TCP | 20m |

## A1: 1

<br>

# Q2: ℹ️ That is a default service created by Kubernetes at launch

<br>

# Q3: What is the type of the default kubernetes service?

## A3: ClusterIP

<br>

# Q4: What is the targetPort configured on the kubernetes service?
```bash
kubectl describe service kubernetes
```
```
Name:                     kubernetes
Namespace:                default
Labels:                   component=apiserver
                          provider=kubernetes
Annotations:              <none>
Selector:                 <none>
Type:                     ClusterIP
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.43.0.1
IPs:                      10.43.0.1
Port:                     https  443/TCP
TargetPort:               6443/TCP
Endpoints:                192.30.72.6:6443
Session Affinity:         None
Internal Traffic Policy:  Cluster
Events:                   <none>
```
## A4: 6443

<br>

# Q5: How many labels are configured on the kubernetes service?
```bash
kubectl describe service kuternetes
```
```
Name:                     kubernetes
Namespace:                default
Labels:                   component=apiserver
                          provider=kubernetes
Annotations:              <none>
Selector:                 <none>
Type:                     ClusterIP
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.43.0.1
IPs:                      10.43.0.1
Port:                     https  443/TCP
TargetPort:               6443/TCP
Endpoints:                192.30.72.6:6443
Session Affinity:         None
Internal Traffic Policy:  Cluster
Events:                   <none>
```

<br>

```
Labels:                   component=apiserver
                          provider=kubernetes
```

## A5: 2

<br>

# Q6: How many Endpoints are attached on the kubernetes service?
```bash
kubectl describe service kuternetes
```
```
Name:                     kubernetes
Namespace:                default
Labels:                   component=apiserver
                          provider=kubernetes
Annotations:              <none>
Selector:                 <none>
Type:                     ClusterIP
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.43.0.1
IPs:                      10.43.0.1
Port:                     https  443/TCP
TargetPort:               6443/TCP
Endpoints:                192.30.72.6:6443
Session Affinity:         None
Internal Traffic Policy:  Cluster
Events:                   <none>
```
<br>

```
Endpoints:                192.30.72.6:6443
```

## A6: 1

<br>

# Q7: How many Deployments exist on the system now in the default namespace?
```bash
kubectl get deployment
```

| NAME                      | READY | UP-TO-DATE | AVAILABLE | AGE |
|---------------------------|-------|------------|-----------|-----|
| simple-webapp-deployment  | 4/4   | 4          | 4         | 30s |

## A7: 1

<br>

# Q8: What is the image used to create the pods in the deployment?
```bash
kubectl describe pods
```
```
Name:             simple-webapp-deployment-646b7d6cd4-cvh77
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.30.72.6
Start Time:       Sun, 27 Oct 2024 21:46:32 +0000
Labels:           name=simple-webapp
                  pod-template-hash=646b7d6cd4
Annotations:      <none>
Status:           Running
IP:               10.42.0.10
IPs:
  IP:           10.42.0.10
Controlled By:  ReplicaSet/simple-webapp-deployment-646b7d6cd4
Containers:
  simple-webapp:
    Container ID:   containerd://b820a27235c39a590ec36155a3e0bc91ad67786d4d285ecc73184ffc5d6b60fc
    Image:          kodekloud/simple-webapp:red
    Image ID:       docker.io/kodekloud/simple-webapp@sha256:175ba08b8986076df14c40db45c4cc1fbbb16ffff031a646d6bc98f20fb5d902
    Port:           8080/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Sun, 27 Oct 2024 21:46:39 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-cqtcp (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  kube-api-access-cqtcp:
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
  Normal  Scheduled  71s   default-scheduler  Successfully assigned default/simple-webapp-deployment-646b7d6cd4-cvh77 to controlplane
  Normal  Pulling    67s   kubelet            Pulling image "kodekloud/simple-webapp:red"
  Normal  Pulled     64s   kubelet            Successfully pulled image "kodekloud/simple-webapp:red" in 2.931s (2.931s including waiting). Image size: 31739558 bytes.
  Normal  Created    64s   kubelet            Created container simple-webapp
  Normal  Started    64s   kubelet            Started container simple-webapp


Name:             simple-webapp-deployment-646b7d6cd4-mt579
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.30.72.6
Start Time:       Sun, 27 Oct 2024 21:46:32 +0000
Labels:           name=simple-webapp
                  pod-template-hash=646b7d6cd4
Annotations:      <none>
Status:           Running
IP:               10.42.0.9
IPs:
  IP:           10.42.0.9
Controlled By:  ReplicaSet/simple-webapp-deployment-646b7d6cd4
Containers:
  simple-webapp:
    Container ID:   containerd://d51c2029467cd82e88bd2c5eb58a1f30c7f936c3076f149086e575151306e665
    Image:          kodekloud/simple-webapp:red
    Image ID:       docker.io/kodekloud/simple-webapp@sha256:175ba08b8986076df14c40db45c4cc1fbbb16ffff031a646d6bc98f20fb5d902
    Port:           8080/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Sun, 27 Oct 2024 21:46:39 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-xzxgs (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  kube-api-access-xzxgs:
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
  Normal  Scheduled  71s   default-scheduler  Successfully assigned default/simple-webapp-deployment-646b7d6cd4-mt579 to controlplane
  Normal  Pulling    68s   kubelet            Pulling image "kodekloud/simple-webapp:red"
  Normal  Pulled     64s   kubelet            Successfully pulled image "kodekloud/simple-webapp:red" in 3.107s (3.107s including waiting). Image size: 31739558 bytes.
  Normal  Created    64s   kubelet            Created container simple-webapp
  Normal  Started    64s   kubelet            Started container simple-webapp


Name:             simple-webapp-deployment-646b7d6cd4-nzjzv
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.30.72.6
Start Time:       Sun, 27 Oct 2024 21:46:32 +0000
Labels:           name=simple-webapp
                  pod-template-hash=646b7d6cd4
Annotations:      <none>
Status:           Running
IP:               10.42.0.11
IPs:
  IP:           10.42.0.11
Controlled By:  ReplicaSet/simple-webapp-deployment-646b7d6cd4
Containers:
  simple-webapp:
    Container ID:   containerd://0b3aea1c5655542457972373f00a440866a7fa9b0eaee6e00baba92eafdb0a54
    Image:          kodekloud/simple-webapp:red
    Image ID:       docker.io/kodekloud/simple-webapp@sha256:175ba08b8986076df14c40db45c4cc1fbbb16ffff031a646d6bc98f20fb5d902
    Port:           8080/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Sun, 27 Oct 2024 21:46:39 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-2ggpm (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  kube-api-access-2ggpm:
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
  Normal  Scheduled  71s   default-scheduler  Successfully assigned default/simple-webapp-deployment-646b7d6cd4-nzjzv to controlplane
  Normal  Pulling    67s   kubelet            Pulling image "kodekloud/simple-webapp:red"
  Normal  Pulled     64s   kubelet            Successfully pulled image "kodekloud/simple-webapp:red" in 3.01s (3.01s including waiting). Image size: 31739558 bytes.
  Normal  Created    64s   kubelet            Created container simple-webapp
  Normal  Started    64s   kubelet            Started container simple-webapp


Name:             simple-webapp-deployment-646b7d6cd4-pl2ls
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.30.72.6
Start Time:       Sun, 27 Oct 2024 21:46:32 +0000
Labels:           name=simple-webapp
                  pod-template-hash=646b7d6cd4
Annotations:      <none>
Status:           Running
IP:               10.42.0.12
IPs:
  IP:           10.42.0.12
Controlled By:  ReplicaSet/simple-webapp-deployment-646b7d6cd4
Containers:
  simple-webapp:
    Container ID:   containerd://8ea9ba4db10edfd4aeaccce90cb29ac579858f85636a1be7dbae657c73f3b626
    Image:          kodekloud/simple-webapp:red
    Image ID:       docker.io/kodekloud/simple-webapp@sha256:175ba08b8986076df14c40db45c4cc1fbbb16ffff031a646d6bc98f20fb5d902
    Port:           8080/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Sun, 27 Oct 2024 21:46:39 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-x9tnf (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  kube-api-access-x9tnf:
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
  Normal  Scheduled  71s   default-scheduler  Successfully assigned default/simple-webapp-deployment-646b7d6cd4-pl2ls to controlplane
  Normal  Pulling    67s   kubelet            Pulling image "kodekloud/simple-webapp:red"
  Normal  Pulled     64s   kubelet            Successfully pulled image "kodekloud/simple-webapp:red" in 3.022s (3.022s including waiting). Image size: 31739558 bytes.
  Normal  Created    64s   kubelet            Created container simple-webapp
  Normal  Started    64s   kubelet            Started container simple-webapp
```

## A8: kodeckloud/simple-webapp:red

<br>

# Q9: Are you able to accesss the Web App UI?
- Try to access the Web Application UI using the tab `simple-webapp-ui` above the terminal.

<br>

# 502 Bad Gateway
nginx/1.27.0

<br>

## A9: No

<br>

# Q10: Create a new service to access the web application using the service-definition-1.yaml file.
- `Name:` webapp-service
- `Type:` NodePort
- `targetPort:` 8080
- `port:` 8080
- `nodePort:` 30080
- `selector:`
- `name:` simple-webapp

## A10:
```bash
vi service-definition-1.yaml
```
```YAML
---
apiVersion: v1
kind: Service
metadata:
  name: webapp-service
  namespace: default
spec:
  ports:
  - nodePort: 30080
    port: 8080
    targetPort: 8080
  selector:
    name: simple-webapp
  type: NodePort
```

<br>

```bash
kubectl create -f srvice-definition-1.yaml
```

<br>

# Q11: Access the web application using the tab simple-webapp-ui above the terminal window.

```
Hello from simple-webapp-deployment-646b7d6cd4-nzjzv!
```

## A11: OK

