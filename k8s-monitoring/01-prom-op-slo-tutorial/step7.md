## Deploy ingress-nginx controller and some error service

```
kubectl apply -f /root/manifests/ingress-nginx/
```{{execute}}

```
kubectl get po
```{{execute}}

```
kubectl apply -f /root/manifests/error-service/
```{{execute}}

```
kubectl get po
```{{execute}}

Test the [error-service ingress](https://[[HOST_SUBDOMAIN]]-32080-[[KATACODA_HOST]].environments.katacoda.com/ok)
