# Q1: ℹ️ In this lab environment, you will get to work with multiple kubernetes clusters where we will practice backing up and restoring the ETCD database.
## A1: OK

<br>

# Q2: ℹ️ You will notice that, you are logged in to the `student-node` (instead of the `controlplane`).
The `student-node` has the `kubectl` client and has access to all the `Kubernetes` clusters that are configured in this lab environment.
Before proceeding to the next question, explore the `student-node` and the clusters it has access to.
## A2: OK

<br>

# Q3: How many `clusters` are defined in the kubeconfig on the `student-node`?
You can make use of the `kubectl config` command.
```bash
kubectl config view
```
```YAML
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://cluster1-controlplane:6443
  name: cluster1
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://192.30.134.12:6443
  name: cluster2
contexts:
- context:
    cluster: cluster1
    user: cluster1
  name: cluster1
- context:
    cluster: cluster2
    user: cluster2
  name: cluster2
current-context: cluster1
kind: Config
preferences: {}
users:
- name: cluster1
  user:
    client-certificate-data: DATA+OMITTED
    client-key-data: DATA+OMITTED
- name: cluster2
  user:
    client-certificate-data: DATA+OMITTED
    client-key-data: DATA+OMITTED
```
## A3: 2

<br>

# Q4: How many nodes (both controlplane and worker) are part of `cluster1`?
Make sure to switch the context to `cluster1`:
```bash
kubectl config use-context cluster1
```
```bash
kubectl get nodes
```
| NAME                   | STATUS | ROLES          | AGE  | VERSION |
|------------------------|--------|----------------|------|---------|
| cluster1-controlplane  | Ready  | control-plane  | 129m | v1.29.0 |
| cluster1-node01        | Ready  | <none>         | 129m | v1.29.0 |
## A4: 2

<br>

# Q5: What is the name of the controlplane node in `cluster2`?
Make sure to switch the context to `cluster2`:
```bash
kubectl config use-context cluster2
```
```bash
kubectl get node
```
| NAME                   | STATUS | ROLES          | AGE  | VERSION |
|------------------------|--------|----------------|------|---------|
| cluster2-controlplane  | Ready  | control-plane  | 131m | v1.29.0 |
| cluster2-node01        | Ready  | <none>         | 130m | v1.29.0 |

## A5: cluster-controlplane

<br>

# Q6: ℹ️ You can SSH to all the nodes (of both clusters) from the student-node.
For example:
```
ssh cluster1-controlplane
Welcome to Ubuntu 18.04.6 LTS (GNU/Linux 5.4.0-1086-gcp x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

To restore this content, you can run the 'unminimize' command.
```
<br>

To get back to the `student` node, use the `logout` or `exit` command, or, hit `Control + D`
```
logout
Connection to cluster1-controlplane closed.
```
## A6: OK

<br>

# Q7: How is `ETCD` configured for `cluster1`?
Remember, you can access the clusters from `student-node` using the `kubectl` tool. You can also `ssh` to the cluster nodes from the `student-node`.
Make sure to switch the context to `cluster1`:
```bash
kubectl config use-context cluster1
```
```bash
kubectl get pods -n kube-system | grep etcd
```
| NAME                           | READY | STATUS  | RESTARTS | AGE  |
|--------------------------------|-------|---------|----------|------|
| etcd-cluster1-controlplane     | 1/1   | Running | 0        | 136m |

<br>

This means that ETCD is set up as a Stacked ETCD Topology where the distributed data storage cluster provided by etcd is stacked on top of the cluster formed by the nodes managed by kubeadm that run control plane components.

## A7: Stacked ETCD

<br>

