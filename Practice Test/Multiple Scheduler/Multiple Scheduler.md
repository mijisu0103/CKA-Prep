# Q1: What is the name of the POD that deploys the default kubernetes scheduler in this environment?
```bash
kubectl get pods --namespace=kube-system
```

| NAME                                  | READY | STATUS  | RESTARTS | AGE   |
|---------------------------------------|-------|---------|----------|-------|
| coredns-77d6fd4654-2pmtd              | 1/1   | Running | 0        | 7m36s |
| coredns-77d6fd4654-8gkxs              | 1/1   | Running | 0        | 7m36s |
| etcd-controlplane                     | 1/1   | Running | 0        | 7m43s |
| kube-apiserver-controlplane           | 1/1   | Running | 0        | 7m42s |
| kube-controller-manager-controlplane  | 1/1   | Running | 0        | 7m42s |
| kube-proxy-nhfrt                      | 1/1   | Running | 0        | 7m36s |
| kube-scheduler-controlplane           | 1/1   | Running | 0        | 7m42s |


## A1: kube-scheduler-controlplane

<br>

# Q2: What is the image used to deploy the kubernetes scheduler?
Inspect the kubernetes scheduler pod and identify the image
```bash
kubectl describe po kube-scheduler-controlplane --namespace=kube-system 
```
```
Name:                 kube-scheduler-controlplane
Namespace:            kube-system
Priority:             2000001000
Priority Class Name:  system-node-critical
Node:                 controlplane/192.1.88.9
Start Time:           Mon, 28 Oct 2024 23:27:42 +0000
Labels:               component=kube-scheduler
                      tier=control-plane
Annotations:          kubernetes.io/config.hash: 3a38305f8aed7021a1cff9b93fc47052
                      kubernetes.io/config.mirror: 3a38305f8aed7021a1cff9b93fc47052
                      kubernetes.io/config.seen: 2024-10-28T23:27:41.644745367Z
                      kubernetes.io/config.source: file
Status:               Running
SeccompProfile:       RuntimeDefault
IP:                   192.1.88.9
IPs:
  IP:           192.1.88.9
Controlled By:  Node/controlplane
Containers:
  kube-scheduler:
    Container ID:  containerd://a05be27bede73282c443d2b96cc730bc6c056defe6f02da89e0e7ecc4a3c41ae
    Image:         registry.k8s.io/kube-scheduler:v1.31.0
    Image ID:      registry.k8s.io/kube-scheduler@sha256:96ddae9c9b2e79342e0551e2d2ec422c0c02629a74d928924aaa069706619808
    Port:          <none>
    Host Port:     <none>
    Command:
      kube-scheduler
      --authentication-kubeconfig=/etc/kubernetes/scheduler.conf
      --authorization-kubeconfig=/etc/kubernetes/scheduler.conf
      --bind-address=127.0.0.1
      --kubeconfig=/etc/kubernetes/scheduler.conf
      --leader-elect=true
    State:          Running
      Started:      Mon, 28 Oct 2024 23:27:34 +0000
    Ready:          True
    Restart Count:  0
    Requests:
      cpu:        100m
    Liveness:     http-get https://127.0.0.1:10259/healthz delay=10s timeout=15s period=10s #success=1 #failure=8
    Startup:      http-get https://127.0.0.1:10259/healthz delay=10s timeout=15s period=10s #success=1 #failure=24
    Environment:  <none>
    Mounts:
      /etc/kubernetes/scheduler.conf from kubeconfig (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  kubeconfig:
    Type:          HostPath (bare host directory volume)
    Path:          /etc/kubernetes/scheduler.conf
    HostPathType:  FileOrCreate
QoS Class:         Burstable
Node-Selectors:    <none>
Tolerations:       :NoExecute op=Exists
Events:            <none>
```
## A2: registry.k8s.io/kube-scheduler:v1.31.0

<br>

# Q3: ℹ️  We have already created the `ServiceAccount` and `ClusterRoleBinding` that our custom scheduler will make use of.

Checkout the following Kubernetes objects:

- `ServiceAccount`: my-scheduler (kube-system namespace)

- `ClusterRoleBinding`: my-scheduler-as-kube-scheduler

- `ClusterRoleBinding`: my-scheduler-as-volume-scheduler

Run the command: `kubectl get serviceaccount -n kube-system` and `kubectl get clusterrolebinding`

<br>

