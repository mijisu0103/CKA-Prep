# Q1: How many static pods exist in this cluster in all namespaces?

```bash
kubectl get pods --all-namespaces
```

| NAMESPACE      | NAME                                   | READY | STATUS  | RESTARTS | AGE   |
|----------------|----------------------------------------|-------|---------|----------|-------|
| kube-flannel   | kube-flannel-ds-glfsg                  | 1/1   | Running | 0        | 6m51s |
| kube-flannel   | kube-flannel-ds-qhwkl                  | 1/1   | Running | 0        | 7m15s |
| kube-system    | coredns-77d6fd4654-lqz8s               | 1/1   | Running | 0        | 7m15s |
| kube-system    | coredns-77d6fd4654-t7q85               | 1/1   | Running | 0        | 7m15s |
| kube-system    | etcd-controlplane                      | 1/1   | Running | 0        | 7m22s |
| kube-system    | kube-apiserver-controlplane            | 1/1   | Running | 0        | 7m18s |
| kube-system    | kube-controller-manager-controlplane   | 1/1   | Running | 0        | 7m24s |
| kube-system    | kube-proxy-9bqkc                       | 1/1   | Running | 0        | 6m51s |
| kube-system    | kube-proxy-nmnfk                       | 1/1   | Running | 0        | 7m15s |
| kube-system    | kube-scheduler-controlplane            | 1/1   | Running | 0        | 7m18s |

<br>
<br>

| NAMESPACE    | NAME                                   | READY | STATUS  | RESTARTS | AGE   |
|--------------|----------------------------------------|-------|---------|----------|-------|
| kube-system  | etcd-controlplane                      | 1/1   | Running | 0        | 7m22s |
| kube-system  | kube-apiserver-controlplane            | 1/1   | Running | 0        | 7m18s |
| kube-system  | kube-controller-manager-controlplane   | 1/1   | Running | 0        | 7m24s |
| kube-system  | kube-scheduler-controlplane            | 1/1   | Running | 0        | 7m18s |

<br>

## A1: 4

<br>


# Q2: Which of the below components is NOT deployed as a static pod?

```bash
kubectl get pods --all-namespaces
```
| NAMESPACE      | NAME                                   | READY | STATUS  | RESTARTS | AGE   |
|----------------|----------------------------------------|-------|---------|----------|-------|
| kube-flannel   | kube-flannel-ds-glfsg                  | 1/1   | Running | 0        | 6m51s |
| kube-flannel   | kube-flannel-ds-qhwkl                  | 1/1   | Running | 0        | 7m15s |
| kube-system    | coredns-77d6fd4654-lqz8s               | 1/1   | Running | 0        | 7m15s |
| kube-system    | coredns-77d6fd4654-t7q85               | 1/1   | Running | 0        | 7m15s |
| kube-system    | etcd-controlplane                      | 1/1   | Running | 0        | 7m22s |
| kube-system    | kube-apiserver-controlplane            | 1/1   | Running | 0        | 7m18s |
| kube-system    | kube-controller-manager-controlplane   | 1/1   | Running | 0        | 7m24s |
| kube-system    | kube-proxy-9bqkc                       | 1/1   | Running | 0        | 6m51s |
| kube-system    | kube-proxy-nmnfk                       | 1/1   | Running | 0        | 7m15s |
| kube-system    | kube-scheduler-controlplane            | 1/1   | Running | 0        | 7m18s |

## A2: coredns

<br>

# Q3: Which of the below components is NOT deployed as a static POD?
```bash
kubectl get pods --all-namespaces
```
| NAMESPACE      | NAME                                   | READY | STATUS  | RESTARTS | AGE   |
|----------------|----------------------------------------|-------|---------|----------|-------|
| kube-flannel   | kube-flannel-ds-glfsg                  | 1/1   | Running | 0        | 6m51s |
| kube-flannel   | kube-flannel-ds-qhwkl                  | 1/1   | Running | 0        | 7m15s |
| kube-system    | coredns-77d6fd4654-lqz8s               | 1/1   | Running | 0        | 7m15s |
| kube-system    | coredns-77d6fd4654-t7q85               | 1/1   | Running | 0        | 7m15s |
| kube-system    | etcd-controlplane                      | 1/1   | Running | 0        | 7m22s |
| kube-system    | kube-apiserver-controlplane            | 1/1   | Running | 0        | 7m18s |
| kube-system    | kube-controller-manager-controlplane   | 1/1   | Running | 0        | 7m24s |
| kube-system    | kube-proxy-9bqkc                       | 1/1   | Running | 0        | 6m51s |
| kube-system    | kube-proxy-nmnfk                       | 1/1   | Running | 0        | 7m15s |
| kube-system    | kube-scheduler-controlplane            | 1/1   | Running | 0        | 7m18s |

## A3: kube-proxy

<br>

