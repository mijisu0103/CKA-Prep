# Q1: How many Namespaces exist on the system?
```bash
kubectl get namespace
```
| NAME              | STATUS | AGE |
|-------------------|--------|-----|
| default           | Active | 24m |
| dev               | Active | 18s |
| finance           | Active | 18s |
| kube-node-lease   | Active | 24m |
| kube-public       | Active | 24m |
| kube-system       | Active | 24m |
| manufacturing     | Active | 18s |
| marketing         | Active | 18s |
| prod              | Active | 18s |
| research          | Active | 18s |

## A1: 10

<br>

# Q2: How many pods exist in the research namespace?
```bash
kubectl get pod --namespace=research
```
| NAME  | READY | STATUS           | RESTARTS       | AGE |
|-------|-------|------------------|----------------|-----|
| dna-1 | 0/1   | CrashLoopBackOff | 3 (41s ago)    | 90s |
| dna-2 | 0/1   | CrashLoopBackOff | 3 (47s ago)    | 89s |

## A2: 2

<br>

# Q3: Create a POD in the finance namespace

- Use the spec given below

## A3:
```bash
kubectl run redis --image=redis --namespace=finance
```

<br>

# Q4: Which namespace has the blue pod in it?
```bash
kubectl get pods --all-namespaces | grep blue
```

## A4: marketing

<br>

# Q5: ℹ️  Access the `Blue` web application using the link above your terminal!!

- From the UI you can ping other services.

<br>
 
Blue-Marketing Application <br>
Connectivity Test <br>
Host Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Host Port <br>
__________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ________

## A5: OK

<br>

# Q6: What DNS name should the Blue application use to access the database db-service in its own namespace - marketing?
- You can try it in the web application UI. Use port 6379.

<!--Since the blue application and the db-service are in the same namespace, we can simply use the service name to access the database-->
## A6: db-service

<br>

# Q7: What DNS name should the Blue application use to access the database db-service in the dev namespace?
- You can try it in the web application UI. Use port 6379.

## A7: db-service.dev.svc.cluster.local