```bash
kubectl get serviceaccount -n kube-system
```
| NAME                                         | SECRETS | AGE |
|----------------------------------------------|---------|-----|
| attachdetach-controller                      | 0       | 11m |
| bootstrap-signer                             | 0       | 11m |
| certificate-controller                       | 0       | 11m |
| clusterrole-aggregation-controller           | 0       | 11m |
| coredns                                      | 0       | 11m |
| cronjob-controller                           | 0       | 11m |
| daemon-set-controller                        | 0       | 11m |
| default                                      | 0       | 11m |
| deployment-controller                        | 0       | 11m |
| disruption-controller                        | 0       | 11m |
| endpoint-controller                          | 0       | 11m |
| endpointslice-controller                     | 0       | 11m |
| endpointslicemirroring-controller            | 0       | 11m |
| ephemeral-volume-controller                  | 0       | 11m |
| expand-controller                            | 0       | 11m |
| generic-garbage-collector                    | 0       | 11m |
| horizontal-pod-autoscaler                    | 0       | 11m |
| job-controller                               | 0       | 11m |
| kube-proxy                                   | 0       | 11m |
| legacy-service-account-token-cleaner         | 0       | 11m |
| my-scheduler                                 | 0       | 53s |
| namespace-controller                         | 0       | 11m |
| node-controller                              | 0       | 11m |
| persistent-volume-binder                     | 0       | 11m |
| pod-garbage-collector                        | 0       | 11m |
| pv-protection-controller                     | 0       | 11m |
| pvc-protection-controller                    | 0       | 11m |
| replicaset-controller                        | 0       | 11m |
| replication-controller                       | 0       | 11m |
| resourcequota-controller                     | 0       | 11m |
| root-ca-cert-publisher                       | 0       | 11m |
| service-account-controller                   | 0       | 11m |
| service-controller                           | 0       | 11m |
| statefulset-controller                       | 0       | 11m |
| token-cleaner                                | 0       | 11m |
| ttl-after-finished-controller                | 0       | 11m |
| ttl-controller                               | 0       | 11m |
| validatingadmissionpolicy-status-controller  | 0       | 11m |

<br>

```bash
kubectl get clusterrolebinding
```
| NAME                                                          | ROLE                                                                             | AGE |
|---------------------------------------------------------------|-----------------------------------------------------------------------------------|-----|
| cluster-admin                                                 | ClusterRole/cluster-admin                                                        | 12m |
| flannel                                                       | ClusterRole/flannel                                                              | 12m |
| kubeadm:cluster-admins                                        | ClusterRole/cluster-admin                                                        | 12m |
| kubeadm:get-nodes                                             | ClusterRole/kubeadm:get-nodes                                                    | 12m |
| kubeadm:kubelet-bootstrap                                     | ClusterRole/system:node-bootstrapper                                             | 12m |
| kubeadm:node-autoapprove-bootstrap                            | ClusterRole/system:certificates.k8s.io:certificatesigningrequests:nodeclient     | 12m |
| kubeadm:node-autoapprove-certificate-rotation                 | ClusterRole/system:certificates.k8s.io:certificatesigningrequests:selfnodeclient | 12m |
| kubeadm:node-proxier                                          | ClusterRole/system:node-proxier                                                  | 12m |
| my-scheduler-as-kube-scheduler                                | ClusterRole/system:kube-scheduler                                                | 92s |
| my-scheduler-as-volume-scheduler                              | ClusterRole/system:volume-scheduler                                              | 92s |
| system:basic-user                                             | ClusterRole/system:basic-user                                                    | 12m |
| system:controller:attachdetach-controller                     | ClusterRole/system:controller:attachdetach-controller                            | 12m |
| system:controller:certificate-controller                      | ClusterRole/system:controller:certificate-controller                             | 12m |
| system:controller:clusterrole-aggregation-controller          | ClusterRole/system:controller:clusterrole-aggregation-controller                 | 12m |
| system:controller:cronjob-controller                          | ClusterRole/system:controller:cronjob-controller                                 | 12m |
| system:controller:daemon-set-controller                       | ClusterRole/system:controller:daemon-set-controller                              | 12m |
| system:controller:deployment-controller                       | ClusterRole/system:controller:deployment-controller                              | 12m |
| system:controller:disruption-controller                       | ClusterRole/system:controller:disruption-controller                              | 12m |
| system:controller:endpoint-controller                         | ClusterRole/system:controller:endpoint-controller                                | 12m |
| system:controller:endpointslice-controller                    | ClusterRole/system:controller:endpointslice-controller                           | 12m |
| system:controller:endpointslicemirroring-controller           | ClusterRole/system:controller:endpointslicemirroring-controller                  | 12m |
| system:controller:ephemeral-volume-controller                 | ClusterRole/system:controller:ephemeral-volume-controller                        | 12m |
| system:controller:expand-controller                           | ClusterRole/system:controller:expand-controller                                  | 12m |
| system:controller:generic-garbage-collector                   | ClusterRole/system:controller:generic-garbage-collector                          | 12m |
| system:controller:horizontal-pod-autoscaler                   | ClusterRole/system:controller:horizontal-pod-autoscaler                          | 12m |
| system:controller:job-controller                              | ClusterRole/system:controller:job-controller                                     | 12m |
| system:controller:legacy-service-account-token-cleaner        | ClusterRole/system:controller:legacy-service-account-token-cleaner               | 12m |
| system:controller:namespace-controller                        | ClusterRole/system:controller:namespace-controller                               | 12m |
| system:controller:node-controller                             | ClusterRole/system:controller:node-controller                                    | 12m |
| system:controller:persistent-volume-binder                    | ClusterRole/system:controller:persistent-volume-binder                           | 12m |
| system:controller:pod-garbage-collector                       | ClusterRole/system:controller:pod-garbage-collector                              | 12m |
| system:controller:pv-protection-controller                    | ClusterRole/system:controller:pv-protection-controller                           | 12m |
| system:controller:pvc-protection-controller                   | ClusterRole/system:controller:pvc-protection-controller                          | 12m |
| system:controller:replicaset-controller                       | ClusterRole/system:controller:replicaset-controller                              | 12m |
| system:controller:replication-controller                      | ClusterRole/system:controller:replication-controller                             | 12m |
| system:controller:resourcequota-controller                    | ClusterRole/system:controller:resourcequota-controller                           | 12m |
| system:controller:root-ca-cert-publisher                      | ClusterRole/system:controller:root-ca-cert-publisher                             | 12m |
| system:controller:route-controller                            | ClusterRole/system:controller:route-controller                                   | 12m |
| system:controller:service-account-controller                  | ClusterRole/system:controller:service-account-controller                         | 12m |
| system:controller:service-controller                          | ClusterRole/system:controller:service-controller                                 | 12m |
| system:controller:statefulset-controller                      | ClusterRole/system:controller:statefulset-controller                             | 12m |
| system:controller:ttl-after-finished-controller               | ClusterRole/system:controller:ttl-after-finished-controller                      | 12m |
| system:controller:ttl-controller                              | ClusterRole/system:controller:ttl-controller                                     | 12m |
| system:controller:validatingadmissionpolicy-status-controller | ClusterRole/system:controller:validatingadmissionpolicy-status-controller        | 12m |
| system:coredns                                                | ClusterRole/system:coredns                                                       | 12m |
| system:discovery                                              | ClusterRole/system:discovery                                                     | 12m |
| system:kube-controller-manager                                | ClusterRole/system:kube-controller-manager                                       | 12m |
| system:kube-dns                                               | ClusterRole/system:kube-dns                                                      | 12m |
| system:kube-scheduler                                         | ClusterRole/system:kube-scheduler                                                | 12m |
| system:monitoring                                             | ClusterRole/system:monitoring                                                    | 12m |
| system:node                                                   | ClusterRole/system:node                                                          | 12m |
| system:node-proxier                                           | ClusterRole/system:node-proxier                                                  | 12m |
| system:public-info-viewer                                     | ClusterRole/system:public-info-viewer                                            | 12m |
| system:service-account-issuer-discovery                       | ClusterRole/system:service-account-issuer-discovery                              | 12m |
| system:volume-scheduler                                       | ClusterRole/system:volume-scheduler                                              | 12m |


