# Deploy a simple app to K3d

Setup a a k3d cluster and deploy an app with ingress enabled. Network policy restricts traffic to required ports only.

### Port mappings

k3d stack port mappings
8888 (localhost port) ---> 80 (loadbalancer ingress) ---> 8080 (service) ---> 8081 (containers)

## Deployment

run ```make``` to deploy entire stack. Ref MakeFile for other options.

## Troubleshooting

### test service and pods 

```
kubectl exec -it -n myapp myapp-app-67cb9496fb-2khvd -- curl http://localhost:8081
kubectl exec -it -n myapp myapp-app-67cb9496fb-2khvd -- curl http://myapp-service:8080

```
test external ```curl http://localhost:8888```