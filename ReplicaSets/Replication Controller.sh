#!/bin/bash

# How to create a replication controller
# Create rc-definition.yml
  """
  apiVersion: v1
  kind: ReplicationControlelr
  metadata:
    name: myapp-rc
    labels:
      app: myapp
      type: front-end
  spec:
    template:
      metadata:
        name: myapp-pod
        labels:
          app: myapp
          type: front-end
      spec:
        containers:
        - name: nginx-controller
          image: nginx

      replicas: 3
  """

# Once the file is ready, run the kubectl create command
kubectl create -f rc-definition.yml

# To view the list of created replication controllers:
kubectl get replicationcontroller

# To see the pods created by the replication controller
kubectl get pods
