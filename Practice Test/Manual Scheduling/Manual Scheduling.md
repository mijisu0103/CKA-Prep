# Q1: A pod definition file nginx.yaml is given. Create a pod using the file.
Only create the POD for now. We will inspect its status next.
## A1: 
```bash
kubectl create -f nginx.yaml
```

<br>

# Q2: What is the status of the created POD?
```bash
kubectl get pods
```

| NAME | READY | STATUS  | RESTARTS | AGE |
|------|-------|---------|----------|-----|
| nginx | 0/1   | Pending | 0        | 43s |


## A2: Pending

<br>


# Q3: Why is the POD in a pending state?
Inspect the environment for various kubernetes control plane components.
```bash
kubectl get pods --namespace kube-system
```
| NAME                                  | READY | STATUS  | RESTARTS | AGE   |
|---------------------------------------|-------|---------|----------|-------|
| coredns-77d6fd4654-65c5f              | 1/1   | Running | 0        | 7m14s |
| coredns-77d6fd4654-znstg              | 1/1   | Running | 0        | 7m14s |
| etcd-controlplane                     | 1/1   | Running | 0        | 7m19s |
| kube-apiserver-controlplane           | 1/1   | Running | 0        | 7m21s |
| kube-controller-manager-controlplane  | 1/1   | Running | 0        | 7m19s |
| kube-proxy-j5xd9                      | 1/1   | Running | 0        | 7m14s |
| kube-proxy-q9d4q                      | 1/1   | Running | 0        | 6m50s |

## A3: No Scheduler Present

<br>

# Q4: Manually schedule the pod on node01.
Delete and recreate the POD if necessary.
# A4:
```bash
kubectl delete po nginx
```
```bash
kubectl get nodes
```
| NAME          | STATUS | ROLES          | AGE   | VERSION |
|---------------|--------|----------------|-------|---------|
| controlplane  | Ready  | control-plane  | 9m57s | v1.31.0 |
| node01        | Ready  | `<none>`       | 9m24s | v1.31.0 |

```bash
vi nginx.yaml
```
```YAML
---
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  nodeName: node01 # Add nodeName
  containers:
  -  image: nginx
     name: nginx
```
```bash
kubectl create -f nginx.yaml
```
```bash
kubectl get pods -o wide
```
| NAME  | READY | STATUS  | RESTARTS | AGE  | IP          | NODE   | NOMINATED NODE | READINESS GATES |
|-------|-------|---------|----------|------|-------------|--------|----------------|-----------------|
| nginx | 1/1   | Running | 0        | 15s  | 10.244.1.2  | node01 | `<none>`       | `<none>`        |


<br>

# Q5: Now schedule the same pod on the `controlplane` node.
Delete and recreate the POD if necessary.
## A5: 
```bash
kubectl delete pod nginx
```
```bash
kubectl get nodes
```
| NAME          | STATUS | ROLES          | AGE | VERSION |
|---------------|--------|----------------|-----|---------|
| controlplane  | Ready  | control-plane  | 13m | v1.31.0 |
| node01        | Ready  | `<none>`       | 13m | v1.31.0 |

```bash
vi nginx.yaml
```
```YAML
---
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  nodeName: controlplane # Change the nodeName from node01 to controlplane
  containers:
  -  image: nginx
     name: nginx
```
```bash
kubectl create -f nginx.yaml
```
```bash
kubectl get pods -o wide
```
| NAME  | READY | STATUS  | RESTARTS | AGE | IP          | NODE         | NOMINATED NODE | READINESS GATES |
|-------|-------|---------|----------|-----|-------------|--------------|----------------|-----------------|
| nginx | 1/1   | Running | 0        | 27s | 10.244.0.4  | controlplane | `<none>`       | `<none>`        |