# Q8; How is `ETCD` configured for `cluster2`?
Remember, you can access the clusters from `student-node` using the `kubectl` tool. You can also `ssh` to the cluster nodes from the `student-node`.
Make sure to switch the context to `cluster2`:
```bash
kubectl config use-context cluster2
```
```bash
kubectl get pods -n kube-system | grep etcd
```
```

```
```bash
ssh cluster2-controlplane
```
```bash
ls /etc/kubernetes/manifests/ | grep -i etcd
```
```bash
ps -ef | grep etc
```
| USER | PID  | PPID  | CPU | TIME | COMMAND |
|------|------|-------|-----|------|---------|
| root | 2836 | 2471  | 0   | 20:10 | kube-scheduler --authentication-kubeconfig=/etc/kubernetes/scheduler.conf --authorization-kubeconfig=/etc/kubernetes/scheduler.conf --bind-address=127.0.0.1 --kubeconfig=/etc/kubernetes/scheduler.conf --leader-elect=true |
| root | 2843 | 2459  | 0   | 20:10 | kube-apiserver --advertise-address=192.30.134.12 --allow-privileged=true --authorization-mode=Node,RBAC --client-ca-file=/etc/kubernetes/pki/ca.crt --enable-admission-plugins=NodeRestriction --enable-bootstrap-token-auth=true --etcd-cafile=/etc/kubernetes/pki/etcd/ca.pem --etcd-certfile=/etc/kubernetes/pki/etcd/etcd.pem --etcd-keyfile=/etc/kubernetes/pki/etcd/etcd-key.pem --etcd-servers=https://192.30.134.23:2379 --kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt --kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname --proxy-client-cert-file=/etc/kubernetes/pki/front-proxy-client.crt --proxy-client-key-file=/etc/kubernetes/pki/front-proxy-client.key --requestheader-allowed-names=front-proxy-client --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt --requestheader-extra-headers-prefix=X-Remote-Extra- --requestheader-group-headers=X-Remote-Group --requestheader-username-headers=X-Remote-User --secure-port=6443 --service-account-issuer=https://kubernetes.default.svc.cluster.local --service-account-key-file=/etc/kubernetes/pki/sa.pub --service-account-signing-key-file=/etc/kubernetes/pki/sa.key --service-cluster-ip-range=10.96.0.0/12 --tls-cert-file=/etc/kubernetes/pki/apiserver.crt --tls-private-key-file=/etc/kubernetes/pki/apiserver.key |
| root | 2845 | 2454  | 0   | 20:10 | kube-controller-manager --allocate-node-cidrs=true --authentication-kubeconfig=/etc/kubernetes/controller-manager.conf --authorization-kubeconfig=/etc/kubernetes/controller-manager.conf --bind-address=127.0.0.1 --client-ca-file=/etc/kubernetes/pki/ca.crt --cluster-cidr=10.244.0.0/16 --cluster-name=kubernetes --cluster-signing-cert-file=/etc/kubernetes/pki/ca.crt --cluster-signing-key-file=/etc/kubernetes/pki/ca.key --controllers=*,bootstrapsigner,tokencleaner --kubeconfig=/etc/kubernetes/controller-manager.conf --leader-elect=true --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt --root-ca-file=/etc/kubernetes/pki/ca.crt --service-account-private-key-file=/etc/kubernetes/pki/sa.key --service-cluster-ip-range=10.96.0.0/12 --use-service-account-credentials=true |
| root | 3429 | 1     | 0   | 20:11 | /usr/bin/kubelet --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf --config=/var/lib/kubelet/config.yaml --container-runtime-endpoint=unix:///var/run/containerd/containerd.sock --pod-infra-container-image=registry.k8s.io/pause:3.9 |
| root | 5671 | 5427  | 0   | 20:11 | /coredns -conf /etc/coredns/Corefile |
| root | 5899 | 5713  | 0   | 20:11 | /coredns -conf /etc/coredns/Corefile |
| root | 14035 | 13858 | 0 | 22:31 | grep etc |

<br>

OR:
```bash
 kubectl -n kube-system describe pod kube-apiserver-cluster2-controlplane 
```
```
Name:                 kube-apiserver-cluster2-controlplane
Namespace:            kube-system
Priority:             2000001000
Priority Class Name:  system-node-critical
Node:                 cluster2-controlplane/192.30.134.12
Start Time:           Fri, 01 Nov 2024 20:11:06 +0000
Labels:               component=kube-apiserver
                      tier=control-plane
Annotations:          kubeadm.kubernetes.io/kube-apiserver.advertise-address.endpoint: 192.30.134.12:6443
                      kubernetes.io/config.hash: 53f02e154ff23829d77da9b63947d670
                      kubernetes.io/config.mirror: 53f02e154ff23829d77da9b63947d670
                      kubernetes.io/config.seen: 2024-11-01T20:11:05.919841900Z
                      kubernetes.io/config.source: file
Status:               Running
SeccompProfile:       RuntimeDefault
IP:                   192.30.134.12
IPs:
  IP:           192.30.134.12
Controlled By:  Node/cluster2-controlplane
Containers:
  kube-apiserver:
    Container ID:  containerd://09b0a5bf7b938eba002a1c00faf01ae87255a60b5e4ab3ed0ccfcab8e32a7955
    Image:         registry.k8s.io/kube-apiserver:v1.29.0
    Image ID:      registry.k8s.io/kube-apiserver@sha256:921d9d4cda40bd481283375d39d12b24f51281682ae41f6da47f69cb072643bc
    Port:          <none>
    Host Port:     <none>
    Command:
      kube-apiserver
      --advertise-address=192.30.134.12
      --allow-privileged=true
      --authorization-mode=Node,RBAC
      --client-ca-file=/etc/kubernetes/pki/ca.crt
      --enable-admission-plugins=NodeRestriction
      --enable-bootstrap-token-auth=true
      --etcd-cafile=/etc/kubernetes/pki/etcd/ca.pem
      --etcd-certfile=/etc/kubernetes/pki/etcd/etcd.pem
      --etcd-keyfile=/etc/kubernetes/pki/etcd/etcd-key.pem
      --etcd-servers=https://192.30.134.23:2379
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
      Started:      Fri, 01 Nov 2024 20:10:57 +0000
    Ready:          True
    Restart Count:  0
    Requests:
      cpu:        250m
    Liveness:     http-get https://192.30.134.12:6443/livez delay=10s timeout=15s period=10s #success=1 #failure=8
    Readiness:    http-get https://192.30.134.12:6443/readyz delay=0s timeout=15s period=1s #success=1 #failure=3
    Startup:      http-get https://192.30.134.12:6443/livez delay=10s timeout=15s period=10s #success=1 #failure=24
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
Events:            <none>
```
## A8: External ETCD

