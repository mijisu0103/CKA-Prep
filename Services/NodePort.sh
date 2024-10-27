# How to create a nodePort Service
# service-definition.yml
"""
apiVersion: v1
kind: Service
metadata:
  name: myapp-service
spec:
  type: NodePort
  ports:
  - targetPort: 80 # Port on POD
	  port: 80 # Port on Service
    nodePort: 30008 # Any number in valid range
  selector:
    app: myapp
    type: front-end
"""

# Create a service
kubectl create -f service-definition.yml

# To see created service
kubectl get services

# To access the web service
curl http://192.168.1.2:30008 # IP of the node: used port
