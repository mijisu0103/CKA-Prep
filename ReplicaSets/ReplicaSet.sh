#!/bin/bash

# Create a ReplicaSet
  # Replicaset-definition.yml
    """
    apiVersion: apps/v1 # Replicaset uses apps/v1 unlike replicationcontroller using v1
    kind: ReplicaSet
    metadata:
	    name: myapp-replicaset
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
	  selector: # Another major difference to replicationcontroller
		  matchLabels:
			type: front-end
    """

# To create a replicaset
kubectl create -f replicaset-definition.yml

# To see the created replicaset
kubectl get replicaset

# To get list of pods
kubectl get pods

# How does one scale the replicaset
  # Update the number of replicas in the definition file to six
    """
    apiVersion: apps/v1 # Replicaset uses apps/v1 unlike replicationcontroller using v1
    kind: ReplicaSet
    metadata:
	    name: myapp-replicaset
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
	  replicas: 6
	  selector: # Another major difference to replicationcontroller
		  matchLabels:
			type: front-end
    """

  # Run the kubectl replace command
  kubectl replace -f replicaset-definition.yml

  # Run the kubectl scale command
  kubectl scale --replicas=6 -f replicaset-definition.yml

  # OR
  kubectl scale --replicas=6 replicaset myapp-replicaset

# Commands
# To create a replicaset:
kubectl create -f replicaset-definition.yml

# To see list of replicaset created
kubectl get replicaset

# To delete the replicaset
kubectl delete replicaset myapp-replicaset
# This command will also delete all undrelying PODs

# To replace or update the replicaset
kubectl replace -f replicaset-definition.yml

# To scale replicaset from the command line without having to modify the file
kubectl scale -replicas=6 -f replicaset-definition.yml

  