<br>

# Q9: What is the IP address of the External ETCD datastore used in cluster2?
```bash
ssh cluster2-controlplane ps -ef | grep --color=auto etcd
```
| USER | PID  | PPID | CPU | START  | TIME     | COMMAND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
|------|------|------|-----|--------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| root | 2843 | 2459 | 0   | 20:10  | 00:06:07 | kube-apiserver --advertise-address=192.30.134.12 --allow-privileged=true --authorization-mode=Node,RBAC --client-ca-file=/etc/kubernetes/pki/ca.crt --enable-admission-plugins=NodeRestriction --enable-bootstrap-token-auth=true --etcd-cafile=/etc/kubernetes/pki/etcd/ca.pem --etcd-certfile=/etc/kubernetes/pki/etcd/etcd.pem --etcd-keyfile=/etc/kubernetes/pki/etcd/etcd-key.pem --etcd-servers=https://192.30.134.23:2379 --kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt --kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname --proxy-client-cert-file=/etc/kubernetes/pki/front-proxy-client.crt --proxy-client-key-file=/etc/kubernetes/pki/front-proxy-client.key --requestheader-allowed-names=front-proxy-client --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt --requestheader-extra-headers-prefix=X-Remote-Extra- --requestheader-group-headers=X-Remote-Group --requestheader-username-headers=X-Remote-User --secure-port=6443 --service-account-issuer=https://kubernetes.default.svc.cluster.local --service-account-key-file=/etc/kubernetes/pki/sa.pub --service-account-signing-key-file=/etc/kubernetes/pki/sa.key --service-cluster-ip-range=10.96.0.0/12 --tls-cert-file=/etc/kubernetes/pki/apiserver.crt --tls-private-key-file=/etc/kubernetes/pki/apiserver.key |

## A9: 192.30.134.23

<br>

# Q10: What is the default data directory used the for `ETCD` datastore used in `cluster1`?
Remember, this cluster uses a `Stacked ETCD` topology.
Make sure to switch the context to `cluster1`:
```bash
kubectl config use-context cluster1
```
```bash
kubectl -n kube-system describe pod etcd-cluster1-controlplane | grep data-dir
```
```
  --data-dir=/var/lib/etcd
```

## A10: /var/lib/etcd

<br>

# Q11: ℹ️ For the subsequent questions, you would need to login to the `External ETCD` server.
To do this, open a new terminal (using the `+` button located above the default terminal).
From the new terminal you can now `SSH` from the `student-node` to either the `IP` of the ETCD datastore (that you identified in the previous questions) OR the hostname `etcd-server`:

