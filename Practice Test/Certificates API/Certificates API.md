**Q1: ℹ️ A new member `akshay` joined our team. He requires access to our cluster. The Certificate Signing Request is at the `/root` location.**

**Inspect it**

```
ls
```

```
akshay.csr  akshay.key
```

```
cat akshay.csr
```

```
-----BEGIN CERTIFICATE REQUEST-----
# Certificate Request
-----END CERTIFICATE REQUEST-----
```

A1: **OK**

<br>

**Q2: Create a CertificateSigningRequest object with the name `akshay` with the contents of the `akshay.csr` file**

**As of kubernetes 1.19, the API to use for CSR is `certificates.k8s.io/v1`.**

**Please note that an additional field called `signerName` should also be added when creating CSR. For client authentication to the API server we will use the built-in signer `kubernetes.io/kube-apiserver-client`.**

A2:

```
cat akshay.csr | base64 -w 0
```

```
# Content of Certificate Request
```

```
vi akshay-csr.yaml
```

```YAML
---
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: akshay
spec:
  request: # Content of Certificate Request
  signerName: kubernetes.io/kube-apiserver-client
  usages:
  - client auth
  
  
```

```
kubectl apply -f akshay-csr.yaml
```

<br>

**Q3: What is the Condition of the newly created Certificate Signing Request object?**

```
kubectl get csr
```
<br>

| NAME       | AGE  | SIGNERNAME                                    | REQUESTOR                  | REQUESTEDDURATION | CONDITION          |
|------------|------|-----------------------------------------------|----------------------------|-------------------|--------------------|
| akshay     | 73s  | kubernetes.io/kube-apiserver-client           | kubernetes-admin           | <none>            | Pending            |
| csr-j8qpd  | 17m  | kubernetes.io/kube-apiserver-client-kubelet   | system:node:controlplane   | <none>            | Approved,Issued    |

<br>

A3: **Pending**

<br>

**Q4: Approve the CSR Request**

A4:

```
kubectl certificate approve akshay
```

```
certificatesigningrequest.certificates.k8s.io/akshay approved
```

<br>

**Q5: How many CSR requests are available on the cluster?**

**Including approved and pending**

```
kubectl get csr
```

<br>

| NAME       | AGE     | SIGNERNAME                                    | REQUESTOR                  | REQUESTEDDURATION | CONDITION          |
|------------|---------|-----------------------------------------------|----------------------------|-------------------|--------------------|
| akshay     | 2m56s   | kubernetes.io/kube-apiserver-client           | kubernetes-admin           | <none>            | Approved,Issued    |
| csr-j8qpd  | 19m     | kubernetes.io/kube-apiserver-client-kubelet   | system:node:controlplane   | <none>            | Approved,Issued    |

<br>

A5: **2**

<br>

**Q6: During a routine check you realized that there is a new CSR request in place. What is the name of this request?**

```
kubectl get csr
```

<br>

| NAME          | AGE     | SIGNERNAME                                    | REQUESTOR                  | REQUESTEDDURATION | CONDITION          |
|---------------|---------|-----------------------------------------------|----------------------------|-------------------|--------------------|
| agent-smith   | 23s     | kubernetes.io/kube-apiserver-client           | agent-x                    | <none>            | Pending            |
| akshay        | 3m35s   | kubernetes.io/kube-apiserver-client           | kubernetes-admin           | <none>            | Approved,Issued    |
| csr-j8qpd     | 20m     | kubernetes.io/kube-apiserver-client-kubelet   | system:node:controlplane   | <none>            | Approved,Issued    |

<br>

**A6: agent-smith**

<br>

**Q7: Hmmm.. You are not aware of a request coming in. What groups is this CSR requesting access to?**

**Check the details about the request. Preferably in YAML.**

```
kubectl get csr agent-smith -o yaml
```

```YAML
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  creationTimestamp: "2024-11-02T18:31:22Z"
  name: agent-smith
  resourceVersion: "1980"
  uid: ea72b7fa-fb2f-42c7-b79d-100a6f6dd0f1
spec:
  groups:
  - system:masters
  - system:authenticated
  request: # CSR
  signerName: kubernetes.io/kube-apiserver-client
  usages:
  - digital signature
  - key encipherment
  - server auth
  username: agent-x
status: {}
```

```
  - system:masters
```

A7: **system:masters**

<br>

**Q8: That doesn't look very right. Reject that request.**

A8:

```
kubectl certificate deny agent-smith
```

```
certificatesigningrequest.certificates.k8s.io/agent-smith denied
```

<br>

**Q9: Let's get rid of it. Delete the new CSR object**

A9:

```
kubectl delete csr agent-smith
```

```
certificatesigningrequest.certificates.k8s.io "agent-smith" deleted
```
