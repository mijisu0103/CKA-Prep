**Q1: Inspect the environment and identify the authorization modes configured on the cluster.**

**Check the `kube-apiserver` settings.**

```
kubectl describe pod kube-apiserver-controlplane -n kube-system
```

```
Name:                 kube-apiserver-controlplane
Namespace:            kube-system
Priority:             2000001000
Priority Class Name:  system-node-critical
Node:                 controlplane/192.34.109.6
Start Time:           Mon, 04 Nov 2024 17:39:44 +0000
Labels:               component=kube-apiserver
                      tier=control-plane
Annotations:          kubeadm.kubernetes.io/kube-apiserver.advertise-address.endpoint: 192.34.109.6:6443
                      kubernetes.io/config.hash: 687a2fdb7ea0a434b1e699830301759e
                      kubernetes.io/config.mirror: 687a2fdb7ea0a434b1e699830301759e
                      kubernetes.io/config.seen: 2024-11-04T17:39:43.904004506Z
                      kubernetes.io/config.source: file
Status:               Running
SeccompProfile:       RuntimeDefault
IP:                   192.34.109.6
IPs:
  IP:           192.34.109.6
Controlled By:  Node/controlplane
Containers:
  kube-apiserver:
    Container ID:  containerd://1f4367784b8f9d7caeff3d56aff20e09c5131d12a43b01efc540393be0e80c8d
    Image:         registry.k8s.io/kube-apiserver:v1.31.0
    Image ID:      registry.k8s.io/kube-apiserver@sha256:470179274deb9dc3a81df55cfc24823ce153147d4ebf2ed649a4f271f51eaddf
    Port:          <none>
    Host Port:     <none>
    Command:
      kube-apiserver
      --advertise-address=192.34.109.6
      --allow-privileged=true
      --authorization-mode=Node,RBAC
      --client-ca-file=/etc/kubernetes/pki/ca.crt
      --enable-admission-plugins=NodeRestriction
      --enable-bootstrap-token-auth=true
      --etcd-cafile=/etc/kubernetes/pki/etcd/ca.crt
      --etcd-certfile=/etc/kubernetes/pki/apiserver-etcd-client.crt
      --etcd-keyfile=/etc/kubernetes/pki/apiserver-etcd-client.key
      --etcd-servers=https://127.0.0.1:2379
      --kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt
      --kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key
      --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
      --proxy-client-cert-file=/etc/kubernetes/pki/front-proxy-client.crt
      --proxy-client-key-file=/etc/kubernetes/pki/front-proxy-client.key
      --requestheader-allowed-names=front-proxy-client
      --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt
      --requestheader-extra-headers-prefix=X-Remote-Extra-
      --requestheader-group-headers=X-Remote-Group
      --requestheader-username-headers=X-Remote-User
      --secure-port=6443
      --service-account-issuer=https://kubernetes.default.svc.cluster.local
      --service-account-key-file=/etc/kubernetes/pki/sa.pub
      --service-account-signing-key-file=/etc/kubernetes/pki/sa.key
      --service-cluster-ip-range=10.96.0.0/12
      --tls-cert-file=/etc/kubernetes/pki/apiserver.crt
      --tls-private-key-file=/etc/kubernetes/pki/apiserver.key
    State:          Running
      Started:      Mon, 04 Nov 2024 17:39:35 +0000
    Ready:          True
    Restart Count:  0
    Requests:
      cpu:        250m
    Liveness:     http-get https://192.34.109.6:6443/livez delay=10s timeout=15s period=10s #success=1 #failure=8
    Readiness:    http-get https://192.34.109.6:6443/readyz delay=0s timeout=15s period=1s #success=1 #failure=3
    Startup:      http-get https://192.34.109.6:6443/livez delay=10s timeout=15s period=10s #success=1 #failure=24
    Environment:  <none>
    Mounts:
      /etc/ca-certificates from etc-ca-certificates (ro)
      /etc/kubernetes/pki from k8s-certs (ro)
      /etc/ssl/certs from ca-certs (ro)
      /usr/local/share/ca-certificates from usr-local-share-ca-certificates (ro)
      /usr/share/ca-certificates from usr-share-ca-certificates (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  ca-certs:
    Type:          HostPath (bare host directory volume)
    Path:          /etc/ssl/certs
    HostPathType:  DirectoryOrCreate
  etc-ca-certificates:
    Type:          HostPath (bare host directory volume)
    Path:          /etc/ca-certificates
    HostPathType:  DirectoryOrCreate
  k8s-certs:
    Type:          HostPath (bare host directory volume)
    Path:          /etc/kubernetes/pki
    HostPathType:  DirectoryOrCreate
  usr-local-share-ca-certificates:
    Type:          HostPath (bare host directory volume)
    Path:          /usr/local/share/ca-certificates
    HostPathType:  DirectoryOrCreate
  usr-share-ca-certificates:
    Type:          HostPath (bare host directory volume)
    Path:          /usr/share/ca-certificates
    HostPathType:  DirectoryOrCreate
QoS Class:         Burstable
Node-Selectors:    <none>
Tolerations:       :NoExecute op=Exists
Events:
  Type    Reason   Age    From     Message
  ----    ------   ----   ----     -------
  Normal  Pulled   5m30s  kubelet  Container image "registry.k8s.io/kube-apiserver:v1.31.0" already present on machine
  Normal  Created  5m30s  kubelet  Created container kube-apiserver
  Normal  Started  5m30s  kubelet  Started container kube-apiserver

```

A1: **Node,RBAC**

<br>

**Q2: How many roles exist in the `default` namespace?**

```
kubectl get roles
```

```
No resources found in default namespace.
```