```bash
ssh cluster2-controlplane ps -ef | grep etcd
```
| USER | PID  | PPID | CPU | START  | TIME     | COMMAND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
|------|------|------|-----|--------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| root | 2843 | 2459 | 0   | 20:10  | 00:06:22 | kube-apiserver --advertise-address=192.30.134.12 --allow-privileged=true --authorization-mode=Node,RBAC --client-ca-file=/etc/kubernetes/pki/ca.crt --enable-admission-plugins=NodeRestriction --enable-bootstrap-token-auth=true --etcd-cafile=/etc/kubernetes/pki/etcd/ca.pem --etcd-certfile=/etc/kubernetes/pki/etcd/etcd.pem --etcd-keyfile=/etc/kubernetes/pki/etcd/etcd-key.pem --etcd-servers=https://192.30.134.23:2379 --kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt --kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname --proxy-client-cert-file=/etc/kubernetes/pki/front-proxy-client.crt --proxy-client-key-file=/etc/kubernetes/pki/front-proxy-client.key --requestheader-allowed-names=front-proxy-client --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt --requestheader-extra-headers-prefix=X-Remote-Extra- --requestheader-group-headers=X-Remote-Group --requestheader-username-headers=X-Remote-User --secure-port=6443 --service-account-issuer=https://kubernetes.default.svc.cluster.local --service-account-key-file=/etc/kubernetes/pki/sa.pub --service-account-signing-key-file=/etc/kubernetes/pki/sa.key --service-cluster-ip-range=10.96.0.0/12 --tls-cert-file=/etc/kubernetes/pki/apiserver.crt --tls-private-key-file=/etc/kubernetes/pki/apiserver.key |

```bash
ssh 192.30.134.23
```
```
Welcome to Ubuntu 18.04.6 LTS (GNU/Linux 5.4.0-1106-gcp x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

To restore this content, you can run the 'unminimize' command.
Last login: Fri Nov  1 22:41:51 2024 from 192.30.134.7
```
```bash
exit
```
```bash
logout
Connection to 192.30.134.23 closed.
```
```bash
ssh etcd-server
```
```
Welcome to Ubuntu 18.04.6 LTS (GNU/Linux 5.4.0-1106-gcp x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

To restore this content, you can run the 'unminimize' command.
```
## A11: OK

<br>

# Q12: What is the default data directory used the for `ETCD` datastore used in `cluster2`?
Remember, this cluster uses an `External ETCD` topology.
```bash
ssh etcd-server
```
```bash
ps -ef | grep --color=auto etcd
```
| USER | PID  | PPID | CPU | START  | TIME     | COMMAND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
|------|------|------|-----|--------|----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| etcd | 813  | 1    | 0   | 20:10  | 00:02:14 | /usr/local/bin/etcd --name etcd-server --data-dir=/var/lib/etcd-data --cert-file=/etc/etcd/pki/etcd.pem --key-file=/etc/etcd/pki/etcd-key.pem --peer-cert-file=/etc/etcd/pki/etcd.pem --peer-key-file=/etc/etcd/pki/etcd-key.pem --trusted-ca-file=/etc/etcd/pki/ca.pem --peer-trusted-ca-file=/etc/etcd/pki/ca.pem --peer-client-cert-auth --client-cert-auth --initial-advertise-peer-urls https://192.30.134.23:2380 --listen-peer-urls https://192.30.134.23:2380 --advertise-client-urls https://192.30.134.23:2379 --listen-client-urls https://192.30.134.23:2379,https://127.0.0.1:2379 --initial-cluster-token etcd-cluster-1 --initial-cluster etcd-server=https://192.30.134.23:2380 --initial-cluster-state new |
| root | 1205 | 1128 | 0   | 22:46  | 00:00:00 | grep --color=auto etcd                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |

## A12: /var/lib/etcd-data

<br>

# Q13: How many nodes are part of the ETCD cluster that etcd-server is a part of?
```bash
ETCDCTL_API=3 etcdctl \
  --endpoints=https://127.0.0.1:2379 \
  --cacert=/etc/etcd/pki/ca.pem \
  --cert=/etc/etcd/pki/etcd.pem \
  --key=/etc/etcd/pki/etcd-key.pem \
   member list
```
```
8ae832ea9d4ad7fb, started, etcd-server, https://192.30.134.23:2380, https://192.30.134.23:2379, false
```
## A13: 1

<br>

# Q14: Take a backup of `etcd` on `cluster1` and save it on the `student-node` at the path `/opt/cluster1.db`
If needed, make sure to set the context to `cluster1` (on the student-node):
## A14: 
```bash
kubectl config use-context cluster1
```
```bash
kubectl describe  pods -n kube-system etcd-cluster1-controlplane  | grep advertise-client-urls
```
```
Annotations:          kubeadm.kubernetes.io/etcd.advertise-client-urls: https://192.30.134.9:2379
      --advertise-client-urls=https://192.30.134.9:2379
```
```bash
kubectl describe  pods -n kube-system etcd-cluster1-controlplane  | grep pki
```
```
 	    --cert-file=/etc/kubernetes/pki/etcd/server.crt
      --key-file=/etc/kubernetes/pki/etcd/server.key
      --peer-cert-file=/etc/kubernetes/pki/etcd/peer.crt
      --peer-key-file=/etc/kubernetes/pki/etcd/peer.key
      --peer-trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt
      --trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt
      /etc/kubernetes/pki/etcd from etcd-certs (rw)
    Path:          /etc/kubernetes/pki/etcd
```
```bash
ssh cluster1-controlplane
```
```bash
ETCDCTL_API=3 etcdctl --endpoints=https://192.30.134.9:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key snapshot save /opt/cluster1.db
```
```bash
exit
```
```bash
scp cluster1-controlplane:/opt/cluster1.db /opt
cluster1.db
```

