# To create a clusterIP service
# service-definition.yml
"""
apiVerison: v1
kind: Service
metadata:
  name: back-end
spec: 
  type: ClusterIP
  ports:
  - targetPort: 80
    port: 80
  
  selector: 
    app: myapp
    type: back-end
"""

# To create a service
kubectl create -f service-definition.yml

# To check the service status
kubectl get services