## A3: OK

<br>

# Q4: Let's create a configmap that the new scheduler will employ using the concept of ConfigMap as a volume. We have already given a configMap definition file called my-scheduler-configmap.yaml at /root/ path that will create a configmap with name my-scheduler-config using the content of file /root/my-scheduler-config.yaml.
## A4:
```bash
kubectl create -f /root/my-scheduler-configmap.yaml
```

<br>

# Q5: Deploy an additional scheduler to the cluster following the given specification.
Use the manifest file provided at `/root/my-scheduler.yaml`. Use the same image as used by the default kubernetes scheduler.
## A5:
```bash
vi /root/my-scheduler.yaml
```
```YAML
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: my-scheduler
  name: my-scheduler
  namespace: kube-system
spec:
  serviceAccountName: my-scheduler
  containers:
  - command:
    - /usr/local/bin/kube-scheduler
    - --config=/etc/kubernetes/my-scheduler/my-scheduler-config.yaml
    image: registry.k8s.io/kube-scheduler:v1.31.0
    livenessProbe:
      httpGet:
        path: /healthz
        port: 10259
        scheme: HTTPS
      initialDelaySeconds: 15
    name: kube-second-scheduler
    readinessProbe:
      httpGet:
        path: /healthz
        port: 10259
        scheme: HTTPS
    resources:
      requests:
        cpu: '0.1'
    securityContext:
      privileged: false
    volumeMounts:
      - name: config-volume
        mountPath: /etc/kubernetes/my-scheduler
  hostNetwork: false
  hostPID: false
  volumes:
    - name: config-volume
```

<br>

# Q6: A POD definition file is given. Use it to create a POD with the new custom scheduler.
File is located at `/root/nginx-pod.yaml`

## A6: 
```bash
vi /root/nginx-pod.yaml
```
```YAML
apiVersion: v1
kind: Pod 
metadata:
  name: nginx
spec:
  schedulerName: my-scheduler
  containers:
  - image: nginx
    name: nginx
```
```bash
kubectl create -f nginx-pod.yaml
```

