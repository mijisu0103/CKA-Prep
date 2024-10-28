#!/bin/bash

# Handy commands
—dry-run
# By default as soon as the command is run, the resource will be created

# If one wants to test one’s command, one can use
—dry-run=client # option
    
# This will not create the resource, instead, tell one whether the resource can be created and if one’s command is right
-o yaml
# This will output the resource definition in YAML format on screen

# Use Cases

# Pod
# To create an NGINX Pod
kubectl run nginx --image=nginx

# To Generate POD Manifest YAML file (-o yaml), do not create it (—dry-run)
kubectl run nginx --image=nginx --dry-run=client -o yaml


# Deployment
# To create a deployment
kubectl create deployment --image=nginx nginx

# To generate deployment YAML file (-o yaml), do not create it (—dry-run)
kubectl create deployment --image=nginx nginx --dry-run=client -o yaml

# To generate deployment with 4 Replicas
kubectl create deployment nginx --image=nginx --replicas=4

# To scale a deployment
kubectl scale deployment nginx --replicas=4

# Another way to do this — to save the YAML definition to a file and modify
kubectl create deployment nginx --image=nginx --dry-run=client -o yaml > nginx-deployment.yaml
# One can then update the YAML file with the replicas or any other field before creating the deployment


# Service
# To create a service named redis-service of type ClusterIP to expose pod redis on port 6379
kubectl expose pod redis --port=6379 --name redis-service --dry-run=client -o yaml
# This will automatically use the pod’s labels as selectors

# OR
kubectl create service clusterip redis --tcp=6379:6379 --dry-run=client -o yaml
# This will not use the pods labels as selectors, instead it will assume selectors as app=redis

# To create a Service named nginx of type NodePort to expose pod nginx’s port 80 on port 30080 on the nodes
kubectl expose pod nginx --type=NodePort --port=80 --name=nginx-service --dry-run=client -o yaml
"""
- This will automatically use the pod's labels as selectors, but one cannot specify the node port
    - One has to generate a definition file and then add the node port in manually before creating the service with the pod
"""

