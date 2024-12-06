# Deploy a simple app to K3d

Setup a a k3d cluster and deploy an app with ingress enabled. Network policy restricts traffic to required ports only.

## Ref

k3d stack port mappings
8080 (host port) ---> 80 (loadbalancer ingress) ---> 80 (service) ---> 8080 (containers)

## Steps

```
make deploy-local-stack:

```

Add ingress host to lcoal host file e.g.
127.0.0.1       hello.localhost

## Testing

```
kubectl exec -it -n myapp myapp-app-67cb9496fb-2khvd -- curl http://myapp-service:8080
curl http://hello.localhost:8080
```