A2: **0**

<br>

**Q3: How many roles exist in all namespaces together?**

```
kubectl get roles --all-namespaces
```

```
NAMESPACE     NAME                                             CREATED AT
blue          developer                                        2024-11-04T17:44:03Z
kube-public   kubeadm:bootstrap-signer-clusterinfo             2024-11-04T17:39:43Z
kube-public   system:controller:bootstrap-signer               2024-11-04T17:39:42Z
kube-system   extension-apiserver-authentication-reader        2024-11-04T17:39:42Z
kube-system   kube-proxy                                       2024-11-04T17:39:44Z
kube-system   kubeadm:kubelet-config                           2024-11-04T17:39:42Z
kube-system   kubeadm:nodes-kubeadm-config                     2024-11-04T17:39:42Z
kube-system   system::leader-locking-kube-controller-manager   2024-11-04T17:39:42Z
kube-system   system::leader-locking-kube-scheduler            2024-11-04T17:39:42Z
kube-system   system:controller:bootstrap-signer               2024-11-04T17:39:42Z
kube-system   system:controller:cloud-provider                 2024-11-04T17:39:42Z
kube-system   system:controller:token-cleaner                  2024-11-04T17:39:42Z
```

A3: **12**

<br>

**Q4: What are the resources the `kube-proxy` role in the `kube-system` namespace is given access to?**

```
kubectl describe role kube-proxy -n kube-system
```

```
Name:         kube-proxy
Labels:       <none>
Annotations:  <none>
PolicyRule:
  Resources   Non-Resource URLs  Resource Names  Verbs
  ---------   -----------------  --------------  -----
  configmaps  []                 [kube-proxy]    [get]
```

A4: **configmaps**

<br>

**Q5: What actions can the `kube-proxy` role perform on `configmaps`?**

```
kubectl describe role kube-proxy -n kube-system
```

```
Name:         kube-proxy
Labels:       <none>
Annotations:  <none>
PolicyRule:
  Resources   Non-Resource URLs  Resource Names  Verbs
  ---------   -----------------  --------------  -----
  configmaps  []                 [kube-proxy]    [get]
```

A5: **Get**

<br>

**Q6: Which of the following statements are true?**

```
kubectl describe role kube-proxy -n kube-system
```

```
Name:         kube-proxy
Labels:       <none>
Annotations:  <none>
PolicyRule:
  Resources   Non-Resource URLs  Resource Names  Verbs
  ---------   -----------------  --------------  -----
  configmaps  []                 [kube-proxy]    [get]
```

A6: **kube-proxy role can get details of configmap object by the name kube-proxy only**

<br>

**Q7: Which account is the `kube-proxy` role assigned to?**

```
kubectl describe rolebinding kube-proxy -n kube-system
```

```
Name:         kube-proxy
Labels:       <none>
Annotations:  <none>
Role:
  Kind:  Role
  Name:  kube-proxy
Subjects:
  Kind   Name                                             Namespace
  ----   ----                                             ---------
  Group  system:bootstrappers:kubeadm:default-node-token  
```

A7: **Group: system:bootstrappers:kubeadm:default-node-token**

<br>

**Q8: A user `dev-user` is created. User's details have been added to the `kubeconfig` file. Inspect the permissions granted to the user. Check if the user can list pods in the `default` namespace.**

**Use the `--as dev-user` option with `kubectl` to run commands as the `dev-user`.**

```
kubectl get pods --as dev-user
```

```
Error from server (Forbidden): pods is forbidden: User "dev-user" cannot list resource "pods" in API group "" in the namespace "default"
```

**A8: dev-user does not have permissions to list pods**

<br>

**Q9: Create the necessary roles and role bindings required for the `dev-user` to create, list and delete pods in the `default` namespace.**

Role: developer

Role Resources: pods

Role Actions: list

Role Actions: create

Role Actions: delete

RoleBinding: dev-user-binding

RoleBinding: Bound to dev-user

A9:

```
kubectl create role developer --namespace=default --verb=list,create,delete --resource=pods
```

```
kubectl create rolebinding dev-user-binding --namespace=default --role=developer --user=dev-user
```

<br>

**Q10: A set of new roles and role-bindings are created in the `blue` namespace for the `dev-user`. However, the `dev-user` is unable to get details of the `dark-blue-app` pod in the `blue` namespace. Investigate and fix the issue.**

**We have created the required roles and rolebindings, but something seems to be wrong.**

A10:

```
kubectl edit role developer -n blue
```

```YAML
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  creationTimestamp: "2024-11-04T17:44:03Z"
  name: developer
  namespace: blue
  resourceVersion: "808"
  uid: 3a72204f-65fe-4d7b-97b4-b0235ed48303
rules:
- apiGroups:
  - ""
  resourceNames:
  - blue-app
  - dark-blue-app
  resources:
  - pods
  verbs:
  - get
  - watch
  - create
  - delete
```

<br>

**Q11: Add a new rule in the existing role `developer` to grant the `dev-user` permissions to create deployments in the `blue` namespace.**

**Remember to add api group `"apps"`.**

A11:

```
kubectl edit role developer -n blue
```

```YAML
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  creationTimestamp: "2024-11-04T17:44:03Z"
  name: developer
  namespace: blue
  resourceVersion: "1937"
  uid: 3a72204f-65fe-4d7b-97b4-b0235ed48303
rules:
- apiGroups:
  - ""
  resourceNames:
  - blue-app
  - dark-blue-app
  resources:
  - pods
  verbs:
  - get
  - watch
  - create
  - delete
- apiGroups:
  - "apps"
  resources:
  - deployments
  verbs:
  - create
```

<br>