# Q4: On which nodes are the static pods created currently?
```bash
kubectl get pods --all-namespaces -o wide
```
| NAMESPACE      | NAME                                   | READY | STATUS  | RESTARTS | AGE  | IP           | NODE         | NOMINATED NODE | READINESS GATES |
|----------------|----------------------------------------|-------|---------|----------|------|--------------|--------------|----------------|-----------------|
| kube-flannel   | kube-flannel-ds-glfsg                  | 1/1   | Running | 0        | 11m  | 192.0.187.3  | node01       | <none>         | <none>          |
| kube-flannel   | kube-flannel-ds-qhwkl                  | 1/1   | Running | 0        | 12m  | 192.0.187.12 | controlplane | <none>         | <none>          |
| kube-system    | coredns-77d6fd4654-lqz8s               | 1/1   | Running | 0        | 12m  | 10.244.0.3   | controlplane | <none>         | <none>          |
| kube-system    | coredns-77d6fd4654-t7q85               | 1/1   | Running | 0        | 12m  | 10.244.0.2   | controlplane | <none>         | <none>          |
| kube-system    | etcd-controlplane                      | 1/1   | Running | 0        | 12m  | 192.0.187.12 | controlplane | <none>         | <none>          |
| kube-system    | kube-apiserver-controlplane            | 1/1   | Running | 0        | 12m  | 192.0.187.12 | controlplane | <none>         | <none>          |
| kube-system    | kube-controller-manager-controlplane   | 1/1   | Running | 0        | 12m  | 192.0.187.12 | controlplane | <none>         | <none>          |
| kube-system    | kube-proxy-9bqkc                       | 1/1   | Running | 0        | 11m  | 192.0.187.3  | node01       | <none>         | <none>          |
| kube-system    | kube-proxy-nmnfk                       | 1/1   | Running | 0        | 12m  | 192.0.187.12 | controlplane | <none>         | <none>          |
| kube-system    | kube-scheduler-controlplane            | 1/1   | Running | 0        | 12m  | 192.0.187.12 | controlplane | <none>         | <none>          |

## A4: controlplane

<br>

# Q5: What is the path of the directory holding the static pod definition files?
```bash
ps -aux | grep /usr/bin/kubelet
```
| USER | PID  | %CPU | %MEM | VSZ    | RSS   | TTY   | STAT | START | TIME | COMMAND                                                                                                                                                                                   |
|------|------|------|------|--------|-------|-------|------|-------|------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| root | 4230 | 0.0  | 0.0  | 4336236 | 94224 | ?     | Ssl  | 22:47 | 0:21 | /usr/bin/kubelet --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf --config=/var/lib/kubelet/config.yaml --container-runtime-endpoint=unix:///var/run/containerd/containerd.sock --pod-infra-container-image=registry.k8s.io/pause:3.10 |
| root | 12328 | 0.0 | 0.0  | 6932    | 2264  | pts/2 | S+   | 23:02 | 0:00 | grep --color=auto /usr/bin/kubelet                                                                                                                                                       |

```
/var/lib/kubelet/config.yaml
```

```bash
grep -i staticpod /var/lib/kubelet/config.yaml
```
```
staticPodPath: /etc/kubernetes/manifests
```
```
/etc/kubernetes/manifests
```

## A5: /etc/kubernetes/manifests

<br>

# Q6: How many pod definition files are present in the manifests directory?
## four static pods
| NAMESPACE    | NAME                                   | READY | STATUS  | RESTARTS | AGE   |
|--------------|----------------------------------------|-------|---------|----------|-------|
| kube-system  | etcd-controlplane                      | 1/1   | Running | 0        | 7m22s |
| kube-system  | kube-apiserver-controlplane            | 1/1   | Running | 0        | 7m18s |
| kube-system  | kube-controller-manager-controlplane   | 1/1   | Running | 0        | 7m24s |
| kube-system  | kube-scheduler-controlplane            | 1/1   | Running | 0        | 7m18s |

## A6: 4

<br>

