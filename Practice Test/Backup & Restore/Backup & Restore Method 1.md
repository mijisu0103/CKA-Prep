# Q1: We have a working Kubernetes cluster with a set of web applications running. Let us first explore the setup.
How many deployments exist in the cluster in default `namespace`?
```bash
kubectl get deployments
```
| NAME | READY | UP-TO-DATE | AVAILABLE | AGE |
|------|-------|------------|-----------|-----|
| blue | 3/3   | 3          | 3         | 43s |
| red  | 2/2   | 2          | 2         | 44s |
## A1: 2

<br>

# Q2: What is the version of ETCD running on the cluster?
Check the ETCD Pod or Process
```bash
kubectl -n kube-system logs etcd-controlplane | grep -i 'etcd-version'
```
```
{"level":"info","ts":"2024-11-01T21:38:35.891437Z","caller":"embed/etcd.go:310","msg":"starting an etcd server","etcd-version":"3.5.15","git-sha":"9a5533382","go-version":"go1.21.12","go-os":"linux","go-arch":"amd64","max-cpu-set":36,"max-cpu-available":36,"member-initialized":false,"name":"controlplane","data-dir":"/var/lib/etcd","wal-dir":"","wal-dir-dedicated":"","member-dir":"/var/lib/etcd/member","force-new-cluster":false,"heartbeat-interval":"100ms","election-timeout":"1s","initial-election-tick-advance":true,"snapshot-count":10000,"max-wals":5,"max-snapshots":5,"snapshot-catchup-entries":5000,"initial-advertise-peer-urls":["https://192.32.25.9:2380"],"listen-peer-urls":["https://192.32.25.9:2380"],"advertise-client-urls":["https://192.32.25.9:2379"],"listen-client-urls":["https://127.0.0.1:2379","https://192.32.25.9:2379"],"listen-metrics-urls":["http://127.0.0.1:2381"],"cors":["*"],"host-whitelist":["*"],"initial-cluster":"controlplane=https://192.32.25.9:2380","initial-cluster-state":"new","initial-cluster-token":"etcd-cluster","quota-backend-bytes":2147483648,"max-request-bytes":1572864,"max-concurrent-streams":4294967295,"pre-vote":true,"initial-corrupt-check":true,"corrupt-check-time-interval":"0s","compact-check-time-enabled":false,"compact-check-time-interval":"1m0s","auto-compaction-mode":"periodic","auto-compaction-retention":"0s","auto-compaction-interval":"0s","discovery-url":"","discovery-proxy":"","downgrade-check-interval":"5s"}
```
```bash
kubectl -n kube-system describe pod etcd-controlplane | grep Image:
```
```
Image:         registry.k8s.io/etcd:3.5.15-0
```
## A2: 3.5.15

<br>

# Q3: At what address can you reach the ETCD cluster from the controlplane node?
Check the ETCD Service configuration in the ETCD POD
```bash
kubectl -n kube-system describe pod etcd-controlplane | grep '\--listen-client-urls'
```
```
 --listen-client-urls=https://127.0.0.1:2379,https://192.32.25.9:2379
```
## A3: https://127.0.0.1:2379

<br>

# Q4: Where is the ETCD server certificate file located?
Note this path down as you will need to use it later
```bash
kubectl -n kube-system describe pod etcd-controlplane | grep '\--cert-file'
```
```
--cert-file=/etc/kubernetes/pki/etcd/server.crt
```
## A4: /etc/kubernetes/pki/etcd/server.crt

<br>

# Q5: Where is the ETCD CA Certificate file located?
Note this path down as you will need to use it later.
```bash
kubectl -n kube-system describe pod etcd-controlplane | grep '\--trusted-ca-file'
```
```
 --trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt
```
## A5: /etc/kubernetes/pki/etcd/ca.crt

<br>

# Q6: The master node in our cluster is planned for a regular maintenance reboot tonight. While we do not anticipate anything to go wrong, we are required to take the necessary backups. Take a snapshot of the ETCD database using the built-in snapshot functionality.
Store the backup file at location `/opt/snapshot-pre-boot.db`
## A6: 
```
ETCDCTL_API=3 etcdctl --endpoints=https://[127.0.0.1]:2379 \
--cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/server.crt \
--key=/etc/kubernetes/pki/etcd/server.key \
snapshot save /opt/snapshot-pre-boot.db
```

<br>

# Q7: ℹ️ Great! Let us now wait for the maintenance window to finish. Go get some sleep. (Don't go for real)
Click `Ok` to Continue
## A7: OK

<br>

# Q8: Wake up! We have a conference call! After the reboot the master nodes came back online, but none of our applications are accessible. Check the status of the applications on the cluster. What's wrong?
```bash
kubectl get pods
```
```
No resources found in default namespace.
```
```bash
kubectl get deployments
```
```
No resources found in default namespace.
```
```bash
kubectl get service
```
| NAME       | TYPE       | CLUSTER-IP | EXTERNAL-IP | PORT(S) | AGE   |
|------------|------------|------------|-------------|---------|-------|
| kubernetes | ClusterIP  | 10.96.0.1  | <none>      | 443/TCP | 2m15s |