<br>

# Q15: An `ETCD` backup for `cluster2` is stored at `/opt/cluster2.db`. Use this snapshot file to carryout a restore on `cluster2` to a new path `/var/lib/etcd-data-new`.
Once the restore is complete, ensure that the controlplane components on `cluster2` are running.
The snapshot was taken when there were objects created in the `critical` namespace on `cluster2`. These objects should be available post restore.
If needed, make sure to set the context to `cluster2` (on the student-node):
## A15: 
```bash
kubectl config use-context cluster2
```
```bash
scp /opt/cluster2.db etcd-server:/root
```
```bash
ssh etcd-server
```
```bash
ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 --cacert=/etc/etcd/pki/ca.pem --cert=/etc/etcd/pki/etcd.pem --key=/etc/etcd/pki/etcd-key.pem snapshot restore /root/cluster2.db --data-dir /var/lib/etcd-data-new
```
```
{"level":"info","ts":1730502241.294741,"caller":"snapshot/v3_snapshot.go:296","msg":"restoring snapshot","path":"/root/cluster2.db","wal-dir":"/var/lib/etcd-data-new/member/wal","data-dir":"/var/lib/etcd-data-new","snap-dir":"/var/lib/etcd-data-new/member/snap"}
{"level":"info","ts":1730502241.3129704,"caller":"mvcc/kvstore.go:388","msg":"restored last compact revision","meta-bucket-name":"meta","meta-bucket-name-key":"finishedCompactRev","restored-compact-revision":13985}
{"level":"info","ts":1730502241.3205543,"caller":"membership/cluster.go:392","msg":"added member","cluster-id":"cdf818194e3a8c32","local-member-id":"0","added-peer-id":"8e9e05c52164694d","added-peer-peer-urls":["http://localhost:2380"]}
{"level":"info","ts":1730502241.459885,"caller":"snapshot/v3_snapshot.go:309","msg":"restored snapshot","path":"/root/cluster2.db","wal-dir":"/var/lib/etcd-data-new/member/wal","data-dir":"/var/lib/etcd-data-new","snap-dir":"/var/lib/etcd-data-new/member/snap"}
```
```bash
vi /etc/systemd/system/etcd.service
```
```
[Unit]
Description=etcd key-value store
Documentation=https://github.com/etcd-io/etcd
After=network.target

[Service]
User=etcd
Type=notify
ExecStart=/usr/local/bin/etcd \
  --name etcd-server \
  --data-dir=/var/lib/etcd-data-new \
  --cert-file=/etc/etcd/pki/etcd.pem \
  --key-file=/etc/etcd/pki/etcd-key.pem \
  --peer-cert-file=/etc/etcd/pki/etcd.pem \
  --peer-key-file=/etc/etcd/pki/etcd-key.pem \
  --trusted-ca-file=/etc/etcd/pki/ca.pem \
  --peer-trusted-ca-file=/etc/etcd/pki/ca.pem \
  --peer-client-cert-auth \
  --client-cert-auth \
  --initial-advertise-peer-urls https://192.30.134.23:2380 \
  --listen-peer-urls https://192.30.134.23:2380 \
  --advertise-client-urls https://192.30.134.23:2379 \
  --listen-client-urls https://192.30.134.23:2379,https://127.0.0.1:2379 \
  --initial-cluster-token etcd-cluster-1 \
  --initial-cluster etcd-server=https://192.30.134.23:2380 \
  --initial-cluster-state new
Restart=on-failure
RestartSec=5
LimitNOFILE=40000

[Install]
WantedBy=multi-user.target
```
```bash
cd /var/lib
```
```bash
chown -R etcd:etcd /var/lib/etcd-data-new
```
```bash
ls -ld /var/lib/etcd-data-new/
```
```bash
cd
```
```bash
systemctl daemon-reload 
```
```bash
systemctl restart etcd
```