# Q7: What is the docker image used to deploy the kube-api server as a static pod?
```
vi /etc/kubernetes/manifests/kube-apiserver.yaml
```
```YAML
apiVersion: v1
kind: Pod
metadata:
  annotations:
    kubeadm.kubernetes.io/kube-apiserver.advertise-address.endpoint: 192.0.187.12:6443
  creationTimestamp: null
  labels:
    component: kube-apiserver
    tier: control-plane
  name: kube-apiserver
  namespace: kube-system
spec:
  containers:
  - command:
    - kube-apiserver
    - --advertise-address=192.0.187.12
    - --allow-privileged=true
    - --authorization-mode=Node,RBAC
    - --client-ca-file=/etc/kubernetes/pki/ca.crt
    - --enable-admission-plugins=NodeRestriction
    - --enable-bootstrap-token-auth=true
    - --etcd-cafile=/etc/kubernetes/pki/etcd/ca.crt
    - --etcd-certfile=/etc/kubernetes/pki/apiserver-etcd-client.crt
    - --etcd-keyfile=/etc/kubernetes/pki/apiserver-etcd-client.key
    - --etcd-servers=https://127.0.0.1:2379
    - --kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt
    - --kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key
    - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
    - --proxy-client-cert-file=/etc/kubernetes/pki/front-proxy-client.crt
    - --proxy-client-key-file=/etc/kubernetes/pki/front-proxy-client.key
    image: registry.k8s.io/kube-apiserver:v1.31.0
    imagePullPolicy: IfNotPresent
    livenessProbe:
      failureThreshold: 8
      httpGet:
        host: 192.0.187.12
        path: /livez
        port: 6443
        scheme: HTTPS
      initialDelaySeconds: 10
      periodSeconds: 10
      timeoutSeconds: 15
    name: kube-apiserver
    readinessProbe:
      failureThreshold: 3
      httpGet:
        host: 192.0.187.12
        path: /readyz
        port: 6443
        scheme: HTTPS
      periodSeconds: 1
      timeoutSeconds: 15
    resources:
      requests:
        cpu: 250m
    startupProbe:
      failureThreshold: 24
      httpGet:
        host: 192.0.187.12
        path: /livez
        port: 6443
        scheme: HTTPS
      initialDelaySeconds: 10
      periodSeconds: 10
      timeoutSeconds: 15
    volumeMounts:
    - mountPath: /etc/ssl/certs
      name: ca-certs
      readOnly: true
    - mountPath: /etc/ca-certificates
      name: etc-ca-certificates
      readOnly: true
      - mountPath: /etc/kubernetes/pki
      name: k8s-certs
      readOnly: true
    - mountPath: /usr/local/share/ca-certificates
      name: usr-local-share-ca-certificates
      readOnly: true
    - mountPath: /usr/share/ca-certificates
      name: usr-share-ca-certificates
      readOnly: true
  hostNetwork: true
  priority: 2000001000
  priorityClassName: system-node-critical
  securityContext:
    seccompProfile:
      type: RuntimeDefault
  volumes:
  - hostPath:
      path: /etc/ssl/certs
      type: DirectoryOrCreate
    name: ca-certs
  - hostPath:
      path: /etc/ca-certificates
      type: DirectoryOrCreate
    name: etc-ca-certificates
  - hostPath:
      path: /etc/kubernetes/pki
      type: DirectoryOrCreate
    name: k8s-certs
  - hostPath:
      path: /usr/local/share/ca-certificates
      type: DirectoryOrCreate
    name: usr-local-share-ca-certificates
  - hostPath:
      path: /usr/share/ca-certificates
      type: DirectoryOrCreate
    name: usr-share-ca-certificates
status: {}
```

## A7: registry.k8s.io/kube-apiserver:v1.31.0

<br>

# Q8: Create a static pod named static-busybox that uses the busybox image and the command sleep 1000
## A8: 
```bash
kubectl run --restart=Never --image=busybox static-busybox --dry-run=client -o yaml --command -- sleep 1000 > /etc/kubernetes/manifests/static-busybox.yaml
```

<br>

# Q9: Edit the image on the static pod to use busybox:1.28.4
## A9:
```bash
kubectl run --restart=Never --image=busybox:1.28.4 static-busybox --dry-run=client -o yaml --command -- sleep 1000 > /etc/kubernetes/manifests/static-busybox.yaml
```

<br>

Did not update it so have to restart kubelet
```bash
systemctl restart kubelet
```

<br>

# Q10: We just created a new static pod named static-greenbox. Find it and delete it.
This question is a bit tricky. But if you use the knowledge you gained in the previous questions in this lab, you should be able to find the answer to it.

## A10: 
```bash
kubectl get pods --all-namespaces -o wide  | grep static-greenbox
```
| NAMESPACE | NAME                    | READY | STATUS  | RESTARTS | AGE  | IP         | NODE  | NOMINATED NODE | READINESS GATES |
|-----------|--------------------------|-------|---------|----------|------|------------|-------|----------------|-----------------|
| default   | static-greenbox-node01   | 1/1   | Running | 0        | 110s | 10.244.1.2 | node01 | <none>         | <none>          |
```bash
ssh node01
```
```bash
ps -ef |  grep /usr/bin/kubelet
```
| USER | PID   | PPID  | %CPU | %MEM | START | TTY   | TIME     | COMMAND                  |
|------|-------|-------|------|------|-------|-------|----------|--------------------------|
| root | 18062 | 17830 | 0    | 0    | 23:20 | pts/0 | 00:00:00 | grep /user/bin/kubelet   |
```bash
grep -i staticpod /var/lib/kubelet/config.yaml
```
```
lib/kubelet/config.yaml
staticPodPath: /etc/just-to-mess-with-you
```
```bash
cd /etc/just-to-mess-with-you/
```
```bash
rm -rf greenbox.yaml 
```
```bash
exit
```
```
kubectl get pods --all-namespaces -o wide  | grep static-greenbox
```
| NAMESPACE | NAME                    | READY | STATUS  | RESTARTS | AGE   | IP         | NODE  | NOMINATED NODE | READINESS GATES |
|-----------|--------------------------|-------|---------|----------|-------|------------|-------|----------------|-----------------|
| default   | static-greenbox-node01   | 1/1   | Running | 0        | 6m23s | 10.244.1.2 | node01 | <none>         | <none>          |
```bash
systemctl restart kubelet
```