## A8: Deployments, Services, Pods are not present

<br>

# Q9: Luckily we took a backup. Restore the original state of the cluster using the backup file.
## A9:
```bash
ETCDCTL_API=3 etcdctl  --data-dir /var/lib/etcd-from-backup \
snapshot restore /opt/snapshot-pre-boot.db
```
| Timestamp                | Level | Component                        | Message                                                                                   |
|--------------------------|-------|----------------------------------|-------------------------------------------------------------------------------------------|
| 2024-11-01 22:02:11.856540 | I     | mvcc                             | restore compact to 1279                                                                   |
| 2024-11-01 22:02:11.861893 | I     | etcdserver/membership           | added member 8e9e05c52164694d [http://localhost:2380] to cluster cdf818194e3a8c32         |

```bash
vi /etc/kubernetes/manifests/etcd.yaml
```
```YAML
apiVersion: v1
kind: Pod
metadata:
  annotations:
    kubeadm.kubernetes.io/etcd.advertise-client-urls: https://192.32.25.9:2379
  creationTimestamp: null
  labels:
    component: etcd
    tier: control-plane
  name: etcd
  namespace: kube-system
spec:
  containers:
  - command:
    - etcd
    - --advertise-client-urls=https://192.32.25.9:2379
    - --cert-file=/etc/kubernetes/pki/etcd/server.crt
    - --client-cert-auth=true
    - --data-dir=/var/lib/etcd
    - --experimental-initial-corrupt-check=true
    - --experimental-watch-progress-notify-interval=5s
    - --initial-advertise-peer-urls=https://192.32.25.9:2380
    - --initial-cluster=controlplane=https://192.32.25.9:2380
    - --key-file=/etc/kubernetes/pki/etcd/server.key
    - --listen-client-urls=https://127.0.0.1:2379,https://192.32.25.9:2379
    - --listen-metrics-urls=http://127.0.0.1:2381
    - --listen-peer-urls=https://192.32.25.9:2380
    - --name=controlplane
    - --peer-cert-file=/etc/kubernetes/pki/etcd/peer.crt
    - --peer-client-cert-auth=true
    - --peer-key-file=/etc/kubernetes/pki/etcd/peer.key
    - --peer-trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt
    - --snapshot-count=10000
    - --trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt
    image: registry.k8s.io/etcd:3.5.15-0
    imagePullPolicy: IfNotPresent
    livenessProbe:
      failureThreshold: 8
      httpGet:
        host: 127.0.0.1
        path: /livez
        port: 2381
        scheme: HTTP
      initialDelaySeconds: 10
      periodSeconds: 10
      timeoutSeconds: 15
    name: etcd
    readinessProbe:
      failureThreshold: 3
      httpGet:
        host: 127.0.0.1
        path: /readyz
        port: 2381
        scheme: HTTP
      periodSeconds: 1
      timeoutSeconds: 15
    resources:
      requests:
        cpu: 100m
        memory: 100Mi
    startupProbe:
      failureThreshold: 24
      httpGet:
        host: 127.0.0.1
        path: /readyz
        port: 2381
        scheme: HTTP
      initialDelaySeconds: 10
      periodSeconds: 10
      timeoutSeconds: 15
    volumeMounts:
    - mountPath: /var/lib/etcd
      name: etcd-data
    - mountPath: /etc/kubernetes/pki/etcd
      name: etcd-certs
  hostNetwork: true
  priority: 2000001000
  priorityClassName: system-node-critical
  securityContext:
    seccompProfile:
      type: RuntimeDefault
  volumes:
  - hostPath:
      path: /etc/kubernetes/pki/etcd
      type: DirectoryOrCreate
    name: etcd-certs
  - hostPath:
      path: /var/lib/etcd-from-backup
      type: DirectoryOrCreate
    name: etcd-data
status: {}
```
```bash
watch "crictl ps | grep etcd"
```
| Container ID    | Image ID        | Created          | Status  | Name     | Restart Count | Pod ID        | Pod Name            |
|-----------------|-----------------|------------------|---------|----------|---------------|---------------|----------------------|
| a3156c520b2d4   | 2e96e5913fc06   | 3 minutes ago    | Running | etcd     | 0             | 5b1268558a4e8 | etcd-controlplane    |

```bash
kubectl get pods
```
| NAME                  | READY | STATUS  | RESTARTS | AGE |
|-----------------------|-------|---------|----------|-----|
| blue-56dd475db5-7xmc7 | 1/1   | Running | 0        | 25m |
| blue-56dd475db5-fgqnn | 1/1   | Running | 0        | 25m |
| blue-56dd475db5-n7scb | 1/1   | Running | 0        | 25m |
| red-8bd48b898-9gckc   | 1/1   | Running | 0        | 25m |
| red-8bd48b898-bqvrk   | 1/1   | Running | 0        | 25m |

