#!/bin/bash

# Create deployment-definition.yml
"""
deployment-definition.yml

apiVersion: apps/v1
kind: Deployment
metadata:
	name: myapp-deployment
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
				- name: nginx-container
					image: nginx
	replicas: 3
	selector:
		matchLabels:
			type: front-end
"""

# Once the file is ready
kubectl create -f deployment-definition.yml
# The deployment automatically creates a ReplicaSet

# To see a new ReplicaSet in the name of the deployment
kubectl get replicaset
# ReplicaSets ultimately creates pods 

# To see the pods with the name of deployment and the replicasets
kubectl get pods

# Command
# To see all the created objects at once
kubectl get all

