# Q1: We have deployed a number of PODs. They are labelled with `tier`, `env` and `bu`. How many PODs exist in the `dev` environment (`env`)?
Use selectors to filter the output
```bash
kubectl get pods --selector env=dev
```
| NAME         | READY | STATUS  | RESTARTS | AGE  |
|--------------|-------|---------|----------|------|
| app-1-2fmvp  | 1/1   | Running | 0        | 2m3s |
| app-1-mxtht  | 1/1   | Running | 0        | 2m3s |
| app-1-trgqk  | 1/1   | Running | 0        | 2m3s |
| db-1-652g9   | 1/1   | Running | 0        | 2m3s |
| db-1-8z74j   | 1/1   | Running | 0        | 2m3s |
| db-1-bh97f   | 1/1   | Running | 0        | 2m3s |
| db-1-dmxw8   | 1/1   | Running | 0        | 2m3s |

<br>

OR more advanced way:
```bash
kubectl get pods --selector env=dev --no-headers | wc -l
```
```
7
```

## A1: 7

<br>

# Q2: How many PODs are in the finance business unit (bu)?
```bash
kubectl get pods --selector bu=finance --no-headers | wc -l
```
```
6
```
## A2: 6

<br>

# Q3: How many objects are in the prod environment including PODs, ReplicaSets and any other objects?
```bash
kubectl get all --selector env=prod --no-headers | wc -l
```
```
7
```
## A3: 7

<br>

# Q4: Identify the POD which is part of the prod environment, the finance BU and of frontend tier?
```bash
kubectl get all --selector env=prod,bu=finance,tier=frontend
```
| NAME             | READY | STATUS  | RESTARTS | AGE   |
|------------------|-------|---------|----------|-------|
| pod/app-1-zzxdf  | 1/1   | Running | 0        | 8m54s |

## A4: app-1-zzxdf

<br>

# Q5: A ReplicaSet definition file is given `replicaset-definition-1.yaml`. Attempt to create the replicaset; you will encounter an issue with the file. Try to fix it.
Once you fix the issue, create the replicaset from the definition file.
```bash
vi replicaset-definition-1.yaml
```
```YAML
apiVersion: apps/v1
kind: ReplicaSet
metadata:
   name: replicaset-1
spec:
   replicas: 2
   selector:
      matchLabels:
        tier: front-end
   template:
     metadata:
       labels:
        tier: front-end # Match this with matchLabels' tier
     spec:
       containers:
       - name: nginx
         image: nginx
```
```bash
kubectl create -f replicaset-definition-1.yaml
```

