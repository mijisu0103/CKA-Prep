#!/bin/bash

# How to deploy pods
kubectl run nginx --image nginx

# How to see the list of pods available
kubectl get pods

# Creating a pod using a YAML based configuration file
  # Create a pod-definition.yaml
    # pod-definition.yaml
    """
      apiVersion: v1
      kind: Pod
      metadata:
        name: myapp-pod
        labels:
          app: myapp
          type: front-end
      spec:
        containers:
          - name: nginx-container # dash because first item in list
            image: nginx
      """

# Once the file is created, run the following command
kubectl create -f pod-definition.yaml

# To see detailed information about the pod
kubectl describe pod myapp-pod


