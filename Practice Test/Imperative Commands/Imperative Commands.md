# Q1: ℹ️  In this lab, you will get hands-on practice with creating Kubernetes objects imperatively.
All the questions in this lab can be done imperatively. However, for some questions, you may need to first create the YAML file using imperative methods. You can then modify the YAML according to the need and create the object using `kubectl apply -f` command.

## A1: OK

<br>

# Q2: Deploy a pod named `nginx-pod` using the `nginx:alpine` image.
Use imperative commands only.

## A2:
```bash
kubectl run nginx-pod --image=nginx:alpine
```

<br>

# Q3: Deploy a `redis` pod using the `redis:alpine` image with the labels set to `tier=db`.
Either use imperative commands to create the pod with the labels. Or else use imperative commands to generate the pod definition file, then add the labels before creating the pod using the file.

## A3: 
```bash
kubectl run redis --labels=tier=db --image=redis:alpine
```

<br>

# Q4: Create a service `redis-service` to expose the `redis` application within the cluster on port `6379`.
Use imperative commands.
## A4:
```bash
 kubectl expose pod redis --port=6379 --name redis-service
```

<br>

# Q5: Create a deployment named `webapp` using the image `kodekloud/webapp-color` with `3` replicas.
Try to use imperative commands only. Do not create definition files.
## A5: 
```bash
kubectl create deployment webapp --image=kodekloud/webapp-color --replicas=3
```
<br>

# Q6: Create a new pod called custom-nginx using the nginx image and run it on container port 8080.
## A6: 
```bash
kubectl run custom-nginx --image=nginx --port=8080
```

<br>

# Q7: Create a new namespace called `dev-ns`.
Use imperative commands.
## A7: 
```bash
kubectl create namespace dev-ns
```

<br>

# Q8: Create a new deployment called `redis-deploy` in the `dev-ns` namespace with the `redis` image. It should have `2` replicas.
Use imperative commands.
## A8:
```bash
kubectl create deployment redis-deploy -n dev-ns --image=redis --replicas=2
```

<br>

# Q9: Create a pod called `httpd` using the image `httpd:alpine` in the default namespace. Next, create a service of type `ClusterIP` by the same name `(httpd)`. The target port for the service should be `80`.
Try to do this with as few steps as possible.
## A9: 
```bash
kubectl run httpd --image=httpd:alpine --port=80 --expose
```

