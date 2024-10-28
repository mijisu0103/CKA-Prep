#!/bin/bash

# Imperative way of managing infrastructure in Kubernetes

# Create Objects
# To create a pod
kubectl run --image=nginx nginx

# To create a deployment
kubectl create deployment --image=nginx nginx

# To create a service to expose a deployment
kubectl expose deployment nginx --port 80

# Update Objects
# To edit an existing object
kubectl edit deployment nginx

# To scale a deployment or replicaset
kubectl scale deployment nginx --replicas=5

# To update the image on a deployment
kubectl set image deployment nginx nginx=nginx:1.18

# To create an object using a configuration file
kubectl create -f nginx.yaml

# To edit an object using the configuration file
kubectl replace -f nginx.yaml

#To delete an object using the configuration file
kubectl delete -f nginx.yaml


# Declarative way of managing infrastructure in Kubernetes
"""
To create a set of files that defines the expected state of the applications and services on a Kubernetes cluster
- Kubernetes should be able to read the configuration files and decide by itself what needs to be done to bring the infrastructure to the expected state

One will run the kubectl apply command for creating, updating or deleting an object
"""

kubectl apply -f nginx.yaml


# This command will look at the existing configuration and figure out what changes need to be made to the system

