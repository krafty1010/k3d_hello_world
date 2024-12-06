# Deploy a simple app to K3d



## Ref

install K3d with traefik (default) load balancer enabled. In example, 8080 (external) is mapped to cluster ingress port (80)

8080 (host port) ---> 80 (loadbalancer ingress) ---> 80 (service) ---> 8080 (containers)


update /etc/hosts

## Steps

```
k3d cluster create mycluster --api-port 6550 -p "8080:80@loadbalancer" --agents 2
k3d image import myapp:local --cluster mycluster

```

Add ingress host to lcoal host file e.g.
127.0.0.1       hello.localhost

## Testing

```
kubectl exec -it -n myapp myapp-app-67cb9496fb-2khvd -- curl http://myapp-service:8080
curl http://hello.localhost:8080
```
