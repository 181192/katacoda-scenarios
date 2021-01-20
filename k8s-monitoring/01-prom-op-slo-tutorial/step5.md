## Deploy Alertmanager through the operator

Let's see how Prometheus definition looks like:

`alertmanager/alertmanager.yaml`{{open}}

```
kubectl apply -f /root/manifests/alertmanager/
```{{execute}}

```
kubectl get po
```{{execute}}

Check some alerts: [Alertmanager UI](https://[[HOST_SUBDOMAIN]]-30903-[[KATACODA_HOST]].environments.katacoda.com/)
